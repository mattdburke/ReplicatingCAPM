# Download data
df1 <- read.csv("https://raw.githubusercontent.com/mattdburke/ReplicatingCAPM/main/data.csv")

# Create empty dataframe to be populated later
df2 <- data.frame(matrix(ncol = 3, nrow = 8))

# We need three columns for later on, firm name, average return and beta
colnames(df2) <- c("Firm", "AvRet", "Beta")
# We can populate the firm column with the column names from the downloaded data
df2$Firm <- colnames(df1)

# This next bit of code takes stock tickers from the df1 dataset and calculates the beta using OLS
calculate_beta <- function(stock_ticker)
	{
	stock_ret <- df1[[stock_ticker]]
	market <- df1$MKT
	fit <- lm(stock_ret ~ market)
	return (fit$coef[2])
	}

# The next 4 lines execute the above function for each firm name and assigns the betas to df2
betas <- list()
for (i in df2$Firm){
	betas[[length(betas) + 1]] <-  calculate_beta(as.character(i))}
df2$Beta <- betas

# As above, but this time for average return
calculate_AvRet <- function(stock_ticker)
	{
	stock_ret <- df1[[stock_ticker]]
	return (mean(stock_ret))
	}
ret <- list()
for (i in df2$Firm){
	ret[[length(ret) + 1]] <-  calculate_AvRet(as.character(i))}
df2$AvRet <- ret

# Run the cross-sectional regression and plot the result
CAPM <- lm(as.numeric(df2$AvRet) ~ as.numeric(df2$Beta))
plot(df2$Beta, df2$AvRet)
abline(CAPM)
