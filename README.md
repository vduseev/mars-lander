# Mars Lander Simulator

![Header](https://image.ibb.co/g34FSv/mars_lander_simulator_header.png)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fce80be8f0a94c278a312d4586e15dca)](https://www.codacy.com/app/vagiz.d/mars-lander?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=vduseev/mars-lander&amp;utm_campaign=Badge_Grade)

## What is This?

That's a full copy of [Mars Lander game from CodinGame](codingame.com/training/expert/mars-lander-episode-3). However, it is now surrounded by some useful tools designed with
**neural network development** in mind.

If you tried to run each epoch of your network manually on CodinGame,
you would probably be dead on your feet.
It would be nice, if we could somehow simulate the Mars Lander game.
In that case we would be able to test the bots locally with full control
over the process. Well, that's exactly what we did here :)

Besides, you can debug your code in your own IDE,
and you can draw some helpful shapes during visualization to see what your
bot is doing right now.

So, we created this simulator in order to test the idea of neural networks
applied to the Mars Lander problem, and with the hope that it will aid others
in their attempt to implement much more complex approaches using tools provided.

## Demonstration
Video demonstrations to be added here.

## Try It Yourself!
You can try it out in two ways: by either downloading the binaries for your
system or by building the project from source. Don't hesitate about the latter
-- we try hard to make this project buildable in one step on most popular
platforms.

### I Just Want Binaries

#### Step-1 Get the binaries for your system.

| Platform | Binaries |
|----------|----------|
| Ubuntu 16.04 | |
| Ubuntu 17.04 | |
| Windows 10 x64 | |
| MacOS X 10.5 | |

#### Step-2 Is platform specific
##### Ubuntu 17.04
Unpack the archive. Note that `##` stands for project version.
```
tar xf mars-lander-x86-64-##.tar
```

##### Windows 10

##### MacOS X

##### Other systems
For any other system closely related to the ones above the project should be
buildable with some tweaks. Though we do not guarantee it.

### I Want To Build From Source

#### Step-1 Get the source code
Clone the repository.
```
git clone git@github.com:vduseev/mars-lander.git
```

or download it https://github.com/vduseev/mars-lander/archive/master.zip.

#### Step-2 Build it
Get into the root directory of the project.
```
cd mars-lander
```

Run the build script.
```
./build
```

#### Step-3 Run it
Make sure your bot is compiled and executable. The simulator must be able to
spawn a sub-process using your bot. Our system does not include compilers for
different languages.

To make your bot binary executable on \*nix systems use this command:
` chmod a+x <path_to_your_bot> `

Now run the simulator:
```
./simulator --bot <path_to_your_bot> --referee mars-lander-referee --map maps/level_1.txt
```

## Full Documentation
* [Requirements](/documentation/requirements)
* Architecture
