import flash.events.Event;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------
//////// ALL OBJECTS ON STAGE
var lgHandle: MovieClip = landingGear.handle_lg;
var lgLights: MovieClip = landingGear;
var leftRP: MovieClip = rudderPedals.leftPedal;
var rightRP: MovieClip = rudderPedals.rightPedal;
var fsArrow: MovieClip = FAM_Hydro.flapSelectorGauge.flapSelectorArrow;
var fsGauge: MovieClip = FAM_Hydro.flapSelectorGauge;
var fsHandle: MovieClip = FAM_Hydro.flapSelector;
var fsSpeed: MovieClip = FAM_Hydro.speedBrake;

//---------------------------------------------------------------
// CONTROL BUTTON SETUPS
// Turn all needed movieclips into relevant buttons, all 
// button functions located in T6_common_cockpit_actions.
//---------------------------------------------------------------
dragHandle(lgHandle, -30, -18, 0, -55);

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
	if (currentFrame >= 3) {
		NextNull.visible = true;
		PrevNull.visible = true;
	}

	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 1:
			txt.text = "1. Select NEXT to start the engine";
			break;
		case 2:
			txt.text = "2. Select NEXT to continue";
			break;
		case 3:
			txt.text = "3. Select the Left Rudder Pedal to turn Left";
			break;
		case 4:
			txt.text = "4. Select the Flap Selector to LDG Position";
			break;
		case 5:
			txt.text = "5. Select the Speed Brake Switch to Extend Position";
			break;
		case 6:
			txt.text = "6. Select the Landing Gear Handle to the LDG UP Position to Extend Position";
			break;
		default:
			txt.text = "Done";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	//defaults
	leftRP.removeEventListener(MouseEvent.CLICK, goFwd);
	leftRP.removeEventListener(MouseEvent.CLICK, goBck);
	fsHandle.removeEventListener(MouseEvent.CLICK, goFwd);
	fsHandle.removeEventListener(MouseEvent.CLICK, goBck);

	//control flap selector arrows
	if (currentFrame == 5) {
		if (fsArrow.rotation <= 150) {
			fsArrow.rotation += 10;
		}
	} else {
		if (fsArrow.rotation >= 10) {
			fsArrow.rotation -= 10;
		}
	}

	// nullify's all filters, DEFAULTS
	rightRP.filters = null;
	leftRP.filters = null;
	fsHandle.filters = null;
	NextBtn.filters = null;
	lgHandle.filters = null;
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
	enableMovieClips(lgHandle, true);
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------

	////////// frame 3 ///////////////	
	if (currentFrame == 3) {
		leftRP.addEventListener(MouseEvent.CLICK, goFwd);
		rudderPedNorm(leftRP, rightRP, 322, 10);
	}
	////////// frame 4 ///////////////	
	if (currentFrame == 4) {
		rudderPedDown(leftRP, rightRP, 322, 10);
		leftRP.addEventListener(MouseEvent.CLICK, goBck);
		fsHandle.addEventListener(MouseEvent.CLICK, goFwd);
	}

	////////// frame 5 ///////////////
	if (currentFrame == 5) {
		fsHandle.addEventListener(MouseEvent.CLICK, goFwd);
	}

	////////// frame 6 ///////////////
	if (currentFrame == 6) {
		if (lgHandle.y <= -70) {
			gotoAndStop(7);
		}
	}

	////////// frame 7 ///////////////
	if (currentFrame == 7) {
		// lights start at red
		if (fr7Animation.currentLabel == "turn red on") {
			lgLights.gotoAndStop("lights-red");
			lgHandle.gotoAndStop("red");
		}
		if (fr7Animation.currentLabel == "turn green") {
			lgHandle.gotoAndStop("green");
		}
		if (fr7Animation.currentLabel == "turn green off") {
			lgHandle.gotoAndStop("off");
		}
		if (fr7Animation.currentLabel == "turn red off") {
			lgLights.gotoAndStop("lights-off");
		}

		// if handle is moved down
		if (lgHandle.y > -70) {
			gotoAndStop(6);
		}

	} else {
		lgHandle.gotoAndStop("off");
		lgLights.gotoAndStop("lights-off");
	}

	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// filter = [yellowOutline], located in T6_Main_Navigation.as

	////////// frame 1 //////////////
	if (currentFrame < 3) {
		NextBtn.filters = [yellowOutline];
	}
	if (currentFrame == 2) {
		changeSpeed(fr2Animation, currentFrame, .2);
	}
	if (currentFrame == 3) {
		leftRP.filters = [yellowOutline];
		changeSpeed(fr3Animation, currentFrame, .2);
	}
	if (currentFrame == 4) {
		rightRP.filters = [blur];
		changeSpeed(fr4Animation, currentFrame, .2);
	}
	if (currentFrame == 4 || currentFrame == 5) {
		fsHandle.filters = [yellowOutline];
	}
	if (currentFrame == 5) {
		changeSpeed(fr5Animation, currentFrame, .2);
	}
	if (currentFrame == 6) {
		lgHandle.filters = [yellowOutline];
		changeSpeed(fr6Animation, currentFrame, .2);
	}
	if (currentFrame == 7) {
		changeSpeed(fr7Animation, currentFrame, .2);
	}

}

