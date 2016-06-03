
--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import qualified Data.Set as S
import           Text.Pandoc.Options
import           Hakyll
import           Hakyll.Web.Tags


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    tags <- buildTags "posts/*" $ fromCapture "tags/*.html"

    -- Post tags
    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged '" ++ tag ++ "'"
        route idRoute
        compile $ do
            list <- postList tags pattern recentFirst
            makeItem ""
                >>= loadAndApplyTemplate "templates/posts.html"
                        (constField "title" title `mappend`
                            constField "body" list `mappend`
                            postCtx)
                >>= loadAndApplyTemplate "templates/default.html"
                        (constField "title" title `mappend`
                            postCtx)
                >>= relativizeUrls
            
    match "images/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "fonts/**" $ do
        route   idRoute
        compile copyFileCompiler
        
    match "js/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/**" $ do
        route   idRoute
        compile compressCssCompiler

    match "static/**" $ do
        route idRoute
        compile copyFileCompiler

    match "contact.md" $ do
        route   $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/default.html" (taggedPostCtx tags)
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/post.html"    (taggedPostCtx tags)
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/default.html" (taggedPostCtx tags)
            >>= relativizeUrls

    match ("index.html" .||. "archive.html") $ do
        route idRoute
        compile $ do
            posts <- postList tags "posts/*" (fmap (take 10) . recentFirst)
            let ctx =
                    tagsField "tags" tags `mappend`
                    --listField "posts" postCtx (return posts) `mappend`
                    constField "posts" posts `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext
                    
            getResourceBody
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    create ["atom.xml"] $ do
        route idRoute
        compile $ do
            posts <- fmap (take 20) . recentFirst =<< loadAllSnapshots "posts/*" "content"
            renderAtom feedConfiguration feedCtx posts
                    
    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------

postList :: Tags -> Pattern -> ([Item String] -> Compiler [Item String])
         -> Compiler String
postList tags pattern preprocess' = do
    postItemTpl <- loadBody "templates/postitem.html"
    posts <- preprocess' =<< loadAll pattern
    applyTemplateList postItemTpl (taggedPostCtx tags) posts


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%Y-%m-%d" `mappend`
    defaultContext

feedCtx :: Context String
feedCtx =
    bodyField "description" `mappend`
    postCtx

taggedPostCtx :: Tags -> Context String
taggedPostCtx tags =
    tagsField "tags" tags `mappend`
    postCtx


--------------------------------------------------------------------------------
feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration
    { feedTitle       = "shaunren.me - Atom feed"
    , feedDescription = "Shaun Ren's personal site"
    , feedAuthorName  = "Shaun Ren"
    , feedAuthorEmail = "shaun@shaunren.me"
    , feedRoot        = "https://shaunren.me"
    }

--------------------------------------------------------------------------------
pandocMathCompiler =
    let mathExtensions = [Ext_tex_math_dollars, Ext_tex_math_double_backslash,
                          Ext_latex_macros]
        defaultExtensions = writerExtensions defaultHakyllWriterOptions
        newExtensions = foldr S.insert defaultExtensions mathExtensions
        writerOptions = defaultHakyllWriterOptions {
                          writerExtensions = newExtensions,
                          writerHTMLMathMethod = MathJax ""
                        }
    in pandocCompilerWith defaultHakyllReaderOptions writerOptions
