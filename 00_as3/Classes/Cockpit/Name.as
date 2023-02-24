package Classes.Cockpit {
	
	public class Name {
		
		// global variables
		private var firstName:String;
		private var lastName:String;
		private var allNames:Array;
		
		// constructor
		public function Name() {
			// defaults
			firstName = "testFirst";
			lastName = "testLast";
			allNames = new Array;
		}
		
		// setters
		public function SetFirstName(val:String):void
		{
			firstName = val;
		}
		
		public function SetLastName(val:String):void
		{
			lastName = val;
		}
		
		// getters
		public function GetFullName():String
		{
			return firstName + " " + lastName;
		}
		
		// other methods
		private function inputNames():void{
			allNames.push();
		}
		
		private function getNameData():void{
			for (var i:Number = 0; i < allNames.length; i++){
				trace(allNames[i]);
			}
		}

	}
	
}
