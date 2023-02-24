
//---------------------------------------------------------------
// GLOBAL VARIABLES
//---------------------------------------------------------------
//////// ALL OBJECTS ON STAGE
var AConoff: MovieClip = ACPanel.airCond;
var evapBlwr: MovieClip = ACPanel.evapBlower;
var pressure: MovieClip = ACPanel.pressurize;
var tempControl: MovieClip = ACPanel.tempKnob;
var ramAir: MovieClip = ACPanel.ramAirFlow;

//////// HIT BOXES FOR BUTTONS WITH 3 STATES
var bleedHit: MovieClip = ACPanel.bleedAir_hitBox;
var ramHit: MovieClip = ACPanel.ramAir_hitBox;
var pressHit: MovieClip = ACPanel.pressurize.pressure_hitBox;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
btnOnOff(AConoff);

/////// HIDE BUTTONS USED AS TARGET AREAS
hiddenBtns(evapBlwr.evapHit);
hiddenBtns(tempControl.tempHit);
hiddenBtns(bleedHit);
hiddenBtns(ramHit);
hiddenBtns(pressHit);

//---------------------------------------------------------------
// stop animations during start-up
//---------------------------------------------------------------
ACPanel.stopAllMovieClips();

//-----------------------------------------------------------------------------
// Initializes an event listener function, to listen on EVERY frame for changes
//-----------------------------------------------------------------------------
addEventListener(Event.ENTER_FRAME, initialize);
function initialize(event: Event): void {
	// Movie Clips that play regardless of what Mode your in
	allModes();
	//Switches modes which manages how controls/buttons function
	// LearnMode boolean is located in T6_Main_Navigation.as
	if (LearnMode) {
		OperationalMode();
	} else {
		InstructionalMode();
	}
}

//---------------------------------------------------------------------------
// allModes() Function - plays regardless of mode
//---------------------------------------------------------------------------
function allModes():void {
	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	enableMovieClips(AConoff, true);
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Select NEXT to start the engines.";
			break;
		case 2:
			txt.text = "2. Select Next to place the aircraft in flight at a steady climb to 8000ft.";
			break;
		case 3:
			txt.text = "3. Select Next to steady climb the aircraft between 8000ft and 18,000ft";
			break;
		case 4:
			txt.text = "4. Select Next to steady climb the aircraft about 18,000ft";
			break;
		default:
			txt.text = "Done";
			break;
	}
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// Frame 1
	if(currentFrame == 1){
		fam_pressurization.gotoAndStop("close");
	} else {
		fam_pressurization.gotoAndStop("open");
	}
	// Frame 2
	if(currentFrame == 3 && T6Motion.currentLabel != "t62"){
		T6Motion.nextFrame();
	} else if(T6Motion.currentLabel == "t62" && currentFrame == 3){
		stop();
	} else {
		T6Motion.prevFrame();
	}
	//----------------------------------------------------
	// Resetter
	//----------------------------------------------------
	// Resetter is set to true when "Reset" button is clicked,
	// Boolean variable located in T6_Main_Navigation.as
	if (Resetter) {
		ResetControls();
	}
}

//---------------------------------------------------------------------------
// InstructionalMode() - Plays slowly, can go back & forth - for Instructors
//---------------------------------------------------------------------------
function InstructionalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Next/Prev Null buttons
	
	//----------------------------------------------------
	// Parts of Animation
	//----------------------------------------------------
	//panel controls
	if(AConoff.currentLabel == "on" && currentFrame == 1){
		gotoAndStop(2);
	} 
	if(AConoff.currentLabel == "off"){
		gotoAndStop(1);
	}
	
	//----------------------------------------------------
	// Filters()
	//----------------------------------------------------
	if(currentFrame == 1){
		AConoff.filters = [yellowOutline];
	} else {
		AConoff.filters = null;
	}
	if(currentFrame > 1){
		NextBtn.filters = [yellowOutline];
	} else {
		NextBtn.filters = null;
	}
	
	//--------------------------------------------------------
	// changeSpeed(name of MovieClip, currentFrame, Speed);
	//--------------------------------------------------------
	/*if (currentFrame == 2) {
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	if (currentFrame == 3) {
		changeSpeed(fr3Animation, currentFrame, .2);
	}
	if (currentFrame == 4) {
		changeSpeed(fr4Animation, currentFrame, .2);
	}
	if (currentFrame == 5) {
		changeSpeed(fr5Animation, currentFrame, .2);
	}
	if (currentFrame == 6) {
		changeSpeed(fr6Animation, currentFrame, .2);
	}*/
}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control - for Students
//---------------------------------------------------------------------------
function OperationalMode():void {
	
	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	
	//----------------------------------------------------
	// Parts of Animation
	//----------------------------------------------------
	if(currentFrame >= 1){
		NextNull.visible = true;
		PrevNull.visible = true;
	}
	if(AConoff.currentLabel == "on" && currentFrame == 1){
		gotoAndStop(2);
		enableMovieClips(AConoff, false);
	} 
	if (currentFrame == 2) {
		//jumpToNext(fr2Animation,3);
	}
	if (currentFrame == 3) {
		//jumpToNext(fr3Animation,4);
	}
	if (currentFrame == 4) {
		//jumpToNext(fr4Animation,5);
	}
	if (currentFrame == 5) {
		//jumpToNext(fr5Animation,6);
	}
	
	//----------------------------------------------------
	// Filters()
	//----------------------------------------------------
	AConoff.filters = null;
	NextBtn.filters = null;
}

//---------------------------------------------------------------
// Reset
//---------------------------------------------------------------
/*
this code resets all Movie Clips back to original position
*/
function ResetControls(): void {
	AConoff.gotoAndStop("off");
	Resetter = false;
}
