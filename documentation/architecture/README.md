# Mars Lander Simulator Architecture

### Change log
| Date | Proposition | Author |
|-|-|-|
| Jun 01, 2017 | First ideas about Architecture | Vagiz |
| Aug 14, 2017 | Detailed running sequence diagram draft | Vagiz |

## Flow Details
1. **User** starts simulation.
    * Run via IDE: "Run run.py"
    * Debug via IDE: "Debug run.py" with breakpoints
1. Startup Stage
    1. Simulation program reads arguments
        1. If **--draw** is provided, then simulation will start Visualization
           subprocess
    1. Simulation program must read configuration
        * Bot script location
        * Map file location (single map)
        * Simulation recording save location
        1. From itself: **simulation.py** constants
            * Preconfigured values must be available
        2. From **simulation.ini** file located near **simulation.ini**
    2. **simulation.py** starts **bot.py** using subprocess module
        * input is set to a **PIPE** named **referees_output**
        * output is set to a **PIPE** named **referees_input**
    3. TODO: take arguments into account!!!
2. Initialization Stage
3. Simulation Loop Stage

## General View
![Running Sequence](https://image.ibb.co/eJxvnF/simulation_bot_debug.png)

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
