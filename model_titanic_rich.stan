
data {
  int<lower=0> N;
  real<lower=0, upper=1> Pclass[N];
  real<lower=0,upper=1> Fare[N];
  int<lower=0,upper=1> Y[N];
}

parameters {
  real b[3];
}

transformed parameters {
  real q[N];
  for(i in 1:N)
    q[i] = inv_logit(b[1]+b[2]*Fare[i]+b[3]*Pclass[i]);
}

model {
  for(i in 1:N)
    Y[i] ~ bernoulli(q[i]);
}

