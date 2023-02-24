import flash.display.MovieClip;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------
//////// ALL OBJECTS ON STAGE
var battSwitch: MovieClip = batteryPanel.batterySwitch;
var aviSwitch: MovieClip = batteryPanel.AVIMasterSwitch;
var busSwitch: MovieClip = batteryPanel.bustieSwitch;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
btnOnOff(battSwitch);
btnOnOff(aviSwitch);
btnOnOff(busSwitch);

busSwitch.gotoAndStop("on");
aviSwitch.gotoAndStop("off");

//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
batteryPanel.stopAllMovieClips();

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
	// set switches in default position
	// all "T" looking switches, defaults
	bts.overT.gotoAndStop("open");
	bts.extT.gotoAndStop("open");
	bts.strT.gotoAndStop("open");
	bts.batT.gotoAndStop("open");
	bts.busT.gotoAndStop("open");
	bts.genT.gotoAndStop("open");
	bts.aviT1.gotoAndStop("open");
	bts.aviT2.gotoAndStop("open");
	// all "door" looking switches
	bts.auxc3.gotoAndStop("up");
	bts.auxc4.gotoAndStop("up");
	bts.batc3.gotoAndStop("up");
	bts.extc3.gotoAndStop("up");
	bts.busc3.gotoAndStop("up");
	// prev/next buttons
	if (currentFrame == 2 || currentFrame == 5 || currentFrame == 6 || currentFrame == totalFrames) {
		NextNull.visible = true;
	} else {
		NextNull.visible = false;
	}
	if (currentFrame == 1 || currentFrame == 3 || currentFrame == 6 || currentFrame == 7){
		PrevNull.visible = true;
	} else {
		PrevNull.visible = false;
	}
	// enable Movie Clip buttons
	enableMovieClips(battSwitch, true);
	enableMovieClips(aviSwitch, true);
	enableMovieClips(busSwitch, true);
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Select NEXT to Connect External Power.";
			break;
		case 2:
			txt.text = "2. Move the Battery Switch to the ON";
			break;
		case 3:
			txt.text = "3. Select NEXT to continue";
			break;
		case 4:
			txt.text = "4. Select NEXT to continue";
			break;
		case 5:
			txt.text = "5. Move the AVIONICS MASTER Switch to the ON position";
			break;
		case 6:
			txt.text = "6. Move the BUS TIE Switch to the NORM position";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame >= 2) {
		bts.overT.gotoAndStop("close");
		bts.extT.gotoAndStop("close");
		bts.extc3.gotoAndStop("down");
	}
	if (currentFrame >= 3) {
		bts.batT.gotoAndStop("close");
		bts.batc3.gotoAndStop("down");
	}
	if (currentFrame >= 6) {
		//bts.aviT1.gotoAndStop("close");
		bts.aviT2.gotoAndStop("close");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
	}
	if (currentFrame == 7) {
		bts.busT.gotoAndStop("close");
		bts.busc3.gotoAndStop("down");
		bts.aviT1.gotoAndStop("close");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
	}

	//----------------------------------------------------
	// Nullify Filters
	//----------------------------------------------------
	NextBtn.filters = null;
	battSwitch.filters = null;
	aviSwitch.filters = null;
	busSwitch.filters = null;

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
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (battSwitch.currentLabel == "on" && currentFrame == 2) {
		gotoAndStop(3);
	}
	if (battSwitch.currentLabel == "off" && currentFrame > 2) {
		gotoAndStop(2);
	}
	if (aviSwitch.currentLabel == "on" && currentFrame == 5) {
		gotoAndStop(6);
	}
	if (aviSwitch.currentLabel == "off" && currentFrame > 5) {
		gotoAndStop(5);
	}
	if (busSwitch.currentLabel == "off" && currentFrame == 6) {
		gotoAndStop(7);
	}
	if (busSwitch.currentLabel == "on" && currentFrame > 6) {
		gotoAndStop(6);
	}


	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	switch (currentFrame) {
		case 1:
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr1Animation, currentFrame, .2);
			break;
		case 2:
			battSwitch.filters = [yellowOutline];
			changeSpeed(fr2Animation, currentFrame, .2);
			break;
		case 3:
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr3Animation, currentFrame, .2);
			break;
		case 4:
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr4Animation, currentFrame, .2);
			break;
		case 5:
			aviSwitch.filters = [yellowOutline];
			changeSpeed(fr5Animation, currentFrame, .2);
			break;
		case 6:
			busSwitch.filters = [yellowOutline];
			changeSpeed(fr6Animation, currentFrame, .2);
			break;
		default:
			changeSpeed(fr7Animation, currentFrame, .2);
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
	enableMovieClips(battSwitch, false);
	enableMovieClips(aviSwitch, false);
	enableMovieClips(busSwitch, false);
	PrevNull.visible = true;
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame == 2){
		enableMovieClips(battSwitch, true);
	}
	if (currentFrame == 5){
		enableMovieClips(aviSwitch, true);
	}
	if (currentFrame == 6){
		enableMovieClips(busSwitch, true);
	}
	if (battSwitch.currentLabel == "on" && currentFrame == 2) {
		gotoAndStop(3);
	}
	if (aviSwitch.currentLabel == "on" && currentFrame == 5) {
		gotoAndStop(6);
	}
	if (busSwitch.currentLabel == "off" && currentFrame == 6) {
		gotoAndStop(7);
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
		case 4:
			changeSpeed(fr4Animation, currentFrame, 1);
			break;
		case 5:
			changeSpeed(fr5Animation, currentFrame, 1);
			break;
		case 6:
			changeSpeed(fr6Animation, currentFrame, 1);
			break;
		default:
			changeSpeed(fr7Animation, currentFrame, 1);
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
	battSwitch.gotoAndStop("off");
	aviSwitch.gotoAndStop("off");
	busSwitch.gotoAndStop("on");
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