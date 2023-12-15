# Autocorrelation is a measure of similarity (correlation) between nearby observations

## TEMPORAL AUTOCORRELATION
# Sia 'd' un vettore di osservazioni temporali (daily)
set.seed(0)
d <- sample(100, 10)
a <- d[-length(d)]
b <- d[-1]
plot(a, b, xlab='t', ylab='t-1')










