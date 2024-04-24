/// @desc


// Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
// Make variable hight jump
key_jump = keyboard_check_pressed(vk_space);


// Calculate movement
var _move = key_right - key_left;
hsp = _move * walksp;
x = x + hsp