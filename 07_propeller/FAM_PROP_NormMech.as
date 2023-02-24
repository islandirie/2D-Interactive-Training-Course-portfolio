import flash.display.MovieClip;
import fl.controls.TextArea;
import flash.text.TextField;
import flash.utils.Timer;
import flash.events.TimerEvent;

//---------------------------------------------------------------
// VARIABLES
//---------------------------------------------------------------

//////// ALL OBJECTS ON STAGE
var tMeter:MovieClip = eicas.torque_meter;
var oMeter:MovieClip = eicas.oil_meter;
var np: MovieClip = nose.pitch;
var sp: MovieClip = nose.spring;
var torqueNum: TextField = torque_numbers.tNumber;
var tNum:Number = 0;
var oilNum: TextField = oilpressure_numbers.oNumber;
var oNum:Number = 0;
var fr4Checker:Boolean = false;

const TORIG:Number = -130;
const OORIG:Number = -115;

// custom timer for switching to next frame in "operational" mode
var myTimer:Timer = new Timer(1000, 5);

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
	NextBtn.filters = null;
	torqueNum.text = String(tNum);
	oilNum.text = String(oNum);
	
	// rotation handle turns green/red at certain positions
	if(oMeter.rotation <= 10 && oMeter.rotation >= -25){
		oMeter.gotoAndStop("green");
	} else {
		oMeter.gotoAndStop("red");
	}
	
	//----------------------------------------------------
	// Notes
	//----------------------------------------------------
	var txt: TextField = notesMC.notesBox.textInput;
	switch (currentFrame) {
		case 4:
			txt.text = "Done";
			break;
		default:
			txt.text = currentFrame + ". Select NEXT to continue";
			break;
	}

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	//////// 1 ///////////
	if(currentFrame == 1){
		if(tMeter.rotation > TORIG){
			tMeter.rotation -= 3;
		}
		if(oMeter.rotation > OORIG){
			oMeter.rotation -= 3;
		}
	}
	//////// 2 ///////////
	if(currentFrame == 2){
		// nose animations with PCL
		if(sp.currentLabel == "highP" || sp.currentLabel == "feather"){
			np.prevFrame();
			sp.prevFrame();
			engine.pcl.prevFrame();
		}
		// gauge animations
		if(tMeter.rotation < -120){
			tMeter.rotation += 1;
		}
		if(tMeter.rotation > -119){
			tMeter.rotation -= 4;
		}
		if(oMeter.rotation < -22){
			oMeter.rotation += 4;
		}
		if(oMeter.rotation > -21){
			oMeter.rotation -= 1;
		}
		// numbers display
		if(tNum < 4){
			tNum += 1;
		}
		if(tNum > 4){
			tNum -= 4;
		}
		if(oNum < 100){
			oNum += 4;
		}
		if(oNum > 100) {
			oNum -= 1;
		}
	}
	// start engine animations
	if(currentFrame >= 2 && fr2Animation.currentFrame == fr2Animation.totalFrames){
		engine.engLines.play();
		engine.engine_arrows.play();
		engine.engine_arrows.oil_press_speed.play();
	}
	//////// 3 ///////////
	// rotation of meters
	if(currentFrame == 3){
		// nose animations
		if(sp.currentLabel == "feather"){
			np.nextFrame();
			sp.nextFrame();
			engine.pcl.nextFrame();
		}
		if(sp.currentLabel == "lowP" || np.currentLabel == "highP to lowP"){
			np.prevFrame();
			sp.prevFrame();
			engine.pcl.prevFrame();
		}
		// guage animations
		if(tMeter.rotation < 90){
			tMeter.rotation += 10;
		} else {
			tMeter.rotation = 90;
		}
		if(oMeter.rotation < -5){
			oMeter.rotation += 1;
		}
		fr4Checker = false;
		// numbers display
		if(tNum < 94){
			tNum += 5;
		}
		if(oNum < 110){
			oNum += 1;
		}
	}
	//////// 4 ///////////
	if(currentFrame == 4){
		// nose animations
		if(sp.currentLabel == "highP"){
			np.nextFrame();
			sp.nextFrame();
			engine.pcl.nextFrame();
		}
		// guage animations
		if(fr4Checker == false){
			tMeter.rotation += 1;
			tNum += 1;
			if(tMeter.rotation == 112){
				fr4Checker = true;
			}
		}
		if(fr4Checker == true && tMeter.rotation > 90){
			tMeter.rotation -= .3;
			tNum -= 1;
		}
		
		// numbers display
		if(tNum < 94){
			tNum += 5;
		}
		
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
	if(currentFrame >= 1){
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
	// Defaults
	PrevNull.visible = true;

	//----------------------------------------------------
	// Part of Animations
	//----------------------------------------------------
	
	/*if(currentFrame == 2){
		myTimer.start();
		myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timeComplete);
	}*/
	
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
	tMeter.rotation = TORIG;
	oMeter.rotation = OORIG;
	np.gotoAndStop(1);
	sp.gotoAndStop(1);
	engine.pcl.gotoAndStop(1);
	
	// control Numbers in display
	tNum = 0;
	oNum = 0;
}

//---------------------------------------------------------------
// HELPER FUNCTIONS
//---------------------------------------------------------------
/*
this function traces all movie clips, helps for timeline debug, if working
with multiple trace() functions put it all in here than call.
*/
function timeComplete(e:TimerEvent):void{
	nextFrame();
	myTimer.reset();
	myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,timeComplete);
}
function traceMovies(): void {
	
}