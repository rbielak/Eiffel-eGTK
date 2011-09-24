-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MENU"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_menu_externals.e,v 1.6 2000/07/10 02:01:28 richieb Exp $"

class GTK_MENU_EXTERNALS

feature {NONE}

	gtk_menu_new: POINTER is
		external "C"
		end

	gtk_menu_append (menu, child: POINTER) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_menu_prepend (m: POINTER; child: POINTER) is
		external "C"
		end

	gtk_menu_insert (m: POINTER; child: POINTER; pos: INTEGER) is
		external "C"
		end

	gtk_menu_popup (menu, parent_menu_shell, parent_menu_item: POINTER;
				func: POINTER; data: POINTER; button: INTEGER;
				activate_time: INTEGER) is
		external "C"
		end

	gtk_menu_reposition (menu: POINTER) is
		external "C"
		end

	gtk_menu_popdown (m: POINTER) is
		external "C"
		end

	gtk_menu_get_active (m: POINTER): POINTER is
		external "C"
		end

	gtk_menu_set_active (m: POINTER; pos: INTEGER) is
		external "C"
		end

	gtk_menu_set_accel_group (m: POINTER; accel_group: POINTER) is
		external "C"
		end

	gtk_menu_get_accel_group (menu: POINTER): POINTER is
		-- returns a GtkAccelGroup*
		external "C"
		end

	gtk_menu_get_uline_accel_group (menu: POINTER): POINTER is
		-- returns a GtkAccelGroup*
		external "C"
		end

	gtk_menu_ensure_uline_accel_group (menu: POINTER): POINTER is
		-- returns a GtkAccelGroup*
		external "C"
		end

	gtk_menu_get_attach_widget (m: POINTER): POINTER is
		external "C"
		end

-- cannot handle pointer_to_func directly
--	gtk_menu_attach_to_widget (GtkMenu *menu,
--                                 GtkWidget *attach_widget,
--                                 GtkMenuDetachFunc detacher);
	
	gtk_menu_detach (m: POINTER) is
		external "C"
		end

	gtk_menu_set_tearoff_state (m: POINTER; torn_off: BOOLEAN) is
		external "C"
		end

	gtk_menu_set_title (menu, title: POINTER) is
		-- title is a const gchar*
		external "C"
		end

	gtk_menu_reorder_child (menu, child: POINTER; position: INTEGER) is
		-- child is a GtkWidget*
		external "C"
		end

end -- GTK_MENU_EXTERNALS
