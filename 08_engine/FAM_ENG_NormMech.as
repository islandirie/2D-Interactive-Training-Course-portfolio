import flash.display.MovieClip;
include "../00_as3/changeSpeed.as";

addEventListener(Event.ENTER_FRAME, controlClips);

rotatingGears.visible = false;

function controlClips(Event): void {
	if(currentFrame >= 2 && fr2Animation.currentFrame >= 40){
		rotatingGears.visible = true;
		rotatingGears.play();
	} else {
		rotatingGears.gotoAndStop(1);
		rotatingGears.visible = false;
	}
}
