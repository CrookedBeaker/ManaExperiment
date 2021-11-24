/// @description Set up queued action interpretations
//Oh boy.
//Welp, nothing ventured, nothing gained.
//Let's do this shit.

//Add log entry
function log(msg) {
	ds_list_insert(log,0,msg);
	
	while ds_list_size(log) > 4 {
		ds_list_delete(log,4);
	}
}