import flash.events.Event;
import flash.display.MovieClip;

//Code created by: --- 7/21/16
//Code modified and created by: --- Gove 7/25/16


//stops the file from playing thru
stop();

//true false variables
//airconditioning
var FAM_AC_CF_NormOp_Swf: Boolean = false;
var FAM_AC_NormOp_Swf: Boolean = false;
var FAM_AC_Defog_NormOp_Swf: Boolean = false;
var FAM_AC_Temp_NormOp_Swf: Boolean = false;
var FAM_AC_Press_NormOp_Swf: Boolean = false;
var MM_AC_CF_NormOp_Swf: Boolean = false;
var MM_AC_NormOp_Swf: Boolean = false;
var MM_AC_Defog_NormOp_Swf: Boolean = false;
var MM_AC_Temp_NormOp_Swf: Boolean = false;
var MM_AC_Press_NormOp_Swf: Boolean = false;

//Electrical
var FAM_DC_BattNormDist_Swf: Boolean = false;
var FAM_DC_ExPwrNormDist_Swf: Boolean = false;
var FAM_DC_GenNormDist_Swf: Boolean = false;
var MM_DC_BattNormDist_Swf: Boolean = false;
var MM_DC_ExPwrNormDist_Swf: Boolean = false;
var MM_DC_GenNormDist_Swf: Boolean = false;
var MM_DC_AuxBatDist_Swf: Boolean = false;

//Fuel
var FAM_Fuel_NormDist_Swf: Boolean = false;
var MM_Fuel_NormDist_Swf: Boolean = false;

//Hydraulic
var FAM_Hydro_NormDist_Swf: Boolean = false;
var MM_Hydro_NormDist_Swf: Boolean = false;

//Landing Gear
var FAM_LG_NormMech_Swf: Boolean = false;
var FAM_LG_Brakes_NormOp_Swf: Boolean = false;
var FAM_LG_NWS_NormOp_Swf: Boolean = false;
var MM_LG_NormalOp_Swf: Boolean = false;

//Oxygen
var FAM_OBOGS_NormMech_Swf: Boolean = false;

//Propeller
var FAM_PROP_NormMech_Swf: Boolean = false;
var MM_PROP_NormMech_Swf: Boolean = false;

//Engine
var FAM_ENG_NormMech_Swf: Boolean = false;

//Engine Fuel
var FAM_ENGFUEL_NormMech_Swf: Boolean = false;
var MM_ENGFUEL_NormOp_Swf: Boolean = false;

//Engine Oil 
var FAM_ENGOIL_NormMech_Swf: Boolean = false;

//Communications
var FAM_COMM_UHF_NormOp_Swf: Boolean = false;

//Navigation
var FAM_NAV_Pitot_NormDist_Swf: Boolean = false;
var FAM_NAV_FlightEnv_NormOp_Swf: Boolean = false;
var FAM_NAV_AttDirect_NormOp_Swf: Boolean = false;
var FAM_NAV_VHF_NormOp_Swf: Boolean = false;
var FAM_NAV_DME_NormOp_Swf: Boolean = false;
var MM_NAV_Pitot_NormDist_Swf: Boolean = false;
var MM_NAV_FlightEnv_NormOp_Swf: Boolean = false;
var MM_NAV_AttDirect_NormOp_Swf: Boolean = false;
var MM_NAV_VHF_NormOp_Swf: Boolean = false;
var MM_NAV_DME_NormOp_Swf: Boolean = false;

//Egress
var FAM_EGRESS_Eject_Swf: Boolean = false;
var MM_EGRESS_Canopy_Swf: Boolean = false;
var MM_EGRESS_EjectSGF_Swf: Boolean = false;

//set the font size for the comboboxes
var tf: TextFormat = new TextFormat();
tf.size = 14;

//apply font size to all comboboxes
CB_Sys.textField.setStyle("textFormat", tf);
CB_Sys.dropdown.setRendererStyle("textFormat", tf);
CB_Sys.rowCount = 15;

