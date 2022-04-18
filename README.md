# 50.002-1D-The-Holding-Dice

Group 16:\
Anshu Arun Gate (1005268)\
Cassie Chong Kenci (1005301)\
Christy Lau Jin Yun (1005330)\
Goh Nicholas (1005194)\
Ishan Monnappa Kodira (1005284)\
Lawrence Chen Qing Zhao (1005012)\
Lek Jie Wei (1005007)\
Nathan Chang (1005149)

## Game: The Holding Dice

Our prototype design involves a roll and hold button for each player and a central button to reset the game, five buttons in total. It will have five seven-segment displays, two 2-digit displays for each player’s current and accumulated scores, and one single-digit display showing the current dice roll. The prototype is made with a wood casing that is cheap, durable and pleasant to work with. Using laser cutting, we managed to engrave the necessary details and slots to embed our game components.

Code:

### Game6

This is for submission.\
This is Game5 with seven segments adapted to display on 2 digit seven segments that is our external output device.\
Idea to display on 2 digit seven seg: Jiewei

### Game5

This is functional game, based on Game4, with the addition of working beta, regfile and control unit.\
Managed to get dice to roll fair: Christy (her proudest achievement)\
Created Game5: Christy\
Debugging: Christy, Cassie

### Game4

This is functional game, based on Game3, copied from Game3 as Game3 got corrupted.\ Functional on external inputs and outputs.\
Still based on FSM from Game2, does not include beta/regfile/CU and uses pure FSM for game flow.\
Still an unfair dice. Christy is obssessed with making it fair.\
Created Game4: Cassie\
Debugging: Nicholas, Jiewei, Christy, Cassie

### Game3

This is not functional, unable to build due to build error. FSM may have errors from Game2.\
Based on Game2's newly created FSM but may not have sorted out logic.\
In hindsight the alu calculations and branch checking should not be in the same state as they interfere and is done at the same time in always block.\
Random dice has proven to work, though unfair as 6 is rarer than the rest due to approach.\
Created Game3: Cassie\
Debugging: Nicholas, Jiewei, Christy, Cassie

### Game2

Remade FSM due to Game being too complicated, this simplifies the logic and tries to make it work before making it modular. Failed though, dice can't roll, accumulated score not tallying.\
Designed newer simplified FSM: Cassie\
Created Game2: Cassie\
Debugging: Nicholas, Jiewei, Christy, Cassie

### Game

Made based on initial FSM created for checkoff. Has beta, regfile, control unit. Heavily referenced Prof Nat's Counter game for help with random dice, but only got random to work on Game3. Does not work and debugging is painful due to inconsistent code style.\
Control unit: Lawrence\
Tried dice rolling with random: Anshu\
Beta and Regfile: Jiewei

## MHP ALU

### ALU_16

This project contains the code for a 16-bit ALU programmed using FPGA.

It has the inputs:

> A[15:0]
> B[15:0]
> ALUFN[5:0]

And it has the outputs:

> Z
> V
> N
> ALU[15:0]

It also contains an auto tester and a manual tester, to test the ALU's various functionalities, by utilizing ROMs and FSMs.

ALU, adder, boolean, comparator, shifter, au_top for manual testing: Cassie\
Autotester and ROMs: Nicholas, Christy, Nathan\
Debugging: Cassie, Nicholas, Christy, Nathan\
Signed division (our proudest achievement): Christy, Nathan, Cassie

## segmenttest

Utility repo for us to experiment with making the seven segment work.
