package T6_Classes.Cockpit {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Switches {
	
		// global Properties / Variables
		public var kimsNumber:Number = 5;
		
		public function Switches()
		{
			// Constructor
		}
		
		// Getters & Setters
		
		// Other Methods / Functions
		public function toggleOnOff(mc:MovieClip):void
		{
			// create a boolean (true/false) value
			var boolValue:Boolean;
			
			// add a mouse event listener, action in switchEm() function
			mc.addEventListener(MouseEvent.CLICK, switchEm);
			
			function switchEm(e:MouseEvent):void
			{
				// switch the boolean value to switch the on/off states
				boolValue = !boolValue;
				if(boolValue){
					mc.gotoAndStop("on");
				} else {
					mc.gotoAndStop("off");
				}
			}
		}

	}
}
