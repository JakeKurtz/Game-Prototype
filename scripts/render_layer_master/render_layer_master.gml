if event_number!=0 exit; // runs only in GM native draw event: where tiles, backgrounds etc render - or custom code in objects!
with(obj_render){
	switch(renderstate){
		case RenderState.set:
			shader_set(shd_ztilt);
			shader_enable_corner_id(true);		// this is the magic ingredient! it allows us to distinguish which vertex is which in a shader!
			renderstate = RenderState.reset;
			break;
		
		case RenderState.reset:
			shader_reset();
			shader_enable_corner_id(false);
			renderstate = RenderState.set;
			break;
	}
}