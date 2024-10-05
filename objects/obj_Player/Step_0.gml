#region movimentaçao + colisão + sprites


// controles: para teclado (wasd)
var keyMoveRight = keyboard_check(ord("D"))
var keyMoveLeft	 = keyboard_check(ord("A"))
var keyMoveDown	 = keyboard_check(ord("S"))
var keyMoveUp	 = keyboard_check(ord("W"))

// direção do movimento: sentido para o plano cartesiano
var moveX = keyMoveRight - keyMoveLeft
var moveY = keyMoveDown - keyMoveUp

// executar lógica: mover se não colide, etc...
if (moveX!=0 || moveY!=0) {
	
	// normalização do vetor: correção da velocidade nas diagonais
	var range = point_distance(0, 0, moveX, moveY)
	moveX = (moveX/range)*3
	moveY = (moveY/range)*3

	// horizontal
	var newX = x+moveX
	if (!place_meeting(newX, y, obj_Collider)) x = newX
	else while (!place_meeting(x+sign(moveX), y, obj_Collider)) x += sign(moveX)

	// vertical
	var newY = y+moveY
	if (!place_meeting(x, newY, obj_Collider)) y = newY
	else while (!place_meeting(x, y+sign(moveY), obj_Collider)) y += sign(moveY)

    // sprites: em movimento
    if	    (moveY < 0)  sprite_index = spr_walk_back
    else if (moveY > 0)  sprite_index = spr_walk_front
    else if (moveX != 0) sprite_index = spr_walk_side image_xscale = (moveX<0)?-1:1
} else {
	
	// sprites: em repouso
    if      (sprite_index == spr_walk_back) sprite_index  = spr_idle_back
    else if (sprite_index == spr_walk_front) sprite_index = spr_idle_front
    else if (sprite_index == spr_walk_side) sprite_index  = spr_idle_side
}


#endregion

#region tiro


// definindo direção e teclas em arrays
var directions = [90, 270, 180, 0]
var keys = [vk_up, vk_down, vk_left, vk_right]

// verificando cada elemento
for (var i = 0; i < 4; i++) {
	
    // chamando script
    var res = scr_shoot_bullet(keyboard_check_pressed(keys[i]), directions[i], fire_timer, fire_rate, ammo)
    fire_timer = res[0];
    ammo = res[1];
}


#endregion