/*
This is the main file that should be included in all projects. Without this
file being called (include ../00_as3/T6_Main_Navigation.as), most of the 
project files will not work. It has already been implemented in all of them.

Coding and Organization/Structure:
Casey --- - Last updates 9/10/2017

Original Codes:
--- Gove - Last updates 10/15/2016
--- - Last updates 7/21/2016

*/

//--------------------------------------------------------------------
// Imports all used Flash classes / Includes other important external .as files
//--------------------------------------------------------------------
import flash.display.MovieClip;
import flash.events.*; //MouseEvent, Event, KeyboardEvent
import flash.text.TextField;
import flash.text.TextFormat;
import fl.controls.Button;
import flash.geom.Rectangle;
import flash.display.DisplayObject;
import fl.controls.UIScrollBar;
import flash.filters.BitmapFilterQuality;
import flash.filters.*;
import fl.transitions.*; //Tween
import fl.transitions.easing.*;
import flash.ui.Mouse;
import flash.utils.Timer;

include "frameCounter.as";
include "T6_common_cockpit_actions.as";
include "Debugger.as";
include "changeSpeed.as";
include "Notes.as";

stop(); // stops main Scene from looping

//--------------------------------------------------------------------
// GLOBAL BOOLEAN VARIABLES
//--------------------------------------------------------------------
var MainNavBool: Boolean; // used in T6_common_cockpit_actions

/////// OPERATIONAL / INSTRUCTIONAL Boolean
var LearnMode: Boolean; // Operational mode = true; Instructional mode = false;
/////// RESETTER Boolean
var Resetter: Boolean;
/////// dynamically calling movie clips, mainly for changeSpeed(), but can be used
// where multiple clips all do same actions. Must be placed in an ENTER_FRAME event listener
//use this code in schematic .as file when needed
var fr_Animation: MovieClip; // = getChildByName("fr" + currentFrame + "Animation") as MovieClip;

//--------------------------------------------------------------------
// FILTERS
//--------------------------------------------------------------------
// To apply filter use - MovieClip.filters = [yellowOutline];
var yellowOutline: GlowFilter = new GlowFilter();
// these are the only properties for the GlowFilter();
yellowOutline.color = 0xFFFF00;
yellowOutline.alpha = 1;
yellowOutline.blurX = 3;
yellowOutline.blurY = 3;
yellowOutline.quality = BitmapFilterQuality.HIGH;
yellowOutline.strength = 5;
yellowOutline.inner = false;
yellowOutline.knockout = false;
// these are the only properties for BlurFilter();
var blur: BlurFilter = new BlurFilter();
blur.blurX = 2;
blur.blurY = 2;
blur.quality = BitmapFilterQuality.MEDIUM;
// Properties for GlowFilter() for black arrows
var glow: GlowFilter = new GlowFilter();
glow.color = 0xffffff;
glow.alpha = 1;
glow.blurX = 5;
glow.blurY = 5;
glow.strength = 2;
glow.quality = BitmapFilterQuality.MEDIUM;


//--------------------------------------------------------------------
// NEXT & PREVIOUS BUTTONS
//--------------------------------------------------------------------
NextBtn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToNextFrame_1);
function fl_ClickToGoToNextFrame_1(e: MouseEvent): void {
	nextFrame();
	MainNavBool = true;
}

PrevBtn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToPreviousFrame_2);
function fl_ClickToGoToPreviousFrame_2(e: MouseEvent): void {
	prevFrame();
}

/*
HIDE BUTTONS based on 1st and last frame
*/
PrevBtn.addEventListener(Event.ENTER_FRAME, hidePrevBtn);
function hidePrevBtn(event): void {
	if (currentFrame == 1) {
		PrevBtn.visible = false;
		PrevNull.visible = true;
	} else {
		PrevBtn.visible = true;
		PrevNull.visible = false;
	}
}
NextBtn.addEventListener(Event.ENTER_FRAME, hideNextBtn);
function hideNextBtn(event): void {
	if (currentFrame == totalFrames) {
		NextBtn.visible = false;
		NextNull.visible = true;
	} else {
		NextBtn.visible = true;
		NextNull.visible = false;
	}
}

//----------------------------------------------------------------------------
// Automatically jump to next frame
//----------------------------------------------------------------------------
function jumpToNext(mc: MovieClip, frNum: Number): void {
	//currentFrame inside MovieClip, not main timeline
	if (mc.currentFrame == mc.totalFrames) {
		gotoAndStop(frNum);
	}
}
function jumpToNextFrame(mc: MovieClip): void {
	//currentFrame inside MovieClip, not main timeline
	if (mc.currentFrame == mc.totalFrames) {
		nextFrame();
	}
}

//------------------ REMOVE EVENT LISTENERS ----------------------------------
//NextBtn.removeEventListener(MouseEvent.CLICK, fl_ClickToGoToNextFrame_1);
//PrevBtn.removeEventListener(MouseEvent.CLICK, fl_ClickToGoToPreviousFrame_2);

//-------------------------------------------------------------------------
// RESET BUTTON
// click to go back to frame 1 on main timeline
//-------------------------------------------------------------------------
var resetf: TextFormat = new TextFormat();
resetf.size = 14;
Reset_Btn.setStyle("textFormat", resetf);
Reset_Btn.label = "RESET";
Reset_Btn.x = 910;
Reset_Btn.y = 615;
Reset_Btn.height = 25;
Reset_Btn.useHandCursor = true;

