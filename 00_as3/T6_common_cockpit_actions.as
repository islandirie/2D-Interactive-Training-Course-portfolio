/*
This file includes all common cockpit button actions. For instance,
basic on/off switches, turn knobs, Hi-Mid-Low switches, etc.
Called from the T6_Main_Navigation.as file.
*/

//--------------------------------------------------------------------
// GLOBAL BOOLEAN VARIABLES USED
//--------------------------------------------------------------------
/*
MainNavBool (Boolean)
*/


//------------------------------------------------------------------------------------------------------ 
// SIMPLE SWITCH ON to OFF
// 1 property (MovieClip), in source movie clip
// label your animations as "on" or "off"
//------------------------------------------------------------------------------------------------------
function btnOnOff(mc: MovieClip): void {

	// add a mouse event listener, action in switchEm() function
	mc.addEventListener(MouseEvent.CLICK, switchEm);
}
function switchEm(e: MouseEvent): void {

	// the "!" means "not", so if btn = true, make btn = not true, and vice versa
	// use the boolean value to switch the on/off states
	// could also use mc.gotoAndStop("off");
	if (e.currentTarget.currentLabel == "on") {
		e.currentTarget.gotoAndStop("off");
	} else {
		e.currentTarget.gotoAndStop("on");
	}
}

//---------------------------------------------------------------------------------------------------
// BUTTON WITH 3 STATES
// 2 properties, hitBox(a invisible movie clip) and hitTarget(the button graphic)
// label animations as "hi", "norm" or "off"
//--------------------------------------------------------------------------------------------------- 

function btn3States(hitBox: MovieClip, hitTarget: MovieClip): void {

	hitBox.alpha = 0;
	hitBox.addEventListener(MouseEvent.CLICK, hitBoxClick);
	function hitBoxClick(e: MouseEvent): void {

		if (e.currentTarget.name == "hi") {
			hitTarget.gotoAndStop("hi");
		}
		if (e.currentTarget.name == "norm") {
			hitTarget.gotoAndStop("norm");
		}
		if (e.currentTarget.name == "off") {
			hitTarget.gotoAndStop("off");
		}
	}
}

//---------------------------------------------------------------------------------------------------
// GUARD BOX w/ 3 STATE BUTTONS - used for pressurization switch
// 3 properties, 3 buttomn Hit State(a movie clip), the red guard (MovieClip), the target (MovieClip)
// target labels as "norm", "dump" and "ram/dump", red guard label animations as "close", "open"
//--------------------------------------------------------------------------------------------------- 
function guardMC(guard: MovieClip, mcTarget: MovieClip): void {
	// uses cover function below
	guard.addEventListener(MouseEvent.CLICK, cover);
	mcTarget.addEventListener(MouseEvent.CLICK, hitBoxClick);
	function hitBoxClick(e: MouseEvent): void {
		if (guard.currentLabel == "close") {
			mcTarget.gotoAndStop("norm");
		} else {
			if (e.target.name == "off") { //norm, uses btn3state labels
				mcTarget.gotoAndStop("norm");
			}
			if (e.target.name == "norm") { //dump
				mcTarget.gotoAndStop("dump");
			}
			if (e.target.name == "hi") { //ramdump
				mcTarget.gotoAndStop("ramdump");
			}
		}
	}
}
//----------------------------------------------------------------------------------
// Code for buttons with covers, used with guardMC() and firewallShutoff()
//----------------------------------------------------------------------------------
function cover(e: MouseEvent): void {
	if (e.currentTarget.currentLabel == "close") {
		e.currentTarget.gotoAndStop("open");
	} else {
		e.currentTarget.gotoAndStop("close");
	}
}

