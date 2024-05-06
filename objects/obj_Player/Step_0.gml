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
// In the air
if (!place_meeting(x, y + 1, obj_InvisibleWall))
{
	sprite_index = spr_Clyde_jump_strip3;
	image_speed = 0;

	// Jumping up?
	if (vsp < -2)
	{
		image_index = 0;
	}
	// Top of jump?
	else if (vsp >= -2 and vsp <= 2)
	{
		image_index = 1;
	}
	else
	{
	//Falling down?
		image_index = 2;
	}
}
else
{
	// We are on a block
	image_speed = 1;
	
	//we are idle or moving
	if (hsp == 0)
	{
		sprite_index = spr_Clyde_idle_strip12;
	}
	else
	{
		sprite_index = spr_Clyde_walk_strip8;
	}
}

//fliping player
if(hsp != 0) image_xscale = sign(hsp);