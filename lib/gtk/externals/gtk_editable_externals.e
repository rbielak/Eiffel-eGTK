-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_EDITABLE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_editable_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_EDITABLE_EXTERNALS


feature {NONE}
			
	gtk_editable_select_region (w: POINTER; s, f: INTEGER) is
		external "C"
		end
	
	gtk_editable_insert_text (w, t: POINTER; l: INTEGER; p: POINTER) is
		external "C"
		end

	gtk_editable_delete_text(w: POINTER; s, f: INTEGER) is
		external "C"
		end

	gtk_editable_get_chars(w: POINTER; s, f: INTEGER): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_editable_cut_clipboard (w: POINTER) is
		external "C"
		end
	
	gtk_editable_copy_clipboard (w: POINTER) is
		external "C"
		end
	
	gtk_editable_paste_clipboard (w: POINTER) is
		external "C"
		end
	
	gtk_editable_claim_selection (editable: POINTER; claim: BOOLEAN; 
								  time: INTEGER) is
		-- editable is a GtkEditable*
		-- time is a guint32
		external "C"
		end

	gtk_editable_delete_selection (w: POINTER) is
		external "C"
		end
	
	gtk_editable_changed (w: POINTER) is
		external "C"
		end
	
	gtk_editable_set_position    (editable: POINTER; position: INTEGER) is
		-- editable is a GtkEditable*
		external "C"
		end

	gtk_editable_get_position    (editable: POINTER): INTEGER is
		-- editable is a GtkEditable*
		external "C"
		end

	gtk_editable_set_editable    (editable: POINTER;
				is_editable: BOOLEAN) is
		-- editable is a GtkEditable*
		external "C"
		end

end  -- GTK_EDITABLE_EXTERNALS
