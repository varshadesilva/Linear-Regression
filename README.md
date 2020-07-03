# Linear-Regression
The prostate cancer dataset consists of data on 97 men with advanced prostate cancer. Following is a description of the variables:


Header | Name | Description | 
--- | --- | --- | 
subject | ID | 1 to 97 | 
psa  | PSA level  | Serum prostate-specific antigen level (mg/ml)
cancervol  | Cancer Volume  | Estimate of prostate cancer volume (cc)
weight  | Weight  | prostate weight (gm)
age  | Age  | Age of patient (years)
benpros  | Benign prostatic hyperplasia  | Amount of benign prostatic hyperplasia (cm^2)
vesinv  | Seminal vesicle invasion  | Presence (1) or absence (0) of seminal vesicle invasion
capspen  | Capsular penetration  | Degree of capsular penetration (cm)
gleason  | Gleason score  | Pathologically determined grade of disease (6, 7 or 8)

The goal is to understand how PSA level is related to the other variables in the dataset. A "reasonably good" linear model is constructed for these data by taking PSA level as the response variable. The final model is used to predict the PSA level for a patient whose predictors are at the sample means of the variables.
