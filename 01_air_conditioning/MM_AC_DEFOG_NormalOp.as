import flash.events.Event;
import flash.display.MovieClip;
include "../00_as3/changeSpeed.as";

//include "../00_as3/T6_common_cockpit_actions.as";

// plays frame 3 defogHandle (glow)
frameMC.addEventListener(Event.ENTER_FRAME, defogPlay);


function defogPlay(event:Event):void {
	// frame 1
	if(currentFrame == 1){
		ACPanel.switch_big.gotoAndStop(1);
		ACPanel.ramAirFlow.gotoAndStop(1);
		defogSwitch.gotoAndStop(1);
	}
	// frame 2, main timeline. Bleed Air and Ram Air switches
	if(currentFrame == 2){
		ACPanel.switch_big.gotoAndStop(2);
		ACPanel.ramAirFlow.gotoAndStop(2);
		defogSwitch.gotoAndStop(1);
		//changeSpeed
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .2);
	}
	if(currentFrame >= 3) {
		moveDefogHandle.defogHandle.play();
		defogSwitch.gotoAndStop(3);
		ACPanel.switch_big.gotoAndStop(3);
		ACPanel.ramAirFlow.gotoAndStop(3);
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
}
/******** plays MovieClip in reverse, example: playReverse( movieClip instance name,
end frame Number, beggining fr number, stop at neutral frame)*/
function playReverse(mc2:MovieClip, endFr:Number, begFr:Number, stp:Number):void{
	if(mc2.currentFrame >= begFr && mc2.currentFrame <= endFr){
		mc2.prevFrame();
		if(mc2.currentFrame == begFr){
			mc2.gotoAndStop(stp);
		}
	} else {
		mc2.gotoAndStop(stp);
	}
}
// this code includes a specific RESET button for the defog animation, could not 
// figure out why it wasn't connecting too the "T6_Main_Navigation.as" Reset_Btn code
var tf2: TextFormat = new TextFormat();
tf2.size = 14;
Defog_Reset.setStyle("textFormat", tf2);
Defog_Reset.label = "RESET";
Defog_Reset.x = 910;
Defog_Reset.y = 615;
Defog_Reset.height = 25;
Defog_Reset.addEventListener(MouseEvent.CLICK, defogReset);

function defogReset(event:MouseEvent):void {
	gotoAndStop(1);
}
