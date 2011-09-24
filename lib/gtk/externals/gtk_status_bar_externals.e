-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_STATUS.BAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_status_bar_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_STATUS_BAR_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_statusbar_new: POINTER is
		external "C"
		end

	gtk_statusbar_get_context_id (statusbar,
				 context_description: POINTER): INTEGER is
		-- context_description is a const gchar*
		external "C"
		end

	-- Returns message_id used for gtk_statusbar_remove 
	gtk_statusbar_push (statusbar: POINTER; context_id: INTEGER;
					 text: POINTER): INTEGER is
		-- text is a const gchar*
		external "C"
		end

	gtk_statusbar_pop (statusbar: POINTER; context_id: INTEGER) is
		external "C"
		end

	gtk_statusbar_remove (statusbar: POINTER;
					 context_id, message_id: INTEGER) is
		external "C"
		end

end  -- GTK_STATUS_BAR_EXTERNALS
