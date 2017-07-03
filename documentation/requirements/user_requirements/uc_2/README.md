# UC-2 Play Simulation

## Created By
Vagiz (July 3, 2017)

## Primary Actors
* Bot Developer

## Secondary Actors
* Simulation Player

## Triggers
* Bot Developer opens simulation recording in Simulation Player.

## Preconditions
* PRE-1. Simulation Player is provided with path to recording file.

## Postconditions
* POST-1. Simulation Player displays opened simulation with player
  controls.

## Normal Flow
![Normal Flow](https://image.ibb.co/mywOxv/uc_2_flow.png)

## Exceptions
* 2.0.E1 Not a simulation recording.
  File has wrong format or file is not available.

## Priority
High priority, because this is the most basic action in simulator.

## Frequency of Use
Approximately 1 use each 5 minutes.

## Assumptions
Simulation recording is available in the same environment as player.
