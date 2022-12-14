# ReplicatingCAPM
Basic replication of the CAPM model in R

This code runs a very basic test of CAPM. 

The classic model looks like;
$ER_{i} = R_{f} + \beta_{i}(ER_{m} - R_{f})$

The expectation is that a security's return is linear in its beta. We can initially test this using time series regressions. These look like the following;

$R_{t} = B_{0} + B_{1}RM_{t} + \epsilon_{t}$

For every security in the dataset, we perform a time series regression. Here we estimate beta by extracting it from the above regression. There is a key issue here, we estimate a beta for a time period where the true beta will naturally vary over time. However, for simplicity I have ignored this. The above regression is not what we are actually interested in. The hypothesis is that a security's return is linear in the beta, so we just needed to estimate this first. The next step is what we are actually interested in.

In this next stage we estimate the following cross-sectional regression.

$R_{i} = \lambda_{0} + \lambda_{1}\beta_{i} + \alpha_{i}$

For each firm in the dataset, I estimate their beta. Similarly I then estimate their average monthly return over the period.

I allocate these values to a new dataset, df2.

With this I then estimate the securities market line.

alphas are correlated across firms, if one tech company does well in the same, so would another company. 