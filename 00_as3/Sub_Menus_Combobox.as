import fl.controls.ComboBox;
import fl.data.DataProvider; 
import flash.net.navigateToURL;


var FamAC:Array = new Array(
	{label:"Cockpit Flow - Normal Operation", data:"../01_air_conditioning/FAM_AC_CF_NormalOp.swf" },
	{label:"Air Conditioning - Normal Operation", data:"blah"},
	{label:"Defog - Normal Operation", data:"blah"},
	{label:"Temperature - Normal Operation", data:"blah"},
	{label:"Pressurization - Normal Operation", data:"blah"}
	)
	
var FamAC_2:Array = new Array(
	{label:"Cockpit Flow"},
	{label:"Air Conditioning"},
	{label:"Defog"},
	{label:"Temperature"},
	{label:"Pressurization"},
	{label:"Cockpit Flow"},
	{label:"Air Conditioning"},
	{label:"Defog"},
	{label:"Temperature"},
	{label:"Pressurization"}
	)
	

// Creates ComboBox and includes function	
	var myCB:ComboBox = new ComboBox();
	myCB.prompt = "Air Conditioning"
	myCB.width = 200;
	myCB.x = 820;
	myCB.y = 108;
	myCB.open();
	
var swfLoader: Loader = new Loader();
var swfFile:URLRequest = new URLRequest;
	
/********this is where you put box to show, showBox(choose 1 from list above) **********/
	showBox(FamAC);

function showBox(sub:Array):void{
	var i:Number;
	for(i = 0; i < sub.length; i++){
		myCB.addItem(sub[i]);
	}
	addChild(myCB);
	myCB.addEventListener(Event.CHANGE, requestURL);
}
function requestURL(event:Event):void{
	swfFile.url = myCB.selectedItem.data;
	navigateToURL(swfFile);
	//use below if issues in other browsers, calls js properties
	//ExternalInterface.call("window.open", swfFile, "_blank");
	swfLoader.load(swfFile);
}
trace(FamAC[0].data);


/****** built from sample below *************
var sfUniversities:Array = new Array( 
    {label:"University of California, Berkeley",  
                data:"http://www.berkeley.edu/"}, 
    {label:"University of San Francisco",  
                data:"http://www.usfca.edu/"}, 
    {label:"San Francisco State University",  
                data:"http://www.sfsu.edu/"}, 
    {label:"California State University, East Bay",  
                data:"http://www.csuhayward.edu/"}, 
    {label:"Stanford University", data:"http://www.stanford.edu/"}, 
    {label:"University of Santa Clara", data:"http://www.scu.edu/"}, 
    {label:"San Jose State University", data:"http://www.sjsu.edu/"} 
); 
 
var aCb:ComboBox = new ComboBox(); 
aCb.dropdownWidth = 210; 
aCb.width = 200;  
aCb.move(150, 50); 
aCb.prompt = "San Francisco Area Universities"; 
aCb.dataProvider = new DataProvider(sfUniversities); 
aCb.addEventListener(Event.CHANGE, changeHandler); 
 
addChild(aCb); 
 
function changeHandler(event:Event):void { 
    var request:URLRequest = new URLRequest(); 
    request.url = ComboBox(event.target).selectedItem.data; 
    navigateToURL(request); 
    aCb.selectedIndex = -1; 
}
*****************/