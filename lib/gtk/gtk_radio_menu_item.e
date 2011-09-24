-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk radio menu item"
	author: "Francois Pennaneach"
	version: "v 0.3.5 GTK+ 1.2.x"
	changes: "adapted to ISE by Richie Bielak"
	cvs: "$Id: gtk_radio_menu_item.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_RADIO_MENU_ITEM

inherit
	
	GTK_CHECK_MENU_ITEM
		redefine 
			make, 
			make_with_label
		end

	GTK_RADIO_MENU_ITEM_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make, 
	make_with_label, 
	make_with_group,
	make_with_group_and_label,
	make_from_item, 
	make_from_item_and_label, 
	make_from_pointer

feature

	make is 
		do
			widget := gtk_radio_menu_item_new(default_pointer)
			register_widget
		end
   
	make_with_label (label: STRING) is
		do
			widget := np_gtk_radio_menu_item_new_with_label(default_pointer,
											label)
			register_widget
		end

	-- TODO: get rid of the pointer here, just like in GTK_RADIO_BUTTON
	make_with_group (lgroup: POINTER) is
			-- Group is a pointer to glist, which is constructed 
			-- using these calls.
		do
			widget := gtk_radio_menu_item_new (lgroup)
			register_widget
		end -- make_with_group

	-- TODO: get rid of the pointer here, just like in GTK_RADIO_BUTTON
	make_with_group_and_label (lgroup: POINTER; label : STRING) is
		do
			widget := np_gtk_radio_menu_item_new_with_label (lgroup, label)
			register_widget
		end -- make_with_group_and_label

	make_from_item(item : like Current) is
		local 
			lgroup: POINTER
		do
			if item /= Void then 
				lgroup := item.group
			end
			make_with_group (lgroup)
		end

	make_from_item_and_label(item: like Current; label: STRING ) is
		local
			lgroup: POINTER
		do
			if item /= Void then 
				lgroup := item.group
			end
			make_with_group_and_label(lgroup, label)
		end

	-- TODO: get rid of this routine, or make it return a G_LIST   
	group: POINTER is
		do
			Result := gtk_radio_menu_item_group (widget)
		end

	-- TODO: get rid of this routine, or make it use a G_LIST   
	set_group (lgroup: POINTER) is 
		do
			gtk_radio_menu_item_set_group (widget, lgroup)
		end

end -- GTK_RADIO_MENU_ITEM
