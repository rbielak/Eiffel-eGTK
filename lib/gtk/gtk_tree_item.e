-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TREE_ITEM - an item to be attached to a tree widget"
	author: "Pirmin Kalberer"
	CVS: "$Id: gtk_tree_item.e,v 1.9 2003/01/11 19:32:52 elphick Exp $"

class GTK_TREE_ITEM

-- A widget for an item to be attached to a tree widget
--
-- Signals (from gtktreeitem.c):
--    "collapse"
--    "expand"

inherit
	
   GTK_ITEM
		redefine
			deselection,
			selection
		end

   GTK_TREE_ITEM_EXTERNALS
		undefine
			copy, is_equal
		end

   EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer,
	make_with_label
	
feature -- creation
	
	make is
		do
			widget := gtk_tree_item_new
			register_widget
		end
	
	make_with_label (text: STRING) is
		require
			text_not_void: text /= Void
		do
			widget := npc.np_gtk_tree_item_new_with_label (text)
			register_widget
		end
	
feature -- subtrees

	set_subtree (lsubtree: GTK_TREE) is
		require
			subtree_not_void: lsubtree /= Void
		do
			gtk_tree_item_set_subtree (widget, lsubtree.widget)
			subtree_cache := lsubtree
		end

	subtree: GTK_TREE is
			-- subtree of this item, if it exists
		local
			stp: POINTER
		do
			stp := c_gtk_tree_item_subtree (widget)
			if stp /= default_pointer then
				if subtree_cache /= Void and then subtree_cache.widget = stp then
					Result := subtree_cache
				else
					create Result.make_from_pointer (stp)
				end
			end
		end

	has_subtree: BOOLEAN is
		do
			Result := c_gtk_tree_item_subtree (widget) /= default_pointer
		end

	remove_subtree is
		do
			gtk_tree_item_remove_subtree (widget)
			subtree_cache := Void
		end

feature -- selection

	selection is
		do
			gtk_tree_item_select (widget)
		end
	
	deselection is
		do
			gtk_tree_item_deselect (widget)
		end
	

feature -- labels

	label_text: STRING is
			-- Return the text of the label
		do
			if child_is_label then
				Result := label.text
			end
		end
	
	child_is_label: BOOLEAN is
			-- Returns true if the widget is a label
		do
			Result := (label /= Void)
		end
	
	label: GTK_LABEL is
		do
			-- This code is broken, because "child" doesn't return 
			-- the right object just yet (richieb August 11th, 1999)
			Result ?= child
		end
	
	
feature {NONE}

	subtree_cache: GTK_TREE
	
end -- GTK_TREE_ITEM
