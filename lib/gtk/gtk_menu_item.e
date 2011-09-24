-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gtk menu item"
	note: "warning : there is an enumerated type (I think so): GtkSubMenuPlacement"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Francois Pennaneach"
	changes: "adapted to ISE - Richie Bielak"
	cvs: "$Id: gtk_menu_item.e,v 1.6 2000/07/10 02:01:27 richieb Exp $"

class GTK_MENU_ITEM

-- A menu entry
--
-- Signals (from gtkmenuitem.c):
--    "activate"
--    "activate_item"

inherit

	GTK_ITEM
		redefine
			deselection,
			selection
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

	GTK_MENU_ITEM_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_with_label

feature

   make is
			-- Creation and initialization
		do
			widget := gtk_menu_item_new
			register_widget
		end -- make
	
	make_with_label(label : STRING) is
		require
			label_valid: label /= Void
		do
			widget := npc.np_gtk_menu_item_new_with_label (label)
			register_widget
		end -- make_with_label

-- TODO: figure these out (2/21)
	
--	accelerator_size is
--		do
--			gtk_menu_item_accelerator_size (widget)
--		end -- accelerator_size
	
--	accelerator_text(text : STRING) is
--		do
--			gtk_menu_item_accelerator_text (widget, $(text.to_c))
--		end -- accelerator_text
	
	activate is
		do
			gtk_menu_item_activate (widget)
		end -- activate
	
	configure(show_toggle_indicator, show_submenu_indicator : BOOLEAN ) is
		do
			gtk_menu_item_configure (widget, show_toggle_indicator, 
									 show_submenu_indicator)
		end -- configure
	
	deselection is
		do
			gtk_menu_item_deselect (widget)
		end -- deselection
	
	selection is
		do
			gtk_menu_item_select (widget)
		end -- selection
	
-- Not implemented
--	set_placement (placement : GTK_SUBMENU_PLACEMENT) is
--		do
--			ext_set_placement(menu_item, placement.value)
--		end -- set_placement
	
	set_submenu(submenu : GTK_WIDGET) is
		do
			gtk_menu_item_set_submenu (widget, submenu.widget)
		end -- set_submenu
	  
	remove_submenu  is
		do
			gtk_menu_item_remove_submenu (widget)
		end
	
	right_justify  is
		do
			gtk_menu_item_right_justify (widget)
		end
	
end -- GTK_MENU_ITEM
