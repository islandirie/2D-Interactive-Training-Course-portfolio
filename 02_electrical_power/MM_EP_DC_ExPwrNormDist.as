import flash.display.MovieClip;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------
//////// ALL OBJECTS ON STAGE
var battSwitch: MovieClip = batteryPanel.batterySwitch;
var aviSwitch: MovieClip = batteryPanel.AVIMasterSwitch;
var busSwitch: MovieClip = batteryPanel.bustieSwitch;
var strSwitch: MovieClip = batteryPanel.starter;
var strHitbox: MovieClip = batteryPanel.starter_hitBox;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
//btn3States(strHitbox.hi, strSwitch);
//btn3States(strHitbox.norm, strSwitch);
//btn3States(strHitbox.off, strSwitch);
// hides mask btns for btn3 Mask
hiddenBtns(strHitbox);

battSwitch.gotoAndStop("off");
aviSwitch.gotoAndStop("off");
busSwitch.gotoAndStop("on");
strSwitch.gotoAndStop("off");

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
	
	NextBtn.filters = null;
	fr_Animation = getChildByName("fr" + currentFrame + "Animation") as MovieClip;

	// enable Movie Clip buttons
	//enableMovieClips(battSwitch, true);
	//enableMovieClips(aviSwitch, true);
	//enableMovieClips(busSwitch, true);
	//enableMovieClips(strHitbox, true);
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Select NEXT to Continue.";
			break;
		case 2:
			txt.text = "2. Select NEXT to Simulate External Power Over-Voltage.";
			break;
		default:
			txt.text = totalFrames + ". Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	if(currentFrame == 2){
		battSwitch.gotoAndStop("on");
		aviSwitch.gotoAndStop("on");
		busSwitch.gotoAndStop("off");
		strSwitch.gotoAndStop("norm");
		
		bts.overT.gotoAndStop("close");
	}
	if (currentFrame >= 2) {
		bts.extT.gotoAndStop("close");
		bts.extc3.gotoAndStop("down");
		bts.batT.gotoAndStop("close");
		bts.batc3.gotoAndStop("down");
		bts.aviT2.gotoAndStop("close");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
		bts.busT.gotoAndStop("close");
		bts.busc3.gotoAndStop("down");
		bts.aviT1.gotoAndStop("close");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
	}

	//----------------------------------------------------
	// Nullify Filters
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
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in 00_as3 folder, T6_Main_Navigation.as
	// changeSpeed() located in 00_as3 folder, changeSpeed.as
	if(currentFrame < totalFrames){
		NextBtn.filters = [yellowOutline];
	}
	

}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control, cannot go back, just reset - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	PrevNull.visible = true;
	if(currentFrame > 1){
		NextNull.visible = true;
	}
	
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
	if(currentFrame == 2){
		myTimer(5);
		//frameMC.frameCounter.text += " " + (seconds - 4);
		if(seconds == 4){
			nextFrame();
		}
	}
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