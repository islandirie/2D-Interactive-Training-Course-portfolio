//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE
var startSwitch: MovieClip = batteryPanel.starterSwitch;
var pcl: MovieClip = powerControlLever.lever;
//////// hitboxes
var startHit: MovieClip = batteryPanel.startHitbox;


//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
hiddenBtns(startHit);

btn3States(startHit.hi, startSwitch);
btn3States(startHit.norm, startSwitch);
btn3States(startHit.off, startSwitch);

// setup power control lever
function pclPlay1(e: Event): void {
	e.currentTarget.play();
}
powerControlLever.addEventListener(MouseEvent.CLICK, pclPlay1);

//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
batteryPanel.stopAllMovieClips;

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

	//----------------------------------------------------
	// Defaults
	//----------------------------------------------------
	startSwitch.filters = null;
	NextBtn.filters = null;
	powerControlLever.filters = null;
	NextNull.visible = false;

	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Move the STARTER switch to the AUTO position";
			break;
		case 2:
			txt.text = "2. Select NEXT to continue Engine start";
			break;
		case 3:
			txt.text = "3. Select NEXT to continue Engine start";
			break;
		case 4:
			txt.text = "4. Select NEXT to continue Engine start";
			break;
		case 5:
			txt.text = "5. Move the PCL to the IDLE position";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// rotate boost pump
	if (currentFrame <= 2 || currentFrame == 6) {
		fanStart.stop();
	} else {
		fanStart.play();
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
	enableMovieClips(powerControlLever, true);
	enableMovieClips(startHit, true);
	if (currentFrame == 1 || currentFrame == 5) {
		NextNull.visible = true;
	} else {
		NextNull.visible = false;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// frame 1
	if (currentFrame == 1 && startSwitch.currentLabel == "hi") {
		gotoAndStop(2);
	}
	// starter switch
	if (startSwitch.currentLabel != "hi") {
		gotoAndStop(1);
	}
	// frame 2
	if (currentFrame == 2) {

	}
	// frame 3
	if (currentFrame == 3) {

	}
	// frame 4
	if (currentFrame == 4) {

	}
	// frame 5
	if (currentFrame == 5) {
		if (powerControlLever.currentLabel == "down") {
			nextFrame();
		}
	}
	// frame 6
	if (currentFrame == 6) {
		if (powerControlLever.currentLabel == "up") {
			prevFrame();
		}
	}



	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	switch (currentFrame) {
		case 1:
			startSwitch.filters = [yellowOutline];
			break;
		case 2:
			changeSpeed(fr2Animation, currentFrame, .2);
			NextBtn.filters = [yellowOutline];
			break;
		case 3:
			changeSpeed(fr3Animation, currentFrame, .2);
			NextBtn.filters = [yellowOutline];
			break;
		case 4:
			changeSpeed(fr4Animation, currentFrame, .2);
			NextBtn.filters = [yellowOutline];
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, .2);
			powerControlLever.filters = [yellowOutline];
			break;
		case 6:
			changeSpeed(fr6Animation, currentFrame, .2);
			break;
		default:
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
	enableMovieClips(powerControlLever, false);
	enableMovieClips(startHit, false);
	PrevNull.visible = true;
	NextNull.visible = true;

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// frame 1
	if (currentFrame == 1) {
		enableMovieClips(startHit, true);
		if (startSwitch.currentLabel == "hi") {
			gotoAndStop(2);
		}
	}
	// frame 2
	if (currentFrame == 2) {
		jumpToNextFrame(fr2Animation);
	}
	// frame 3
	if (currentFrame == 3) {
		jumpToNextFrame(fr3Animation);
	}
	// frame 4
	if (currentFrame == 4) {
		jumpToNextFrame(fr4Animation);
	}
	// frame 5
	if (currentFrame == 5) {
		enableMovieClips(powerControlLever, true);
	}
	if (currentFrame == 5 && powerControlLever.currentLabel == "down") {
		gotoAndStop(6);
	}
	// frame 6
	if (currentFrame == 6) {

	}

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	switch (currentFrame) {
		case 2:
			changeSpeed(fr2Animation, currentFrame, 1);
			break;
		case 3:
			changeSpeed(fr3Animation, currentFrame, 1);
			break;
		case 4:
			changeSpeed(fr4Animation, currentFrame, 1);
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, 1);
			break;
		case 6:
			changeSpeed(fr6Animation, currentFrame, 1);
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
	startSwitch.gotoAndStop("off");
	powerControlLever.gotoAndStop(1);
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