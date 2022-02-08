/// @description enemy attributes. Health, speed, etc.

health_max = 10;
health_current = health_max;

invincible = false;

dir_sprites[0, 0] = spr_walker_idle_lr;
dir_sprites[1, 0] = spr_walker_idle_up;
dir_sprites[2, 0] = spr_walker_idle_lr;
dir_sprites[3, 0] = spr_walker_idle_dwn;
dir_sprites[0, 1] = spr_walker_run_lr;
dir_sprites[1, 1] = spr_walker_run_up;
dir_sprites[2, 1] = spr_walker_run_lr;
dir_sprites[3, 1] = spr_walker_run_dwn;

spr_current = dir_sprites[0, 0];

moving = false;
mve_spd_default = 300;
mve_speed = 300;
mve_speed_recoil_recv = mve_spd_default * 3;
mve_dir = 0;
dir_last = 0;
//how long until randomly assigning new movement pattern
alarmvar_mve = 2;
alarmvar_opt = 0;
alarmvar_inv = 50000;
//default invincibility frames
alarmvar_inv_default = 0.2
