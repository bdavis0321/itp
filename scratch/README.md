# itp
 ## Bryce
 ### Davis

# Week 2 - Scratch

#### My objective with this Scratch program was to create a function/animation of a basketball being shot into a hoop. 

## Movement Function

##### I started with attempting to program the movement of the basketball into the hoop. It took a few different tries using more basic movement scripts to realize I somehow needed to use a sine function to simulate the arc on a shot. 

##### I used two different functions for each dimension of movement. For the horizontal X movement, I used a "change x by (11)" function, which shifts the basketball sprite to the right by 11 units every frame. For the vertical Y movement, I used a variable C which increases by 4 each frame, and then Y is changed each frame by the sine of C multiplied by 12. I had to do a lot of trial and error with the numbers in each function before I found the most realistic looking arc. 

## Sequencing the Sprites

##### When the program is started, the basketball sprite is hidden, as the Andie sprite is already holding a basketball in costume 'andie-a'. When the space bar is pressed, the Andie sprite is changed to a shooting motion in 'andie-b', and the basketball sprite appears at the starting position of x:-206 y:-37, which is where the basketball in the 'andie-a' costume starts. 

##### As soon as the space bar is pressed, a looping function begins which moves the basketball in an arc, until the basketball sprite reaches a position greater than x:195, which is where the basketball hoop sprite is. I had some trouble with this function first, because I started with a "repeat until 'x position EQUALS 195'". The basketball sprite would not stop at the hoop and kept going through the arc, and I realized that because the basketball moves horizontally by units of 11, it passes over x:195 between two frames, which means it just skips through this check entirely. To fix this, I changed the equals function to a greater than function.

##### When the basketball sprite reaches the hoop at x:195, the movement loop ends, which hides the basketball, plays a "Goal Cheer" sound, and changes Andie to the costume 'andie-d' celebrating their made shot. Restarting the program hides the basketball, changes Andie back to the 'andie-a' costume, and stops the cheering sound effect.