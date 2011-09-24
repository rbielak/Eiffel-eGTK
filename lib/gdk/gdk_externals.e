-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "External GDK lib calls"
	cvs: "$Id: gdk_externals.e,v 1.5 2000/04/03 01:53:38 richieb Exp $"

class GDK_EXTERNALS

feature

--	gdk_pixmap_unref (p: POINTER) is
--		external "C"
--		end

--	gdk_pixmap_new (widget: POINTER; w, h: INTEGER; depth: INTEGER): POINTER is
--		external "C"
--		end

	c_gdk_image_new (visual: POINTER; width, height: INTEGER): POINTER is
		external "C"
		end

	gdk_image_put_pixel (image: POINTER; x,y: INTEGER; pixel: INTEGER) is
		external "C"
		end

	gdk_image_get_pixel (image: POINTER; x,y: INTEGER): INTEGER is
		external "C"
		end

	gdk_image_destroy (image: POINTER) is
		external "C"
		end
	
	gdk_draw_point (drawable, gc: POINTER; x, y: INTEGER) is
		external "C"
		end

	gdk_draw_line (drawable, gc: POINTER; x1, y1, x2, y2: INTEGER) is
		external "C"
		end

	gdk_draw_rectangle (drawable, gc: POINTER; filled, x, y,
		width, height: INTEGER) is
		external "C"
		end

	gdk_draw_arc (drawable, gc: POINTER; filled, x, y,
		width, height, angle1, angle2: INTEGER) is
		external "C"
		end

	gdk_draw_polygon (drawable, gc: POINTER; filled, x, y: INTEGER;
		point_array: POINTER; number_points: INTEGER) is
		external "C"
		end

	gdk_draw_string (drawable, font, gc: POINTER; x, y: INTEGER;
		string: POINTER) is
		external "C"
		end

	gdk_draw_text (drawable, font, gc: POINTER; x, y: INTEGER;
		string: POINTER; text_length: INTEGER) is
		external "C"
		end

	gdk_draw_text_wc (drawable, font, gc: POINTER; x, y: INTEGER;
		wide_string: POINTER; text_length: INTEGER) is
		external "C"
		end

	gdk_draw_pixmap (drawable, gc, src: POINTER; xsrc, ysrc: INTEGER;
		xdest, ydest, width, height: INTEGER) is
		external "C"
		end

---	the underlying gdk_draw_bitmap function appears to not exist, even
---	though its declared in the gdk.h header file
---	HERE
---	gdk_draw_bitmap (drawable, gc, src: POINTER; xsrc, ysrc: INTEGER;
---		xdest, ydest, width, height: INTEGER) is
---		external "C"
---		end

	gdk_draw_image (drawable, gc, image: POINTER; xsrc, ysrc: INTEGER;
			xdest, ydest: INTEGER;
			width, height: INTEGER) is
		external "C"
		end

	gdk_flush is
		-- flush all buffered xlib events, causing an immediate update
		-- useful if you cannot return to the event loop in a "timely"
		-- fashion
		external "C"
		end



feature -- other
end
