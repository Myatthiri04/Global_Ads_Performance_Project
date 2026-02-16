# Global Digital Advertising Performance Analysis
*Business & Marketing Analytics Case Study*

##Overview
Digital advertising campaigns generate large volume of data, but marketing teams often struggle to identify which variables drive revenue, how ad spend affects returns,and which metrics guide optimization.

**Objective**
-Identify key drivers of revenue.
-Evaluate campaign efficiency using ROAS.
-Develop predictive models to support data-driven budget allocation. 

**Dataset used: Global Ads Performance (Kaggle)
**Tools Used: R(data analysis & regression), Tableau (data visualisation)

##Exploratory Data Analysis
Initial analysis examined performance difference across:
-Platforms, campaign types, and industries. 
-Key Metrics: Impressions, Clicks,Click-Through_Rate (CTR),Ad Spend,Conversions,REvenue,ROAS.

**Key Observations**
-Revenue varies significantly across platforms and industries.
-Higher ad spend does not consistently produce higher revenue, 
-Campaign efficiency (ROAS) varies more than total revenue,indicating optimization opportunities.

##Revenue Driver Analysis
**Methodology**
-Developed a multiple linear regression model: 'Revenue~Impressions+Clicks+Ad Spend'
-Evaluated variable signnificance and model performance. 

**Model Performance**
-Adjusted R-squared= 0.457 (moderate predictive strength)
-Model statistically significant (p<0.001)

**Variable Insights**
lm(formula = revenue ~ impressions + clicks + ad_spend, data = ads_data)

Residuals:
   Min     1Q Median     3Q    Max 
-82249 -12276  -1970   8019 179847 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -8.854e+02  1.261e+03  -0.702    0.483    
impressions -8.807e-03  1.571e-02  -0.561    0.575    
clicks       8.257e+00  3.544e-01  23.297   <2e-16 ***
ad_spend    -1.340e-01  1.522e-01  -0.881    0.379

**Strategic Insight**
Revenue is primarly driven by "user engagement (clicks)" rather than raw impressions or total spend. Budget increase alone will not guarantee growth-campaign effectiveness relies on targeting and creative quality. 

##ROAS Predicitve Modelling
-Built regression model to predict **Retrun on Ad Spend (ROAS)**
-Actual vs Predicted ROAS shows strong alignment,indicating predictive consistency.
<img width="912" height="890" alt="image" src="https://github.com/user-attachments/assets/7783fbcc-c69e-443b-bf3f-c15db05b316c" />

**Business Implications**
-Historical campaign data can forecast advertisig efficiency. 
-Helps allocated budgets strategically. 
-Early identification of underperforming campaigns improves ROI.

##Recommendations
-Prioritize "click optimization strategies" (A/B testing, creative refinement).
-Focus on "engagement-based KPIs" rather than impressions.
-Use predictive models to guide "budget allocation decisions".
-Monitor "ROAS trends across industries" to identify scaling opportunities. 

##Technical Skills Demonstrated
-Data cleaning and transformation in R.
-Exploratory Data Analysis (EDA).
-Multiple linear Regression. 
-Model interpretation (R-squared, p-values, coefficients)
-Tableau data visualization. 

