import flash.display.MovieClip;
import flash.ui.Mouse;
import flash.utils.Timer;
import flash.events.TimerEvent;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import flash.events.Event;
import flash.events.AccelerometerEvent;
import fl.transitions.Transition;
import flash.text.TextField;

// all variables for each movie clip
var npi: MovieClip = nose.pitch;
var sp: MovieClip = nose.spring;
var to: MovieClip = torque;
var tn: MovieClip = torque_numbers;
var op: MovieClip = oilpressure_numbers;
var el: MovieClip = engine.engLines;
var opSpeed: MovieClip = engine.engine_arrows.oil_press_speed;
var opInt: int = 125 / 30;
var tnInt: int = 160 / 60;
var firstTime: Number = 19;
var myFrames: Number = 30;

/* 
ONE ENTER_FRAME event listener / ONE function. This controls all movieclip changes on the timeline.
I found this to be a much better way than including multiple enter_frame listeners (functions) for
each individual object. Which allows me to create conditional statements when navigating through
every frame of the entire animation.
*/

addEventListener(Event.ENTER_FRAME, controlClips);
tn.stop(); // stops torque counter at frame 1
op.stop(); // stops oil pressure counter at frame 1
// stops propeller5 movie clip at frame 5.



function controlClips(Event): void {
	// START condition statements for pitch mechanical parts. pitch/spring/oil pressure
	if (currentFrame == 3 && currentLabel != "highP") {
		if (npi.currentLabel == "lowP" || npi.currentLabel == "highP to lowP") {
			npi.prevFrame();
			sp.prevFrame();
			to.prevFrame();
			engine.pcl.prevFrame();
		}
		if (npi.currentLabel == "feather" || npi.currentLabel == "feather to highP") {
			npi.nextFrame();
			sp.nextFrame();
			to.nextFrame();
			engine.pcl.nextFrame();
		}
	} else {
		npi.stop();
		sp.stop();
		to.stop();
		engine.pcl.stop();
	}
	if (currentFrame == 4 && npi.currentLabel != "lowP") {
		npi.nextFrame();
		sp.nextFrame();
		to.nextFrame();
		engine.pcl.nextFrame();
	} else {
		npi.stop();
		sp.stop();
		to.stop();
		engine.pcl.stop();
	}
	if (currentFrame == 2 && npi.currentLabel != "feather") {
		npi.prevFrame();
		sp.prevFrame();
		to.prevFrame();
		engine.pcl.prevFrame();
	} else {
		npi.stop();
		sp.stop();
		to.stop();
		engine.pcl.stop();
	}
	// END code for pitch mechanical parts. pitch/spring/oil pressure


	// START Number Counters
	tn.tNumber.text = tn.currentFrame * tnInt;
	op.oNumber.text = (op.currentFrame * opInt) - 15;
	if (currentFrame == 1) {
		engine.engine_arrows.visible = false;
	} else {
		engine.engine_arrows.visible = true;
	}

	if (currentFrame == 1) {
		tn.tNumber.text = 0;
		op.oNumber.text = 0;
	}
	if (currentFrame == 2 && tn.currentFrame > 1) {
		tn.prevFrame();
		op.prevFrame();
	}
	if (currentFrame == 3) {
		if (tn.currentFrame < 41) {
			tn.nextFrame();
		} else if (tn.currentFrame > 41) {
			tn.prevFrame();
		} else {
			tn.stop();
		}
		if (op.currentFrame < 30) {
			op.nextFrame();
		}
	}
	if (currentFrame >= 4 && tn.currentFrame < 47) {
		tn.nextFrame();
	}
	if (currentFrame == 4) {
		op.oNumber.text == 100;
	}
	if (currentFrame >= 5) {
		tn.tNumber.visible = false;
		op.oNumber.visible = false;
	} else {
		tn.tNumber.visible = true;
		op.oNumber.visible = true;
	}
	// END Number Counters


	// START oil pressure arrow speed
	if (currentFrame == 2) {
		engine.engine_arrows.stop();
		opSpeed.stop();
	} else {
		engine.engine_arrows.play();
		opSpeed.play();
	}
	if (currentFrame >= 3) {
		opSpeed.play();
	}
	// END oil pressure arrow speed

	// Abnormal Text display based on Frame 5 and 6
	if (currentFrame == 5) {
		abnormalText.gotoAndStop(1);
		torque.visible = false;
	} else {
		torque.visible = true;
	}
	if (currentFrame == 6) {
		abnormalText.gotoAndStop(2);
	}

	// ABNORMALS, frame 5 & 6
	if (currentFrame <= 4) {
		engine.gotoAndStop(1);
	}
	if (currentFrame == 5 && npi.currentFrame > 30) {
		npi.prevFrame();
		sp.prevFrame();
	}
	if (currentFrame == 5) {
		engine.gotoAndStop(2);
		if (eicas.currentFrame < 14 || eicas.currentFrame == eicas.totalFrames) {
			eicas.play();
		}
		if (propellers5.currentFrame == propellers5.totalFrames) {
			propellers5.stop();
			opSpeed.stop();
			//engine.pcl.prevFrame();
		}
		engine.pcl.gotoAndStop(60);
	}
	if (currentFrame == 6) {
		torque.visible = false;
		eicas.nextFrame();
		if (engine.pcl.currentFrame != 59) {
			engine.pcl.play();
		} else {
			engine.pcl.stop();
		}
		engine.nextFrame();
		engine.gotoAndStop(3);
		if (npi.currentLabel != "highP") {
			npi.nextFrame();
			sp.nextFrame();
		}
	}

	// START engine lines
	el.stop();
	if (currentFrame >= 3) {
		el.play();
	}
	// END engine lines


} // close function