Reset_Btn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToAndStopAtFrame_1);
function fl_ClickToGoToAndStopAtFrame_1(event: MouseEvent): void {
	gotoAndStop(1);
	Resetter = true;
}

//-------------------------------------------------------------------------
// MODE BUTTON
// Switches between Instructional / Operational Mode
// Look for the button in the project library to switch its default label
// which is currently on "Instructional"
//-------------------------------------------------------------------------
var switchMode: TextFormat = new TextFormat();
switchMode.size = 12;
switcheroo.setStyle("textFormat", switchMode);
switcheroo.x = 910;
switcheroo.y = 585;
switcheroo.width = 100;
switcheroo.height = 25;
switcheroo.toggle = true; // this makes it switch between 2 choices, use .selected for conditional test
switcheroo.useHandCursor = true; // it should change to a hand cursor
switcheroo.addEventListener(Event.CHANGE, switchingModes);

function switchingModes(e: Event): void {
	if (switcheroo.selected) {
		switcheroo.label = "Operational";
	} else {
		switcheroo.label = "Instructional";
	}
	// sets LearnMode:Boolean for individual animations
	LearnMode = switcheroo.selected;
}

//-------------------------------------------------------------------------
// CUSTOM TIMER
// Counts seconds based on 30 frames equals 1sec. Always starts at 1 second
// input function in ENTER_FRAME function. All schematics already built in 
//-------------------------------------------------------------------------
var counter: Number = 0; // public variables
var seconds: Number = 0; // public variables
function myTimer(stopTime: Number): void {
	counter++;
	if (counter % 30 == 0 || counter == 0) {
		seconds++;
	}
	if (seconds == stopTime) {
		seconds = 0;
	}
}

//-------------------------------------------------------------------------
// CUSTOM TIMELINE / PROGRESS BAR
// includes instructions for cockpit controls for animation
//-------------------------------------------------------------------------
var blockX: Number = progressBar.block.x;
var blockY: Number = progressBar.block.y;
var blockHeight: Number = progressBar.block.height;
var barHeight: Number = progressBar.bar.height;
var boundHeight: Number = barHeight - blockHeight;
var boundsRect: Rectangle = new Rectangle(blockX, blockY, 0, boundHeight);
var mcPlaying: Boolean = false;
var playPauseMC: MovieClip;
var blockValue: Number;
var mcValue: Number;
var blockConverted: Number;
var mcConverted: Number;
// setup position for progress bar
progressBar.x = 1012.65;
progressBar.y = 109;

// enable dragging
progressBar.block.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
function startDragging(e: MouseEvent): void {
	progressBar.block.startDrag(true, boundsRect);
}
// disable dragging
progressBar.block.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
progressBar.block.addEventListener(MouseEvent.RELEASE_OUTSIDE, stopDragging);
function stopDragging(e: MouseEvent): void {
	progressBar.block.stopDrag();
}
// click bar to jump to frame number
//progressBar.bar2.addEventListener(MouseEvent.CLICK, moveBlock);
function moveBlock(e: MouseEvent): void {
	progressBar.block.y = progressBar.mouseY;
}

function controlMC(mc: MovieClip): void {
	blockY = progressBar.block.y;
	playPauseMC = mc;

	// get values in percentage
	blockValue = Math.ceil(blockY/boundHeight*100); //getPercentage(blockY, boundHeight);
	mcValue = Math.ceil(mc.currentFrame/mc.totalFrames*100); //getPercentage(mc.currentFrame, mc.totalFrames);
	// convert percentage back to position / frames
	blockConverted = percentToPosition(mcValue, boundHeight);
	mcConverted = percentToPosition(blockValue, mc.totalFrames);

	//progressBar.block.y = blockConverted;
	//mc.gotoAndStop(mcConverted);
	progressBar.bar2.addEventListener(MouseEvent.CLICK, moveBlock);
	
	if (mcPlaying) {
		progressBar.block.y = blockConverted;
	} else {
		mc.gotoAndStop(mcConverted);
	}

	play_pause.addEventListener(MouseEvent.CLICK, playPause);


	trace(mc.isPlaying);
	//trace("mcValue: " + mcValue + " blockValue: " + blockValue);

}
function getPercentage(pos: Number, total: Number): Number {
	return Math.ceil((pos / total) * 100);
}
function percentToPosition(value: Number, total: Number): Number {
	return Math.ceil((value / 100) * total);
}

//-------------------------------------------------------------------------
// PLAY / PAUSE BUTTON
// used in conjunction with timeline
//-------------------------------------------------------------------------
play_pause.x = 910;
play_pause.y = 550;
function playPause(e: MouseEvent): void {
	if (mcPlaying = true) {
		playPauseMC.stop();
		play_pause.gotoAndStop("pause");
		mcPlaying = false;
	} else {
		playPauseMC.play();
		play_pause.gotoAndStop("play");
		mcPlaying = true;
	}
}

//-------------------------------------------------------------------------
// TEXT FIELD, INSTRUCTIONS
// includes instructions for cockpit controls for animation
//-------------------------------------------------------------------------