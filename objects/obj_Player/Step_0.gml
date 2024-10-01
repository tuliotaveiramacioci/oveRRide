#region movimentaçao + colisão + sprites


// controles: para teclado
var keyRight = keyboard_check(ord("D")) || keyboard_check(vk_right)
var keyLeft	 = keyboard_check(ord("A")) || keyboard_check(vk_left)
var keyDown	 = keyboard_check(ord("S")) || keyboard_check(vk_down)
var keyUp	 = keyboard_check(ord("W")) || keyboard_check(vk_up)

// direção do movimento: sentido para o plano cartesiano
var moveX = keyRight - keyLeft
var moveY = keyDown - keyUp

// executar lógica: mover se não colide, etc...
if (moveX!=0 || moveY!=0) {
	
	// normalização do vetor: correção da velocidade nas diagonais
	var range = point_distance(0, 0, moveX, moveY)
	moveX = (moveX/range)*5
	moveY = (moveY/range)*5

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