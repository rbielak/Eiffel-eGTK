-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MENU_ITEM"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_menu_item_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_MENU_ITEM_EXTERNALS

feature {NONE}

	gtk_menu_item_new: POINTER is
		external "C"
		end
	
	gtk_menu_item_new_with_label (l: POINTER): POINTER is
		external "C"
		end

	gtk_menu_item_set_submenu (it: POINTER; sub: POINTER) is
		external "C"
		end

	gtk_menu_item_remove_submenu (it: POINTER) is
		external "C"
		end

	gtk_menu_item_set_placement (it: POINTER; placement: INTEGER) is
			-- placement = GTK_TOP_BOTTOM | GTK_LEFT_RIGHT
		external "C"
		end

	gtk_menu_item_configure (it: POINTER; show_toggle, show_submenu: BOOLEAN) is
		external "C"
		end

	gtk_menu_item_select (it: POINTER) is
		external "C"
		end

	gtk_menu_item_deselect (it: POINTER) is
		external "C"
		end

	gtk_menu_item_activate (item: POINTER) is
		external "C"
		end

	gtk_menu_item_right_justify (it: POINTER) is
		external "C"
		end

end  -- GTK_MENU_ITEM_EXTERNALS
