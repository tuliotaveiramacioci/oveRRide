// horizontal
var leftL = viewX
var rightL = viewW+(viewW*(segX-1))
if (obj_Player.x>rightL) segX++
else if (obj_Player.x<leftL) segX--

// vertical 
var topL = viewY
var bottomL = viewH+(viewH*(segY-1))
if (obj_Player.y>bottomL) segY++
else if (obj_Player.y<topL) segY--

// configuração final
camera_set_view_pos(camera, viewW*(segX-1), viewH*(segY-1))
viewX = camera_get_view_x(camera)
viewY = camera_get_view_y(camera)