---
title: "Car Racing Reinforcement Learning"
excerpt: "
Explored Reinforcement Learning techniques to optimize virtual car racing performance in the Gymnasium CarRacing environment. Employed Deep Q-Networks (DQN) and Proximal Policy Optimization (PPO) models, enhanced with reward augmentations, demonstrating the impact of architectural choices and training methodologies on achieving high-speed, stable racing behavior.<br/><img src='/images/RLcar.gif' style='width: 50%; max-width: 600px; height: auto;'>"
collection: projects
---
This project aimed to apply Reinforcement Learning (RL) techniques to optimize performance in the CarRacing game environment provided by Gymnasium. We focused on using Deep Q-Networks (DQN) and Proximal Policy Optimization (PPO) models, leveraging the Stable Baselines3 library for implementation.

Our experiments revealed that a Convolutional Neural Network (CNN) architecture paired with PPO exhibited promising results, achieving significant progress in race completion with high speed within a few hours of training. To enhance training efficiency and model performance, we explored various augmentation strategies, including reward structure modifications and model architectural adjustments.

We implemented reward augmentations such as grass detection, speed, and acceleration to incentivize the agent to stay on the track, maintain high speeds, and accelerate efficiently. Through careful tuning of scaling factors, we achieved a balance between these augmentations and the baseline rewards, ensuring the agent prioritized both safe racing lines and high velocities.

This project was completed as part of the CSE 251B course at UCSD during the Winter 2024 quarter.