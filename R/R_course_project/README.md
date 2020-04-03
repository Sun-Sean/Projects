# Description of the Directory

The directory contains the small R project done in R programming course.
The topic I chose was to simulate the result of the markov chain library in R

However, I only made two simple functions, 
The first is to compute the the state vector,
given the initial state, the transition matrix and the number of states.

The second is used to find the steady state vector of the transition matrix,
given the transition matrix and the initial state.

The downside of the function I made for the second function is that:
1. If the steady state vector does not exist, the function won't stop the computation.
2. The finding of the steady state vector does not and should not rely on the initial state vector,
though any arbitrary input of the initial state vector leads to the same result,
it would be better to build a function that soley takes the transition matrix as an input.
