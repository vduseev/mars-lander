# UC-1 Run Simulation

## Created By
Vagiz (July 3, 2017)

## Primary Actors
* Bot Developer
* Bot Training Algorithm

## Secondary Actors
* Simulation Server
* Bot Algorithm
* Referee Algorithm

## Triggers
* Bot Developer asks Simulation Server to run a simulation.
* Bot Training Algorithm asks Simulation Server to run a simulation.

## Preconditions
* PRE-1. Bot Developer provided path to Bot Algorithm to Simulation Server.
* PRE-2. Simulation Server has access to Bot Algorithm.
* PRE-3. Bot Developer provided path to Referee Algorithm to Simulation Server.
* PRE-4. Simulation Server has access to Referee Algorithm.
* PRE-5. Bot Developer provided paths to Initialization Data to Simulation
  Server.
* PRE-6. Bot Developer provided simulation recording saving path
  to Simulation Server.

## Postconditions
* POST-1. Simulation results are saved to game recording file.
* POST-2. Simulation Server returns success code to the caller.

## Normal Flow
![Normal Flow](https://image.ibb.co/gK9bza/uc_1_flow.png)

## Exceptions
* 1.0.E1 Path to Bot Program not specified.
* 1.0.E2 Path to Referee Program not specified.
* 1.0.E3 Path to initialization data (maps) not specified.

## Priority
High priority, because this is the most basic action in simulator.

## Frequency of Use
Approximately 1 request each 10 seconds.

## Business Rules
* BR-1

## Assumptions
Bot Algorithm, Referee Algorithm, and Simulation Server operate on the same
environment.
