# Bullet-Hell
APCS Spring 2022 Final Project, Bullet Hell

Group: Dodgers

Sudman Khan, Andrew Hur

A Bullet Hell genre game, in which the player controls an avatar that is able to shoot. There will be enemies floating around the space as well that shoot at the player and try to kill it. The goal is to shoot the enemies all while dodging barrages of bullets shooting through space at you.


Dev Log

5/23/22
Sudman - Made the game files and classes that we needed based on the UML diagram. Wrote constructors for each class except Bullet. Wrote display methods for player and enemy and tested them.

5/23/22 - 5/24/22
Andrew - Wrote control methods for Player. In testing process. Mouse movement moves fine, wasd movement currently not working. Switching between modes is also not working. Will fix bugs later. Tried fixing bullet class on my own branch. Didn't work out well. Sudman finished that before me so will have to pull from updated main branch and deal with a merge conflict tomorrow.

5/24/22
Sudman - Fixed keyboard control methods for Player. Wrote the constructor for the bullet class and wrote the shoot method for bullets and made it so that players can now shoot bullets in a straight line. Made it so that players cannot go past the borders of the game window. Finally, changed the background color to black and the bullet color to yellow. Will probably change later with updated graphics.

5/25/22
Sudman - Players can now shoot while mouse is held down. Implemented a delay before each bullet is shot so its not basically a laser. Next, tried to write methods to shoot towards the mouse position but this one will take some more time to implement as it doesn't work properly yet.

5/25/22
Andrew - Fixed the methods for shooting towards the mouse position. Tried to create an enemy that would shoot bullets. The enemy will now shoot bursts of bullets periodically but these bullets are shot directly down and are very easy to dodge. Will add different attack patterns later. Must also implement way for the player to take damage and the enemy to take damage. Also need to differentiate player bullets and enemy bullets. Will start working on that tomorrow.

5/26/22 - 5/27/22
Andrew - Finally fixed the controls. They work as expected and are very accurate.
Sudman - Working on HP System, but realize that countdown for the bullets was broken because of a bug and am now working to fix said bug. 

5/28/22 - 5/30/22
Sudman - Fixed the delay for bullets. Changed it so that it takes in a varable, shootingSpeed, so essentially we can change very easily how fast the player can shoot. Next, gave the shoot method to enemies, so now they target the player and shoot at them. Changed graphics: Player bullets are now blue and enemy bullets are now red. Added a slight glow to each. Finally, when space bar is held, the player moves slower making it easier to dodge enemy shots as the normal movement speed was too fast to dodge.

Andrew - Found a few bugs that have to do with HP and displaying. Tried fixing them but didn't work. Must do more testing. Made it so enemies move randomly. Movement is not incredibly jerky but it's random so the movement leaves a lot to be desired. Random movement also applies to all enemies across both current stages. Might want to edit that later based on gameplay difficulty. 

Sudman - Created 5 stages (for now) with varying number and positions of enemies. Also added a start screen so you aren't immediately thrown into a game. Also added a death screen where you can choose to restart from the beginning. Might have to tweak enemy behavior based on difficulty.

5/31-6/1

Sudman - Added a no death mode for easier debugging (I do not want to repeatedly die, I hope you understand). Was working on adding a delay between stages but could not figure it out that well. Made 2 new classes: StrongBullet (deals double dmg and extends Bullet) and StrongEnemy (has 5 health and extends Enemy). Tweaked stages to include these enemies. Strong Bullets are purple and Strong Enemies are red for differenciating purposes. 

Andrew - Started to work on Homing Bullets. Having some difficulty.

6/2 - 6/5 
Andrew - Gave up on the homing bullets. There are other features that I could implement that are more valuable and a better use of my time. Changed a few visual things to do with the text layout and added Health Packs. They spawn in the middle of the screen every minute and despawn if not collected after 5 seconds. If the player collects a health packet (by running over it), then it will also disappear. 

6/6
Andrew - Fixed minor bugs with game stage display and health packet timing.
