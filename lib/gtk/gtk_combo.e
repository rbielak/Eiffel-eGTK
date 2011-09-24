-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_COMBO - combo widget"
	author: "Daniel Elphick"
	cvs: "$Id: gtk_combo.e,v 1.6 2002/08/26 05:02:51 DJAC Exp $"

class GTK_COMBO

	-- A combo box consists of a text entry box and a pull down menu. This 
	-- enables the user either to select an item from the menu or to type it 
	-- in manually.

inherit

	GTK_BOX
		redefine
			add_child, remove_child, make_from_pointer
		select
			add_child, remove_child, make_from_pointer, has_child
		end

	GTK_ITEM
		undefine
			is_equal, copy, add_child, remove_child, make_from_pointer,
			has_child
		end

	GTK_COMBO_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make, make_from_pointer

feature

	set_value_in_list(val: BOOLEAN; ok_if_empty: BOOLEAN) is
			-- Specifies whether the value entered in the text entry field 
			-- must match one of the values in the list. If this is set,
			-- the user will not be able to perform any other action until 
			-- a valid value has been entered.
			--
			-- If an empty field is acceptable, the ok_if_empty 
			-- parameter should be TRUE. 
		local
			v, o: INTEGER
		do
			if val then v := 1 end
			if ok_if_empty then o := 1 end
			gtk_combo_set_value_in_list(widget, v, o)
		end

	set_use_arrows(val: BOOLEAN) is
			-- Set to true if the arrow (cursor) keys can be used to step 
			-- through the items in the list. This is the default.

		local
			v: INTEGER
		do
			if val then v := 1 end
			gtk_combo_set_use_arrows(widget, v)
		end
	
	set_use_arrows_always(val: BOOLEAN) is
			-- Set to true if the arrow keys will still work even if the   
			-- current contents of entry do not match any of the list items. 
		local
			v: INTEGER
		do
			if val then v := 1 end
			gtk_combo_set_use_arrows_always(widget, v)
		end

	set_case_sensitive(val: BOOLEAN) is
			-- Specifies whether the text entered into entry and the text 
			-- in list's items is case sensitive.
		local
			v: INTEGER
		do
			if val then v := 1 end
			gtk_combo_set_case_sensitive(widget, v)
		end

	set_item_string(it: GTK_ITEM; item_value: STRING) is
			-- Sets the string to place in entry when a particular list item 
			-- is selected. This is needed if the list item is not a simple 
			-- label.
		do
			npc.np_gtk_combo_set_item_string(widget, it, item_value)
		end

	set_popdown_strings(strings: ARRAY[STRING]) is
			-- Set all of the items in the popup list.
		require
			strings /= Void
		do
			npc.np_gtk_combo_set_popdown_strings(widget, strings);
		end
			
	disable_activate is
			-- Stops the GtkCombo widget from showing the popup list when 
			-- entry emits the "activate" signal, i.e. when the Return key is 
			-- pressed.
			--
			-- This may be useful if, for example, you want the Return key 
			-- to close a dialog instead.
		do
			gtk_combo_disable_activate(widget)
		end

	-- access this to read/set the entry
	entry: GTK_ENTRY

	list: GTK_LIST

feature {NONE}

	make is
			-- Create a new combo widget
		do
			widget := gtk_combo_new
			register_widget
			create entry.make_from_pointer(c_gtk_combo_entry(widget))
			create list.make_from_pointer(c_gtk_combo_list(widget))
			-- add these as children, to satisfy the invariant
			create children.make(1,2)
			children.force (entry, 1)
			children.force (list, 2)
		end

	make_from_pointer (p: POINTER) is
		do
			precursor (p)
			create entry.make_from_pointer(c_gtk_combo_entry(widget))
			create list.make_from_pointer(c_gtk_combo_list(widget))
			-- add these as children, to satisfy the invariant
			children.force (entry, 1)
			children.force (list, 2)
		end

	remove_child (a_widget: like first_child) is
		do
			print("GTK_COMBO.remove_child: should not be used%N")
		end

	add_child (a_child: like first_child) is
			-- add another widget to our children array
		do
			print("GTK_COMBO.add_child: should not be used%N")
		end

invariant

	two_children: count = 2

end -- GTK_COMBO
