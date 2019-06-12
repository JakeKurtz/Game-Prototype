lightmap_init(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));

lightmap_set_ambient(0.4);
lightmap_set_light_parent_object(obj_light_parent);
lightmap_set_caster_parent_object(obj_caster_parent);
lightmap_move_with_view(true);
lightmap_set_shadows_enabled(true);
lightmap_set_shadow_size(256);

depth = -1000001;