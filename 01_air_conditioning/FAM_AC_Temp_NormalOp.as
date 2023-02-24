import flash.display.MovieClip;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE
var AConoff: MovieClip = ACPanel.airCond;
var evapBlwr: MovieClip = ACPanel.evapBlower;
var evapBlwrFan1: MovieClip = Evaporator_Blower1.evaporatorBlowerFan;
var evapBlwrFan2: MovieClip = Evaporator_Blower2.evaporatorBlowerFan;
var bleedAir: MovieClip = ACPanel.switch_big;
var pressure: MovieClip = ACPanel.pressurize;
var tempControl: MovieClip = ACPanel.tempKnob;
var ramAir: MovieClip = ACPanel.ramAirFlow;
var defogSwitch: MovieClip;
var moveDefogHandle: MovieClip;

//////// HIT BOXES FOR BUTTONS WITH 3 STATES
var bleedHit: MovieClip = ACPanel.bleedAir_hitBox;
var ramHit: MovieClip = ACPanel.ramAir_hitBox;
var pressHit: MovieClip = ACPanel.pressurize.pressure_hitBox;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
/*btn3States(bleedHit.hi, bleedAir);
btn3States(bleedHit.norm, bleedAir);
btn3States(bleedHit.off, bleedAir);
btn3States(ramHit.hi, ramAir);
btn3States(ramHit.norm, ramAir);
btn3States(ramHit.off, ramAir);*/

//btnOnOff(AConoff);
//btnOnOff(defogSwitch);

//guardMC(pressure.pressure_guard, pressure);

//gdKnobs(evapBlwr, evapBlwr.evapHit, -135, 135);
gdKnobs(tempControl, tempControl.tempHit, -135, 135);
//dragHandle(moveDefogHandle, moveDefogHandle.x, 532, 0, 153);

/////// HIDE BUTTONS USED AS TARGET AREAS
hiddenBtns(evapBlwr.evapHit);
hiddenBtns(tempControl.tempHit);
hiddenBtns(bleedHit);
hiddenBtns(ramHit);
hiddenBtns(pressHit);

//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
ACPanel.stopAllMovieClips();
tempControl.rotation = 60;
bleedAir.gotoAndStop("norm");
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
function allModes() {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Enable/disable buttons
	enableMovieClips(tempControl, true);
	NextNull.visible = true;
	PrevNull.visible = true;
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Move the TEMP CONTROL Switch to AUTO-Mid-Range";
			break;
		case 2:
			txt.text = "2. Move the TEMP CONTROL Switch to AUTO-COLD";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(tempControl.rotation >= -20 && tempControl.rotation <= 20) {
		gotoAndStop(2);
	} else if (tempControl.rotation > 20) {
		gotoAndStop(1);
	} else {
		gotoAndStop(3);
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

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// Best set-up for button controls on Instructional Mode

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in T6_Main_Navigation.as
	////////// frame 1 //////////////
	if (currentFrame < 3) {
		tempControl.filters = [yellowOutline];
		//changeSpeed(fr1Animation, currentFrame, .2);
	} else {
		tempControl.filters = null;
	}
	// Change Speed
	switch (currentFrame) {
		case 1:
			changeSpeed(fr1Animation, currentFrame, .2);
			break;
		case 2:
			changeSpeed(fr2Animation, currentFrame, .2);
			break;
		case 3:
			changeSpeed(fr3Animation, currentFrame, .2);
			break;
	}
}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	switch (currentFrame) {
		case 1:
			changeSpeed(fr1Animation, currentFrame, 1);
			break;
		case 2:
			changeSpeed(fr2Animation, currentFrame, 1);
			break;
		case 3:
			enableMovieClips(tempControl, false);
			changeSpeed(fr3Animation, currentFrame, 1);
			break;
	}

	//----------------------------------------------------
	// Clear Filters
	//----------------------------------------------------
	tempControl.filters = null;
}

//---------------------------------------------------------------
// Reset
//---------------------------------------------------------------
/*
this code resets all Movie Clips back to original position
*/
function ResetControls(): void {
	tempControl.rotation = 50;
	Resetter = false;
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
this function traces all movie clips, helps for timeline debug, call it when needed
*/
function traceMovies(): void {
	trace("bleedAir " + bleedAir.currentLabel);
	trace("pressure " + pressure.currentLabel);
	trace("pressure guard " + pressure.pressure_guard.currentLabel);
	trace("defogSwitch " + defogSwitch.currentLabel);
	trace("moveDefogHandle " + moveDefogHandle.defogHandle.currentFrameLabel);
	trace("bleedHit " + bleedHit.currentLabel);
	trace("ramHit " + ramHit.currentLabel);
	trace("pressHit " + pressHit.currentLabel);
}