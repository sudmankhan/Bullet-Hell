# Bullet-Hell
APCS Spring 2022 Final Project, Bullet Hell

Group: Dodgers

Sudman Khan, Andrew Hur

A Bullet Hell genre game, in which the player controls an avatar that is able to shoot. There will be enemies floating around the space as well that shoot at the player and try to kill it. The goal is to shoot the enemies all while dodging barrages of bullets shooting through space at you.


Dev Log

5/23/22
Sudman - Made the game files and classes that we needed based on the UML diagram. Wrote constructors for each class except Bullet. Wrote display methods for player and enemy and tested them.

5/23/22 - 5/24/22
Andrew - Wrote control methods for Player. In testing process. Mouse movement moves fine, wasd movement currently not working. Switching between modes is also not working. Will fix bugs later. Tried fixing bullet class on my own branch. Didn't work out well. Sudman finished that before me so will have to pull from updated main branch and deal wiht a merge conflict tomorrow.

5/24/22
Sudman - Fixed keyboard control methods for Player. Wrote the constructor for the bullet class and wrote the shoot method for bullets and made it so that players can now shoot bullets in a straight line. Made it so that players cannot go past the borders of the game window. Finally, changed the background color to black and the bullet color to yellow. Will probably change later with updated graphics.

5/25/22
Sudman - Players can now shoot while mouse is held down. Implemented a delay before each bullet is shot so its not basically a laser. Next, tried to write methods to shoot towards the mouse position but this one will take some more time to implement as it doesn't work properly yet.
