#loading data
pc <- read.csv("prostate_cancer.csv")
attach(pc)

#drawing histograms for cancer variables
hist(log(cancervol))
hist(weight)
hist(log(psa))
hist(age)
hist(benpros)
hist(vesinv)
hist(capspen)
hist(gleason)

#drawing scatterplots and calculating r 
plot(log(cancervol),log(psa),main = "Scatterplot of log(psa) vs log(cancervol)", xlab = 'log(cancervol)', ylab = "log(psa)")
cor(cancervol,psa)
plot(weight,log(psa),main = "Scatterplot of log(psa) vs weight", xlab = 'weight', ylab = "log(psa)")
cor(weight,psa)
plot(age,log(psa),main = "Scatterplot of log(psa) vs age", xlab = 'age', ylab = "log(psa)")
cor(age,psa)
plot(benpros,log(psa),main = "Scatterplot of log(psa) vs benpros", xlab = 'benpos', ylab = "log(psa)")
cor(benpros,psa)
plot(capspen,log(psa),main = "Scatterplot of log(psa) vs capspen", xlab = 'capspen', ylab = "log(psa)")
cor(capspen,psa)
plot(gleason,log(psa),main = "Scatterplot of log(psa) vs gleason", xlab = 'gleason', ylab = "log(psa)")
cor(gleason,psa)


#drawing boxplots for qualitative variable
boxplot(psa ~ vesinv, data = pc, main = "Boxplot of vesinv", ylab="PSA level (mg/ml)")
boxplot(psa ~ gleason, data = pc, main = "Boxplot of gleason", ylab = "PSA level (mg/ml)")

#simple linear regression model
fit1 <- lm(log(psa)~0+log(cancervol))
summary(fit1)
anova(fit1)

#full model using all predictors
fit2 <- lm(log(psa) ~ 0+log(cancervol) + weight + age + benpros+ vesinv + capspen + gleason)
summary(fit2)

#comparing models
anova(fit1,fit2)

#creating model after removing insignificant predictors
fit3 <- lm(log(psa) ~ 0+log(cancervol) + gleason+ vesinv + benpros)
summary(fit3)

#comparing models
anova(fit3,fit2)

#drawing residual plot and QQ plot
plot(fitted(fit3),resid(fit3))
abline(h=0)
qqnorm(resid(fit3))
qqline(resid(fit3))

#time series plot of residuals
plot(resid(fit3),type = "l")
abline(h=0)


#comparing all 3 models
anova(fit1,fit3,fit2)

#using forward stepwise selection
fitfull <- lm(log(psa) ~ 0+log(cancervol) + weight +age + benpros+ vesinv + capspen +gleason)

fit_step3 <-step(fitnull,scope = list(upper=fitfull),direction = "forward", trace = 1)
summary(fit_step3)


#prediction
new.xvalues <-data.frame(cancervol= log(mean(cancervol)),gleason=mean(gleason),vesinv=which.max(table(vesinv)), benpros = mean(benpros))
log_psa = predict(fit3, newdata = new.xvalues)
log_psa
psalevel = exp(log_psa)
psalevel





