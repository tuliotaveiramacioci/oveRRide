//
//				<<< DEBUG >>>
//

draw_set_color(c_white);

var state
switch (playerState) {
    case stateMachine.Idle:
        state = "parado"
        break
		
    case stateMachine.Move:
        state = "movendo"
        break
		
	case stateMachine.MoveShoot:
        state = "movendo e atirando"
        break
	
    case stateMachine.Shoot:
        state = "atirando"
        break
}
draw_text(10, 10, "estado atual: "+state);
draw_text(10, 30, "municao restante: "+string(shootAmmo))
draw_text(10, 50, "intervalo (tiros): " + string(shootCooldown))


