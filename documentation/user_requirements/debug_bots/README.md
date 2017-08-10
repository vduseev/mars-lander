# Debug Bots

Debugging bots and bot training programs is a primary action executed by
a user of this system.

When developing a bot program to operate the Mars Lander the usually faces a
challenge of finding where the error in program is. The program usually grows
quite fast in size the more challenging the environment of Mars becomes.

Having no option to write unit tests or debug the program on CodinGame user
resorts to developing the code in a favorite editor writing a set of unit tests
in a separate file. It does not, however, help to debug the logic of the bot
program. When certain conditions are met it is much easier to observe the
situation on the simulation screen real-time checking the position of the
Lander visually instead of debugging using pure numbers and variables only.

As future users of the system we believe that the option to debug bot programs
while drawing simulation in the process will aid a lot with development of
complex bot programs.

Another option is when we need to debug a bot training program. Imagine a script
that generates new bots using genetic algorithm. Essentially, the script must
generate an epoch of bots, test each and everyone of them against the
simulation, having no need, of course, to display all that (just pure and fast
simulation), then check the results of the simulation and use them to generate
a new epoch. What if the bot programs this script generates all have a
critical bug in them? How would we approach a debugging of such script?

It would be convenient to do it all in a single debug run from IDE. A flow that
encompasses such approach is described in the [Normal Flow](#normal_flow)
section.

## Created By
Vagiz (August 10, 2017)

## Primary Actors

## Secondary Actors

## Triggers

## Preconditions

## Postconditions

<a name="normal_flow"></a>
## Normal Flow

## Exceptions

## Priority

## Frequency of Use

## Business Rules

## Assumptions
