df1 <- read.csv("https://raw.githubusercontent.com/mattdburke/ReplicatingCAPM/main/data.csv")
df2 <- data.frame(matrix(ncol = 3, nrow = 8))
colnames(df2) <- c("Firm", "AvRet", "Beta")
df2$Firm <- colnames(df1)
calculate_beta <- function(stock_ticker)
	{
	stock_ret <- df1[[stock_ticker]]
	market <- df1$MKT
	fit <- lm(stock_ret ~ market)
	return (fit$coef[2])
	}
betas <- list()
for (i in df2$Firm){
	betas[[length(betas) + 1]] <-  calculate_beta(as.character(i))}
df2$Beta <- betas
calculate_AvRet <- function(stock_ticker)
	{
	stock_ret <- df1[[stock_ticker]]
	return (mean(stock_ret))
	}
ret <- list()
for (i in df2$Firm){
	ret[[length(ret) + 1]] <-  calculate_AvRet(as.character(i))}
df2$AvRet <- ret
CAPM <- lm(as.numeric(df2$AvRet) ~ as.numeric(df2$Beta))
plot(df2$Beta, df2$AvRet)
abline(CAPM)
