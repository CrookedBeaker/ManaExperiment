/// @description Keep it rolling!

for (var i=0; i<number+sign(adv); i++) {
	val[i] = irandom_range(1,sides);
}

total = 0;
if (adv == dr_adv) {
	total = max(val[0],val[1]);
} else if (adv == dr_disadv) {
	total = min(val[0],val[1]);
} else {
	for (var i=0; i<array_length(val); i++) {
		total += val[i];
	}
}
total += amod;

rolls--;
if (rolls != 0) {
	alarm[0] = 8;
} else {
	rolls = 8;
	alarm[1] = 120; //Hold before going back
}