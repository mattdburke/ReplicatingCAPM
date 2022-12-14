# ReplicatingCAPM
Basic replication of the CAPM model in R

This code runs a very basic test of CAPM. 

The classic model looks like;
$ER_{i} = R_{f} + \beta_{i}(ER_{m} - R_{f})

For each firm in the dataset, I estimate their beta. Similarly I then estimate their average monthly return over the period.

I allocate these values to a new dataset, df2.

With this I then estimate the securities market line.

alphas are correlated across firms, if one tech company does well in the same, so would another company. 