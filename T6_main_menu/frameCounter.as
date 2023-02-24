import flash.text.TextField;
import flash.text.TextFormat;

// formating
var countFormat:TextFormat = new TextFormat();
// display TextField()
var frameCounter:TextField = new TextField();

frameCounter.addEventListener(Event.ENTER_FRAME, frameNumberText);
function frameNumberText(evt:Event):void { 
	frameCounter.text = currentFrame + ' of ' + totalFrames;
	frameCounter.x = 909;
	frameCounter.y = 733;
	frameCounter.border = true;
	countFormat.color = 0x25456C;
	countFormat.size = 18;
	frameCounter.setTextFormat(countFormat);
 }
 
addChild(frameCounter);

