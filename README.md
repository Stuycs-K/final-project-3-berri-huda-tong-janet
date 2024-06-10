[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info
Period 3
Huda Berri
Janet Tong 
Berry Jam 

## Overview
Our project is a simulation of 8ball/billiards, a game in which one uses a stick to ONLY hit a "cue" ball (the white ball), which in turn can move other balls across a board and into their designated holes. Many physics forces are at play, including ball collisions, momentum, friction, and more, aspects of which are all included in our project. With this, different levels of force can be exerted on the stick/balls and result in different outcomes in positioning, creating so many outcomes of our game. 

## Instructions

To activate the stick, press your mouse. Moving ur mouse around (not dragging!) will allow you to control the angle at which the stick hits the cue ball. Pressing your mouse again will allow you to secure this angle. If you'd like to change your stick configuration, press your mouse again and changes in orientation are again allowed. 

Once the angle is secured, move your mouse to the sidebar and drag the stick down as much as you would like. The further the stick is dragged down, the more force placed on the stick when hitting the ball. Releasing your mouse after dragging will shoot the ball. 

Repeat this cycle by once again pressing your mouse to reset the location of the stick and play! 

For easier demo-ing, the cueball can be moved at any time: to do so, ensure the cursor is over the ball the whole duration of dragging, meaning do not drag the ball around too fast. 

To reset the board, press the key "r". This will return the board to its initial state. 

To easily win the game, press the key "w". This will set up a very easy win, to display the win screen.

To easily lose the game, press the key "d". This will set up a very easy loss, to display the lose screen.

Like regular billiards, players determine whether they are striped or solid based on which ball is hit first: once a player hits a certain type of ball, the opposite is designated to the other player. To win, each player must get all 7 of their respective balls in, and THEN get the black 8 Ball in. If either player gets the white cue ball in, their turn is over, and the other player is able to place the cue ball anywhere on the screen. 

If a player does not get in any balls or only gets in their opponents balls, their turn ends. 
If a player gets their own balls in the holes, they can play again. 

## POSSIBLE BUGS 

The inital break shot is unrealistic and buggy at times due to our trouble in resolving multi-ball collisions. The best way to separate the balls is to hit the dead center of the very closest yellow ball at a force an intensity of about 4-5 bars (see the side bar lines). At times, balls may be stacked on top of eachother -- if so aggressively hit the jumbled balls at a high intensity to break them apart. 

To effectively land a ball into a pocket, don't put too much force; otherwise, the bounce will appear to be in the hole but will bounce off. 

Shooting balls in while they're very close to pockets is susceptible to bugs due to the way the turn function is written. To counter this, place the cue ball farther away before shooting balls into pockets. 

## LINK TO VIDEO 

