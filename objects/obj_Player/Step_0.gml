/// @desc


// Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
// Make variable hight jump
key_jump = keyboard_check_pressed(vk_space);


// Calculate movement
var _move = key_right - key_left;
hsp = _move * walksp;

vsp = vsp + grv;
y = y + vsp;


/* Collition */
// Horazontal collition
if (place_meeting(x + hsp, y, obj_InvisibleWall)){
	while (!place_meeting(x + sign(hsp), y, obj_InvisibleWall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collition
if (place_meeting(x, y - vsp, obj_InvisibleWall))
{
	while (!place_meeting(x, y + sign(vsp), obj_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;