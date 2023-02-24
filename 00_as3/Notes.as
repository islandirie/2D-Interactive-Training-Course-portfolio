/*
Original code by Casey --- 10/18/2017

Purpose:
These actions are related to the Notes that should be put into all animated schematics.
The purpose is to guide the student/instructor on what buttons on a cockpit to press to
jump to the next animation sequence. It can also give a brief explanation on where they 
are at in the animation.

Technical:
- name of movieclip is "notesMC", internal objects include "textInput", "noteBox" and "notesArrow"
*/

//------ Add Shadow for Notes --------------------------
var tfShadow: DropShadowFilter = new DropShadowFilter();
tfShadow.color = 0x777777;
tfShadow.alpha = .5;
tfShadow.blurX = .3;
tfShadow.blurY = .3;
tfShadow.quality = BitmapFilterQuality.HIGH;

notesMC.filters = [tfShadow];

//------ SetUp Tween Section ---------------------------
var myTween: Tween = new Tween(notesMC, "y", Elastic.easeOut, 720, 720 + notesMC.notesBox.height, .5, true);
var arrowUp:Boolean;

notesMC.addEventListener(MouseEvent.CLICK, tweenClick);
function tweenClick(e: MouseEvent): void {
	myTween.yoyo();
	
	if(arrowUp){
		notesMC.notesArrow.rotation = 180;
		arrowUp = !arrowUp;
		notesMC.notesBox.visible = false;
	} else {
		notesMC.notesArrow.rotation = 0;
		arrowUp = !arrowUp;
		notesMC.notesBox.visible = true;
	}
}
