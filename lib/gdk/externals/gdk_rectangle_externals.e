-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "A class that provides access to a GdkRectangle struct"
	author: "Richie Bielak - based on code from VEGTK"
	date: "January 2000, 13"
	version: "v 0.3.5 GTK+ 1.2.x"

class GDK_RECTANGLE_EXTERNALS

feature -- C calls needed to manipulate the struct

	c_gdk_rectangle_new (x, y, w, h: INTEGER): POINTER is
		external "C"
		end

	c_gdk_rectangle_x_set (rp: POINTER; x: INTEGER) is
		external "C"
		end

	c_gdk_rectangle_x (rp: POINTER): INTEGER is
		external "C"
		end

	c_gdk_rectangle_y_set (rp: POINTER; y: INTEGER) is
		external "C"
		end

	c_gdk_rectangle_y (rp: POINTER): INTEGER is
		external "C"
		end

	c_gdk_rectangle_width_set (rp: POINTER; w: INTEGER) is
		external "C"
		end

	c_gdk_rectangle_width (rp: POINTER): INTEGER is
		external "C"
		end

	c_gdk_rectangle_height_set (rp: POINTER; h: INTEGER) is
		external "C"
		end

	c_gdk_rectangle_height (rp: POINTER): INTEGER is
		external "C"
		end

end


