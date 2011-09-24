-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MENU_SHELL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_menu_shell_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_MENU_SHELL_EXTERNALS

feature {NONE}

	gtk_menu_shell_append (ms: POINTER; w: POINTER) is
		external "C"
		end

	gtk_menu_shell_prepend (ms: POINTER; w: POINTER) is
		external "C"
		end

	gtk_menu_shell_insert (ms: POINTER; w: POINTER; pos: INTEGER) is
		external "C"
		end

	gtk_menu_shell_deactivate (ms: POINTER) is
		external "C"
		end

	gtk_menu_shell_select_item (menu_shell, menu_item: POINTER) is
		-- menu_item is a GtkWidget*
		external "C"
		end

	gtk_menu_shell_deselect (menu_shell: POINTER) is
		external "C"
		end

	gtk_menu_shell_activate_item (menu_shell, menu_item: POINTER;
                                     force_deactivate: BOOLEAN) is
		-- menu_item is a GtkWidget*
		external "C"
		end

end  -- GTK_MENU_SHELL_EXTERNALS
