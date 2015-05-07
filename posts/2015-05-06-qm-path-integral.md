---
title: The Path Integral Formulation of Quantum Mechanics
tags: physics, quantum-mechanics
---

### Canonical Quantization

Traditionally, quantum mechanics is formulated by the following postulates, which stems from [Hamiltonian mechanics](https://en.wikipedia.org/wiki/Hamiltonian_mechanics):

1. A [ket](https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation) in a [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), $\ket{\psi(t)}$, describes the state of a system.

2. A classical dynamical variable $\omega(x,p)$ becomes a [Hermitian](https://en.wikipedia.org/wiki/Hermitian_matrix) operator $\Omega(X,P) = \omega(x\to X, p \to P)$, where $X,P$ are Hermitian with [commutator](https://en.wikipedia.org/wiki/Commutator#Ring_theory) $[X,P] = i\hbar$.

3. When a measurement of an observable $\Omega$ is made, the state becomes one of the eigenvectors $\ket{\omega}$ of $\Omega$, and the result of the observation, $\omega$, is the corresponding eigenvalue. The state jumps to the eigenstate $\ket{\omega}$ with probability $P(\omega) \propto |\braket{\omega}{\psi(t)}|^2$.

4. The state evolves according to [Schrödinger equation](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation): $$ i\hbar\frac{d}{dt} \ket{\psi(t)} = H\ket{\psi(t)}, $$ where $H = \Hs(X, P)$, and $\Hs(x,p)$ is the classical Hamiltonian.


#### Solving the Quantum Problem
Here we give a overview of the general approach to solving a quantum problem, given $H$ and $\ket{\psi(0)}$. Assume $H$ has no explict dependence on $t$.

In general, we would like to find a _propagator_ $U(t)$ such that
$$ \ket{\psi(t)} = U(t)\ket{\psi(0)}. $$
First, we find the eigenstates $\ket{E}$ of the Hermitian operator $H$ (note that the eigenvalues of an Hermitian operator are real), i.e. $$ H\ket{E} = E\ket{E} \quad\text{where}\quad E \in \RR. $$
Then we can expand $\ket{\psi(t)} = U(t)\ket{\psi(0)}$ in the $E$ basis (also called the _energy basis_):
$$ \ket{\psi(t)} = \sum \ket{E} \braket{E}{\psi(t)} = \sum f_E(t) \ket{E}. $$
By Schrödinger equation, we get
$$ i\hbar f_E' = Hf_E = Ef_E, \quad\text{which has solution}\quad f_E(t) = f_E(0)e^{-iEt/\hbar}. $$
Thus, comparing this with the definition of the propagator, we can see that
$$ U(t) = \sum \ket{E}\bra{E} e^{-iEt/\hbar}. $$

Finally, to evaluate $\psi(x,t)$, note that since $$ \int \ket{x'}\bra{x'}\,dx' = I, $$
we have $$ \psi(x,t) = \braket{x}{\psi(t)} = \bra{x}U(t)\ket{\psi(0)} = \int \bra{x}{U(t)}\ket{x'}\braket{x'}{\psi(0)}\,dx'. $$
Thus we can find any $\psi(x,t)$ given $U(t)$ and $\ket{\psi(0)}$, and $U(t)$ can be found using the process described above for time independent $H$. Hence, the quantum problem is solved.


### Path Integral Formulation
Richard Feynman came up with this formulation of QM in the 1940s. Contrasting the canonical quantization described above, Feynman's path integral formulation has its roots in [Lagrangian mechanics](https://en.wikipedia.org/wiki/Lagrangian_mechanics).

Let $\Ls = T-V$ be a Lagrangian. The _action_ of a path $x(t)$ is defined as
$$ S[x(t)] = \int_{t_i}^{t_f} \Ls(x,\dot{x})\,dt. $$
The classical path $x_{cl}$ is the path such that its action is _minimized_ (hence the name "principle of least action").

In the path integral formulation, we compute the propagator directly:
$$ U(x_N, t_N; x_0, t_0) = A\int_{x_0}^{x_N} \exp\left(\frac{iS[x(t)]}{k}\right)\,\Ds[x(t)], $$
where $\Ds[x(t)]$ means the integral is to be integrated for all paths from $x_0$ to $x_N$, and $A$ is a normalization factor.

It can be shown that
$$ \int \Ds[x(t)] = \lim_{\substack{N\to\infty \\ \epsilon\to 0}} \frac{1}{A} \int_{-\infty}^\infty \cdots \int_{-\infty}^{\infty} \frac{dx_1}{A}  \cdots \frac{dx_{N-1}}{A}, $$
    where $A = \sqrt{\frac{2i\pi\hbar\epsilon}{m}}$.

This equation shows that _every_ path from $x_0$ to $x_N$ is given equal weight in QM. Why, then, is the classical path $x_{cl}$ the preferred path for macroscopic scenarios? This is because of the fact that for large $S[x(t)]$, the complex exponentials tend to cancel each other out, while the paths that are close to the classical path tend to add constructively. In particular, when the magnitude of the phase is greater than $\pi$, the coherence starts to die away, i.e. $|S[x(t)]| \le \hbar\pi S_{cl}$ are the coherent paths. Hence classical mechanics reemerges in macroscopic scenarios.

### A Simple Problem: The Free Particle in 1D
We have a particle moving in free space. Classically, the particle has mass $m$ and momentum $p = mv$, with Hamiltonian $\Hs = p^2/2m$. In the quantum world, this becomes $H = P^2/2m$.

#### Finding the Propagator with Canonical Quantization
We first solve this problem with the traditional canonical quantization formulation.
From above, the _stationary states_ are of the form $\ket{\psi(t)} = \ket{E}e^{-iEt/\hbar}$. So for the eigenstates $\ket{E}$ of $H$, we have
$$ H\ket{E} = \frac{P^2}{2m}\ket{E} = E\ket{E}. $$
To solve this, first note that any eigenstate of $P$ must also be an eigenstate of $P^2$. Thus feeding the eigenstates $\ket{p}$ of $P$ into the equation above, we find
$$ \left(\frac{p^2}{2m} - E\right)\ket{p} = 0. $$ Since $\ket{p}$ is nonzero, we have $$ p = \pm\sqrt{2mE}. $$ Hence for each eigenvalue $E$, there are two orthogonal eigenstates, so
$$ \ket{E} = A\ket{p = \sqrt{2mE}} + B\ket{p = -\sqrt{2mE}}, $$ and
$$ U(t) = \int_{-\infty}^\infty \ket{E}\bra{E} e^{-iEt/\hbar} \, dE = \int_{-\infty}^\infty \ket{p}\bra{p} e^{-ip^2t/2m\hbar} \, dp. $$
Finally,
$$ \begin{align*}U(x,t;x') = \int_{-\infty}^{\infty} \braket{x}{p} \braket{p}{x'} e^{-ip^2t/2m\hbar} \, dp
&= \frac{1}{2\pi\hbar} \int_{-\infty}^\infty e^{ipx/\hbar} \left(e^{ipx'/\hbar}\right)^* e^{-ip^2t/2m\hbar} \, dp
\\ &= \sqrt{\frac{m}{2\pi\hbar i t}} e^{im(x-x')^2/2\hbar t}. \end{align*} $$

#### Finding the Propagator with Path Integral
We would like to evaluate the integral mentioned above. As it turns out, in this particular case, evaluating the approximation $e^{iS[x_{cl}(t)]/\hbar}$ is sufficient.

The classical path $x_{cl}$ is the straight line path $x \to x'$, with uniform velocity $v = (x'-x)/t$. Since $\Ls = mv^2/2$ is constant, $$ S[x_{cl}(t)] = \int_0^t \Ls dt' = \frac{m}{2} \frac{(x-x')^2}{t}. $$
Hence $$ U(x,t;x') = A\exp\left(\frac{im(x-x')^2}{2\hbar t}\right). $$
As $t \to 0$, we must have $U \to \delta(x-x')$ ($\delta$ is the [Dirac delta function](https://en.wikipedia.org/wiki/Dirac_delta_function)). Since the definition of $\delta$ is
$$ \delta(x) = \lim_{\Delta\to 0} \frac{1}{\sqrt{\pi\Delta^2}} e^{-\frac{(x-x')^2}{\Delta^2}}, $$
we can see that $$ A = \frac{1}{\sqrt{\pi \Delta^2}} = \sqrt{\frac{m}{2\pi\hbar it}}. $$
Therefore
$$ U(x,t;x') = \sqrt{\frac{m}{2\pi\hbar i t}} e^{im(x-x')^2/2\hbar t}, $$
which is exactly the same as the propagator we obtained by using canonical quantization.
