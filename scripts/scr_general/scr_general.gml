///General stuff
randomize();

function Init() {
	global.partyPC = [ //PC Party members
		{
			name : "Larry",
			class : "Fighter",
			hp : 35,
			ss : [3],
			ac : 16,
			
			spr : 0,
			desc : "Heir to the Sprinklton throne sought\nby a rival assassin clan, he seeks\nvengeance and the truth for the death\nof his family.",
			
			weap : "Gauntlet",
			atk: 7,
			spatk: 5,
			dmg: 5,
			
			spellsA : [["Acid Splash"],
				["Silent Im."]],
			spellsBA : [["None"],
				["False Life"]]
		},
		{
			name : "Tordan",
			class : "Barbarian",
			hp : 52,
			ss : [0],
			spr : 1,
			desc : "An ex-sailor seeking a life of\nadventure. Not much of his past is\nknown beyond that.",
			
			weap : "Battleaxe",
			atk: 8,
			spatk: 0,
			dmg: 6,
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Foster",
			class : "Cleric",
			hp : 32,
			ss : [4,3],
			spr : 2,
			desc : "Teacher of healing arts turned\nnecromancer, forced into hiding and\nreturning to life through his own\nteachings.",
			
			weap : "Scimitars",
			atk: 4,
			spatk: 7,
			dmg: 2,
			
			spellsA : [["Sacred Flame","Thaumaturgy"],
				["Cure Wounds","Guiding Bolt"],
				["Spiritual W."]],
			spellsBA : [["None"],
				["None"],
				["None"]]
		},
		{
			name : "Glee",
			class : "Bard",
			hp : 33,
			ss : [4,3],
			spr : 3,
			desc : "Persued by wisps of her past life, she\nis constantly on the run, not making\nlasting friendships but is kind-\nhearted.",
			
			weap : "Rapier",
			atk: 4,
			spatk: 6,
			dmg: 2,
			
			spellsA : [["V. Mockery"],
				["Cure Wounds","Thunder Wave"]],
			spellsBA : [["None"],
				["None"]]
		},
		{
			name : "Rhogar",
			class : "Paladin",
			hp : 32,
			ss : [3],
			
			spr : 4,
			desc : "A dark past, for which he will never\nforget, sets out in an act of\nvengeance, though not himself but for\nthe ones hes lost.",
			
			weap : "Warhammer",
			atk: 5,
			spatk: 0,
			dmg: 3,
			
			spellsA : [["None"],
				["None"]],
			spellsBA : [["None"],
				["Div. Smite"]]
		},
		{
			name : "Fenris",
			class : "Artificer",
			hp : 27,
			ss : [3],
			ac : 16,
			
			spr : 5,
			desc : "A witty and charming craftsman who\nstrives to rid himself of his past\ndeeds as he develops his skills.",
			
			weap : "Crossbow",
			atk: 5,
			spatk: 7,
			dmg: 3,
			
			spellsA : [["Fire Bolt"],
				["Faerie Fire","Ray of Sick."]],
			spellsBA : [["None"],
				["Exp. Retreat","Heal. Word"]]
		}
	]
	
	global.partyNPC = [ //NPC Party members
		{
			name : "Lloyd",
			class : "Wizard",
			hp : 35,
			ss : [4,3,3,3,2],
			spr : 0,
			desc : "A creation of Hades once in servitude\nto Thio the Strong Man, he now lives a\nlife of his own and serves no-one.",
			weap : "None",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Lilly",
			class : "Fighter",
			hp : 82,
			ss : [0],
			spr : 1,
			desc : "A sentient plant confident in her\nabilities who tends to copy the\nactions and mannerisms of those\naround her.",
			weap : "Greatsword",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Doot",
			class : "Cleric",
			hp : 100,
			ss : [4,3,3,3,2,1,1,1],
			spr : 2,
			desc : "A perveyor of knowledge brought back\nto life by an unknown force, he has\nbecome well known throughout the\nland.",
			weap : "Crossbow",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Tark",
			class : "Paladin",
			hp : 125,
			ss : [4,3,2],
			spr : 3,
			desc : "A reanimated suit of armor who has\nlearned much of the world of magic\nthrough his time in the Necromancer's\nCastle.",
			weap : "Battleaxe",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Huey",
			class : "Beast",
			hp : 42,
			ss : [0],
			spr : 4,
			desc : "Saved from death in the Tree of\nImpurity, he has become a faithful\nally, mostly loyal to Foster.",
			weap : "Fangs",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Valerie",
			class : "Monk",
			hp : 66,
			ss : [0],
			spr : 5,
			desc : "Separated from her tribe during a\nraid of the party's wagon, the\nstubborn master of Ki is now in good\ncompany.",
			weap : "Quarterstaff",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		},
		{
			name : "Fledge",
			class : "Druid",
			hp : 31,
			ss : [4,3,2],
			spr : 6,
			desc : "Isolated for most of his life, he is\nattuned to nature and wishes to see\nthe world once more.",
			weap : "Wood Staff",
			
			spellsA : [["None"],["None"]],
			spellsBA : [["None"],["None"]]
		}
	]
}

function totalSS(character) {
	var ss = 0;
	for (var i = 0; i<array_length(character.ss); i++) {
		ss += character.ss[i];
	}
	return ss;
}

function weapGetType(weap) {
	var type;
	switch weap {
		case "Scimitars":
		case "Gauntlet":
		case "Rapier":
		case "Battleaxe":
		case "Warhammer":
			type = "Melee";
			break;
		case "Crossbow":
		case "Shortbow":
		case "Longbow":
			type = "Ranged";
	}
	return type;
}

function weapGetDmgDie(weap) {
	var die;
	switch weap {
		case "Daggers":
			die = 4;
		case "Scimitars":
		case "Fangs":
			die = 6;
			break;
		case "Crossbow":
		case "Gauntlet":
		case "Rapier":
			die = 8;
			break;
		case "Battleaxe":
		case "Warhammer":
			die = 10;
	}
	return die;
}

function weapGetDmgType(weap) {
	var type;
	switch weap {
		case "Gauntlet":
		case "Warhammer":
			type = dt_bludgeoning;
			break;
		case "Scimitars":
		case "Battleaxe":
			type = dt_slashing;
			break;
		case "Daggers":
		case "Fangs":
		case "Crossbow":
		case "Rapier":
			type = dt_piercing;
			break;
	}
	return type;
}

function dmgTypeToString(type) {
	var t = "something";
	switch type {
		case dt_bludgeoning:
			t = "bludgeoning";
			break;
		case dt_slashing:
			t = "slashing";
			break;
		case dt_piercing:
			t = "piercing";
			break;
		case dt_fire:
			t = "bludgeoning";
			break;
		case dt_acid:
			t = "bludgeoning";
			break;
		case dt_cold:
			t = "bludgeoning";
			break;
		case dt_lightning:
			t = "bludgeoning";
			break;
		case dt_thunder:
			t = "bludgeoning";
			break;
		case dt_poison:
			t = "bludgeoning";
			break;
		case dt_necrotic:
			t = "bludgeoning";
			break;
		case dt_radiant:
			t = "bludgeoning";
			break;
		case dt_force:
			t = "bludgeoning";
			break;
	}
	return t;
}

Init();