AC_Lvl_Sys.AC_Sys_FAM.textField.setStyle("textFormat", tf);
AC_Lvl_Sys.AC_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

AC_Lvl_Sys.AC_Sys_MM.textField.setStyle("textFormat", tf);
AC_Lvl_Sys.AC_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

EP_Lvl_Sys.EP_Sys_FAM.textField.setStyle("textFormat", tf);
EP_Lvl_Sys.EP_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

EP_Lvl_Sys.EP_Sys_MM.textField.setStyle("textFormat", tf);
EP_Lvl_Sys.EP_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

FUEL_Lvl_Sys.FUEL_Sys_FAM.textField.setStyle("textFormat", tf);
FUEL_Lvl_Sys.FUEL_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

FUEL_Lvl_Sys.FUEL_Sys_MM.textField.setStyle("textFormat", tf);
FUEL_Lvl_Sys.FUEL_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

HYDRO_Lvl_Sys.HYDRO_Sys_FAM.textField.setStyle("textFormat", tf);
HYDRO_Lvl_Sys.HYDRO_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

HYDRO_Lvl_Sys.HYDRO_Sys_MM.textField.setStyle("textFormat", tf);
HYDRO_Lvl_Sys.HYDRO_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

LG_Lvl_Sys.LG_Sys_FAM.textField.setStyle("textFormat", tf);
LG_Lvl_Sys.LG_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

LG_Lvl_Sys.LG_Sys_MM.textField.setStyle("textFormat", tf);
LG_Lvl_Sys.LG_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

OXY_Lvl_Sys.OXY_Sys_FAM.textField.setStyle("textFormat", tf);
OXY_Lvl_Sys.OXY_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

PROP_Lvl_Sys.PROP_Sys_FAM.textField.setStyle("textFormat", tf);
PROP_Lvl_Sys.PROP_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

PROP_Lvl_Sys.PROP_Sys_MM.textField.setStyle("textFormat", tf);
PROP_Lvl_Sys.PROP_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

ENG_Lvl_Sys.ENG_Sys_FAM.textField.setStyle("textFormat", tf);
ENG_Lvl_Sys.ENG_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

ENGFUEL_Lvl_Sys.ENGFUEL_Sys_FAM.textField.setStyle("textFormat", tf);
ENGFUEL_Lvl_Sys.ENGFUEL_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

ENGFUEL_Lvl_Sys.ENGFUEL_Sys_MM.textField.setStyle("textFormat", tf);
ENGFUEL_Lvl_Sys.ENGFUEL_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

ENGOIL_Lvl_Sys.ENGOIL_Sys_FAM.textField.setStyle("textFormat", tf);
ENGOIL_Lvl_Sys.ENGOIL_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

COMM_Lvl_Sys.COMM_Sys_FAM.textField.setStyle("textFormat", tf);
COMM_Lvl_Sys.COMM_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

NAV_Lvl_Sys.NAV_Sys_FAM.textField.setStyle("textFormat", tf);
NAV_Lvl_Sys.NAV_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

NAV_Lvl_Sys.NAV_Sys_MM.textField.setStyle("textFormat", tf);
NAV_Lvl_Sys.NAV_Sys_MM.dropdown.setRendererStyle("textFormat", tf);

EGRESS_Lvl_Sys.EGRESS_Sys_FAM.textField.setStyle("textFormat", tf);
EGRESS_Lvl_Sys.EGRESS_Sys_FAM.dropdown.setRendererStyle("textFormat", tf);

EGRESS_Lvl_Sys.EGRESS_Sys_MM.textField.setStyle("textFormat", tf);
EGRESS_Lvl_Sys.EGRESS_Sys_MM.dropdown.setRendererStyle("textFormat", tf);


