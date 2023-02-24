//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------


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
		/*
		case totalFrames:
			txt.text = "Done";
			break;
		default:
			txt.text = currentFrame + ". Select NEXT to continue";
			break;
		*/
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
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
	
}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control, cannot go back, just reset - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {

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
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	

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
function traceMovies(): void {
	
}