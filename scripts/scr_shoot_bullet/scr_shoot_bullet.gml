// parâmetros
var key_pressed = argument0
var bullet_direction = argument1
var fire_timer = argument2
var fire_rate = argument3
var ammo = argument4

// condições: intervalo e munição
if (fire_timer==0 && ammo>0) {
    if (key_pressed) {
        // atira
        var bullet = instance_create_layer(x, y, "lay_Instances", obj_Bullet)
        bullet.direction = bullet_direction
        bullet.image_angle = bullet_direction
        fire_timer = fire_rate;
        ammo--;
    }
}

// final
if (fire_timer>0) fire_timer--
return [fire_timer, ammo];
