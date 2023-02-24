import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.events.Event;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL NEEDED OBJECTS ON STAGE
var nwsBtn:MovieClip = nwsHandleLarge.nwsButton;
var leftRP: MovieClip = rudderPedals.leftPedal;
var rightRP: MovieClip = rudderPedals.rightPedal;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------


//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
//stopAllMovieClips();

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
	enableMovieClips(nwsBtn, false);
	enableMovieClips(leftRP, false);
	
	// Defaults
	NextBtn.filters = null;
	leftRP.filters = null;
	rightRP.filters = null;
	NextNull.visible = true;
	
	// nws button
	nwsBtn.removeEventListener(MouseEvent.CLICK, goNext);
	leftRP.removeEventListener(MouseEvent.CLICK, goNext);
	nwsBtn.filters = null;
	nwsHandleLarge.visible = false;
	nwsHandle.visible = true;
	// rudder pedals
	if(currentFrame != 5){
		rudderPedNorm(rightRP, leftRP, 322, 10);
	}
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Select NEXT to Place the Aircraft in Flight";
			break;
		case 2:
			txt.text = "2. Select NEXT to Place the Aircraft on Ground";
			break;
		case 3:
			txt.text = "3. Select NWS BUTTON to Continue";
			break;
		case 4:
			txt.text = "4. Depress Left Rudder Pedal to turn Left";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame < 3){
		NextNull.visible = false;
	}
	if(currentFrame == 3){
		nwsHandleLarge.visible = true;
		nwsHandle.visible = false;
		nwsBtn.addEventListener(MouseEvent.CLICK, goNext);
		enableMovieClips(nwsBtn, true);
	}
	if(currentFrame == 4){
		leftRP.addEventListener(MouseEvent.CLICK, goNext);
		enableMovieClips(leftRP, true);
	}
	if(currentFrame == 5){
		rudderPedUp(rightRP, leftRP, 322, 10);
		rightRP.filters = [blur];
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
// InstructionalMode() - Plays slowly, can go back & forth on timeline - for Instructors
//---------------------------------------------------------------------------
function InstructionalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Defaults
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	switch(currentFrame){
		case 1: 
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr1Animation, currentFrame, .2);
			break;
		case 2:
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr2Animation, currentFrame, .2);
			break;
		case 3:
			nwsBtn.filters = [yellowOutline];
			//changeSpeed(fr3Animation, currentFrame, .2);
			break;
		case 4:
			leftRP.filters = [yellowOutline];
			changeSpeed(fr4Animation, currentFrame, .2);
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, .2);
			break;
		}
}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control, cannot go back, just reset - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Defaults
	PrevNull.visible = true;
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	switch(currentFrame){
		case 1: 
			changeSpeed(fr1Animation, currentFrame, 1);
			break;
		case 2:
			changeSpeed(fr2Animation, currentFrame, 1);
			break;
		case 3:
			//changeSpeed(fr3Animation, currentFrame, 1);
			break;
		case 4:
			changeSpeed(fr4Animation, currentFrame, 1);
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, 1);
			break;
		}

	//----------------------------------------------------
	// Clear Filters
	//----------------------------------------------------
	
}

//---------------------------------------------------------------
// Reset
//---------------------------------------------------------------
/*
this code resets all Movie Clips back to original position
*/
function ResetControls(): void {
	Resetter = false;
	// ex: battery_switch.gotoAndStop("off")
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
this function traces all movie clips, helps for timeline debug, if working
with multiple trace() functions put it all in here than call.
*/
function goNext(e:MouseEvent){
	nextFrame();
}
function traceMovies(): void {
	
}