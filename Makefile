html:	site
	./site build
site:	site.hs
	ghc --make -threaded site.hs
