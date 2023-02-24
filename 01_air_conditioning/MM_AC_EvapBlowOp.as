include "../00_as3/changeSpeed.as";

frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(event):void{
	///////////////// frame 2 /////////////////////
	if (currentFrame <= 2){
		ACpanel.fwd_evapBlower.rotation = -120; //off
		ACpanel.airCond.gotoAndStop(1); //off
		ACpanel2.aft_evapBlower.rotation = -120; //off
		battPanel.gotoAndStop(1); //off
		defog.switchTo.gotoAndStop(1); //off
	}
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .2);
	}

	///////////////// frame 3 /////////////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = 0; //on
		ACpanel.airCond.gotoAndStop(3);	//on
		ACpanel2.aft_evapBlower.rotation = 0; //on
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(1); //off
	}
	
	////////////// frame 4 ////////////////////////
	if(currentFrame == 4){
		changeSpeed(fr4Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = 0; //on
		ACpanel.airCond.gotoAndStop(3);	//on
		ACpanel2.aft_evapBlower.rotation = -120; //off
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(3); //on
	}
	
	///////////// frame 5 ////////////////////////
	if(currentFrame == 5){
		changeSpeed(fr5Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = 0; //on
		ACpanel.airCond.gotoAndStop(1);	//off
		ACpanel2.aft_evapBlower.rotation = 0; //on
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(3); //on
	}
	
	///////////// frame 6 ////////////////////////
	if(currentFrame == 6){
		changeSpeed(fr6Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = -120; //off
		ACpanel.airCond.gotoAndStop(1);	//off
		ACpanel2.aft_evapBlower.rotation = -120; //off
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(1); //off
		abnormalText.gotoAndStop(1);
	}
	
	///////////// frame 7 ////////////////////////
	if(currentFrame == 7){
		changeSpeed(fr7Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = 0; //on
		ACpanel.airCond.gotoAndStop(1);	//off
		ACpanel2.aft_evapBlower.rotation = -120; //off
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(3); //on
		abnormalText.gotoAndStop(2);
	}
	
	///////////// frame 8 ////////////////////////
	if(currentFrame == 8){
		changeSpeed(fr8Animation, currentFrame, .2);
		ACpanel.fwd_evapBlower.rotation = 0; //on
		ACpanel.airCond.gotoAndStop(1);	//off
		ACpanel2.aft_evapBlower.rotation = 0; //on
		battPanel.gotoAndStop(2); //on
		defog.switchTo.gotoAndStop(3); //on
		abnormalText.gotoAndStop(3);
	}
	
} // end of function controlClips()