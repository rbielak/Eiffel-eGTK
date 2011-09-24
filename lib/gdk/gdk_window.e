-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "type-safe wrapper for GdkWindow"
	author: "Dave E Martin XXIII"
	genesis: "199903170535 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_window.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GDK_WINDOW

inherit

	GDK_DRAWABLE
		rename
			drawable as window
		end

	GDK_WINDOW_EXTERNALS
		undefine
			is_equal, copy
		end

creation

	make

feature {GTK_WIDGET, GDK_EVENT}

	make (the_window: POINTER) is
		do
			window := the_window
		ensure
			window_set: window = the_window
		end

feature {GTK_WIDGET}
 
        lower is
               do
                       gdk_window_lower(window)
               end

        raise is
               do
                       gdk_window_raise(window)
               end



	set_background(c: GDK_COLOR) is
		do
			gdk_window_set_background(window, c.color)
		end

	set_back_pixmap(p: GDK_PIXMAP; parent_relative: BOOLEAN) is
		local
			pr: INTEGER
		do
			if parent_relative then
				pr := 1
			end
			gdk_window_set_back_pixmap(window, p.pixmap, pr)
		end

	set_cursor(c: GDK_CURSOR) is
		local
			p: POINTER
		do
			if c /= Void then
				p := c.cursor
			else
				p := default_pointer
			end
			gdk_window_set_cursor(window, p)
		end

	set_color_map(c: GDK_COLOR_MAP) is
		do
			gdk_window_set_colormap(window, c.color_map)
		end

	get_color_map: GDK_COLOR_MAP is
		do
			create Result.make(gdk_window_get_colormap(window))
		end

	set_decorations(d: INTEGER) is
		require
			d_in_range: d >= 0 and d <= Gdk_max_decoration
		do
			gdk_window_set_decorations(window, d)
		end

	set_functions(f: INTEGER) is
		require
			f_in_range: f >= 0 and f <= Gdk_max_function
		do
			gdk_window_set_functions(window, f)
		end

end -- GDK_WINDOW
