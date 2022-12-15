# Replicating and testing the CAPM hypothesis

The classic model looks like;
$ER_{i} = R_{f} + \beta_{i}(ER_{m} - R_{f})$

The expectation is that a security's return is linear in its beta. We can initially test this using time series regressions. These look like the following;

$R_{t} = \beta_{0} + \beta_{1}R_{t}^{market} + \epsilon_{t}$

For every security $i$ in the dataset, we perform a time series regression. Here we estimate beta by extracting it from the above. This regression, for one asset at least shows us that returns for security $i$ are linear in the returns of the market. However, this doesn't test if returns are linear in the security's beta. In order to test this we extract the estimate for $\beta_{1}$ from the above and regress them on the security's average return for the period. We then perform the following cross-sectional regression.

$R_{i} = \lambda_{0} + \lambda_{1}\beta_{i} + \alpha_{i}$

This takes some thinking about. We have taken the estimated coefficients from the previous time series regression and used them as the independent variable in this regression. In this case we estimate lambda 1, which represents the security's return sensitivity to it's beta. Further, we also rewrite the error term here as alpha. The reason for this is because the error in this model represents the excess return on the model.

The R code here is simplistic and not optimal. I use for loops and simple OLS. There are no corrections for autocorrelation or heteroscedasticity. This is for learning purposes only.
