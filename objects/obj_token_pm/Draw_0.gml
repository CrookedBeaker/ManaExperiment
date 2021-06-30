/// @description Draw your stuff

if actionTaking = 0 { //Draw some places you can go!
	draw_sprite(spr_step,0,moveOrigin[0],moveOrigin[1]);
	
	for (var i = 1; i <= move-movedTurn; i++) {
		var dY = -i*16;
		var dX = 0;
		while (dY != i*16+16) {
			if !place_meeting(moveOrigin[0]-dX,moveOrigin[1]+dY,obj_solid) draw_sprite(spr_step,0,moveOrigin[0]-dX,moveOrigin[1]+dY);
			if !place_meeting(moveOrigin[0]+dX,moveOrigin[1]+dY,obj_solid) draw_sprite(spr_step,0,moveOrigin[0]+dX,moveOrigin[1]+dY);
			dY += 16;
			dX += (dY > 0) ? 16 : -16;
		}
	}
}

draw_self();
//draw_text(x,y,string(instance_exists(obj_menu_battle)));