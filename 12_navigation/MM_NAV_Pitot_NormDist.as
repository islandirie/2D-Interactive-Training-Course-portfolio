include "../00_as3/changeSpeed.as";
import flash.display.MovieClip;

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(Event): void {
	////////////////////// frame 2 //////////////////////////
	// 2, 5, 6, 7
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	if(currentFrame == 5){
		changeSpeed(fr5Animation, currentFrame, .2);
	}
	if(currentFrame == 6){
		changeSpeed(fr6Animation, currentFrame, .2);
	}
	if(currentFrame == 7){
		changeSpeed(fr7Animation, currentFrame, .2);
	}
}
