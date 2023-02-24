/*
Original code Created by --- 10/12/2017
Updated code by Casey --- 10/18/2017

Purpose:
These actions are related to the Notes that should be put into all animated schematics.
The purpose is to guide the student/instructor on what buttons on a cockpit to press to
jump to the next animation sequence. It can also give a brief explanation on where they 
are at in the animation.

Technical:
- It links to an external text file (.txt) and inputs the text into a notes section movie clip.
- It highlights instructions relevant to the currentFrame of the animation.
- The text files are located in a "Notes" folder, should have same name as the Animation name.
	- text files are dynamic and can be made by client
	- formatting simply requires that they use "numbers" of instruction. The current frame and
	  number in text shall be highlighted accordingly
*/

import fl.controls.UIScrollBar;
import flash.filters.BitmapFilterQuality;
import flash.filters.GlowFilter;
import flash.events.Event;

//------ SetUp Notes section ---------------------------

//var textURL: URLRequest = new URLRequest();
var textLoader: URLLoader = new URLLoader();
var n_txfield: TextField = new TextField();
var txtFormat: TextFormat = new TextFormat;
var colorRed: TextFormat = new TextFormat;
var n_bold: TextFormat = new TextFormat;
var pattern: RegExp = /\d/g; // this pattern finds digits, can also use new RegExp("\\d*", "");

//---- TextFormat Styles -------------------------

txtFormat.leftMargin = 40;
txtFormat.rightMargin = 15;
txtFormat.font = "Arial";
txtFormat.size = 14;
txtFormat.color = 0x4f4f4f;

n_txfield.defaultTextFormat = txtFormat;

colorRed.color = 0xff0000;
n_bold.bold = true;

//---- TextField Styles -------------------------------

//tfield.selectable = false; //Leave as default "true" for now, for editing purposes
n_txfield.multiline = true;
n_txfield.wordWrap = true;
n_txfield.width = 400;
n_txfield.height = 225;
n_txfield.x = 100;
n_txfield.y = 50;

//----- Scroll Bar set up ------------------------------

var mySb: UIScrollBar = new UIScrollBar();
mySb.direction = "vertical";

// Size it to match the text field.
mySb.setSize(n_txfield.width, n_txfield.height);

// Move it immediately below the text field.
mySb.move(n_txfield.width + n_txfield.x, n_txfield.y);

//put it on stage
mySb.scrollTarget = n_txfield;

//------ Creates Rectangle behind TextField for Customizing Look -----------

var rectangle: Shape = new Shape;
rectangle.graphics.lineStyle(1, 0xD6D688);
rectangle.graphics.beginFill(0xFFFFA3);
rectangle.graphics.drawRect(100, 49, 416, 227); // (x spacing, y spacing, width, height)
rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill

//-------- Adds a Shadow for Rectanclge ------------------------------------------------

var shadow: DropShadowFilter = new DropShadowFilter();
shadow.color = 0x777777;
shadow.alpha = .5;
shadow.blurX = 3;
shadow.blurY = 3;
shadow.quality = BitmapFilterQuality.HIGH;

rectangle.filters = [shadow];

//---- Handle external text ------------------------------

textLoader.addEventListener(Event.COMPLETE, onLoaded);
function onLoaded(e: Event): void {
	// when load completes will pass the external textfile to tf.text
	n_txfield.text = e.target.data;
}

function notesHighlight(textURL: URLRequest, frameNum: Number): void {
	
	//loads the url of the external text file.
	textLoader.load(textURL);
	// textArray is a String of Numbers, not the actual Numbers
	// using RegExp (Regular Expressions) to find all digits and save into
	// an Array, NOTE: in AS3, "2" == 2 returns true, even if one is text
	var textArray: Array = n_txfield.text.match(pattern);
	// The search() goes into text file and looks for "numbers", than gets
	// the index position of that number. Ex: search(1), finds 1 at index 28 of
	// text file. Than returns 28 which is an actual Number.
	var pos1: Number = n_txfield.text.search(frameNum);
	var pos2: Number;
	var last: Number = n_txfield.length;

	//set to defaults first
	n_txfield.textColor = 0x4f4f4f;

	// set to RED based on frameNum (which should be the current frame your on)
	// position 2 is currentFrame + 1, ex: change color from 1 to 2, but, if on the
	// last frame, color from last frame to end of text data.
	if (frameNum == textArray.length) {
		pos2 = n_txfield.length;
	} else {
		pos2 = n_txfield.text.search(frameNum + 1);
	}
	// after receiving postition 2 info based on currentFrame, color the selection area Red.
	n_txfield.setTextFormat(colorRed, pos1, pos2);
}