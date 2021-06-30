///General stuff

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
			atk: 5,
			dmg: 3,
			
			spellsA : [["Acid Splash"],
				["Silent Im.","False Life"]],
			spellsBA : [["None"],
				["None"]]
		},
		{
			name : "Tordan",
			class : "Barbarian",
			hp : 52,
			ss : [0],
			spr : 1,
			desc : "An ex-sailor seeking a life of\nadventure. Not much of his past is\nknown beyond that.",
			weap : "Battleaxe"
		},
		{
			name : "Foster",
			class : "Cleric",
			hp : 32,
			ss : [4,3],
			spr : 2,
			desc : "Teacher of healing arts turned\nnecromancer, forced into hiding and\nreturning to life through his own\nteachings.",
			weap : "Scimitars"
		},
		{
			name : "Glee",
			class : "Bard",
			hp : 33,
			ss : [4,3],
			spr : 3,
			desc : "Persued by wisps of her past life, she\nis constantly on the run, not making\nlasting friendships but is kind-\nhearted.",
			weap : "Rapier",
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
			spellsA : [["None"],
				["???"]],
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
			dmg: 3,
			
			spellsA : [["Fire Bolt"],
				["Cure Wounds","Faerie Fire","Grease","Ray of Sick."]],
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
			weap : "None"
		},
		{
			name : "Lilly",
			class : "Fighter",
			hp : 82,
			ss : [0],
			spr : 1,
			desc : "A sentient plant confident in her\nabilities who tends to copy the\nactions and mannerisms of those\naround her.",
			weap : "Greatsword"
		},
		{
			name : "Doot",
			class : "Cleric",
			hp : 100,
			ss : [4,3,3,3,2,1,1,1],
			spr : 2,
			desc : "A perveyor of knowledge brought back\nto life by an unknown force, he has\nbecome well known throughout the\nland.",
			weap : "Crossbow"
		},
		{
			name : "Tark",
			class : "Paladin",
			hp : 125,
			ss : [4,3,2],
			spr : 3,
			desc : "A reanimated suit of armor who has\nlearned much of the world of magic\nthrough his time in the Necromancer's\nCastle.",
			weap : "Battleaxe"
		},
		{
			name : "Huey",
			class : "Beast",
			hp : 42,
			ss : [0],
			spr : 4,
			desc : "Saved from death in the Tree of\nImpurity, he has become a faithful\nally, mostly loyal to Foster.",
			weap : "Fangs"
		},
		{
			name : "Valerie",
			class : "Monk",
			hp : 66,
			ss : [0],
			spr : 5,
			desc : "Separated from her tribe during a\nraid of the party's wagon, the\nstubborn master of Ki is now in good\ncompany.",
			weap : "Quarterstaff"
		},
		{
			name : "Fledge",
			class : "Druid",
			hp : 31,
			ss : [4,3,2],
			spr : 6,
			desc : "Isolated for most of his life, he is\nattuned to nature and wishes to see\nthe world once more.",
			weap : "Wood Staff"
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

Init();