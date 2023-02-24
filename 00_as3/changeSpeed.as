/*
//--------------------------------------------------------------
// How to use function:
//--------------------------------------------------------------
In local flash file / .as file use the changeSpeed() function w/ parameters.
At top of .as file, copy and paste line below: 
	include "../00_as3/changeSpeed.as";
Example:
	changeSpeed([movie clip], [currentFrame], [speed])
	- for [speed]: .01 slowest to '1' normal to '5' much faster.
Note: 
	currently function only works with 1 movie clip at a time within the same frame. May
	include function as a class to allow multiple movie clips at the same time. if you
	need to use a second movieclip on same frame use code below in local flash file.
	[movieclip].gotoAndStop(Math.floor(countFrame));
*/

//--------------------------------------------------------------
// declare all variables here
//--------------------------------------------------------------
var speed:Number = 0; // .01 - 9
var countFrame:Number = 0;
var movClip:MovieClip;
var recFrame:Number;
var roundDown:Number;
var frNum:Array = [null,false,false,false,false,false,false,false,false,false,false];


//--------------------------------------------------------------
// start changeSpeed() function
//--------------------------------------------------------------
function changeSpeed(mc2:MovieClip, rf:Number, spd:Number):void
{
	movClip = mc2; // focuses on current movie clip
	recFrame = rf; //keeps track of current frame number
	changeCountFrame(rf); // simply checks if frame number is true/false
	speed = spd; // allows input to customize speed
	movClip.addEventListener(Event.ENTER_FRAME, handleEvent);
}
//--------------------------------------------------------------
// handleEvent() function, Main code.
//--------------------------------------------------------------
function handleEvent(event):void
{
	roundDown = Math.floor(countFrame);
	if(currentFrame == recFrame){
		setFrameBoolean(recFrame);
		countFrame += speed;
		movClip.gotoAndStop(roundDown);
		if(movClip.currentFrame == movClip.totalFrames){
			countFrame = movClip.totalFrames;
		}
	} else {
		countFrame = 0;
	}
	if(frNum[recFrame] == true){
		movClip.removeEventListener(Event.ENTER_FRAME, handleEvent);
	}
	//debug(); //use this line for debugging, erase first 2 slashes ("//")
}

//--------------------------------------------------------------
// other helper functions
//--------------------------------------------------------------

// function used to change frNum[] array at currentFrame to true
function setFrameBoolean(frameNumber:Number):void{
	for(var i:Number = 0; i < frNum.length; i++){
		if(frameNumber == i){
			frNum[i] = true;
		} else {
			frNum[i] = false;
		}
	}
}

// function used to restart countFrame to 0, so that each movie clip plays from beginning
function changeCountFrame(frameNumber:Number):void{
	if(frNum[frameNumber] == false){
		countFrame = 0;
	}
}

/* 
function used for debugging purposes, to test code, 
it helps to see how the timeline is counting frames
*/
function debug(){
	trace("countFrame = " + countFrame
	+ " frame # " + recFrame
	+ " movie clip " + movClip.name);
}