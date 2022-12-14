# ReplicatingCAPM
Basic replication of the CAPM model in R

This code runs a very basic test of CAPM. 

The classic model looks like;
$ER_{i} = R_{f} + \beta_{i}(ER_{m} - R_{f})$

The expectation is that a security's return is linear in its beta. We can initially test this using time series regressions. These look like the following;

$R_{t} = \beta_{0} + \beta_{1}RM_{t} + \epsilon_{t}$

For every security in the dataset, we perform a time series regression. Here we estimate beta by extracting it from the above regression. There is a key issue here, we estimate a beta for a time period where the true beta will naturally vary over time. However, for simplicity I have ignored this. The above regression is not what we are actually interested in. The hypothesis is that a security's return is linear in the beta, so we just needed to estimate this first. The next step is what we are actually interested in.

In this next stage we estimate the following cross-sectional regression.

$R_{i} = \lambda_{0} + \lambda_{1}\beta_{i} + \alpha_{i}$

This takes some processing. We have taken the estimated coefficients from the previous time series regression and used them as the independent variable in this regression. In this case we estimate lambda 1, which represents the security's return sensitivity to it's beta. Further, we also rewrite the error term here as alpha. The reason for this is because the error in this model represents the excess return on the model. This model also has issues. Namely that if one tech firm does well in a particular month its likely that another tech firm will. We call this heteroscedasticity. We don't deal with this any further in this simple example. The results of this regression are plotted at the bottom of the code.

The R code here is simplistic and not optimal. I use for loops and simple OLS. This is for learning purposes only.
