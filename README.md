# HDL Based Rhythm Game

This project was a course project for our Digital Systems Design Laboratory course where I was the leader and main programmer for the group. 

The game works by loading it into an FPGA. Our instructor specifically used a ZedBoard that connects to a video feed so we were able to test it and verify that it works over the internet. Unfortunately, we weren't able to include music into this project but the design files included makes the base program of what a basic rhythm game would look like. You could study these files and codes to get a feel of what it takes to create a rhythm game on an FPGA.

<h3> Files: </h3>
<ul> 
<li> blockmaster </li>
- Generates the blocks of the rhythm game. Includes how they look like and the specific parameters used to move them down the screen.
<li>clk_blk</li> </n>
- Provides the clock for the program. It was set to the clock available on the FPGA.
<li> linecheck </li>
- Checks if the blocks reach the line. Determines the judgment of a 'hit' in rhythm games.
<li> topmodule </li>
- Top module of the different design files. Congregates them into a project.
<li> vga_gen </li>
- Generates the display. Generates the colors needed by the program.
<li> vga_timing </li>
- Timing of the display. Uses horizontal then vertical scanning used even by modern displays today.
</ul>


<br> <br>
Also included are some test benches to be able to verify that the different modules work on their own respectively, if you're into that.
