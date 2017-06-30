# Business Requirements

The Mars Lander Simulator is launched in the belief that by providing
a convenient simulator for CodinGame participants we may witness the rise of
algorithm quality behind Mars Lander problem.

As developers of this simulator we invest heavily in a proper development style
we chose for this project. We expect ourselves to pay lots of attention to
requirements, architecture, design, code construction, and continuous delivery.
We hope for a suitable return on this investment in a form of experience and
better understanding of the development tactics applicable to software projects.

## Background <a name="background"></a>

### Context
As a group of developers spending our free time on CodinGame we did not find
an easy way to train neural network in Mars Lander problem. We decided to
build a tool that will allow us to do that.
[Mars Lander - Episode 3 on CodinGame](https://www.codingame.com/training/expert/mars-lander-episode-3)

### History
#### May, 2017
We tried to solve Mars Lander problem at the end of the evening after a good
bunch of drinks. We advanced to the second level where we were stuck with
landing strategy.
#### June, 2017
We proceeded to the third level. Simple tactics did not work here.
![Mars Lander - Episode 3](https://image.ibb.co/bNiY8Q/mars_lander_episode_3.png)

The map on level is quite complex and requires the lander to find a path to the
landing zone. Implementing A* path finding by converting whole area to a graph
did not appeal to us. We googled possible solutions with [Bezier](https://pomax.github.io/bezierinfo/) curves and
after a discussion we found out that we are unable to come up with a beautiful
solution. We decided to apply neural network + genetic algorithm tactics.
However, running each generation inside the browser to test its fitness could
not be done, obviously.

## Business opportunity <a name="business_opportunity"></a>
This project will allow coders to train their bots without connecting to
CodinGame. However, the simulation is aimed to be completely compatible with the
original one. Any generated or written bot that was successfully tested in
simulation will pass CodinGame tests.

### Problems that are not solved <a name="problems"></a>
* Running thousands of Mars Lander simulations quickly
* Draw additional things during visualization (bounding boxes, lines, etc.)
* Integration between IDE and CodinGame

### Aligning with trends
With this simulator we create an opportunity for junior developers to learn
about genetic algorithm and neural networks and write even complex bots without
a fuss. Also anything related to deep learning is on the edge currently.

Such project aligns with our own strategy that nourishes development of hobby
projects with attention to detail.

### Typical needs
As coders we searched for an IDE integration with CodingGame or for a simulator
that will allow us to implement complex approaches to bot creation.

### How product would be used
1. User faces a [problem](#problems)
2. Finds our repository on GitHub
3. Quickly reads how to use
4. Downloads binaries or clones the repository and builds it
5. Uses an API our system provides to run thousands of simulations in it
6. Plays recordings of simulations using advanced bot debug drawing we provide
7. User develops a bot that solves the problem
8. Uploads bot's source code to CodinGame

### Critical interface and quality requirements
* The system must provide amazingly simple to use API for a user in order for him
to develop a bot in any language.
* The system must be very easy to run or start. No mega-dependencies.
* The system must be flexible and allow user to configure performance of
simulations.

## Business objectives <a name="business_objectives"></a>

## Success metrics <a name="success_metrics"></a>

## Vision statement <a name="vision_statement"></a>

## Business risks <a name="business_risks"></a>

## Business assumptions and dependencies <a name="business_assumptions_and_dependencies"></a>
