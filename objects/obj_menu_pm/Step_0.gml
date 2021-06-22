/// @description Move around and select party members

if !instance_exists(obj_menu_pm_view) {

//Scroll
if keyboard_check_pressed(vk_right) {index++};
if keyboard_check_pressed(vk_left) {index--};
if keyboard_check_pressed(vk_down) {index+=2};
if keyboard_check_pressed(vk_up) {index-=2};

if (index >= array_length(list)) {index -= array_length(list)};
if (index < 0) {index += array_length(list)};

//Position based on index
x = (index%2)*128+8;
y = floor((index%6)/2)*64+40;

//Go back!
if keyboard_check_pressed(ord("X")) {room_goto(rm_title_menu)};

//Select!
if keyboard_check_pressed(ord("Z")) && !cancelInput {
	var inst = instance_create_depth(32,240,depth-1,obj_menu_pm_view)
	inst.character = list[index];
};

cancelInput = false;
} else {
	cancelInput = true;
}