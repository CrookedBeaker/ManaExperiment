/// @description Aaaaaand done.

global.lastRoll = total;

if instance_exists(obj_dm_queue) {
	obj_dm_queue.wait = false;
}

instance_destroy();