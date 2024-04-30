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

// Calculate jump
if (place_meeting(x, y + 1, obj_InvisibleWall)) and (key_jump)
{
	vsp = -jumpsp
}


/********
Collition 
********/
// Horazontal collition
if (place_meeting(x + hsp, y, obj_InvisibleWall))
{
	while (!place_meeting(x + sign(hsp), y, obj_InvisibleWall))
	 {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collition
if (place_meeting(x, y + vsp, obj_InvisibleWall))
{
	while (!place_meeting(x, y + sign(vsp), obj_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


/*********
Animation
*********/
if (!place_meeting(x, y + 1, obj_InvisibleWall))
{
	sprite_index = spr_Player_Air;
	image_speed = 0;
	if(vsp > 0) image_index = 1; else image_index = 0;
	
}
else
{
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_Player;
	}
	else
	{
		sprite_index = spr_Player_Walk;
	}
}

//fliping player
if(hsp != 0) image_xscale = sign(hsp);