-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk check menu item"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Francois Pennaneach"
	changes: "adapted for ISE - Richie Bielak"
	cvs: "$Id: gtk_check_menu_item.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_CHECK_MENU_ITEM

-- Signals (from checkmenuitem.c)
--    "toggled"  -  

inherit
	
	GTK_MENU_ITEM
		redefine
			make,
			make_with_label
		end

	GTK_NON_PORTABLE_CALLS
		undefine
			is_equal, copy
		end

	GTK_CHECK_MENU_ITEM_EXTERNALS
		undefine
			is_equal, copy
		end

creation

	make,
	make_with_label

feature

	make is
			-- Creation and initialization
		do
			widget := gtk_check_menu_item_new
			register_widget
		end -- make
	
	make_with_label(label : STRING) is
		do
			widget := np_gtk_check_menu_item_new_with_label(label)
			register_widget
		end -- make_with_label
	
	set_active (active: BOOLEAN) is
		do
			gtk_check_menu_item_set_active (widget, active)
		end -- set_is_active

	is_active: BOOLEAN is
		do
			Result := c_gtk_check_menu_item_is_active (widget)
		end
	
	toggled is
			-- Set the toggle on
		do
			gtk_check_menu_item_toggled(widget)
		end -- toggled
	
	set_show_toggle (always: BOOLEAN) is
		do
			gtk_check_menu_item_set_show_toggle (widget, always )
		end
	
end -- GTK_CHECK_MENU_ITEM
