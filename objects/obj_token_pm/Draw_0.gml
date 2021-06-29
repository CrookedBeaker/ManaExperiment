/// @description Draw your stuff

if moving { //Draw some places you can go!
	draw_set_color(c_white);
	draw_rectangle(moveOrigin[0],moveOrigin[1],moveOrigin[0]+16,moveOrigin[1]+16,false);
	
	for (var i = 1; i <= move-movedTurn; i++) {
		var dY = -i*16;
		var dX = 0;
		while (dY != i*16+16) {
			draw_rectangle(moveOrigin[0]-dX,moveOrigin[1]+dY,moveOrigin[0]-dX+16,moveOrigin[1]+dY+16,false);
			draw_rectangle(moveOrigin[0]+dX,moveOrigin[1]+dY,moveOrigin[0]+dX+16,moveOrigin[1]+dY+16,false);
			dY += 16;
			dX += (dY > 0) ? 16 : -16;
		}
	}
}

draw_self();
//draw_text(x,y,string(instance_exists(obj_menu_battle)));