//---------------------------------------------------------------------------------------------------
// EMERGENCY FIREWALL SHUTOFF VALVE - open/close and push/pull
// 2 properties, fso Cover (MovieClip), fso T-Handle (MovieClip)
// target labels as "down", "down2up", "up", "up2down" red guard label animations as "close", "open"
//---------------------------------------------------------------------------------------------------
/* code below should be used in animation to allow cover to push down t-handle	
	if(fsoValve.fsocover.currentLabel == "close"){
		fsoValve.fsothandle.gotoAndStop("down");
	}
*/
function firewallShutoff(fsoCover: MovieClip, fsoT: MovieClip): void {
	fsoCover.addEventListener(MouseEvent.CLICK, cover);
	fsoT.addEventListener(MouseEvent.CLICK, hitClick);
	function hitClick(e: MouseEvent): void {
		if (e.currentTarget.currentLabel == "down") {
			e.currentTarget.gotoAndPlay("down2up");
		}
		if (e.currentTarget.currentLabel == "up") {
			e.currentTarget.gotoAndPlay("up2down");
		}
	}
}


//---------------------------------------------------------------------------------------------------
// DRAG HANDLE in 1 position (x or y)
// 5 properties, MovieClip, properties of rectangle (x pos, y pos, width, height)
//---------------------------------------------------------------------------------------------------
function dragHandle(mc: MovieClip, rectX: Number, rectY: Number, rectW: Number, rectH: Number): void {
	// below is an example for how to set up a Rectangle within Function
	// to keep drag within a certain area, the code below should be moved
	// to function property instead to maintain flexibility
	// new Rectangle(x, y, boundary in width, boundary in height)
	var mcBounds: Rectangle = new Rectangle(rectX, rectY, rectW, rectH);

	mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
	mc.addEventListener(MouseEvent.RELEASE_OUTSIDE, stopDragging);
	mc.addEventListener(MouseEvent.MOUSE_OUT, stopDragging);
	mc.addEventListener(MouseEvent.MOUSE_UP, stopDragging);

	function startDragging(e: MouseEvent): void {
		mc.startDrag(false, mcBounds);
	}
	function stopDragging(e: MouseEvent): void {
		mc.stopDrag();
		//mc.removeEventListener(MouseEvent.MOUSE_DOWN, startDragging);
	}
}

//---------------------------------------------------------------
// ENABLES / DISABLES multiple buttons at once
// 2 propeties, a MovieClip and a boolean, if true buttons, enabled
// if false buttons, disabled.
//---------------------------------------------------------------
function enableMovieClips(mc: MovieClip, bool: Boolean): void {
	mc.enabled = bool;
	mc.mouseEnabled = bool; // enables/disables buttons
	mc.mouseChildren = bool; // enables/disables all children of that button
	mc.buttonMode = bool; // creates a hand cursor
}

//---------------------------------------------------------------
// HIDE BUTTON MASKS, used as hit targets
//---------------------------------------------------------------
function hiddenBtns(hitTarget: MovieClip): void {
	hitTarget.alpha = 0;
}

//---------------------------------------------------------------
// ROTATE KNOBS
// 4 propeties, a MovieClip, hitTarget(a mask that specifies a hit target)
// minR (stops at a certain point if rotating counter-clockwise)
// maxR (stops at a certain point if rotating clockwise)
//---------------------------------------------------------------
function gdKnobs(mc: MovieClip, hitTarget: MovieClip, minR: Number, maxR: Number): void {

	// default postion, where it starts at

	//adds a MOUSE_UP and MOUSE_DOWN event, mouse down connected to mc, mouse up to stage 
	hitTarget.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownF);
	addEventListener(MouseEvent.MOUSE_UP, mouseUpF);


	function mouseDownF(e: MouseEvent): void {
		//adds a MOUSE_MOVE event, only works while mouse is in clicked and in motion
		addEventListener(MouseEvent.MOUSE_MOVE, rotate);
	}

	function rotate(e: MouseEvent): void {

		//if statement to test if movie clip has parent or not, the x and y values are always
		//based on parent top-left area, not the stage.
		var angle: Number;

		angle = Math.atan2(mc.parent.mouseY - mc.y, mc.parent.mouseX - mc.x); //get angle in radians (pythagoras)

		angle = angle * 180 / Math.PI + 90; //convert to degrees , the 90 is to have it point to the mouse
		mc.rotation = angle;

		if (mc.rotation < minR) {
			mc.rotation = minR;
			removeEventListener(MouseEvent.MOUSE_MOVE, rotate);
			mc.rotation = minR + 5;
		}
		if (mc.rotation > maxR) {
			mc.rotation = maxR;
			removeEventListener(MouseEvent.MOUSE_MOVE, rotate);
			mc.rotation = maxR - 5;
		}
	}

	function mouseUpF(e: MouseEvent): void {
		removeEventListener(MouseEvent.MOUSE_MOVE, rotate);
	}
}

