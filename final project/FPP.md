# Final Project Proposal

### Title
NBA Stats - Start or Sit?
I can't really think of a better title right now but hopefully I'll come up with something a little more creative when I'm done.

### Summary
My goal for this project is to create a web-based tool that allows the user to access the basic and advanced stats of NBA players and teams, allows the user to compare multiple players based on overall and specific stats, and potentially analyze a lineup of players for fantasy league purposes.

### Resources
The biggest resource that I need to figure out how to get access to is an NBA API. It used to be a lot easier to get access to live data from either NBA.com or ESPN.com, however in recent years they've either made that data private or made it only accessibly on their website through a paid subscription. There are other APIs like balldontlie.io that seem much easier to use and have regularly updating live stats, however, a lot of them aren't cheap.
 
### Specifics
As I mentioned in the summary, my goal is to create a tool to access and visualize player and team statistics from an NBA API. This would hopefully be both historical stats and live/current season stats, and allow as up-to-date a view as possible. Firstly, I plan on having a tool to select individual players, and view their basic stats (points, assists, rebounds, blocks, assists, minutes, attempts, etc.) as well as advanced stats like box-plus-minus. Another feature I would like to have is the ability to select and compare two different players based on their basic and advanced stats, and determine in which areas one player is better than another. The last and most difficult feature I would like to include is the ablilty to select a lineup of players, and determine based off of the available statistics which players would be better to start or sit in a fantasy basketball league. These statistics would be retrieved from an NBA API, and displayed visually in a graph.

### GOOD Project Outcome
At a minimum, I want the software to be able to access historical basic and advanced NBA stats and print them in a readable visual medium. 

### BETTER Project Outcome
I also would like for the project to have the ability to access live and current statistics, and automatically update when new information is received. I also would like for the user to be able to compare the data between two selected players.

### BEST Project Outcome
My ultimate goal with this project is to create a feature in which a selected group of players can be analyzed based on their current and projected stats to determine which players should be started or benched in a fantasy basketball lineup. 

### Calendar
Within the next week, I need to determine which API I will be using, and so far I'm leaning towards using the NBA Stats API (https://github.com/nprasad2077/nbaStats), which is free, however doesn't have the ability to access live updating stats. A lot of this project will be done in Python and I've already begun researching and thinking of ways of implementing my ideas. So far I've started with pseudo-coding the more basic elements of this project and figuring out how the Python script will interact with the HTML/JS front-end. 