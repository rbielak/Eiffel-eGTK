-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Dialog for selecting fonts"
	author: "Daniel Elphick"
	
class GTK_FONT_SELECTION_DIALOG

inherit

	GTK_WINDOW

	GTK_FONT_SELECTION_DIALOG_EXTERNALS
		undefine
			is_equal, copy
		end
	
	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make_with_title

feature {NONE}

	make_with_title (title: STRING) is
		require
			title_not_void: title /= Void
		do
			window := npc.np_gtk_font_selection_dialog_new (title)
			register_widget
			create ok.make_from_pointer (c_gtk_font_selection_dialog_ok_button (window))
			create apply.make_from_pointer (c_gtk_font_selection_dialog_apply_button (window))
			create cancel.make_from_pointer (c_gtk_font_selection_dialog_cancel_button (window))
			create selection.make_from_pointer (c_gtk_font_selection_dialog_fontsel (window))
		end

feature

	get_font_name: STRING is
		do
			Result := npc.np_gtk_font_selection_dialog_get_font_name(window)
		end

	get_font: GDK_FONT is
			-- GDK_FONT does not exist
		do
			-- create Result.make_from_pointer(gtk_font_selection_dialog_get_font(window))
		end

	set_font_name(font: STRING) is
			-- examine font_set to see if it was successful
		do
			font_set := npc.np_gtk_font_selection_dialog_set_font_name(window, font)
		end

	font_set: BOOLEAN

	set_filter(filter_type, font_type: INTEGER; foundries, weights, slants,
				setwidths, spacings, charsets: ARRAY[STRING]) is
		do
			npc.np_gtk_font_selection_dialog_set_filter(window, filter_type,
				font_type, foundries, weights, slants, setwidths, spacings,
				charsets)
		end

	get_preview_text: STRING is
		do
			Result := npc.np_gtk_font_selection_dialog_get_preview_text(window)
		end

	set_preview_text(text: STRING) is
		do
			npc.np_gtk_font_selection_dialog_set_preview_text(window, text)
		end

	ok: GTK_BUTTON
			-- button pressed to accept choice and close the window

	apply: GTK_BUTTON
			-- button pressed to accept choice but not close the window

	cancel: GTK_BUTTON
			-- button pressed to cancel and close the window

	selection: GTK_FONTSEL

end
