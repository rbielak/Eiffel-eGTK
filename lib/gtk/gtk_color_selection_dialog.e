-- Copyright 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Dialog for selecting colors"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	date: "September 3, 1999"
	
class GTK_COLOR_SELECTION_DIALOG

inherit

	GTK_WINDOW

	GTK_COLOR_SELECTION_DIALOG_EXTERNALS
		undefine
			is_equal, copy
		end
	
	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make_with_title

feature

	make_with_title (title: STRING) is
		require
			title_not_void: title /= Void
		do
			window := npc.np_gtk_color_selection_dialog_new (title)
			register_widget
			create ok.make_from_pointer (c_gtk_color_selection_dialog_ok_button (window))
			create cancel.make_from_pointer (c_gtk_color_selection_dialog_cancel_button (window))
			create selection.make_from_pointer (c_gtk_color_selection_dialog_colorsel (window))
 			-- frido 1999-30-09
 			create help.make_from_pointer(c_gtk_color_selection_dialog_help_button (window));
		end


	ok: GTK_BUTTON
			-- button pressed to accept choice

	cancel: GTK_BUTTON
			-- button pressed to cancel


 	help: GTK_BUTTON;
			-- help button of the dialog
			-- frido 1999-30-09

	reset: GTK_BUTTON
			-- button pressed to reset

	selection: GTK_COLORSEL


	selection_dialog_type : INTEGER is
		do
			Result := gtk_color_selection_dialog_get_type
		end

	last_color_selected: ARRAY [DOUBLE] is
		do
			Result := selection.selection_get_color
		end

	
end
