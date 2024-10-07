#region movimentação e colisão


	// sentido do movimento: direção no plano cartesiano
	var moveX = keyboard_check(ord(moveKey[3]))-keyboard_check(ord(moveKey[1]))
	var moveY = keyboard_check(ord(moveKey[2]))-keyboard_check(ord(moveKey[0]))

	if (moveX!=0 or moveY!=0) {
	
		// normalização do vetor: correção da velocidade nas diagonais
		var moveRange = point_distance(0, 0, moveX, moveY)
		moveX /= moveRange
		moveY /= moveRange

		// horizontal: x
		if (!place_meeting(x+moveX, y, obj_Collider)) x = x+moveX
		else while (!place_meeting(x+sign(moveX), y, obj_Collider)) x += sign(moveX)

		// vertical: y
		if (!place_meeting(x, y+moveY, obj_Collider)) y = y+moveY
		else while (!place_meeting(x, y+sign(moveY), obj_Collider)) y += sign(moveY)

	}


#endregion

#region tiro


	if (shootCooldown<=0 and shootAmmo>0) {

	    // sentido do movimento: direção no plano cartesiano
		var shootX = keyboard_check(shootKey[0])-keyboard_check(shootKey[2]);
		var shootY = keyboard_check(shootKey[3])-keyboard_check(shootKey[1]);


	    if (shootX!=0 or shootY!=0) {
			
	        // determina a direção: inclui diagonais
	        var shootAngle = point_direction(0, 0, shootX, shootY);
		
			// efetua o tiro: gera objeto e ajusta dados
			var shootBullet = instance_create_layer(x, y, "Instances", obj_Bullet)
			shootBullet.direction = shootAngle
			shootBullet.image_angle = shootAngle
			shootAmmo--
	        shootCooldown = shootDelay;
	    }
	}

	// intervalo entre disparos: 30 frames (1/2 segundo)
	if (shootCooldown>0) shootCooldown--


#endregion
