-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_LABEL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_label_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_LABEL_EXTERNALS

inherit

	GTK_JUSTIFICATION_ENUM

feature {NONE}

	gtk_label_new (l: POINTER): POINTER is
		external "C"
		end
	
	gtk_label_set_text (w, l: POINTER) is
		external "C"
		end

	gtk_label_set_justify (label: POINTER; jtype: INTEGER) is
		-- jtpye is a GtkJustification constant
		require
			just: jtype >= Gtk_justify_left and jtype <= Gtk_justify_fill
		external "C"
		end

	gtk_label_set_pattern (label, pattern: POINTER) is
		-- pattern is a const gchar*
		external "C"
		end

	gtk_label_set_line_wrap (label: POINTER; wrap: BOOLEAN) is
		external "C"
		end

	gtk_label_get (l: POINTER): POINTER is
		external "C"
		end
	
feature {NONE} -- code in the glue library

	c_label_text (w: POINTER): POINTER is
			-- get label text
		external "C"
		end

	gtk_label_parse_uline (label, string: POINTER): INTEGER is
	-- Convenience function to set the name and pattern by parsing
	-- a string with embedded underscores, and return the appropriate
	-- key symbol for the accelerator.
		-- string is a const gchar*
		external "C"
		end

end  -- GTK_LABEL_EXTERNALS