//set all FAM/MM Lvl_Sys's to invisible until the system is chosen
AC_Lvl_Sys.visible = false;
EP_Lvl_Sys.visible = false;
FUEL_Lvl_Sys.visible = false;
HYDRO_Lvl_Sys.visible = false;
LG_Lvl_Sys.visible = false;
OXY_Lvl_Sys.visible = false;
PROP_Lvl_Sys.visible = false;
ENG_Lvl_Sys.visible = false;
ENGFUEL_Lvl_Sys.visible = false;
ENGOIL_Lvl_Sys.visible = false;
COMM_Lvl_Sys.visible = false;
NAV_Lvl_Sys.visible = false;
EGRESS_Lvl_Sys.visible = false;

//add combo box labels for SYSTEM

CB_Sys.addItem({
	label: "Choose a System"
});

function CB_Sys_subList(): void {
	CB_Sys.addItem({
		label: "Choose a System"
	});
	CB_Sys.addItem({
		label: "21 - Air Conditioning"
	});
	CB_Sys.addItem({
		label: "23 - Communications"
	});
	CB_Sys.addItem({
		label: "24 - Electrical Power"
	});
	CB_Sys.addItem({
		label: "28 - Fuel System"
	});
	CB_Sys.addItem({
		label: "29 - Hydraulic System"
	});
	CB_Sys.addItem({
		label: "32 - Landing Gear"
	});
	CB_Sys.addItem({
		label: "34 - Navigation"
	});
	CB_Sys.addItem({
		label: "35 - Oxygen"
	});
	CB_Sys.addItem({
		label: "61 - Propeller"
	});
	CB_Sys.addItem({
		label: "72 - Engine"
	});
	CB_Sys.addItem({
		label: "73 - Engine Fuel"
	});
	CB_Sys.addItem({
		label: "79 - Engine Oil"
	});
	CB_Sys.addItem({
		label: "95 - Egress Systems"
	});
}


CB_Sys.addEventListener(MouseEvent.CLICK, SysClick);
function SysClick(event: MouseEvent): void {
	CB_Sys.removeAll();
	CB_Sys_subList();
}



CB_Sys.addEventListener(Event.CHANGE, SysChosen);

function SysChosen(e: Event): void {
	showLvl(e.currentTarget.selectedItem.numChildren);
}

function showLvl(str: String): void {
	switch (str) {
		case "21 - Air Conditioning":
			AC_Lvl_Sys.visible = true;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "23 - Communications":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = true;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "24 - Electrical Power":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = true;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "28 - Fuel System":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = true;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "29 - Hydraulic System":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = true;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "32 - Landing Gear":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = true;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "34 - Navigation":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = true;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "35 - Oxygen":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = true;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "61 - Propeller":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = true;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "72 - Engine":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = true;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "73 - Engine Fuel":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = true;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "79 - Engine Oil":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = true;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = false;
			break;
		case "95 - Egress Systems":
			AC_Lvl_Sys.visible = false;
			EP_Lvl_Sys.visible = false;
			FUEL_Lvl_Sys.visible = false;
			HYDRO_Lvl_Sys.visible = false;
			LG_Lvl_Sys.visible = false;
			OXY_Lvl_Sys.visible = false;
			PROP_Lvl_Sys.visible = false;
			ENG_Lvl_Sys.visible = false;
			ENGFUEL_Lvl_Sys.visible = false;
			ENGOIL_Lvl_Sys.visible = false;
			COMM_Lvl_Sys.visible = false;
			NAV_Lvl_Sys.visible = false;
			EGRESS_Lvl_Sys.visible = true;
			break;
	}
}



//function AC_Sys_FAM_List()
//function AC_Sys_MM_List()


//what to do when a label is selected from SYSTEM dropdown
/*CB_Sys.addEventListener(Event.CHANGE, SysChoose);

function SysChoose(event: Event): void {
	if (CB_Sys.selectedItem.label == "Air Conditioning") {
		AC_Lvl_Sys.visible = true;
		EP_Lvl_Sys.visible = false;
	} else if (CB_Sys.selectedItem.label == "Electrical Power") {
		AC_Lvl_Sys.visible = false;
		EP_Lvl_Sys.visible = true;
	}
};*/