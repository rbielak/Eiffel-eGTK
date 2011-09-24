-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"External C calls for GTK_ARROW"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_arrow_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_ARROW_EXTERNALS

inherit

	GTK_SHADOWTYPE_ENUM

	GTK_ARROWTYPE_ENUM

feature {NONE}  -- direct GTK+ calls

	gtk_arrow_new (arrow_type, shadow_type: INTEGER): POINTER is
		require
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

	gtk_arrow_set (arrow: POINTER; arrow_type, shadow_type: INTEGER) is
		require
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

end -- GTK_ARROW_EXTERNALS
