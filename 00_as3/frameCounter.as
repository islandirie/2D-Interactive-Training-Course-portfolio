/*
This file controls the frame counter text located in bottom right
of all projects. It even positions text box properly on stage
using x and y coordinates.
Called from the T6_Main_Navigation.as file.
*/

// display TextField()
frameMC.frameCounter.addEventListener(Event.ENTER_FRAME, frameNumberText);
function frameNumberText(evt: Event): void {
	this.frameMC.x = 970;
	this.frameMC.y = 565;
	frameMC.frameCounter.text = currentFrame + ' of ' + totalFrames;
}