import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.text.TextFormat;
include "frameCounter.as";

stop(); // stops from looping

//code created by: --- 7/21/16

//setup the font size for the button text
var tf: TextFormat = new TextFormat();

tf.size = 14;

BtnMode.setStyle("textFormat", tf);
PR_Btn.setStyle("textFormat", tf);


//Labels the button at runtime
BtnMode.label = "Instructor Mode";

//sets the toggle mode
BtnMode.toggle = true;

//Click listener
BtnMode.addEventListener(MouseEvent.CLICK, ModeName);

function ModeName(event: MouseEvent): void {
	//trace(event.target.selected);

	//Checks to see if button is toggled down
	if (event.target.selected == true) {
		event.target.label = "Operator Mode";
	} else {
		event.target.label = "Instructor Mode";

	}
}

//pause and resume button toggle
PR_Btn.label = " Pause";

//sets the toggle mode
PR_Btn.toggle = true;

//Click listener
PR_Btn.addEventListener(MouseEvent.CLICK, PauseResumeName);

function PauseResumeName(event: MouseEvent): void {
	//trace(event.target.selected);

	//Checks to see if button is toggled down
	if (event.target.selected == true) {
		event.target.label = "Resume";
	} else {
		event.target.label = "Pause";
	}
}

// code created by --- Gove

NextBtn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToNextFrame_1);
function fl_ClickToGoToNextFrame_1(event: MouseEvent): void {
	nextFrame();
}

PrevBtn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToPreviousFrame_2);
function fl_ClickToGoToPreviousFrame_2(event: MouseEvent): void {
	prevFrame();
}

// hide buttons based on 1st and last frame

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
	if (currentFrame == totalFrames){
		NextBtn.visible = false;
		NextNull.visible = true;
	} else {
		NextBtn.visible = true;
		NextNull.visible = false;
	}
}