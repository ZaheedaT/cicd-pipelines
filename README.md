# CI/CD for ML Automation
This project demonstrates how to set up a CI/CD pipeline for a machine learning project using GitHub Actions.
The entire workflow, from training to deployment, is automated.

The project will:

* Train a simple Random Forest Model using scikit-learn on a drug classification task. 
* Automate the Evaluation process with CML (Continuous Machine Learning). 
* Deploy the Web Application to Hugging Face Hub.

## Data

This automation can be used on any kind of model/data.

The target feature is
`Drug type`
The feature sets are:
`Age`
`Sex`
`Blood Pressure Levels (BP)`
`Cholesterol Levels`
`Na to Potassium Ration`



---
title: Drug Classification
emoji: 💊
colorFrom: yellow
colorTo: red
sdk: gradio
sdk_version: 4.16.0
app_file: drug_app.py
pinned: false
license: apache-2.0
---