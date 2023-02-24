import flash.display.MovieClip;
import flash.ui.Mouse;
import flash.utils.Timer;
import fl.motion.easing.Elastic;

addEventListener(Event.ENTER_FRAME, controlClips);
//var np: MovieClip = nose.propellers;
var npi: MovieClip = nose.pitch;
var sp: MovieClip = nose.spring;
var to: MovieClip = torque;
var tn: MovieClip = torque_numbers;
var op: MovieClip = oilpressure_numbers;
var el: MovieClip = engine.engLines;
var opSpeed: MovieClip = engine.engine_arrows.oil_press_speed;
var opInt: int = 125/30;
var tnInt: int = 160/60;
var firstTime: Number = 19;


tn.stop(); // stops torque counter at frame 1
op.stop(); // stops oil pressure counter at frame 1

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
	if (currentFrame == 1){
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
		if (op.currentFrame < 30){
			op.nextFrame();
		}
	}
	if (currentFrame == 4 && tn.currentFrame < 47) {
		tn.nextFrame();
	}
	if (currentFrame == 4){
		op.oNumber.text == 100;
	}
	// END Number Counters
	
	
	// START oil pressure arrow speed
	if(currentFrame == 2){
		engine.engine_arrows.stop();
		opSpeed.stop();
	} else {
		engine.engine_arrows.play();
		opSpeed.play();
	}
	if(currentFrame >= 3 && opSpeed.currentLabel == "regEnd"){
		opSpeed.gotoAndPlay("regular speed");
	}
	if (currentFrame == 4 && opSpeed.currentFrame == opSpeed.totalFrames){
		opSpeed.gotoAndPlay("faster speed");
	}
	// END oil pressure arrow speed
	
	
	// START engine lines
	el.stop();
	if(currentFrame >= 3){
		el.play();
	}
	// END engine lines
	
} // close function