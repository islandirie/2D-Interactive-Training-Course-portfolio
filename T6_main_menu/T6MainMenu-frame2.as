//var swf: MovieClip;
var swfLoader: Loader = new Loader();
var swfFile: URLRequest;


//setting font size for menu button (same variable used for combobox font size)
BtnMenu.setStyle("textFormat", tf);



// -----THIS IS WHERE TO ADD SWF LINKS----- chooses which swf to play based on which variable is shown as true. add "else if" statement for each additional swf


switch (true) {

	//Airconditioning
	case (FAM_AC_CF_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/FAM_AC_CF_NormalOp.swf");
		break;
		FAM_AC_CF_NormalOp.swf
	
	case (FAM_AC_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/FAM_AC_NormalOp.swf");
		break;
		FAM_AC_NormalOp.swf

	case (FAM_AC_Defog_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/FAM_AC_Defog_NormalOp.swf");
		break;
		FAM_AC_Defog_NormalOp.swf

	case (FAM_AC_Temp_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/FAM_AC_Temp_NormalOp.swf");
		break;
		FAM_AC_Temp_NormalOp.swf

	case (FAM_AC_Press_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/FAM_AC_Press_NormalOp.swf");
		break;
		FAM_AC_Press_NormalOp.swf

	case (MM_AC_CF_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/MM_AC_CF_NormalOp.swf");
		break;
		MM_AC_CF_NormalOp.swf

	case (MM_AC_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/MM_AC_NormalOp.swf");
		break;
		MM_AC_NormalOp.swf

	case (MM_AC_Defog_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/MM_AC_Defog_NormalOp.swf");
		break;
		MM_AC_Defog_NormalOp.swf

	case (MM_AC_Temp_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/MM_AC_Temp_NormalOp.swf");
		break;
		MM_AC_Temp_NormalOp.swf

	case (MM_AC_Press_NormOp_Swf):
		swfFile = new URLRequest("../01_air_conditioning/MM_AC_Press_NormalOp.swf");
		break;
		MM_AC_Press_NormalOp.swf



		//Electrical Power
	case (FAM_DC_BattNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/FAM_EP_DC_BattNormDist.swf");
		break;
		//FAM_EP_DC_BattNormDist.swf
	
	case (FAM_DC_ExPwrNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/FAM_EP_DC_ExPwrNormDist.swf");
		break;
		//FAM_EP_DC_BattNormDist.swf
	
	case (FAM_DC_GenNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/FAM_EP_DC_GenNormDist.swf");
		break;

	case (MM_DC_BattNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/MM_EP_DC_BattNormDist.swf");
		break;
		//MM_EP_DC_BattNormDist.swf
	
	case (MM_DC_ExPwrNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/MM_EP_DC_ExPwrNormDist.swf");
		break;
	
	case (MM_DC_GenNormDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/MM_EP_DC_GenNormDist.swf");
		break;
	
	case (MM_DC_AuxBatDist_Swf):
		swfFile = new URLRequest("../02_electrical_power/MM_EP_DC_AuxBatDist.swf");
		break;



		//Fuel System
	case (FAM_Fuel_NormDist_Swf):
		swfFile = new URLRequest("../03_fuel/FAM_Fuel_NormDist.swf");
		break;
		FAM_Fuel_NormDist.swf

	case (MM_Fuel_NormDist_Swf):
		swfFile = new URLRequest("../03_fuel/MM_Fuel_NormDist.swf");
		break;
		MM_Fuel_NormDist.swf


		//Hydraulic System
	case (FAM_Hydro_NormDist_Swf):
		swfFile = new URLRequest("../04_hydraulic/FAM_Hydro_NormDist.swf");
		break;
		FAM_Hydro_NormDist.swf

	case (MM_Hydro_NormDist_Swf):
		swfFile = new URLRequest("../04_hydraulic/MM_Hydro_NormDist.swf");
		break;
		MM_Hydro_NormDist.swf



		//Landing Gear
	case (FAM_LG_NormMech_Swf):
		swfFile = new URLRequest("../05_landing_gear/FAM_LG_NormMech.swf");
		break;
		FAM_LG_NormMech.swf

	case (FAM_LG_Brakes_NormOp_Swf):
		swfFile = new URLRequest("../05_landing_gear/FAM_LG_Brakes_NormOp.swf");
		break;
		FAM_LG_Brakes_NormOp.swf

	case (FAM_LG_NWS_NormOp_Swf):
		swfFile = new URLRequest("../05_landing_gear/FAM_LG_NWS_NormOp.swf");
		break;
		FAM_LG_NWS_NormOp.swf

	case (MM_LG_NormalOp_Swf):
		swfFile = new URLRequest("../05_landing_gear/MM_LG_NormalOp.swf");
		break;
		MM_LG_NormalOp.swf

		//Oxygen
	case (FAM_OBOGS_NormMech_Swf):
		swfFile = new URLRequest("../06_oxygen/FAM_OBOGS_NormMech.swf");
		break;
		FAM_OBOGS_NormMech.swf

		//Propeller
	case (FAM_PROP_NormMech_Swf):
		swfFile = new URLRequest("../07_propeller/FAM_PROP_NormMech.swf");
		break;
		FAM_PROP_NormMech.swf

	case (MM_PROP_NormMech_Swf):
		swfFile = new URLRequest("../07_propeller/MM_PROP_NormMech.swf");
		break;
		MM_PROP_NormMech.swf

		//Engine
	case (FAM_ENG_NormMech_Swf):
		swfFile = new URLRequest("../08_engine/FAM_ENG_NormMech.swf");
		break;
		FAM_ENG_NormMech.swf

		//Engine Fuel
	case (FAM_ENGFUEL_NormMech_Swf):
		swfFile = new URLRequest("../09_engine_fuel/FAM_ENGFUEL_NormMech.swf");
		break;
		FAM_ENGFUEL_NormMech.swf

	case (MM_ENGFUEL_NormOp_Swf):
		swfFile = new URLRequest("../09_engine_fuel/MM_ENGFUEL_NormOp.swf");
		break;
		MM_ENGFUEL_NormOp.swf

		//Engine Oil
	case (FAM_ENGOIL_NormMech_Swf):
		swfFile = new URLRequest("../10_engine_oil/FAM_ENGOIL_NormMech.swf");
		break;
		FAM_ENGOIL_NormMech.swf

		//Communications
	case (FAM_COMM_UHF_NormOp_Swf):
		swfFile = new URLRequest("../11_communications/FAM_COMM_UHF_NormOp.swf");
		break;
		FAM_COMM_UHF_NormOp.swf

		//Navigation
	case (FAM_NAV_Pitot_NormDist_Swf):
		swfFile = new URLRequest("../12_navigation/FAM_NAV_Pitot_NormDist.swf");
		break;
		FAM_NAV_Pitot_NormDist.swf	

	case (FAM_NAV_FlightEnv_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/FAM_NAV_FlightEnv_NormOp.swf");
		break;
		FAM_NAV_FlightEnv_NormOp.swf	

	case (FAM_NAV_AttDirect_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/FAM_NAV_AttDirect_NormOp.swf");
		break;
		FAM_NAV_AttDirect_NormOp.swf	

	case (FAM_NAV_VHF_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/FAM_NAV_VHF_NormOp.swf");
		break;
		FAM_NAV_VHF_NormOp.swf	

	case (FAM_NAV_DME_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/FAM_NAV_DME_NormOp.swf");
		break;
		FAM_NAV_DME_NormOp.swf	
	
	case (MM_NAV_Pitot_NormDist_Swf):
		swfFile = new URLRequest("../12_navigation/MM_NAV_Pitot_NormDist.swf");
		break;
		MM_NAV_Pitot_NormDist.swf	

	case (MM_NAV_FlightEnv_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/MM_NAV_FlightEnv_NormOp.swf");
		break;
		MM_NAV_FlightEnv_NormOp.swf	

	case (MM_NAV_AttDirect_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/MM_NAV_AttDirect_NormOp.swf");
		break;
		MM_NAV_AttDirect_NormOp.swf	

	case (MM_NAV_VHF_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/MM_NAV_VHF_NormOp.swf");
		break;
		MM_NAV_VHF_NormOp.swf	

	case (MM_NAV_DME_NormOp_Swf):
		swfFile = new URLRequest("../12_navigation/MM_NAV_DME_NormOp.swf");
		break;
		MM_NAV_DME_NormOp.swf	
	
		//Egress Systems
	case (FAM_EGRESS_Eject_Swf):
		swfFile = new URLRequest("../13_ejection_sequence/FAM_EGRESS_Eject.swf");
		break;
		FAM_EGRESS_Eject.swf
	
	case (MM_EGRESS_Canopy_Swf):
		swfFile = new URLRequest("../13_ejection_sequence/MM_EGRESS_Canopy.swf");
		break;
		MM_EGRESS_Canopy.swf

	case (MM_EGRESS_EjectSGF_Swf):
		swfFile = new URLRequest("../13_ejection_sequence/MM_EGRESS_EjectSGF.swf");
		break;
		MM_EGRESS_EjectSGF.swf
	
}

//this will load selected swf to stage
swfLoader.load(swfFile);
MC_SwfContainer.addChild(swfLoader);

//menu button control, removes loader and goes back to menu. all true/false variables will be set to false upon entering frame 1 again. 
BtnMenu.addEventListener(MouseEvent.CLICK, fl_BtnMenu);
function fl_BtnMenu(event: MouseEvent): void {

	MC_SwfContainer.removeChild(swfLoader);
	gotoAndStop("menu");
}

/*
if (FAM_CF_NormOp_Swf) {
	swfFile = new URLRequest("schematics/FAM_CF_NormalOp.swf");
	//trace("16 FAM");
} else if (MM_CF_NormOp_Swf) {
	swfFile = new URLRequest("schematics/MM_CF_NormalOp.swf");
	//trace("19 MM");
}




-----repeat the code below for every new swf. change out the true/false variable from the menu pg and .swf name-----

else if (CHANGE_VARIABLE) {
	swfFile = new URLRequest("schematics/CHANGE_NAME.swf");
}

*/


//-----------------------------------------