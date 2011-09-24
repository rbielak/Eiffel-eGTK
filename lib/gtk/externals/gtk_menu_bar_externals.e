-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MENU_BAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_menu_bar_externals.e,v 1.6 2000/07/10 02:01:28 richieb Exp $"

class GTK_MENU_BAR_EXTERNALS

inherit

	GTK_SHADOWTYPE_ENUM

feature {NONE}

	gtk_menu_bar_new: POINTER is
		external "C"
		end

	gtk_menu_bar_prepend (mb: POINTER; child: POINTER) is
		external "C"
		end

	gtk_menu_bar_append (mb: POINTER; child: POINTER) is
		external "C"
		end

	gtk_menu_bar_insert (mb: POINTER; child: POINTER; pos: INTEGER) is
		external "C"
		end

	gtk_menu_bar_set_shadow_type (mb: POINTER; type: INTEGER) is
		-- type is a GtkShadowType constant
		require
			good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
		external "C"
		end

end  -- GTK_MENU_BAR_EXTERNALS
