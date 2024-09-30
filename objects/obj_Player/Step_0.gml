#region movimentação & colisão


// controles
var moveUp = keyboard_check_pressed(vk_up)
var moveLeft = keyboard_check_pressed(vk_left)
var moveDown = keyboard_check_pressed(vk_down)
var moveRight = keyboard_check_pressed(vk_right)

// direção
velH = (moveRight-moveLeft)*velT
velV = (moveDown-moveUp)*velT

// função
move_and_collide(velH, velV, obj_Collider)


#endregion