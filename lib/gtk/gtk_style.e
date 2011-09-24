-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "GtkStyle"
	author: "Dave E Martin XXIII"
	genesis: "199903180429 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_style.e,v 1.11 2003/01/11 19:32:51 elphick Exp $"
	HERE: "still needs querys for the other GC attributes"

class GTK_STYLE

inherit

	GTK_STYLE_EXTERNALS

	GTK_WIDGET_EXTERNALS

	EGTK_HANDLE_FACTORY
	
creation

	make,
	make_from_pointer,
	make_from_default,
	make_from_style

feature  -- creation

	make is
		do
			style := gtk_style_new
		end

	make_from_pointer (stylep: POINTER) is
		require
			stylep_not_void: stylep /= default_pointer 
		do
			style := stylep
		end

	make_from_default is
		do
			style := gtk_style_copy(default_style)
		end

	make_from_style (st: GTK_STYLE) is
		require
			style_not_void: style /= Void
		do
			style := gtk_style_copy(st.style)
		ensure
			style_set: style /= Void and style /= default_pointer
			new_style: style /= st.style
		end

feature -- colors

	fg (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_fg (style, index))
		end

	set_fg (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_fg (style, color.color, index)
		end

	bg (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_bg (style, index))
		end

	set_bg (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_bg (style, color.color, index)
		end

	base (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_base (style, index))
		end

	set_base (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_base (style, color.color, index)
		end

	light (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_light (style, index))
		end

	set_light (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_light (style, color.color, index)
		end

	mid (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_mid (style, index))
		end

	set_mid (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_mid (style, color.color, index)
		end

	dark (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_dark (style, index))
		end

	set_dark (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_dark (style, color.color, index)
		end

	text (index: INTEGER): GDK_COLOR is
		require
			-- see gtkstyle.h for definition
			valid_index: (index >= 0) and (index < 5)
		do
			create Result.make_from_pointer (c_gtk_style_get_text (style, index))
		end

	set_text (color: GDK_COLOR; index: INTEGER) is
		require
			color_not_void: color /= Void
			valid_index: (index >= 0) and (index < 5)
		do
			c_gtk_style_set_text (style, color.color, index)
		end



feature -- query for Graphical contexts

	fg_gc (index: INTEGER): like general_gc_cache is
			--HERE check contract here as well?
		local
			p: POINTER
		do
			p := c_gtk_style_get_fg_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	bg_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_bg_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	light_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_light_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	dark_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_dark_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	mid_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_mid_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	text_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_text_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	base_gc (index: INTEGER): like general_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_base_gc (style, index)
			if general_gc_cache = Void or else general_gc_cache.gc /= p then
				create  general_gc_cache.make_from_pointer (p)
			end
			Result := general_gc_cache
		ensure
			Result /= Void
		end

	black_gc: like black_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_black_gc (style)
			if black_gc_cache = Void or else black_gc_cache.gc /= p then
				create  black_gc_cache.make_from_pointer (p)
			end
			Result := black_gc_cache
		ensure
			Result /= Void
		end

	white_gc: like white_gc_cache is
		local
			p: POINTER
		do
			p := c_gtk_style_get_white_gc (style)
			if white_gc_cache = Void or else white_gc_cache.gc /= p then
				create  white_gc_cache.make_from_pointer (p)
			end
			Result := white_gc_cache
		ensure
			Result /= Void
		end

feature -- fonts

	font: GDK_FONT is
		local
			fp: POINTER
		do
			fp := c_gtk_style_font (style)
			if fp /= default_pointer then
				Result ?= registered (fp)
				if Result = Void then
					create Result.make_from_pointer (fp)
				end
			end
		end

	set_font (a_font: GDK_FONT) is
		require
			a_font_not_void: a_font /= Void
		do
			c_gtk_style_set_font (style, a_font.font)
		end

feature

	style: POINTER

	default_style: POINTER is
		do
			Result := gtk_widget_get_default_style
		ensure
			set: Result /= Void and then Result /= default_pointer
		end

feature {GTK_WIDGET}
	
	black_gc_cache: GDK_GC

	white_gc_cache: GDK_GC

	general_gc_cache: GDK_GC

invariant

	style_set: style /= Void and then style /= default_pointer

end -- GTK_STYLE
