-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_FILESEL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_filesel_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_FILESEL_EXTERNALS


feature {NONE}
			
	gtk_file_selection_new (t: POINTER): POINTER is
		external "C"
		end

	gtk_file_selection_set_filename (w, fn: POINTER) is
		external "C"
		end

	gtk_file_selection_get_filename (w: POINTER): POINTER is
		external "C"
		end

	gtk_file_selection_complete (w, pat: POINTER) is
		external "C"
		end

	gtk_file_selection_show_fileop_buttons (w: POINTER) is
		external "C"
		end

	gtk_file_selection_hide_fileop_buttons (w: POINTER) is
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_file_selection_ok_button (fs: POINTER): POINTER is
		external "C"
		end

	c_gtk_file_selection_cancel_button (fs: POINTER): POINTER is
		external "C"
		end

end  -- GTK_FILESEL_EXTERNALS
