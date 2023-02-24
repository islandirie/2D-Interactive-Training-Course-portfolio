include "../00_as3/changeSpeed.as";

addEventListener(Event.ENTER_FRAME, controlClips);
function controlClips(event):void{
	
	////////////// frame 2 /////////////////////
	if(currentFrame == 2){
		changeSpeed(fr2Animation,currentFrame,.2);
	}
	////////////// frame 3 ////////////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation,currentFrame,.2);
	}
	if(currentFrame <= 3){
		ACPanel.ramAirFlow.gotoAndStop(1);
		ACPanel.switch_big.gotoAndStop(1);
	}

	////////////// frame 4 ////////////////////
	if(currentFrame == 4){
		ACPanel.ramAirFlow.gotoAndStop(2);
		ACPanel.switch_big.gotoAndStop(2);
		changeSpeed(fr4Animation,currentFrame,.2);
	}
	
	////////////// frame 5 ////////////////////
	if(currentFrame == 5){
		ACPanel.ramAirFlow.gotoAndStop(3);
		ACPanel.switch_big.gotoAndStop(3);
		changeSpeed(fr5Animation,currentFrame,.2);
	}
	
	////////////// frame 6 ////////////////////
	if(currentFrame == 6){
		changeSpeed(fr6Animation,currentFrame,.2);
	}
}