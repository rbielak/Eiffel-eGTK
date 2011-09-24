-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TREE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_tree_externals.e,v 1.7 2000/07/10 02:01:28 richieb Exp $"

class GTK_TREE_EXTERNALS

inherit

	GTK_CONSTANTS

	GTK_SELECTIONMODE_ENUM
	
feature {NONE}  -- GTK+ calls

	gtk_tree_new: POINTER is
		external "C"
		end

	gtk_tree_append (tree, tree_item: POINTER) is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_prepend (tree, tree_item: POINTER) is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_insert (tree, tree_item: POINTER; position: INTEGER) is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_remove_items (tree, items: POINTER) is
		-- items is a GList*
		external "C"
		end

	gtk_tree_clear_items (tree: POINTER; start, finish: INTEGER) is
		external "C"
		end

	gtk_tree_select_item (tree: POINTER; item: INTEGER) is
		external "C"
		end

	gtk_tree_unselect_item (tree: POINTER; item: INTEGER) is
		external "C"
		end

	gtk_tree_select_child (tree, tree_item: POINTER) is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_unselect_child (tree, tree_item: POINTER) is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_child_position (tree, child: POINTER): INTEGER is
		-- tree_item is a GtkWidget*
		external "C"
		end

	gtk_tree_set_selection_mode (tree: POINTER; mode: INTEGER) is
		-- mode is a GtkSelectionMode constant
		require
			good_mode: mode >= Gtk_selection_single and mode <= Gtk_selection_extended
		external "C"
		end

	gtk_tree_set_view_mode (tree: POINTER; mode: INTEGER) is
		-- mode is a GtkTreeViewMode constant
		external "C"
		end

	gtk_tree_set_view_lines (tree: POINTER; flag: INTEGER) is
		external "C"
		end

feature {NONE} -- access to fields 
	
	c_gtk_tree_selection (tree: POINTER): POINTER is
		external "C"
		end

	c_gtk_tree_children_count (tree: POINTER): INTEGER is
		external "C"
		end


end  -- GTK_TREE_EXTERNALS