//---------------------------------------------------------------------------
// OperationalMode() - Auto play until it reaches a control - for Students
//---------------------------------------------------------------------------
function OperationalMode(): void {

	//----------------------------------------------------
	// Controls
	//----------------------------------------------------
	enableMovieClips(lgHandle, false);
	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	////////// frame 3 ///////////////	
	if (currentFrame == 3) {
		leftRP.addEventListener(MouseEvent.CLICK, goFwd);
		rudderPedNorm(leftRP, rightRP, 322, 10);
	}
	////////// frame 4 ///////////////
	if (currentFrame == 4) {
		rudderPedDown(leftRP, rightRP, 322, 10);
		fsHandle.addEventListener(MouseEvent.CLICK, goFwd);
	}

	////////// frame 5 ///////////////
	if (currentFrame == 5) {
		fsHandle.addEventListener(MouseEvent.CLICK, goFwd);
	}

	////////// frame 6 ///////////////
	if (currentFrame == 6) {
		enableMovieClips(lgHandle, true);
		if (lgHandle.y <= -70) {
			gotoAndStop(7);
		}
	}

	////////// frame 7 ///////////////
	if (currentFrame == 7) {
		// lights start at red
		enableMovieClips(lgHandle, false);
		if (fr7Animation.currentLabel == "turn red on") {
			lgLights.gotoAndStop("lights-red");
			lgHandle.gotoAndStop("red");
		}
		if (fr7Animation.currentLabel == "turn green") {
			lgHandle.gotoAndStop("green");
		}
		if (fr7Animation.currentLabel == "turn green off") {
			lgHandle.gotoAndStop("off");
		}
		if (fr7Animation.currentLabel == "turn red off") {
			lgLights.gotoAndStop("lights-off");
		}

	} else {
		lgHandle.gotoAndStop("off");
		lgLights.gotoAndStop("lights-off");
	}
	//----------------------------------------------------
	// Filters / changeSpeed()
	//----------------------------------------------------
	// only allows 1 button to work at a time, based on currentFrame
	// changeSpeed()
	if (currentFrame == 2) {
		changeSpeed(fr2Animation, currentFrame, 1);
	}
	if (currentFrame == 3) {
		changeSpeed(fr3Animation, currentFrame, 1);
	}
	if (currentFrame == 4) {
		changeSpeed(fr4Animation, currentFrame, 1);
	}
	if (currentFrame == 5) {
		changeSpeed(fr5Animation, currentFrame, 1);
	}
	if (currentFrame == 6) {
		changeSpeed(fr6Animation, currentFrame, 1);
	}
	if (currentFrame == 7) {
		changeSpeed(fr7Animation, currentFrame, 1);
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
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
rudder Functions
*/
function goFwd(e: Event): void {
	nextFrame();
}
function goBck(e: Event): void {
	prevFrame();
}

/*
this function traces all movie clips, helps for timeline debug, call it when needed
*/
function traceMovies(): void {

}