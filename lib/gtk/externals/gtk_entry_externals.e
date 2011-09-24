-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_ENTRY"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_entry_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_ENTRY_EXTERNALS


feature {NONE}
			
	gtk_entry_new: POINTER is
		external "C"
		end

	gtk_entry_new_with_max_length (len: INTEGER): POINTER is
		external "C"
		end

	gtk_entry_set_text (e: POINTER; t: POINTER) is
		external "C"
		end

	gtk_entry_append_text (e: POINTER; t: POINTER) is
		external "C"
		end

	gtk_entry_prepend_text (e: POINTER; t: POINTER) is
		external "C"
		end

	gtk_entry_set_position (w: POINTER; p: INTEGER) is
		external "C"
		end

	gtk_entry_get_text (e: POINTER): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_entry_select_region (entry: POINTER; start, finish: INTEGER) is
		external "C"
		end
						 
	gtk_entry_set_visibility (e: POINTER; f: BOOLEAN) is
		external "C"
		end

	gtk_entry_set_editable (e: POINTER; f: BOOLEAN) is
		external "C"
		end

	gtk_entry_set_max_length (w: POINTER; l: INTEGER) is
		external "C"
		end


end  -- GTK_ENTRY_EXTERNALS
