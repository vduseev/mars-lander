# Mars Lander Simulator Use Cases

## Actors

<a name="actor_bot_developer"></a>
* **Bot Developer**

  Human developer working with Mars Lander Simulator.

<a name="actor_bot_executable"></a>
* **Bot Executable**

  Compiled bot program or executable script that implements bot logic with
  the same approach as on CodinGame (communication via stdin/stdout).

* **Referee Executable**

  Referee program possessing knowledge about Mars Lander simulation laws able
  to calculate results for each frame based on current input provided by bot.

* **Bot Trainer Executable**

  Program that is able to create new bots, run simulations for them, check
  results and produce better bots until success conditions specified in trainer
  are met.

* **Simulator**

  Program that is able to run simulations as told by Bot Developer or Bot
  Trainer Executable. Saves results of simulations under specified path.

* **Simulation Player**

  Program that is able to play simulations recorded by Simulator.

* **Map Editor**

  Program that allows bot developer to create and edit Mars maps to test
  bots in different situations.

## Use Cases
* [Run Simulation](/documentation/user_requirements/run_simulation)
* [Play Simulation](/documentation/user_requirements/play_simulation)
* [Play Simulation](/documentation/user_requirements/debug_bots)
* [Edit Maps](/documentation/user_requirements/edit_maps)
