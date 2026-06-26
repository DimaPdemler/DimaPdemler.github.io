---
permalink: /
title: "About Me"
excerpt: "About me"
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

I am a Master's student in Data Science at ETH Zurich, where I focus on efficient machine learning for scientific computing. I previously earned a B.S. in Computational Physics with a minor in Mathematics from UC San Diego.

I work at the intersection of physics, mathematics, and machine learning. My goal is to build efficient machine learning models grounded in the physical and mathematical principles that govern both the world and the tasks they are designed to solve.

My research centers on model compression and efficient deep learning for scientific problems. I work on quantization-aware training, pruning, and knowledge distillation to make deep learning models faster and lighter without sacrificing performance.

<!-- I have been fortunate to have worked with many insigthful and insipiring mentors. Over the past few years I have worked with Professor [Javier Duarte](https://jduarte.physics.ucsd.edu/) and [Nhan Tran](https://cms.fnal.gov/nhan-tran/), focusing on optimizing neural networks for nanosecond timescales using FPGAs. Our work involves creating a Neural Architecture Codesign (NAC) pipeline that automates the discovery and optimization of efficient machine learning models for scientific and engineering applications. More recently, we have worked on a surrogate model to predict FPGA latency times for ML models synthesized to FPGA chips.  -->

<!-- Over the past two years, I have worked with Professor [Javier Duarte](https://jduarte.physics.ucsd.edu/) on fast and efficient machine learning, focusing on optimizing neural networks for nanosecond timescales using FPGAs. Our work involves creating a Neural Architecture Codesign (NAC) pipeline that automates the discovery and optimization of efficient machine learning models for scientific and engineering applications. By breaking down complex problems into their fundamental components, we aim to develop elegant and interpretable solutions. -->

<!-- I have also had the opportunity to work with Professor [Lesya Shchutska](https://people.epfl.ch/lesya.shchutska/?lang=en) at EPFL on demonstrating the existence of heavy neutral leptons using machine learning techniques, and with Professor [Yiwen Chu](https://hyqu.ethz.ch/) at ETH Zurich on designing a vibration damping system for a cryo fridge. These experiences have reinforced my belief in the power of incorporating fundamental principles to create better solutions. -->


## Notable Papers
{% include base_path %}
{% assign sorted_pubs = site.publications | sort: 'notable' %}
{% for post in sorted_pubs %}
  {% if post.notable %}
    {% include archive-single.html %}
  {% endif %}
{% endfor %}
