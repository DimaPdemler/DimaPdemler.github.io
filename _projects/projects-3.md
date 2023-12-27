---
title: "High Neutral Lepton Classification"
excerpt: "Used transfer learning and lottery ticket hypothesis pruning to create an optimal heavy neutral lepton classification neural network. For this project I was part of the Excellence Research Internship Program at EPFL.<br/><img src='/images/HNL_image.png'>"
collection: projects
---

I created a heavy neutral lepton (HNL) classification network that takes in 4-momentum and energy values of particle pairs to identify if an event contains an HNL or is a different collision. To do this, I first made a multivariate regression model that can calculate diffrent important kinematic values of the particle pairs. The benefit of this approach that while we have limited real data, we could have infinite kinematic value data to train on. After we found a good enough model, I then used transfer learning to train this model (with more layers) to run signal classification for HNL. More info on this can be seen in the [Github Repository](https://github.com/DimaPdemler/HNLclassifier) and the [final presentation slideshow](https://github.com/DimaPdemler/DimaPdemler.github.io/tree/master/files/HNLclassifier_pres.pdf). 

This was done during the summer of 2023 where I was part of [Excellence Research Internship Program](https://www.epfl.ch/education/international/en/coming-to-epfl/research-internships/). I worked on this for [Lesya Shchutska](https://people.epfl.ch/lesya.shchutska/?lang=en) and under supervision of [Konstantin Androsov](https://people.epfl.ch/konstantin.androsov?lang=en). 
