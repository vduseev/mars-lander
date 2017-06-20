# Mars Lander Simulator Architecture

## General View

### Referee
* Referee is an executable program

### Game Server
* Server is an executable program
* We can communicate with Server:
  * Via Terminal with standard inputs and outputs and basic commands
  * Via REST API over HTTP
* Server creates an instance of Referee for each bot

### Visualization

### Bots
