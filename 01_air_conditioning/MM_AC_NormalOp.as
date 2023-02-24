import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.events.Event;
include "../00_as3/changeSpeed.as";

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);
ACpanel.airCond.stop();

function controlClips(event): void {
	
	// frame 2
	if (currentFrame >= 2) {
		ACpanel.airCond.gotoAndStop(3);
		illy_files.gotoAndStop(2);
	} else {
		ACpanel.airCond.gotoAndStop(1);
		illy_files.gotoAndStop(1);
	}
	//--------------------------------------------------------
	// changeSpeed(MovClip, currentFrame, Speed);
	//--------------------------------------------------------
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .2);
	}
	if(currentFrame == 4){
		changeSpeed(fr3Animation, currentFrame, 10);
	}
	if(currentFrame == 5){
		changeSpeed(fr5Animation, currentFrame, .2);
	}
}