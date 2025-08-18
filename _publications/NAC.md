---
title: "Neural Architecture Codesign for Fast Physics Applications"
collection: publications
permalink: /publication/NAC
excerpt: 'This paper presents a new hardware-aware neural architecture search pipeline for low latency deployment'
date: 2025-1-09
venue: 'Machine Learning Science and Technology Journal'
paperurl: 'https://iopscience.iop.org/article/10.1088/2632-2153/adede1'
# citation: 'Your Name, You. (2009). &quot;Paper Title Number 1.&quot; <i>Journal 1</i>. 1(1).'
---
We develop a pipeline to streamline neural architecture codesign for physics applications to reduce the need for ML expertise when designing models for novel tasks. Our method employs neural architecture search and network compression in a two-stage approach to discover hardware efficient models. This approach consists of a global search stage that explores a wide range of architectures while considering hardware constraints, followed by a local search stage that fine-tunes and compresses the most promising candidates. We exceed performance on various tasks and show further speedup through model compression techniques such as quantization-aware-training and neural network pruning. We synthesize the optimal models to high level synthesis code for FPGA deployment with the hls4ml library. Additionally, our hierarchical search space provides greater flexibility in optimization, which can easily extend to other tasks and domains. We demonstrate this with two case studies: Bragg peak finding in materials science and jet classification in high energy physics, achieving models with improved accuracy, smaller latencies, or reduced resource utilization relative to the baseline models.

[Download paper here](https://iopscience.iop.org/article/10.1088/2632-2153/adede1)
[Arxiv](https://www.arxiv.org/pdf/2501.05515)

<!-- Recommended citation: Your Name, You. (2009). "Paper Title Number 1." <i>Journal 1</i>. 1(1). -->