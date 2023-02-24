import flash.display.MovieClip;
import flash.utils.Timer;
import flash.events.TimerEvent;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE
var lgLights: MovieClip = landingGear;
var lgHandle: MovieClip = landingGear.handle_lg;
var miniLights: MovieClip = landingGear2;
var miniHandle: MovieClip = landingGear2.handle_lg;
//timer
var testTime: Timer = new Timer(1000, 4);

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
dragHandle(lgHandle, -30, -18, 0, -55);
stopAllMovieClips();

//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
lgLights.stopAllMovieClips();
landingGear2.stopAllMovieClips();

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
	// set small landing gear to match bigger landing gear
	miniHandle.y = lgHandle.y;
	miniHandle.gotoAndStop(lgHandle.currentFrame);
	miniLights.gotoAndStop(lgLights.currentFrame);

	// Defaults
	lgHandle.filters = null;
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Set the Landing Gear Handle to the LDG UP Position";
			break;
		case 2:
			txt.text = "2. Set the Landing Gear Handle to the LDG DOWN Position";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame == 1){
		trace(fr1Animation.isPlaying);
		controlMC(fr1Animation);
	}
	if (currentFrame == 2){
		controlMC(fr2Animation);
	} 
	if (currentFrame == 3){
		controlMC(fr3Animation);
	}
		
		
	////////////// frame 1
	if (currentFrame == 1) {
		lgHandle.gotoAndStop("off");
		greenOrange_back.gotoAndStop("grey");
		lgLights.gotoAndStop("lights-green");
	} else {
		lgHandle.gotoAndStop("red");
	}
	if (currentFrame == 1 && lgHandle.y <= -63) {
		gotoAndStop(2);
	}

	////////////// frame 2
	if (currentFrame == 2) {
		greenOrange.gotoAndStop("orangeTop");
		//lights
		if (fr2Animation.currentLabel == "start_goIn") {
			lgLights.gotoAndStop("lights-red");
		}
		if (fr2Animation.currentLabel == "end_switch") {
			lgLights.gotoAndStop("lights-redLR");
		}
		if (fr2Animation.currentLabel == "end_goOut") {
			lgHandle.gotoAndStop("off");
			lgLights.gotoAndStop("lights-off");
		}

		// start_goIn playing
		if (fr2Animation.currentLabel == "end_goIn") {
			greenOrange_back.gotoAndStop("greenTop");
			fr2Animation.gotoAndPlay("start_switch");
		}
		// start_switch playing
		if (fr2Animation.currentLabel == "end_switch") {
			greenOrange_back.gotoAndStop("grey");
			fr2Animation.gotoAndPlay("start_goOut");
		}
	}

	////////////// frame 3
	if (currentFrame == 3) {
		greenOrange.gotoAndStop("orangeTop");
		//lights
		if (fr3Animation.currentLabel == "start_goIn") {
			lgLights.gotoAndStop("lights-red");
		}
		if (fr3Animation.currentLabel == "end_switch") {
			lgLights.gotoAndStop("lights-both");
		}
		if (fr3Animation.currentLabel == "end_goOut") {
			lgHandle.gotoAndStop("off");
			lgLights.gotoAndStop("lights-green");
		}

		// use timer clock to control "paused" parts of the animations
		// start_goIn playing
		if (fr3Animation.currentLabel == "end_goIn") {
			greenOrange_back.gotoAndStop("greenTop");
			fr3Animation.gotoAndPlay("start_switch");
		}
		// start_switch playing
		if (fr3Animation.currentLabel == "end_switch") {
			greenOrange_back.gotoAndStop("grey");
			fr3Animation.gotoAndPlay("start_goOut");
		}
	}
	// allows to move handle down to go to frame 3, but only at the end of frame 2 animation
	if (currentFrame == 2 && lgHandle.y >= -28 && fr2Animation.currentFrame == fr2Animation.totalFrames) {
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
// InstructionalMode() - Plays slowly, can go back & forth on timeline - for Instructors
//---------------------------------------------------------------------------
function InstructionalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	// Defaults
	NextNull.visible = false;
	enableMovieClips(lgHandle, true);

	// show seconds left on frameMC
	if (testTime.running) {
		frameMC.frameCounter.text = testTime.repeatCount - testTime.currentCount;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame == 2 && lgHandle.y >= -28 && fr2Animation.currentFrame != fr2Animation.totalFrames) {
		gotoAndStop(1);
	}
	if (currentFrame == 2 && lgHandle.y >= -28 && fr2Animation.currentFrame == fr2Animation.totalFrames) {
		gotoAndStop(3);
	}

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	switch (currentFrame) {
		case 1:
			lgHandle.filters = [yellowOutline];
			NextNull.visible = true;
			changeSpeed(fr1Animation, currentFrame, .5);
			break;
		case 2:
			if (fr2Animation.currentFrame == fr2Animation.totalFrames) {
				lgHandle.filters = [yellowOutline];
			} else {
				lgHandle.filters = null;
			}
			NextNull.visible = true;
			changeSpeed(fr2Animation, currentFrame, .2);
			break;
		case 3:
			changeSpeed(fr3Animation, currentFrame, .2);
			NextNull.visible = true;
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
	NextNull.visible = true;
	enableMovieClips(lgHandle, false);

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame <= 2){
		enableMovieClips(lgHandle, true);
	}
	if(currentFrame == 2 && fr2Animation.currentFrame != fr2Animation.totalFrames){
		enableMovieClips(lgHandle, false);
	}
	if(currentFrame == 3){
		enableMovieClips(lgHandle, false);
	}
	
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
			changeSpeed(fr3Animation, currentFrame, 1);
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
	lgHandle.y = -18;
	lgLights.gotoAndStop("lights-off");
	//fr1Animation.gotoAndPlay(1);
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
this function traces all movie clips, helps for timeline debug, if working
with multiple trace() functions put it all in here than call.
*/
function traceMovies(): void {

}