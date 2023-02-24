import flash.display.DisplayObject;
import fl.motion.easing.Back;
import flash.display.MovieClip;


function gdKnobs(mc: MovieClip, hitHere:MovieClip, minR: Number, maxR: Number): void {

	// default postion, where it starts at
	//mc.rotation = minR;
	hitHere.alpha = 0;

	//adds a MOUSE_UP and MOUSE_DOWN event, mouse down connected to hitHere, mouse up to stage 
	hitHere.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownF);
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

		/*if (mc.rotation > 135 || mc.rotation < -135) {
			mc.rotation = -133;	
		}*/
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