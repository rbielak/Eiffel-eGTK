-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "GTK_PREVIEW"
	author: "Daniel Elphick"
	
class GTK_PREVIEW
	
inherit
	
	GTK_WIDGET
	
	GTK_PREVIEW_EXTERNALS
		rename
			gtk_preview_set_gamma as set_gamma,
			gtk_preview_set_color_cube as set_color_cube,
			gtk_preview_set_install_cmap as set_install_cmap,
			gtk_preview_set_reserved as set_reserved,
			gtk_preview_reset as reset
		undefine
			copy, is_equal
		end

creation
	
	make
	
feature

	set_preview_size(w, h: INTEGER) is
		do
			gtk_preview_size(widget, w, h)
		end
	
	put(win: GDK_WINDOW; gc: GDK_GC; srcx, srcy,
			destx, desty, w, h: INTEGER) is
		do
			gtk_preview_put(widget, win.window, gc.gc, srcx, srcy,
				destx, desty, w, h)
		end

	draw_row(data: ARRAY[CHARACTER]; x, y, w: INTEGER) is
		do
			npc.np_gtk_preview_draw_row(widget, data, x, y, w)
		end

	set_expand(expand: BOOLEAN) is
		do
			gtk_preview_set_expand(widget, expand)
		end

	set_dither(dither: INTEGER) is
		do
			gtk_preview_set_dither(widget, dither)
		end

	get_visual: GDK_VISUAL is
		do
			create Result.make(gtk_preview_get_visual)
		end

	get_cmap: GDK_COLOR_MAP is
		do
			create Result.make(gtk_preview_get_cmap)
		end

	get_info: GTK_PREVIEW_INFO is
		do
			create Result.make(gtk_preview_get_info)
		end

feature {NONE}
	
	make(type: INTEGER) is 
		do
			widget := gtk_preview_new(type)
			register_widget
		end
	
end -- GTK_PREVIEW
