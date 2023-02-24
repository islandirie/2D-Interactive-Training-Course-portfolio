import flash.display.MovieClip;
include "../00_as3/changeSpeed.as";

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(Event): void {
	// frame 2
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	// frame 3
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .2);
	}
	// frame 4
	if(currentFrame == 4){
		changeSpeed(fr4Animation, currentFrame, .15);
	}
	
}
