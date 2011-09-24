-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TREE_ITEM"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_tree_item_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_TREE_ITEM_EXTERNALS

feature {NONE} -- GTK+ calls

	gtk_tree_item_new: POINTER is
		external "C"
		end

	gtk_tree_item_new_with_label (label:POINTER): POINTER is
		-- label is a gchar*
		external "C"
		end

	gtk_tree_item_set_subtree (tree_item, subtree:POINTER) is
		-- subtree is a GtkWidget*
		external "C"
		end

	gtk_tree_item_remove_subtree (tree_item:POINTER) is
		external "C"
		end

	gtk_tree_item_select (tree_item:POINTER) is
		external "C"
		end

	gtk_tree_item_deselect (tree_item:POINTER) is
		external "C"
		end

	gtk_tree_item_expand (tree_item:POINTER) is
		external "C"
		end

	gtk_tree_item_collapse (tree_item:POINTER) is
		external "C"
		end

feature {NONE} -- access to struct fields

	c_gtk_tree_item_subtree (tree_item: POINTER): POINTER is
		external "C"
		end

end  -- GTK_TREE_ITEM_EXTERNALS
