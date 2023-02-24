import flash.events.Event;
import flash.display.MovieClip;

include "../00_as3/changeSpeed.as";

// declare all global variables at top, after libraries


frameMC.addEventListener(Event.ENTER_FRAME, controlClips);

function controlClips(e:Event):void{
	/////////// frame 1 //////////////
	if(currentFrame == 1){
		batteryPanel.bustieSwitch.gotoAndStop(3); // Open position
		batteryPanel.AVIMasterSwitch.gotoAndStop("off");
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
		
		bts.auxc3.gotoAndStop("up");
		bts.auxc4.gotoAndStop("up");
	}
	/////////// frame 2 //////////////
	if(currentFrame == 2){
		changeSpeed(fr2Animation, currentFrame, .5);
		batteryPanel.batterySwitch.prevFrame();
		bts.batT.gotoAndStop("open");
		
		bts.auxc1.gotoAndStop("up");
		bts.batc3.gotoAndStop("up");
	}
	////////// frame 3 ////////////////
	if(currentFrame == 3){
		changeSpeed(fr3Animation, currentFrame, .3);
		batteryPanel.bustieSwitch.gotoAndStop(3); // Open Position
		batteryPanel.batterySwitch.nextFrame();
		batteryPanel.AVIMasterSwitch.gotoAndStop("off");
		batteryPanel.auxBattSwitch.prevFrame();
		bts.busT.gotoAndStop("open");
		bts.batT.gotoAndStop("close");
		bts.aviT1.gotoAndStop("open");
		bts.aviT2.gotoAndStop("open");
		
		bts.batc3.gotoAndStop("down");
		bts.auxc1.gotoAndStop("down");
		bts.auxc2.gotoAndStop("up");
		bts.auxc3.gotoAndStop("up");
		bts.auxc4.gotoAndStop("up");
		
	}
	////////// frame 4 ///////////////
	if(currentFrame == 4){
		changeSpeed(fr4Animation, currentFrame, .2);
		batteryPanel.AVIMasterSwitch.gotoAndStop("on");
		batteryPanel.bustieSwitch.gotoAndStop(3); // Open Position
		batteryPanel.auxBattSwitch.nextFrame();
		bts.busT.gotoAndStop("open");
		bts.batT.gotoAndStop("open");
		
		bts.batc3.gotoAndStop("up");
		bts.auxc1.gotoAndStop("up");
		bts.auxc2.gotoAndStop("down");
	}
	
}