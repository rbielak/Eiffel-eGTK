-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_FONTSEL - a font selection widget"
	author: "Daniel Elphick"
	cvs: "$Id: gtk_fontsel.e,v 1.5 2003/01/11 19:32:51 elphick Exp $"

class GTK_FONTSEL

-- A font selection widget

inherit
	
	GTK_BOX
	
	GTK_FONTSEL_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature

	get_font_name: STRING is
		do
			Result := npc.np_gtk_font_selection_get_font_name(widget)
		end

	get_font: GDK_FONT is
		do
			create Result.make_from_pointer(gtk_font_selection_get_font(widget))
		end

	set_font_name(fontname: STRING) is
		do
			set_font_name_successful :=
				npc.np_gtk_font_selection_set_font_name(widget, fontname)
		end

	set_font_name_successful: BOOLEAN
	-- Trying hard here not to have a function which has a side effect
	-- I assume that set_font_name returns true if successful but I can't find
	-- any docs

	set_filter(filter_type, font_type: INTEGER; foundries, 
			weights, slants, setwidths, spacings, charsets: ARRAY[STRING]) is
		do
			npc.np_gtk_font_selection_set_filter(widget, filter_type,
				font_type, foundries, weights, slants, setwidths,
				spacings, charsets)
		end

	get_preview_text: STRING is
		do
			Result := npc.np_gtk_font_selection_get_preview_text(widget)
		end

	set_preview_text(text: STRING) is
		do
			npc.np_gtk_font_selection_set_preview_text(widget, text)
		end

feature {NONE}
	
	make is 
		do
			widget := gtk_font_selection_new
			create children.make (1, 0)
			register_widget
		end

end -- GTK_FONTSEL
