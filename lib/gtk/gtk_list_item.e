-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_LIST_ITEM - an item in a list box"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_list_item.e,v 1.12 2003/01/11 19:04:23 elphick Exp $"

class GTK_LIST_ITEM

-- An item to go in a list box
--
-- Signals (from gtklistitem.c):
--    "end_selection"
--    "extend_selection"
--    "scroll_horizontal"
--    "scroll_vertical"
--    "select_all"
--    "start_selection"
--    "toggle_add_mode"
--    "toggle_focus_row"
--    "undo_selection"
--    "unselect_all"


inherit
	
	GTK_ITEM
		undefine
			make_from_pointer
		redefine
			child, focus_child
		end

	-- This redefinition is here to avoid the use of "?=" in 
	-- GTK_BIN. If "?=" is used in GTK_BIN the SE gives too many 
	-- useless warnings.
	GTK_WIDGET
		redefine
			make_from_pointer 
		end

	GTK_LIST_ITEM_EXTERNALS
		undefine
			copy, is_equal
		end
	
creation
	
	make,
	make_with_label

feature

	make_with_label (label: STRING) is
		require
			label_not_void: label /= Void
		do
			widget := npc.np_gtk_list_item_new_with_label (label)
			register_widget
		end

	make is
		do
			widget := gtk_list_item_new
			register_widget
		end

	make_from_pointer (p: POINTER) is
		do
			precursor {GTK_WIDGET} (p)
			child ?= widget_factory.item_from_pointer (c_gtk_bin_child (p))
		end

	select_item is
		do
			gtk_list_item_select (widget)
		end

	deselect_item is
		do
			gtk_list_item_deselect (widget)
		end

	child: GTK_LABEL

	focus_child: GTK_LABEL is
		local
			childp: POINTER
		do
			childp := c_focus_child (widget)
			if childp /= default_pointer then
				Result ?= widget_factory.item_from_pointer (childp)
			end
		end
	

feature {GTK_COMMAND_TYPE}

	gtk_object: POINTER is
			-- this feature is here to get around a bug in SE-078b5
		do
			Result := widget
		end

end -- GTK_LIST_ITEM
