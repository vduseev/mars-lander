# UC-1 Run Simulation

## Created By
Vagiz (July 3, 2017)

## Primary Actors
* Bot Developer
* Bot Trainer Executable

## Secondary Actors
* Simulator
* Bot Executable
* Referee Executable

## Triggers
* Bot Developer asks Simulator to run a simulation.
* Bot Trainer Executable asks Simulator to run a simulation.

## Preconditions
* PRE-1. Simulator is provided with paths to Bot Executable.
* PRE-2. Simulator has access to Bot Algorithms.
* PRE-3. Simulator is with provided path to Referee Executable.
* PRE-4. Simulator has access to Referee Algorithm.
* PRE-5. Simulator is provided with paths to Initialization Data.
* PRE-6. Simulator is with provided simulation recording saving path.

## Postconditions
* POST-1. Simulation results are saved to game recording file.
* POST-2. Simulator returns success code to the caller.

## Normal Flow
![Normal Flow](https://image.ibb.co/j5msPa/uc_1_flow.png)

## Exceptions
* 1.0.E1 Path to Bot Program not specified.
* 1.0.E2 Path to Referee Program not specified.
* 1.0.E3 Path to initialization data (maps) not specified.
* 1.0.E4 Saving path for simulation recording not specified.

## Priority
High priority, because this is the most basic action in simulator.

## Frequency of Use
Approximately 1 request each 10 seconds.

## Business Rules
* BR-1

## Assumptions
Bot Executable, Referee Executable, and Simulator all operate on the same
environment.
