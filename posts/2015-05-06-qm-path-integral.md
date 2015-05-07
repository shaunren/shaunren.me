---
title: The Path Integral Formulation of Qunatum Mechanics
tags: physics, quantum-mechanics
---

### Canonical Quantization

Traditionally, quantum mechanics is the mechanics that satisfies the following postulates, which stems from [Hamiltonian mechanics](https://en.wikipedia.org/wiki/Hamiltonian_mechanics):

1. A [ket](https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation) in a [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), $\ket{\psi(t)}$, describes the state of a system.

2. An classical dynamical variable $\omega(x,p)$ becomes a [Hermitian](https://en.wikipedia.org/wiki/Hermitian_matrix) operator $\Omega(X,P) = \omega(x\to X, p \to P)$, where $X,P$ are Hermitian with [commutator](https://en.wikipedia.org/wiki/Commutator#Ring_theory) $[X,P] = i\hbar$.

3. When a measurement of an observable $\Omega$ is made, the state becomes one of the eigenvectors $\ket{\omega}$ of $\Omega$, and the result of the observation, $\omega$, is the corresponding eigenvalue. The state jumps to the eigenstate $\ket{\omega}$ with probability $P(\omega) \propto |\braket{\omega}{\psi(t)}|^2$.

4. The state evolves according to [Schrödinger equation](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation): $$ i\hbar\frac{d}{dt} \ket{\psi(t)} = H\ket{\psi(t)}, $$ where $H = \Hs(X, P)$, and $\Hs(x,p)$ is the classical Hamiltonian.


#### Solving the Quantum Problem
Here we give a overview of the general approach to solving a quantum problem, given $H$ and $\psi{0}$. Assume $H$ has no explict dependence on $t$.

In general, we would like to find a _propagator_ $U(t)$ such that
$$ \ket{\psi(t)} = U(t)\ket{\psi(0)}. $$
First, we solve find eigenstates $\ket{E}$ of the Hermitian operator $H$, i.e. $$ H\ket{E} = E\ket{E} \quad\text{where}\quad E \in \CC. $$
Then we can expand $\ket{\psi(t)} = U(t)\ket{\psi(0)}$ in the $E$ basis:
$$ \ket{\psi(t)} = \sum \ket{E} \braket{E}{\psi(t)} = \sum f_E(t) \ket{E}. $$
By Schrödinger equation, we get $i\hbar f_E' = Ef_E$, which has solution $f_E(t) = f_E(0)e^{iEt/\hbar}$.
Thus, comparing this with the definition of the propagator, we can see that
$$ U(t) = \sum \ket{E}\bra{E} e^{iEt/\hbar}. $$

Finally, to evaluate $\psi(x,t)$, note that since $$ \int \ket{x'}\bra{x'}\,dx' = I, $$
we have $$ \psi(x,t) = \braket{x}{\psi(t)} = \bra{x}U(t)\ket{\psi(0)} = \int \bra{x}{U(t)}\ket{x'}\braket{x'}{\psi(0)}\,dx'. $$
Thus we can find any $\psi(x,t)$ given $U(t)$ and $\ket{\psi(0)}$, and $U(t)$ can be found using the process described above for time independent $H$. Hence, the quantum problem is solved.


### Path Integral Formulation
Richard Feynman came up with this formulation of QM in the 1940s. Contrasting the canonical quantization described above, Feynman's path integral formulation has its roots in Lagrangian mechanics.

Let $\Ls = T-V$ be a Lagrangian. The _action_ of a path $x(t)$ is defined as
$$ S[x(t)] = \int_{t_i}^{t_f} \Ls(x,\dot{x})\,dt. $$
The classical path $x_{cl}$ is the path such that its action is _minimized_ (hence the name "principle of least action").

In the path integral formulation, we compute the propagator directly:
$$ U(x_N, t_N; x_0, t_0) = A\int_{x_0}^{x_N} \exp\left(\frac{iS[x(t)]}{k}\right)\,\Ds[x(t)], $$
where $\Ds[x(t)]$ means the integral is to be integrated for all paths from $x_0$ to $x_N$, and $A$ is a normalization factor.

It can be shown that
$$ \int \Ds[x(t)] = \frac{1}{B} \lim_{\substack{N\to\infty \\ \epsilon\to 0}} \int_{-\infty}^\infty \cdots \int_{-\infty}^{\infty} \frac{dx_1}{B}  \cdots \frac{dx_{N-1}}{B}, $$
    where $B = \sqrt{\frac{2i\pi\hbar\epsilon}{m}}$.

This equation shows that _every_ path from $x_0$ to $x_N$ is given equal weight in QM. Why, then, is the classical path $x_{cl}$ the preferred path for macroscopic scenarios? This is because of the fact that for large $S[x(t)]$, the complex exponentials tend to cancel each other out, while the paths that are close to the classical path tend to add constructively. In particular, when the phase is above $\pi$, the coherence starts to die away, i.e. $|S[x(t)]| \le \hbar \pi$ are the coherent paths. Hence classical mechanics reemerges in macroscopic scenarios.