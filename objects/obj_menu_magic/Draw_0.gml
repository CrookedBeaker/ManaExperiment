/// @description Draw spell descriptions!
//draw_text(16,80,string(hide));
if (variable_instance_exists(id,"buttons") && array_length(buttons) != 0){
if hide {

	var s = "";
	
switch buttons[array_length(buttons)-index-1].label {
	//Cantrips
	case "Acid Splash":
		s = "Acid Splash\nConjuration cantrip\n\nDoes acid damage at a range on\na failed DEX save.";
		break;
	case "Fire Bolt":
		s = "Fire Bolt\nEvocation cantrip\n\nA ranged attack that does fire\ndamage.";
		break;
	case "Sacred Flame":
		s = "Sacred Flame\nEvocation cantrip\n\nDoes radiant damage at a range on\na failed DEX save.";
		break;
	case "Thaumaturgy":
		s = "Thaumaturgy\nTransmutation cantrip\n\nMakes the caster's voice much louder\nwhen used to imtimidate foes.";
		break;
	case "V. Mockery":
		s = "Vicious Mockery\nEnchantment cantrip\n\nDoes psychic damage at a range and\nputs the target's next attack at\ndisadvantage on a failed WIS save.";
		break;
		
	//Level 1
	case "Cure Wounds":
		s = "Cure Wounds\nEvocation lv. 1\n\nThe caster touches a creature and\nrestores hit points based on their\nspellcasting ability.";
		break;
	case "Div. Smite":
		s = "Divine Smite\nPaladin feature\n\nAdds extra radiant damage to the next\nmelee weapon attack.";
		break;
	case "Exp. Retreat":
		s = "Expeditious Retreat\nTransmutaion lv. 1\nConcentration required\n\nThe caster can dash as a bonus\naction and upon casting.";
		break;
	case "Faerie Fire":
		s = "Faerie Fire\nEvocation lv. 1\nConcentration required\n\nEveryone in a 4x4 square is covered\nin light on a failed DEX save.\nIlluminated creatures are easier to\nhit.";
		break;
	case "False Life":
		s = "False Life\nNecromancy lv. 1\n\nGrants a few temporary hit points to\nthe caster.";
		break;
	case "Guiding Bolt":
		s = "Guiding Bolt\nEvocation lv. 1\n\nA ranged attack that does radiant\ndamage and illuminates the target.\nIlluminated creatures are easier to\nhit.";
		break;
	case "Heal. Word":
		s = "Healing Word\nEvocation lv. 1\n\nRestores a few hit points at a range\nbased on the caster's ability.";
		break;
	case "Silent Im.":
		s = "Silent Image\nIllusion lv. 1\nConcentration required\n\nIn combat, it can create an illusory\nclone of the caster.";
		break;
	case "Thunder Wave":
		s = "Thunder Wave\nEvocation lv. 1\n\nEveryone in a 3x3 square near the\ncaster is pushed 2 squares away and\ntakes thunder damage on a failed CON\nsave.";
		break;
	case "Ray of Sick.":
		s = "Ray of Sickness\nNecromancy lv. 1\n\nA ranged attack that does poison\ndamage, poisoning the target on a\nfailed CON save.";
		break;
}

draw_set_font(fnt_main_bold);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(16,112,s);

} else {//Draw the top bar if not hidden
	draw_set_font(fnt_main_bold);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_color(make_color_rgb(117,33,148));
	draw_sprite(spr_magicuihead,0,x,y-16*(array_length(buttons)+1));
	draw_text(x+25,y-16*(array_length(buttons)+1)+6,string(menuID)); //Level
	
	draw_set_color(make_color_rgb(56,55,188));
	var slots = (menuID == 0) ? "X" : string(character.ss[menuID-1]);
	draw_text(x+62,y-16*(array_length(buttons)+1)+6,slots); //Spell slots
}

}
