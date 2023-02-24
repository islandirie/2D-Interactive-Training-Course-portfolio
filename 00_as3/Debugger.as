/* 
All Debug codes go in here, normally makes use of the
trace() function.

Debuggers include, tracing names of movie clips, etc.

*/

// Main use to test button instance names, will even check
// for a parent, if it has any.
// used with an addEventListener attached to a MovieClip().
function nameOfMovieClip(e:MouseEvent):void {
	
	var eThis:String = e.currentTarget.name;
	var rootParent:String = e.target.parent.name;
	
	if(rootParent == eThis){
		trace(eThis + " button clicked");
	} else {
		var eParent:String = e.currentTarget.parent.name;
		var combine:String = eParent + "." + eThis;
		trace(combine + " button clicked");
	}
	
	e.currentTarget.removeEventListener(MouseEvent.CLICK, nameOfMovieClip);
}

// simply checks what frame you are on, needs to be inputed into a
// ENTER_FRAME event listener, to listen on every frame. If not,
// will only read from frame 1.
function frameNumber():void {
	addEventListener(Event.ENTER_FRAME, countThis);
	function countThis():void {
		trace(currentFrame);
	}
}

//------------------------------------------------------------------------
// Find all movie clip children with their names, use of RegExp Class
// ignores all movie clips with "instance" as a name
//------------------------------------------------------------------------
// a MovieClip is an Object, so calling the Object property works
function findChildren(mc: Object) {
	// Expression that ignores all names that start with 'instance'
	var myRegExp: RegExp = /instance/;

	for (var i: int = 0; i < mc.numChildren; i++) {
		if (!myRegExp.test(mc.getChildAt(i).name)) {
			trace("index# " + i + " " + mc.getChildAt(i).name);
		}
	}
	trace(" ");
	trace(mc.name + " has " + mc.numChildren + " children total");
	trace("use " + mc.name + ".getChildAt(index#) or " + mc.name + ".getChildByName(MovieClip Name)");
}
