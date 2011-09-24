-- Copyright 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "File selection widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_file_selection.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GTK_FILE_SELECTION

inherit
	
	GTK_WINDOW
		rename
			window as fselector
		end

	GTK_FILESEL_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make_with_title
	
feature

	set_file_name (fname: STRING) is
		require
			valid_fname: fname /= Void
		do
			npc.np_gtk_file_selection_set_filename (fselector, fname)
		end

	get_file_name: STRING is
		local
			p: POINTER
		do
			create Result.make (0)
			p := gtk_file_selection_get_filename (fselector)
			Result := npc.np_string_from_pointer (p)
		end

	complete_selection (pattern: STRING) is
		require
			pattern_valid: pattern /= Void
		do
			npc.np_gtk_file_selection_complete (fselector, pattern)
		end

	show_fileops_buttons is
		obsolete "Use show_file_ops_buttons instead"
		do
			gtk_file_selection_show_fileop_buttons (fselector)
		end

	show_file_ops_buttons is
		do
			gtk_file_selection_show_fileop_buttons (fselector)
		end

	hide_file_ops_buttons is
		do
			gtk_file_selection_hide_fileop_buttons (fselector)
		end

	ok: GTK_BUTTON
			-- OK button, to accept the selection

	cancel: GTK_BUTTON
			-- cancel the selection
	
feature {NONE}

	make_with_title (title: STRING) is
		require
			title_valid: title /= Void
		do
			-- not portable yet
			fselector := npc.np_gtk_file_selection_new (title)
			register_widget
			-- TODO: convert these to use the widget factory
			create ok.make_from_pointer (c_gtk_file_selection_ok_button (fselector))
			create cancel.make_from_pointer (c_gtk_file_selection_cancel_button (fselector))
		end

invariant

	buttons_there: (ok /= Void) and (cancel /= Void)

end
