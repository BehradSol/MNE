# MNE
Minimum Norm Estimation 

Description: This repository contains implementations of the Minimum Norm Estimation.

Copyright (c) 2020 Behrad Soleimani All Rights Reserved

Contact: behrad@umd.edu

Date: February 29, 2020

Requirements: implemented in Matlab R2019a version, but should run on most versions.

Contents: 
> main.m:                    **Master script**. 

> MNE.m:                     **Minimum norm estimation function**.

> MNEdrivation.pdf:          **Derivations and details of the MNE**.

Instructions: Simple and easy. Download all the codes in a directory and run main.m, that will generate an example described below. To use the function individually, please look at the function descriptions. The derivations and details are also explained in .pdf file.

Example:

We consider the following observation model

<p align="center">
  <img src="https://user-images.githubusercontent.com/59627073/81076985-60f5bc80-8eba-11ea-9867-71fe9c2bec26.jpg">
</p>
where x<sub>t</sub> and y<sub>t</sub> represent the observation and source vectors at t-th time sample, respectively. The minimum norm estimation (MNE) is given as

<p align="center">
  <img src="https://user-images.githubusercontent.com/59627073/81077822-791a0b80-8ebb-11ea-84c5-d8b27aeed62f.jpg">
</p>

where *λ* is the regulariation coefficient and can be obtained iteratively.

In this example, we assume that there are N<sub>x</sub>=5 sources and T=50 time samples. The MNE solution for two cases (low and full -rank) is depicted in Fig. 1. 

| ![](Figs/MNE.png) | 
|:--:| 
| Fig 1. The MNE solution for two cases N<sub>y</sub>=3 and 5 observations |
