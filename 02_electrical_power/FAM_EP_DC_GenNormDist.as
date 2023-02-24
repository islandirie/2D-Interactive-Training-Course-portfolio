import flash.display.MovieClip;
import flash.events.Event;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------
//////// ALL OBJECTS ON STAGE
var aviSwitch: MovieClip = batteryPanel.AVIMasterSwitch;
var genSwitch: MovieClip = batteryPanel.generatorSwitch;
var startSwitch: MovieClip = batteryPanel.starterSwitch;
var startTarget: MovieClip = batteryPanel.starterSwitch.startHitbox;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
btnOnOff(aviSwitch);
btnOnOff(genSwitch);
btn3States(startTarget.hi, startSwitch);
btn3States(startTarget.norm, startSwitch);
btn3States(startTarget.off, startSwitch);

aviSwitch.gotoAndStop("off");
startSwitch.gotoAndStop("off");
genSwitch.gotoAndStop("off");

//invisible hit boxes for 3 state buttons (starter)

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
	bts.batT.gotoAndStop("close");
	bts.busT.gotoAndStop("close");
	bts.aviT1.gotoAndStop("close");
	bts.aviT2.gotoAndStop("open");
	bts.genT.gotoAndStop("open");
	// all "door" looking switches
	bts.batc3.gotoAndStop("down");
	bts.busc3.gotoAndStop("down");
	bts.auxc3.gotoAndStop("up");
	bts.auxc4.gotoAndStop("up");
	// prev/next buttons

	// enable Movie Clip buttons
	enableMovieClips(genSwitch, true);
	enableMovieClips(aviSwitch, true);
	enableMovieClips(startSwitch, true);

	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Move the STARTER switch to the AUTO position.";
			break;
		case 2:
			txt.text = "2. Select NEXT to continue";
			break;
		case 3:
			txt.text = "3. Move the GEN switch to the ON position.";
			break;
		case 4:
			txt.text = "4. Move the AVIONICS MASTER switch to the ON position.";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame == 2) {
		rotatingGen.rotation += 7;
	}
	if (currentFrame >= 3) {
		bts.genT.gotoAndStop("close");
	}
	if (currentFrame >= 5) {
		bts.aviT2.gotoAndStop("close");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
	}

	//----------------------------------------------------
	// Nullify Filters
	//----------------------------------------------------
	NextBtn.filters = null;
	genSwitch.filters = null;
	aviSwitch.filters = null;
	startSwitch.filters = null;

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
	NextNull.visible = true;
	PrevNull.visible = true;
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	// STARTER switch
	if (startSwitch.currentLabel == "hi" && currentFrame == 1) {
		gotoAndStop(2);
	}
	if(startSwitch.currentLabel != "hi" && currentFrame > 1){
		gotoAndStop(1);
	}
	// Null buttons
	if(currentFrame == 2){
		NextNull.visible = false;
	}
	if(currentFrame == 3){
		PrevNull.visible = false;
	}
	// GEN switch
	if(genSwitch.currentLabel == "on" && currentFrame == 3){
		gotoAndStop(4);
	}
	if(genSwitch.currentLabel != "on" && currentFrame > 3){
		gotoAndStop(3);
	}
	// Avionics Master switch
	if(aviSwitch.currentLabel == "on" && currentFrame == 4){
		gotoAndStop(5);
	}
	if(aviSwitch.currentLabel != "on" && currentFrame > 4){
		gotoAndStop(4);
	}


	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	switch (currentFrame) {
		case 1:
			startSwitch.filters = [yellowOutline];
			changeSpeed(fr1Animation, currentFrame, .2);
			break;
		case 2:
			NextBtn.filters = [yellowOutline];
			changeSpeed(fr2Animation, currentFrame, .2);
			break;
		case 3:
			genSwitch.filters = [yellowOutline];
			changeSpeed(fr3Animation, currentFrame, .2);
			break;
		case 4:
			aviSwitch.filters = [yellowOutline];
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
	enableMovieClips(genSwitch, false);
	enableMovieClips(aviSwitch, false);
	enableMovieClips(startSwitch, false);
	PrevNull.visible = true;
	NextNull.visible = true;
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if (currentFrame == 1) {
		enableMovieClips(startSwitch, true);
	}
	if(currentFrame == 2){
		NextNull.visible = false;
	}
	if (currentFrame == 3) {
		enableMovieClips(genSwitch, true);
	}
	if (currentFrame == 4) {
		enableMovieClips(aviSwitch, true);
	}
	if (startSwitch.currentLabel == "hi" && currentFrame == 1) {
		gotoAndStop(2);
	}
	if (genSwitch.currentLabel == "on" && currentFrame == 3) {
		gotoAndStop(4);
	}
	if (aviSwitch.currentLabel == "on" && currentFrame == 4) {
		gotoAndStop(5);
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
	genSwitch.gotoAndStop("off");
	aviSwitch.gotoAndStop("off");
	startSwitch.gotoAndStop("off");
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