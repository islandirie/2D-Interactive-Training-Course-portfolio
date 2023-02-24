import flash.events.Event;
import flash.net.URLRequest;
import flash.sampler.NewObjectSample;
import flash.display.MovieClip;
import flash.display.DisplayObject;
import flash.text.TextField;
include "../00_as3/changeSpeed.as";

/*
Movie Clips that follow main timeline position.
Using the frame counter button (frameMC) as an event listener with
multiple movie clips to control their animations. It saves time
instead of creating a seperate event listener for each movie clip.
*/

frameMC.addEventListener(Event.ENTER_FRAME, animatedFrames);
function animatedFrames(e: Event): void {
	// eicas lights
	eicas.gotoAndStop(currentFrame);
	// oxygen flow
	if (currentFrame >= 2) {
		oxygenPanel.oxygenFlow.play();
	} else {
		oxygenPanel.oxygenFlow.gotoAndStop(1);
	}
	
	// frame 2
	if(currentFrame == 2){
		changeSpeed(fr2Animation,currentFrame, .2);
	}
	if(currentFrame == 3){
		changeSpeed(fr3Animation,currentFrame, .2);
	}
	if(currentFrame == 4){
		changeSpeed(fr4Animation,currentFrame, .2);
	}
}
// plays supplySwitch during proper frames
// var supplySwitch:MovieClip = new MovieClip;
supplySwitch.addEventListener(Event.ENTER_FRAME, showSwitch);
function showSwitch(e: Event): void {
	if (currentFrame >= 2) {
		e.currentTarget.nextFrame();
	} else {
		e.currentTarget.prevFrame();
	}
}