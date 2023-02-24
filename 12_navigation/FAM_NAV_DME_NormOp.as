import flash.display.MovieClip;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE
var avi:MovieClip = AVIMasterSwitch;


//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
btnOnOff(avi);
avi.gotoAndStop("off");

//-----------------------------------------------------------------------------
// STOP ALL ANIMATIONS during start-up on stage including its children
//-----------------------------------------------------------------------------
stopAllMovieClips();

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
	// Defaults
	enableMovieClips(avi, true);
	NextBtn.filters = null;
	avi.filters = null;
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 9:
			txt.text = "Done";
			break;
		case 2:
			txt.text = "2. Switch Avionics Master to the ON position";
			break;
		default:
			txt.text = currentFrame + ". Select NEXT to move forward";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame == 1){
		enableMovieClips(avi, false);
	}
	if(currentFrame == 2){
		if(avi.currentLabel == "on"){
			gotoAndStop(3);
		}
		NextNull.visible = true;
	}
	if(currentFrame > 2 && avi.currentLabel == "off"){
		gotoAndStop(2);
	}
	if(currentFrame == 3){
		PrevNull.visible = true;
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
		break;
		case 2:
		changeSpeed(fr2Animation, currentFrame, .4);
		avi.filters = [yellowOutline];
		break;
		case 3:
		changeSpeed(fr3Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 4:
		changeSpeed(fr4Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 5:
		changeSpeed(fr5Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 6:
		changeSpeed(fr6Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 7:
		changeSpeed(fr7Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 8:
		changeSpeed(fr8Animation, currentFrame, .4);
		NextBtn.filters = [yellowOutline];
		break;
		case 9:
		changeSpeed(fr9Animation, currentFrame, .4);
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
	if(currentFrame != 1){
		NextNull.visible = true;
	}
	
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame == 3){
		jumpToNextFrame(fr3Animation);
	}
	if(currentFrame == 4){
		jumpToNextFrame(fr4Animation);
	}
	if(currentFrame == 5){
		jumpToNextFrame(fr5Animation);
	}
	if(currentFrame == 6){
		jumpToNextFrame(fr6Animation);
	}
	if(currentFrame == 7){
		jumpToNextFrame(fr7Animation);
	}
	if(currentFrame == 8){
		jumpToNextFrame(fr8Animation);
	}
	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	switch(currentFrame){
		case 2:
		changeSpeed(fr2Animation, currentFrame, .8);
		break;
		case 3:
		changeSpeed(fr3Animation, currentFrame, .8);
		break;
		case 4:
		changeSpeed(fr4Animation, currentFrame, .8);
		break;
		case 5:
		changeSpeed(fr5Animation, currentFrame, .8);
		break;
		case 6:
		changeSpeed(fr6Animation, currentFrame, .8);
		break;
		case 7:
		changeSpeed(fr7Animation, currentFrame, .8);
		break;
		case 8:
		changeSpeed(fr8Animation, currentFrame, .8);
		break;
		case 9:
		changeSpeed(fr9Animation, currentFrame, .8);
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
	avi.gotoAndStop("off");
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