include "../00_as3/changeSpeed.as";

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);
function controlClips(event):void{
	
	////////////// frame 1 ////////////////////
	if(currentFrame == 1){
		Defog.switchTo.gotoAndStop(1);
		ACPanel.switch_big.gotoAndStop(1);
	}
	
	////////////// frame 2 ////////////////////
	if(currentFrame == 2){
		Defog.switchTo.gotoAndStop(3);
		ACPanel.switch_big.gotoAndStop(2);
		changeSpeed(fr2Animation,currentFrame,.2);
	}
	////////////// frame 3 ////////////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation,currentFrame,.2);
	}
	
	////////////// frame 4 ////////////////////
	if(currentFrame == 4){
		Defog.switchTo.gotoAndStop(1);
		abnormalText.gotoAndStop(1);
		changeSpeed(fr4Animation,currentFrame,.2);
	}
	
	////////////// frame 5 ////////////////////
	if(currentFrame == 5){
		abnormalText.gotoAndStop(2);
		Defog.switchTo.gotoAndStop(3);
		changeSpeed(fr5Animation,currentFrame,.2);
	}
}