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
an easy way to train a neural network in Mars Lander problem. We decided to
build a tool that will allow us to do that.
Check the official problem description here:
[Mars Lander - Episode 3 on CodinGame](https://www.codingame.com/training/expert/mars-lander-episode-3).

### History
#### End of May, 2017
We tried to solve Mars Lander problem at the end of the evening after a good
bunch of drinks. We advanced to the second level where we were stuck with a
landing strategy.
#### Beginning of June, 2017
We proceeded to the third level. However, simple tactics did not work here.
![Mars Lander - Episode 3](https://image.ibb.co/bNiY8Q/mars_lander_episode_3.png)

The map of this level is quite complex and requires the lander to find a path to the
landing zone. It can be done by a very simple algorithm:
* Obtain higher position than highest obstacle on map;
* Strafe in the direction of landing zone;
* Start landing when there are no obstacles between lander and landing zone;
* Land safely on the ground.

This algorithm is only applicable to the data presented in a problem. It's not
a general solution, which we did not like. Discussing other approaches we
thought about implementing A* path finding by converting whole area to a graph,
but it did not appeal to us. Then we googled possible solutions based on
[Bezier](https://pomax.github.io/bezierinfo/) curves, but couldn't understand
how to apply them straight ahead. We decided to play with
neural networks + genetic algorithm tactics.
However, running each generation inside the browser to test its fitness could
not be done, obviously.

## Business opportunity <a name="business_opportunity"></a>
This project will allow coders to train their Neural Network bots without a need
to manually interact with CodingGame. However, the simulation is aimed to be completely compatible with the
original one. Any generated or written bot that was successfully tested in
simulation will pass CodinGame tests.

### Problems that are not solved in original game <a name="problems"></a>
* Running thousands of Mars Lander simulations quickly
* Draw additional things during visualization (bounding boxes, lines, etc.)
* Integration between IDE and CodinGame (no copy-pasting between IDE and broswer)

### Aligning with trends
With this simulator we create an opportunity for junior developers to learn
about genetic algorithm and neural networks and write even complex bots without
a fuss. Also anything related to deep learning is on the edge currently.

It's worth mentioning, that such project also aligns with our own strategy that nourishes development of hobby projects with attention to detail.

### Typical needs of a user
As coders we searched for an IDE integration with CodingGame or for a simulator
that will allow us to implement complex approaches to bot creation.

### How product would be used
1. User faces one of the [problems](#problems) described above
2. Finds our repository on GitHub
3. Quickly reads how to use it
4. Downloads binaries or clones the repository and builds it
5. Uses an API our system provides to run thousands of simulations in it
6. Plays recordings of simulations using advanced bot debug drawing we provide
7. User develops a bot that solves the problem
8. Uploads bot's source code to CodinGame

### Critical interface and quality requirements
* The system must provide amazingly simple to use API for a user enable bot
development in any language.
* The system must be very easy to run or start. No mega-dependencies.
* The system must be flexible and allow user to configure performance of
simulations.

## Business objectives <a name="business_objectives"></a>
* Earn 10 stars on GitHub within 3 months after project completion.

## Success metrics <a name="success_metrics"></a>
* Reduce time required to run a new bot by 50 percent in comparison to
  CodinGame.
* Reduce average time user needs to develop a bot by 25 percent.
* Keep time required to manually deploy the system on any of 3 primary
  operating systems (Windows, Linux, MacOS) within 1 min, excluding download time.
* Run 1000 simulations simultaneously in less than 10 seconds on a 6th generation
  Intel processor.
* User is able to develop bots without ever switching focus from IDE.
* Comply with requirements check list from Code Construct book.
* Comply with architecture check list from Code Construct book.

## Vision statement <a name="vision_statement"></a>
For programmers who need to train a neural network in Mars Lander problem from
CodinGame, the Mars Lander Simulator is a simulation system that will provide
a simple but powerful set of tools. The system allows to run thousands of bots
simultaneously, provides advanced visualization functions, and enables user to
avoid switching focus from actual code. It ultimately saves time required for
bot development.

## Business risks <a name="business_risks"></a>
* RISK-1: Users reject the system thinking it is not worth it to run it.
* RISK-2: Mars Lander problem is too old and lost all its hype. Users are not
  interested in a simulator for it.
* RISK-3: CodinGame will release a referee code for Mars Lander problem
  allowing users to create their own simulator without carefully studying the
  original game.
* RISK-4: By focusing on development of a single repository instead of spending
  our time on alternative problems we might develop skills irrelevant to the
  current software development market.

## Business assumptions and dependencies <a name="business_assumptions_and_dependencies"></a>
* CodinGame will not release referee source code for Mars Lander problem.
* About 1% of programmers who tried to solve Mars Lander Ep.3 problem are
  thinking about applying neural network approach and start looking into
  problem discussions for ideas on how to do that.
* Around 30 people try to solve Mars Lander Ep.3 each month.
