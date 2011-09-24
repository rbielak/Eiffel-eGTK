-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_OPTION_MENU"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_option_menu_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_OPTION_MENU_EXTERNALS

feature {NONE} -- GTK+ calls

	gtk_option_menu_new: POINTER is
		external "C"
		end

	gtk_option_menu_get_menu    (option_menu: POINTER): POINTER is
		external "C"
		end

	gtk_option_menu_set_menu    (option_menu, menu: POINTER) is
		-- menu is a GtkWidget*
		external "C"
		end

	gtk_option_menu_remove_menu (option_menu: POINTER) is
		external "C"
		end

	gtk_option_menu_set_history (option_menu: POINTER; index: INTEGER) is
		external "C"
		end

end  -- GTK_OPTION_MENU_EXTERNALS
