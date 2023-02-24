import flash.events.Event;
import flash.display.MovieClip;
include "../00_as3/changeSpeed.as";

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(event): void {
	
	if(currentFrame == 2){
		changeSpeed(fr2Animation, 2, .2);
		//changeCountFrame(currentFrame);
	}
	if(currentFrame == 4){
		changeSpeed(fr4Animation, 4, .2);
		//changeCountFrame(currentFrame);
	}
	if(currentFrame == 5){
		changeSpeed(fr5Animation, 5, .2);
		//changeCountFrame(currentFrame);
	}
	if(currentFrame == 6){
		changeSpeed(fr6Animation, 6, .2);
	}
	if(currentFrame == 7){
		changeSpeed(fr7Animation, 7, .8);
	}
	if(currentFrame == 8){
		changeSpeed(fr8Animation, 8, .2);
	}
	if(currentFrame == 9){
		changeSpeed(fr9Animation, 9, .2);
	}
}