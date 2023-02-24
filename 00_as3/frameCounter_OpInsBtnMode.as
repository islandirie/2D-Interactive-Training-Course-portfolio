import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.MovieClip;

// display TextField()
frameMC.frameCounter.addEventListener(Event.ENTER_FRAME, frameNumberText);
function frameNumberText(evt: Event): void {
	this.frameMC.x = 961;
	this.frameMC.y = 558;
	frameMC.frameCounter.text = currentFrame + ' of ' + totalFrames;
}