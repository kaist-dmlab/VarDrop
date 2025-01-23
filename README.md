# VarDrop

The repo is the official implementation of VarDrop.
This folder contains source codes and a part of datasets for AAAI 2025 submitted paper.
<!-- whose title is "Reducing Variate Redundancy for Efficient Transformers in Time Series Forecasting"-->


## How to run

To run the source codes, please follow the instructions below.

0. Download datasets in ```dataset``` folder. Please refer to the footnotes in the main text for access paths to each data source.

1. We require following packages to run the code. Please download all requirements in your python environment. 

  - python==3.11.5
  - torch==2.1.1
  - numpy==1.26.2
  - scipy==1.11.4
  - scikit-learn==1.2.2

2. Run scripts in ```script``` folder.

   ```shell
   sh script/ECL.sh
   sh script/Traffic.sh
   sh script/Weather.sh
   sh script/Solar.sh
   ```
