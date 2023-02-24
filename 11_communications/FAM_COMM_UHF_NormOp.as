include "../00_as3/changeSpeed.as";
import flash.display.MovieClip;

addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(Event): void {
	////////////////////// frame 2 //////////////////////////
	if(currentFrame == 2){
		changeSpeed(fr2Animation,currentFrame, .2);
	}
	///////////////////// frame 3 //////////////////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation,currentFrame, .2);
	}
	//highlight animations
	if(currentFrame == 3){
		frame2_highlights.gotoAndStop(3);
	} else if(currentFrame == 2){
		frame2_highlights.gotoAndStop(2);
	} else {
		frame2_highlights.gotoAndStop(1);
	}
}
