import flash.text.TextField;

// display TextField()
frameCounter.addEventListener(Event.ENTER_FRAME, frameNumberText);
function frameNumberText(evt:Event):void { 
	frameCounter.x = 903;
	frameCounter.y = 545;
	frameCounter.text = currentFrame + ' of ' + totalFrames;
 }