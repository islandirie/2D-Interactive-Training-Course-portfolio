﻿import flash.display.MovieClip;

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
btn3States(bleedHit.hi, bleedAir);
btn3States(bleedHit.norm, bleedAir);
btn3States(bleedHit.off, bleedAir);
/*btn3States(ramHit.hi, ramAir);
btn3States(ramHit.norm, ramAir);
btn3States(ramHit.off, ramAir);*/

//btnOnOff(AConoff);
btnOnOff(defogSwitch);

guardMC(pressure.pressure_guard, pressure);

//gdKnobs(evapBlwr, evapBlwr.evapHit, -135, 135);
//gdKnobs(tempControl, tempControl.tempHit, -135, 135);
dragHandle(moveDefogHandle, moveDefogHandle.x, 532, 0, 153);

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
//---------------------------------------------------------------
// Initializes an event listener function, to listen on EVERY frame for changes
//---------------------------------------------------------------
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
	// All Null buttons are visible
	NextNull.visible = true;
	PrevNull.visible = true;

	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Move the Bleed Air inflow Switch to NORM.";
			break;
		case 2:
			txt.text = "2. Select the Defog Switch to the ON position";
			break;
		case 3:
			txt.text = "3. Move the Air Distribution Control Lever to the CANOPY position";
			break;
		case 4:
			txt.text = "4. Lift the Guard and move the Pressurization Switch to RAM/DUMP";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame >= 3 && currentFrame < 5) {
		evapBlwrFan1.rotation -= 10;
		evapBlwrFan2.rotation -= 10;
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

function InstructionalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Enable/disable buttons
	enableMovieClips(moveDefogHandle, true);
	enableMovieClips(bleedHit, true);
	enableMovieClips(defogSwitch, true);
	enableMovieClips(moveDefogHandle, true);
	enableMovieClips(pressure.pressure_guard, true);
	enableMovieClips(pressHit, true);
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// Best set-up for button controls on Instructional Mode
	// works with reset button, if button is turned off will jump to proper frame number
	// also works with all movie clips, all other variations of the if/else statement
	// causes issues.
	if (bleedAir.currentLabel == "norm") {
		if (defogSwitch.currentLabel == "on") {
			if (moveDefogHandle.y <= 550) {
				if (pressure.currentLabel == "ramdump") {
					gotoAndStop(5);
				} else {
					gotoAndStop(4);
				}
			} else {
				gotoAndStop(3);
			}
		} else {
			gotoAndStop(2);
		}
	} else {
		gotoAndStop(1);
	}

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in T6_Main_Navigation.as
	////////// frame 1 //////////////
	if (currentFrame == 1) {
		bleedAir.filters = [yellowOutline];
		changeSpeed(fr1Animation, currentFrame, .2);
	} else {
		bleedAir.filters = null;
	}
	////////// frame 2 //////////////
	if (currentFrame == 2) {
		defogSwitch.filters = [yellowOutline];
		changeSpeed(fr2Animation, currentFrame, .2);
	} else {
		defogSwitch.filters = null;
	}
	////////// frame 3 //////////////
	if (currentFrame == 3) {
		moveDefogHandle.defogHandle.filters = [yellowOutline];
		changeSpeed(fr3Animation, currentFrame, .2);
	} else {
		moveDefogHandle.defogHandle.filters = null;
	}
	////////// frame 4 //////////////
	if (currentFrame == 4) {
		pressure.filters = [yellowOutline];
		changeSpeed(fr4Animation, currentFrame, .2);
	} else {
		pressure.filters = null;
	}
	////////// frame 5 //////////////
	if (currentFrame == 5){
		changeSpeed(fr5Animation, currentFrame, .2);
	}

}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {
	
	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Enable/disable buttons
	enableMovieClips(moveDefogHandle, false);
	enableMovieClips(bleedHit, false);
	enableMovieClips(defogSwitch, false);
	enableMovieClips(moveDefogHandle, false);
	enableMovieClips(pressure.pressure_guard, false);
	enableMovieClips(pressHit, false);
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// if correct buttons are pressed will move forward
	if(bleedAir.currentLabel == "norm" && currentFrame == 1){
		gotoAndStop(2);
	}
	if(defogSwitch.currentLabel == "on" && currentFrame == 2){
		gotoAndStop(3);
	}
	if(moveDefogHandle.y <= 550 && currentFrame == 3){
		gotoAndStop(4);
	}
	if(pressure.currentLabel == "ramdump" && currentFrame == 4){
		gotoAndStop(5);
	}
	// only allows 1 button to work at a time, based on currentFrame
	switch(currentFrame){
		case 1:
			enableMovieClips(bleedHit, true);
			changeSpeed(fr1Animation, currentFrame, 1);
			break;
		case 2:
			enableMovieClips(defogSwitch, true);
			changeSpeed(fr2Animation, currentFrame, 1);
			break;
		case 3:
			enableMovieClips(moveDefogHandle, true);
			changeSpeed(fr3Animation, currentFrame, 1);
			break;
		case 4:
			enableMovieClips(pressure.pressure_guard, true);
			enableMovieClips(pressHit, true);
			changeSpeed(fr4Animation, currentFrame, 1);
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, 1);
	}
	
	//----------------------------------------------------
	// Clear Filters
	//----------------------------------------------------
	bleedAir.filters = null;
	defogSwitch.filters = null;
	moveDefogHandle.defogHandle.filters = null;
	pressure.filters = null;

}

//---------------------------------------------------------------
// Reset
//---------------------------------------------------------------
/*
this code resets all Movie Clips back to original position
*/
function ResetControls(): void {
	bleedAir.gotoAndStop("off");
	ramAir.gotoAndStop("off");
	defogSwitch.gotoAndStop("off");
	moveDefogHandle.y = 684;
	pressure.gotoAndStop("norm");
	pressure.pressure_guard.gotoAndStop("close");
	Resetter = false;
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
the 3 functions below are specific for the defog handle.
*/
function defogUp(): void {
	if (moveDefogHandle.y >= 532) {
		moveDefogHandle.y -= 7;
	}
}
function defogDown(): void {
	if (moveDefogHandle.y <= 684) {
		moveDefogHandle.y += 7;
	}
}
function defogMid(): void {
	if (moveDefogHandle.y < 608) {
		moveDefogHandle.y += 7;
	}
	if (moveDefogHandle.y > 608) {
		moveDefogHandle.y -= 7;
	}
}

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