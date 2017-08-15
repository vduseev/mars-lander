# Mars Lander Simulator Architecture

### Change log
| Date | Proposition | Author |
|-|-|-|
| Jun 01, 2017 | First ideas about Architecture | Vagiz |
| Aug 14, 2017 | Detailed running sequence diagram draft | Vagiz |
| Aug 15, 2017 | Added arguments to simulation call | Vagiz |

## Flow Details

### **User** starts simulation
Two ways of starting the simulation are planned:
* Run via IDE: "Run run.py"
* Debug via IDE: "Debug run.py" with breakpoints

Generally, `run.py` will contain necessary data to call `simulation.py`.
It initiates a startup stage.

### Startup Stage

#### Simulation parameters
Following simulation parameters must be identified during startup stage.

| Parameter meaning | Type | Parameter name | Mandatory | Comment |
|-|-|-|-|-|
| Bot script location | String | `--bot` | Yes | Only one bot per simulation |
| Map file/files location | List<String> | `--maps` | Yes | `[1..N]` maps can be used during simulation |
| Simulation recording location | String | `--record` | No | Saves simulation log to specified location, if provided |
| Real-time visualization | Non-value Arg | `--draw` | No | When provided then visualization happens during simulation |

##### Notes:
If both `--record` and `--draw` are not provided, then simulation makes no
no sense, since it is not visualized and not saved.
In such case simulation will not take place and exception will be thrown.

##### Priority:
There are several ways to set simulation parameters. Each way has its own
priority. Options with higher priority override those with lower priority.
| Parameter source | Priority |
|-|-|
| `run.py` global constants | 1 |


#### Calling `simulation.py` with args
##### `--draw`
If provided, then simulation will start Visualization subprocess.

2. **simulation.py** starts **bot.py** using subprocess module
    * input is set to a **PIPE** named **referees_output**
    * output is set to a **PIPE** named **referees_input**

### TODO: take arguments into account!!!

### Initialization Stage

### Simulation Loop Stage

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