function gdKnobsDebug(mc: MovieClip): void {
	trace("mc name: " + mc.name + " mc mouseX: " + mc.mouseX + " mc mouseY: " + mc.mouseY);
	trace("mc parent name = " + mc.parent.name + " parent mouseX: " + mc.parent.mouseX + "parent mouseY = " + mc.parent.mouseY + " mousey: " + mouseY);
}

//---------------------------------------------------------------
// RUDDER PEDALS
// 3 Functions (goes up, goes down, goes to normal)
// rudderPedals(frame Number, Left Pedal MovieClip, Right Pedal MovieClip, MovieClip Height, Scaling speed rate)
// ex: rudderPedals (4, leftRP, rightRP, 322, 10);
//---------------------------------------------------------------
function rudderPedUp(mc1: MovieClip, mc2: MovieClip, mcHeight: Number, scaleSpd: Number): void {
	if (mc1.height <= mcHeight + 100) {
		mc1.height += scaleSpd;
		mc2.height -= scaleSpd;
		mc1.scaleX = mc1.scaleY; // scales in proportion
		mc2.scaleX = mc2.scaleY;
	}
}
function rudderPedDown(mc1: MovieClip, mc2: MovieClip, mcHeight: Number, scaleSpd: Number): void {
	if (mc1.height >= mcHeight - 100) {
		mc1.height -= scaleSpd;
		mc2.height += scaleSpd;
		mc1.scaleX = mc1.scaleY; // scales in proportion
		mc2.scaleX = mc2.scaleY;
	}
}
function rudderPedNorm(mc1: MovieClip, mc2: MovieClip, mcHeight: Number, scaleSpd: Number): void {
	if (mc1.height > mcHeight) {
		mc1.height -= scaleSpd;
		mc2.height += scaleSpd;
		mc1.scaleX = mc1.scaleY; // scales in proportion
		mc2.scaleX = mc2.scaleY;
	}
	if (mc1.height < mcHeight) {
		mc1.height += scaleSpd;
		mc2.height -= scaleSpd;
		mc1.scaleX = mc1.scaleY; // scales in proportion
		mc2.scaleX = mc2.scaleY;
	}
}
//---------------------------------------------------------------
// Gauges (Speed/Pressure/Torque)
// 2 Functions (degToRad, radToDeg)
// 
// THIS CODE IS INCOMPLETE
//---------------------------------------------------------------

// degree to radians
function degToRad(angle:Number):Number {
	return ((angle*Math.PI)/180);
}
// radians to degrees
function radToDeg(angle:Number):Number {
	return ((angle*180)/Math.PI);
}


/*
dynamically adding a movie clip from library, instantiating through classes.
click on movie clip in library > properties: select "export for actionscript" and
"export for frame1". than use function below to simplify creating x and y properties

how to use: setMC(obogsTemp,809,275); //used in FAM_OBOGS_NormMech.swf.

function setMC(mc:Class, newMC:String, xVal:Number, yVal:Number):void
{
    var newMC:MovieClip = new mc() as MovieClip;
    // Here you actually make an object out of a class
    addChild(newMC);
    newMC.x = xVal;
    newMC.y = yVal;
}
*/