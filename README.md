# VarDrop: Enhancing Training Efficiency by Reducing Variate Redundancy in Periodic Time Series Forecasting

> __Publication__ </br>
> Kang, J., Shin, Y., and Lee, J., "VarDrop: Enhancing Training Efficiency by Reducing Variate Redundancy in Periodic Time Series Forecasting", The 39th AAAI Conference on Artificial Intelligence (AAAI), 2025.

This repository is the official PyTorch implementation of **VarDrop**.


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
