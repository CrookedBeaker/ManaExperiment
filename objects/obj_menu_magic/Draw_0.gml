/// @description Draw spell descriptions!
//draw_text(16,80,string(hide));
if (variable_instance_exists(id,"buttons") && array_length(buttons) != 0 && hide) {

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
		s = "Cure Wounds\nEvocation lv. 1\n\nRestores hit points based on the\ncaster's ability.";
		break;
	case "Div. Smite":
		s = "Divine Smite\nPaladin feature\n\nAdds extra radiant damage to the next\nmelee weapon attack.";
		break;
	case "Faerie Fire":
		s = "Faerie Fire\nEvocation lv. 1\n\nEveryone in a 4x4 square is covered in\nlight on a failed DEX save.\nIlluminated creatures are easier to hit.";
		break;
	case "Thunder Wave":
		s = "Thunder Wave\nEvocation lv. 1\n\nEveryone in a 3x3 square near the caseter\nis pushed 2 squares away and takes thunder\ndamage on a failed CON save.";
		break;
}

draw_set_font(fnt_main_bold);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(8,112,s);

}
