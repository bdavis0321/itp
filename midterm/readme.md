# Intro to Programming - Midterm

### Phase 1
My goal for this midterm project was to be able to recreate the Aphex Twin logo within p5.js, and tile it according to the project requirements. My sketch on the graph paper was very sloppy, but I was less focused on pinpoint accuracy with the angles and more focused on planning out specifically how I would sketch the logo line-by-line. One reference that helped me out a ton was a reference of the geometry on Paul Nicholson's original logo, which I found here:

    https://steveffisher.wordpress.com/2017/02/22/aphex-twin-original-logo-designs/

### Phase 2
When trying to translate the sketch into p5.js, I was having a very tough time getting a bearing on where to even start with the shapes and coordinates for everything, but I figured out a way of organizing all of the shapes into three categories. First, I started with basic black rectangles and quadrilaterals all using the 4-coordinate quad() variables. Then, I used some black circles placed on the corners of the rectangles to round out the edges, all using circle() except for one arc(), which just draws an incomplete circle. The last shapes were all white-space circles and rectangles to basically cut out of the black shape, and these were also just circle() and quad(), except filled in white using the fill(255).

This phase probably just took the longest with experimenting with trial-and-error on where each shape would end up, and it was hard for me to use the original angles specified in Paul Nicholson's sketch, so I kinda just did it over and over with different coordinates until I got something that looked close enough. 

### Phase 3
While getting the whole sketch into the draw() function, I also made sure everything was as organized and optimized as possible. At this point I was also experimenting a bit with the translate and scaling as I was figuring out a plan on how to tile the sprite.

### Phase 4
This part was very confusing to try and figure out, but from the beginning I knew how I wanted it to function. I wanted the ability to be able to specify both the size of the canvas, as well as the grid subdivision, and using only these two variables would everything else work. It was a bit tricky getting the ratios figured out here as my sketch was not a perfect square, but rather 140 by 103 pixels. However, I realized it was easy to specify this ratio by just using (103/140) whenever needed.

To make everything a little easier at the beginning, I just started with having the canvas be 1400 by 1030, and the grid divided into 10 so I didn't have to deal with any extra variables. I started by trying to figure out the counting system, and I basically took that from my previous FizzBuzz project. 