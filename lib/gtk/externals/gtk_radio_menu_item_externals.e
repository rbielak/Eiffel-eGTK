-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description:	"External C calls for GTK_RADIO_MENU_ITEM"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_radio_menu_item_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"
	
class GTK_RADIO_MENU_ITEM_EXTERNALS
	
feature {NONE}  -- GTK+ calls
	
	gtk_radio_menu_item_new (group: POINTER): POINTER is
			-- group is a GSList*
		external "C"
		end
	
	gtk_radio_menu_item_new_with_label (group, label: POINTER): POINTER is
			-- group is a GSList*
			-- label is a const gchar*
		external "C"
		end
	
	gtk_radio_menu_item_group (radio_menu_item: POINTER): POINTER is
			-- returns a GSList*
		external "C"
		end
	
	gtk_radio_menu_item_set_group (radio_menu_item, group: POINTER) is
			-- group is a GSList*
		external "C"
		end
	
end  -- GTK_RADIO_MENU_ITEM_EXTERNALS
