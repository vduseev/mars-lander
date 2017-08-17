# Mars Lander Simulator Architecture

### Change log
| Date | Proposition | Author |
|-|-|-|
| Jun 01, 2017 | First ideas about Architecture | Vagiz |
| Aug 14, 2017 | Detailed running sequence diagram draft | Vagiz |
| Aug 15, 2017 | Added simulation parameters description | Vagiz |

## Breakdown by Phases
* Initialization
* Simulation Loop
* Teardown

## Breakdown by Components
* `run.py`
* `simulation.py`
* `visualization.py`

### Initialization
There are several ways to start simulation:
| Usecase | Description | Comments |
|-|-|-|
| | Run `run.py` via IDE | For simple bot development purposes |
| | Debug `run.py` via IDE | For debugging of bots of any difficulty |
| | Call `simulation.py` via CMD | For no particular reason |
| | Call `simulation.py` as a subprocess | For "trainer" program to run simulations |

**Note:** `run.py` will contain necessary parameters to call `simulation.py`
in a format of global constants.

#### Simulation parameters
Following simulation parameters must be specified and provided to
`simulation.py` during initialization stage.

| Parameter meaning | Type | Parameter name | Mandatory | Comment |
|-|-|-|-|-|
| Bot script location | `String` | `--bot` | Yes | Only one bot per simulation |
| Map file/files location | `List<String>` | `--maps` | Yes | `[1..N]` maps can be used during simulation |
| Simulation recording location | `String` | `--record` | No | Saves simulation log to specified location, if provided |
| Real-time visualization | Non-value Arg | `--draw` | No | When provided then visualization happens during simulation |

##### Notes:
If both `--record` and `--draw` are not provided, then simulation makes no
no sense, since it is not visualized and not saved.
In such case simulation will not take place and exception will be thrown.

##### Effects of `simulation.py` args

###### `--bot`
Path to a file containing bot logic. File must be runnable by python's
subprocess module. **TBD:** whether path is absolute or relative, or both.

Only one bot can be used for a single simulation run. This argument is
mandatory.

###### `--maps`
List of one or more maps which will be used in a simulation. Provided
in a format of space separated paths.

###### `--record`

###### `--draw`
If provided, then simulation will start Visualization subprocess as well.

* **simulation.py** starts **bot.py** using subprocess module
* **input** is set to a **PIPE** named **referees_output**
* **output** is set to a **PIPE** named **referees_input**

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
