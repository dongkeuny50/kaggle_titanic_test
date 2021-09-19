
data {
  int<lower=0> N;
  int<lower=0,upper=1> Sex[N];
  real<lower=0, upper=1> Pclass[N];
  real<lower=0,upper=1> Fare[N];
  real<lower=0,upper=1> Age[N];
  int<lower=0,upper=1> Y[N];
}

parameters {
  real b[5];
}

transformed parameters {
  real q[N];
  for(i in 1:N)
    q[i] = inv_logit(b[1]+b[2]*Sex[i]+b[3]*Pclass[i]+b[4]*Fare[i]+b[5]*Age[i]);
}

model {
  for(i in 1:N)
    Y[i] ~ bernoulli(q[i]);
}

