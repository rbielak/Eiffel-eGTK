-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "GTK_TREE - a tree widget"
	author: "Pirmin Kalberer"
	CVS: "$Id: gtk_tree.e,v 1.10 2003/01/11 19:32:52 elphick Exp $"
	
class GTK_TREE
	
	-- A tree widget
	--
   -- Signals (from gtktree.c):
	--    "select_child"
	--    "selection_changed"
	--    "unselect_child"
	
inherit
	
	GTK_COMPOSED_BIN
		redefine
			add_widget
		end

	GTK_TREE_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature -- creation
	
	make is 
		do
			widget := gtk_tree_new
			create children.make (1, 0)
			register_widget
		end
	
feature -- adding items

	add_widget (a_child: GTK_TREE_ITEM) is
			-- add a child item
		do
			precursor (a_child)
		end
	
	append_item (tree_item: GTK_TREE_ITEM) is
			-- append item to the tree. Same effect as "add_widget"
		require
			item_not_void: tree_item /= Void
		do
			gtk_tree_append (widget, tree_item.widget)
			add_child (tree_item)
		end
	
feature -- children and positions

	child_position (child: GTK_TREE_ITEM): INTEGER is
			-- position of this widget in the list
		require
			child_not_void: child /= Void
		do
			Result := gtk_tree_child_position (widget, child.widget)
		end

	children_count: INTEGER is
			-- count of children at this level
		do
			Result := c_gtk_tree_children_count (widget)
		end

feature -- selections
	
	select_item (it: INTEGER) is
		require
			--	 valid_item_index: (it >= 0) and (it < count)
		do
			gtk_tree_select_item (widget, it)
		end
	
	unselect_item (it: INTEGER) is
		require
			--	 valid_item_index: (it >= 0) and (it < count)
		do
			gtk_tree_unselect_item (widget, it)
		end

	selection: G_LIST is
			-- list of items selected
		local
			g_list: POINTER
		do
			g_list := c_gtk_tree_selection (widget)
			if g_list /= default_pointer then
				create Result.make_from_pointer (g_list)
			end
		end
	
	set_selection_mode (mode: INTEGER) is
		require
			valid_mode: is_selection_mode_valid (mode)
		do
			gtk_tree_set_selection_mode (widget, mode)
		end
	
	is_selection_mode_valid (mode: INTEGER): BOOLEAN is
		do
		   Result := (mode = Gtk_selection_single) 
		      or else (mode = Gtk_selection_browse)
		      or else (mode = Gtk_selection_multiple)
		      or else (mode = Gtk_selection_extended)
		end
	

	select_child (tree_item: GTK_TREE_ITEM) is
		require
			tree_item_not_void: tree_item /= Void
		do
			gtk_tree_select_child (widget, tree_item.widget)
		end

	unselect_child (tree_item: GTK_TREE_ITEM) is
		require
			tree_item_not_void: tree_item /= Void
		do
			gtk_tree_unselect_child ( widget, tree_item.widget)
		end
	
feature -- view modes

	set_view_mode (mode: INTEGER) is
		require
			valid_mode: is_view_mode_valid (mode)
		do
			gtk_tree_set_view_mode (widget, mode)
		end
	
	set_view_lines (flag: INTEGER ) is
		require
			valid_mode: is_view_mode_valid (flag)
		do
			gtk_tree_set_view_lines (widget, flag )
		end

	is_view_mode_valid (mode: INTEGER): BOOLEAN is
		do
		   Result := (mode = Gtk_tree_view_line) 
		      or else (mode = Gtk_tree_view_item)
		end
	

feature -- adding and removing items

	remove_items (items: G_LIST) is
		require
			items_not_void: items /= Void
		do
			gtk_tree_remove_items ( widget, items.g_list )
		end

   prepend (tree_item: GTK_TREE_ITEM ) is
		require
			tree_item_not_void: tree_item /= Void
		do
			gtk_tree_prepend (widget, tree_item.widget)
			add_child (tree_item)
		end

   insert (tree_item: GTK_TREE_ITEM; position : INTEGER ) is
		require
			tree_item_not_void: tree_item /= Void
		do
			gtk_tree_insert (widget, tree_item.widget, position )
			add_child (tree_item)
		end

   clear_items (start: INTEGER; last: INTEGER ) is
		require
			valid_low: (start >= 0) and (last >= start)
			valid_high: (last <= children_count) 
		do
			gtk_tree_clear_items (widget, start, last )
			-- should remove these from children array
		end

   
end -- GTK_TREE
