# Flappy Bird AI
Flappy Bird game, but the bird is controlled by a feedforward net and a genetic algorithm.  
I created my own neural net for this project! For more information about the neural net I used, visit [my neural network code on Github](https://github.com/singhalmanu9/neuralnet).  
Essentially, the birds are given 5 data points (distance to closest pipe, current height, current velocity, top of the closest opening, and size of the opening) and are told to use those inputs to determine whether or not to jump at the current timestep. Bird's "brain" is a 3 layer neural network with 5 input nodes, 8 hidden nodes, and 1 output node whose weights are evolved by means of a genetic algorithm that clones and mutates better birds and passes their genes on to the next generation. Each generation consists of 500 birds and the program keeps track of the highest score seen so far, how well the best bird from the previous generation would do, and the average score for all birds from that generation.  
When running these parameters, the birds can break 100 points in a matter of 10-20 generations.

Inspired by Dan Shiffman's Coding Challenge
