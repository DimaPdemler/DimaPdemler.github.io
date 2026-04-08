---
permalink: /
title: "About Me"
excerpt: "About me"
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

I am a recent graduate of UC San Diego getting a bachellors degree in Computational Physics and a minor in Mathematics. I have a strong interest in the intersection of physics/mathematics and machine learning. My goal is to develop efficient machine learning models rooted in the underlying physical and mathematical principles the govern the world and their task.

I am currently taking a gap year in Zurich Switzerland, studying Datascience at ETH Zurich before starting my PhD the following year at Yale University in Elecrical & Computer Engineering.

I am interested in model compression, efficient deep learning, and the application of machine learning to scientific problems. I work on Quantization Aware training, pruning, and knowledge distillation to create efficient deep learning models.

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
