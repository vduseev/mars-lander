# First Draft of Requirements

### Referee
* We can control referee via terminal
* Referee knows everything about game laws
  * Restricts lander movement
  * Calculates collision
  * Stops the game if the bot did not provide an answer under time limit

### Game Server
* Server can communicate with several bots simultaneously
* Server knows nothing about game laws, but communicates with referee

### Visualization
* Visualization only works with recorded games
* We can pause visualization and play it step by step
* Visualization can draw several bots simultaneously

### Bot
* A bot can draw additional information during visualization
  * Straight Lines
  * Text
  * Path curves
  * Circles
* We need to draw fitness graph for genetic algorithm
* We need to visualize neural network for debugging

## Use Cases

### UC-1 Upload bot program to server

### UC-2 Run bot program on server

Preconditions:
* Bot is already uploaded to server

Postconditions:
* Game recording is produced

#### UC-2.1 Run single bot program

#### UC-2.2 Run multiple bot programs simultaneously

### UC-3 Download game recordings from server

### UC-4 Play game recordings with visualization

## Requirements
