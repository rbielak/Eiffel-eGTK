-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "Field access for GDK_COLOR"

class GDK_COLOR_EXTERNALS

feature {NONE}

	c_gdk_color_size: INTEGER is
		external "C"
		end

	c_gdk_color_pixel (c: POINTER): INTEGER is
		external "C"
		end

	c_gdk_color_set_pixel (c: POINTER; pix: INTEGER) is
		external "C"
		end		
		
	c_gdk_color_red (c: POINTER): INTEGER is
		external "C"
		end

	c_gdk_color_set_red (c: POINTER; val: INTEGER) is
		external "C"
		end

	c_gdk_color_green (c: POINTER): INTEGER is
		external "C"
		end

	c_gdk_color_set_green (c: POINTER; val: INTEGER) is
		external "C"
		end

	c_gdk_color_blue (c: POINTER): INTEGER is
		external "C"
		end

	c_gdk_color_set_blue (c: POINTER; val: INTEGER) is
		external "C"
		end

end
