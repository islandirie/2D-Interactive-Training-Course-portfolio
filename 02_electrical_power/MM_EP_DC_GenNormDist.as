import flash.events.Event;
import flash.display.MovieClip;

include "../00_as3/changeSpeed.as";

// declare all global variables at top, after libraries


frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(e:Event):void{
	/////////// frame 1 //////////////
	if(currentFrame == 1){
		batteryPanel.bustieSwitch.gotoAndStop(1); // Open position
		batteryPanel.AVIMasterSwitch.gotoAndStop("off");
		batteryPanel.batterySwitch.prevFrame();
		bts.strT.gotoAndStop("open");
		bts.extT.gotoAndStop("open");
		bts.overT.gotoAndStop("open");
		bts.genT.gotoAndStop("open");
		bts.busT.gotoAndStop("open");
		bts.aviT1.gotoAndStop("open");
		bts.aviT2.gotoAndStop("open");
		bts.batT.gotoAndStop("open");
		
		bts.batc3.gotoAndStop("up");
		bts.batc4.gotoAndStop("up");
		bts.busc3.gotoAndStop("up");
		bts.auxc3.gotoAndStop("up");
		bts.auxc4.gotoAndStop("up");
	}
	////////// frame 2 ///////////////
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .2);
		batteryPanel.bustieSwitch.gotoAndStop(3); // Open position
		batteryPanel.AVIMasterSwitch.gotoAndStop("on");
		batteryPanel.batterySwitch.nextFrame();
		batteryPanel.generatorSwitch.prevFrame(); // sandwich 3
		
		bts.busT.gotoAndStop("close");
		bts.aviT1.gotoAndStop("close");
		bts.aviT2.gotoAndStop("close");
		bts.batT.gotoAndStop("close");
		bts.genT.gotoAndStop("open"); // sandwich 3
		
		bts.batc3.gotoAndStop("down");
		bts.busc3.gotoAndStop("down");
		bts.auxc3.gotoAndStop("down");
		bts.auxc4.gotoAndStop("down");
		bts.genc3.gotoAndStop("up"); // sandwich 3
	}
	///////// frame 3 ///////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .2);
		batteryPanel.generatorSwitch.nextFrame();
		bts.genT.gotoAndStop("close");
		bts.genc3.gotoAndStop("down");
	}
	
}