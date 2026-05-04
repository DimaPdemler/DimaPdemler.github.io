---
title: "SQUID Effect Derivation from Maxwell's Equations"
excerpt: "Derived the equations governing Superconducting Quantum Interference Devices (SQUIDs) starting from Maxwell's and Schrödinger's equations. The derivations were simplified from advanced graduate references down to an undergraduate level, culminating in a theoretical magnetic field sensitivity of about 10 picotesla."
header:
  teaser: squid_diagram.png
collection: portfolio
date: 2024-02-01
redirect_from:
  - /projects/projects-5/
---

This project derives the operating principles of Superconducting Quantum Interference Devices (SQUIDs) — among the most sensitive magnetometers ever built — starting from the most fundamental laws of electromagnetism and quantum mechanics. By analyzing Cooper pair tunneling and quantum interference in Josephson junctions under an applied magnetic field, we walk through the derivation of the AC and DC Josephson effects and use them to construct a simple SQUID device.

Working from Ginzburg-Landau theory and gauge invariance arguments, we first derived the Josephson junction current relation

$$ I = I_c \sin\!\left(\phi_2 - \phi_1 + \frac{2e}{c}\,t\,V_{12}\right), $$

then extended the analysis to 3D under an applied magnetic field, and finally combined two junctions in parallel to obtain the SQUID interference pattern:

$$ I_{\max}(\Phi) = 2 I_c \left| \cos\!\left( \frac{\pi \Phi}{\Phi_0} \right) \right|, $$

where $\Phi$ is the magnetic flux through the SQUID loop and $\Phi_0 = h/2e$ is the flux quantum. Because $\Phi_0$ is so small, even tiny changes in the applied field produce measurable oscillations in the output current. For a representative SQUID of area $1\,\mathrm{cm}^2$, this gives a theoretical magnetic field sensitivity of

$$ B \;\approx\; \frac{0.5\,\Phi_0}{A} \;\approx\; 10^{-11}\,\mathrm{T}, $$

i.e. on the order of 10 picotesla.

The goal of the writeup was to take material that is normally only accessible at the graduate textbook level and present it cleanly at an undergraduate level. The project was completed for Phys 100C at UC San Diego, together with Parker George and Leo Megliola.

The full derivation paper can be viewed [here (PDF)](https://dimapdemler.github.io/files/100C_Final_Project_SQUIDS.pdf).
