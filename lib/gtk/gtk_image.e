-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk image"
	author: "Dave E Martin XXIII"
	genesis: "199903110715 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_image.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GTK_IMAGE

inherit

	GTK_MISC
		rename
			widget as image
		end

	GTK_IMAGE_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature -- creation

	make (visual_: GDK_VISUAL; width_, height_: INTEGER) is
		require
			visual_ /= Void
		local
--			mask: GDK_BITMAP
		do
			create  gdk_image.make (visual_, width_, height_)
--			create  mask
--			image := gtk_image_new (val, mask)
			image := gtk_image_new (gdk_image.image, default_pointer)
			register_widget
		ensure
			image /= default_pointer
		end
feature
	redraw is
		do
			redraw_region (0, 0, width, height)
		end

	redraw_region (x, y: INTEGER; the_width, the_height: INTEGER) is
		require
			x_in_range: x >= 0 and x < width
			y_in_range: y >= 0 and y < height
			width_in_range: (the_width + x) <= width
			height_in_range: (the_height + y) <= height
		do
--			gdk_draw_image (window.window, style.black_gc.gc,
--				gdk_image.image, x, y, 0, 0, width_, height_)
			window.draw_image (style.black_gc, gdk_image, x, y,
				0 ,0, the_width, the_height)
		end

feature -- query
	gdk_image: GDK_IMAGE

end -- GTK_IMAGE
