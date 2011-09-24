-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_CHECK_MENU_ITEM"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_check_menu_item_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_CHECK_MENU_ITEM_EXTERNALS

feature {NONE} -- GTK+ calls
	
	gtk_check_menu_item_new: POINTER is
		external "C"
		end
	
	gtk_check_menu_item_new_with_label (label: POINTER): POINTER is
			-- label is const gchar*
		external "C"
		end
	
	gtk_check_menu_item_set_active (check_menu_item: POINTER;
									is_active: BOOLEAN) is
		external "C"
		end
	
	gtk_check_menu_item_set_show_toggle (menu_item: POINTER;
										 always: BOOLEAN) is
		external "C"
		end
	
	gtk_check_menu_item_toggled (check_menu_item: POINTER) is
		external "C"
		end

feature {NONE} -- fields

	c_gtk_check_menu_item_is_active (check_menu_item: POINTER): BOOLEAN is
		external "C"
		end

end  -- GTK_CHECK_MENU_ITEM_EXTERNALS
