import flash.events.Event;
import flash.display.MovieClip;
include "../00_as3/changeSpeed.as";

include "../00_as3/T6_common_cockpit_actions.as";

// plays frame 3 defogHandle (glow)
addEventListener(Event.ENTER_FRAME, defogPlay);
function defogPlay(event:Event):void {

	if(currentFrame >= 3) {
		moveDefogHandle.defogHandle.play();
	}
	if(moveDefogHandle.currentLabel == "middle" && currentFrame == 3){
		moveDefogHandle.gotoAndPlay("moveUp");
	}
	if(moveDefogHandle.currentLabel == "moveUp" && currentFrame !== 3){
		playReverse(moveDefogHandle,34,5,1);
	} 
	if(moveDefogHandle.currentLabel == "middle" && currentFrame == 4){
		moveDefogHandle.gotoAndPlay("moveDown");
	}
	if(moveDefogHandle.currentLabel == "moveDown" && currentFrame !== 4){
		playReverse(moveDefogHandle, 69,39,1);
	}
	//changeSpeed
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .5);
	}
}
/******** plays MovieClip in reverse, example: playReverse( movieClip instance name,
end frame Number, beggining fr number, stop at neutral frame)*/
function playReverse(mc:MovieClip, endFr:Number, begFr:Number, stp:Number):void{
	if(mc.currentFrame >= begFr && mc.currentFrame <= endFr){
		mc.prevFrame();
		if(mc.currentFrame == begFr){
			mc.gotoAndStop(stp);
		}
	} else {
		mc.gotoAndStop(stp);
	}
}

// code used to stop enter_frame listener with defogPlay()
function stopListener():void{
	if (this.hasEventListener(Event.ENTER_FRAME)){
		this.removeEventListener(Event.ENTER_FRAME, defogPlay);
	}
}

fl_switchTo(defogSwitch);

// plays air from ADC Lever
air_graphic.addEventListener(Event.ENTER_FRAME, showAir);
function showAir(e: Event): void {
	if (currentFrame == 1 || currentFrame == 4) {
		air_graphic.visible = false;
	} else {
		air_graphic.visible = true;
	}
}


/**** mask soft edges using faded color (alpha 0 - 100), 
gm_circle and air_graphic
gm_circle.cacheAsBitmap = true;
air_graphic.cacheAsBitmap = true;
air_graphic.mask = gm_circle; ****/

