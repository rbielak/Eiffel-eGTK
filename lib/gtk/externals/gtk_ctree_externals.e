-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_xxx"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_ctree_externals.e,v 1.9 2000/07/10 02:01:27 richieb Exp $"

class GTK_CTREE_EXTERNALS

inherit

	GTK_CTREE_ENUM

	EGTK_NON_PORTABLE

feature {NONE}  -- GTK+ calls

	gtk_ctree_construct (ctree: POINTER;
				columns, tree_column: INTEGER;
				titles: POINTER) is
		-- titles is a gchar*[]
		external "C"
		end

	gtk_ctree_new_with_titles (columns, tree_column: INTEGER;
				titles: POINTER): POINTER is
		-- titles is a gchar*[]
		external "C"
		end

	gtk_ctree_new (columns, tree_column: INTEGER): POINTER is
		external "C"
		end

	gtk_ctree_insert_node (ctree, parent, sibling: POINTER;
				text: POINTER;
				spacing: INTEGER;
				pixmap_closed, mask_closed,
				pixmap_opened, mask_opened: POINTER;
				is_leaf, is_expanded: BOOLEAN): POINTER is
		-- parent, sibling are GtkCTreeNode* 
		-- text is a gchar*[]
		-- spacing is a guint8        
		-- pixmap_closed, pixmap_opened are GdkPixmap*
		-- mask_closed, mask_opened are GdkBitmap*
		-- returns a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_remove_node (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_insert_gnode (ctree, parent, sibling, gnode: POINTER;
--				GtkCTreeGNodeFunc  func;
--				data: POINTER): POINTER is
--		-- parent, sibling are GtkCTreeNode* 
--		-- gnode is a GNode*
--		-- data is a gpointer
--		-- returns a GtkCTreeNode*
--		external "C"
--		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_export_to_gnode (ctree, parent, sibling, node: POINTER;
--				GtkCTreeGNodeFunc  func;
--				data: POINTER): POINTER is
--		-- parent, sibling are GNode* 
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		-- returns a GNode*
--		external "C"
--		end


feature {NONE}	-- GTK+  Generic recursive functions, querying / finding tree
		-- information

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_post_recursive (ctree, node: POINTER;
--				GtkCTreeFunc  func;
--				data: POINTER) is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		external "C"
--		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_post_recursive_to_depth (ctree, node: POINTER;
--				depth: INTEGER;
--				GtkCTreeFunc  func;
--				data: POINTER) is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		external "C"
--		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_pre_recursive (ctree, node: POINTER;
--				GtkCTreeFunc  func;
--				data: POINTER) is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		external "C"
--		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_pre_recursive_to_depth (ctree, node: POINTER;
--				depth: INTEGER;
--				GtkCTreeFunc  func;
--				data: POINTER) is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		external "C"
--		end

	gtk_ctree_is_viewable (ctree, node: POINTER): BOOLEAN is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_last (ctree, node: POINTER): POINTER is
		-- node is a GtkCTreeNode*
		-- returns a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_find_node_ptr (ctree, ctree_row: POINTER): POINTER is
		-- ctree_row is a GtkCTreeRow*
		-- returns a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_nth (ctree: POINTER; row: INTEGER): POINTER is
		-- returns a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_find (ctree, node, child: POINTER): BOOLEAN is
		-- node, child are GtkCTreeNode*
		external "C"
		end

	gtk_ctree_is_ancestor (ctree, node, child: POINTER): BOOLEAN is
		-- node, child are GtkCTreeNode*
		external "C"
		end

	gtk_ctree_find_by_row_data (ctree, node, data: POINTER): POINTER is
		-- node is a GtkCTreeNode*
		-- data is a gpointer
		-- returns a GtkCTreeNode*
		external "C"
		end

-- returns a GList of all GtkCTreeNodes with row->data == data
	gtk_ctree_find_all_by_row_data (ctree, node, data: POINTER): POINTER is
		-- node is a GtkCTreeNode*
		-- data is a gpointer
		-- returns a GList*
		external "C"
		end

-- Cannot directly implement a pointer_to_func
--	gtk_ctree_find_by_row_data_custom (ctree, node, data: POINTER;
--				GCompareFunc  func): POINTER is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		-- returns a GtkCTreeNode*
--		external "C"
--		end

-- returns a GList of all GtkCTreeNodes with row->data == data
-- Cannot directly implement a pointer_to_func
--	gtk_ctree_find_all_by_row_data_custom (ctree, node, data: POINTER;
--				GCompareFunc  func): POINTER is
--		-- node is a GtkCTreeNode*
--		-- data is a gpointer
--		-- returns a GList*
--		external "C"
--		end

	gtk_ctree_is_hot_spot (ctree: POINTER; x, y: INTEGER): BOOLEAN is
		external "C"
		end


feature {NONE}	-- Tree signals : move, expand, collapse, (un)select

	gtk_ctree_move (ctree, node, new_parent, new_sibling: POINTER) is
		-- node is a GtkCTreeNode*
		-- new_parent, new_sibling are GtkCTreeNode* 
		external "C"
		end

	gtk_ctree_expand (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_expand_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_expand_to_depth (ctree, node: POINTER; depth: INTEGER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_collapse (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_collapse_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_collapse_to_depth (ctree, node: POINTER; 
				depth: INTEGER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_toggle_expansion (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_toggle_expansion_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_select (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_select_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_unselect (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_unselect_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_real_select_recursive (ctree, node: POINTER;
				state: INTEGER) is
		-- node is a GtkCTreeNode*
		external "C"
		end


feature {NONE}  -- Analogues of GtkCList functions

	gtk_ctree_node_set_text (ctree, node: POINTER; column: INTEGER;
					text: POINTER) is
		-- node is a GtkCTreeNode*
		-- text is a const gchar*
		external "C"
		end

	gtk_ctree_node_set_pixmap (ctree, node: POINTER; column: INTEGER;
				pixmap, mask: POINTER) is
		-- node is a GtkCTreeNode*
		-- pixmap is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_ctree_node_set_pixtext (ctree, node: POINTER; column: INTEGER;
				text: POINTER; spacing: INTEGER;
				pixmap, mask: POINTER) is
		-- node is a GtkCTreeNode*
		-- text is a const gchar*
		-- spacing is a guint8
		-- pixmap is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_ctree_set_node_info (ctree, node, text: POINTER;
				spacing: INTEGER;
				pixmap_closed, mask_closed,
				pixmap_opened, mask_opened: POINTER;
				is_leaf, is_expanded: BOOLEAN) is
		-- node is a GtkCTreeNode*
		-- text is a const gchar*
		-- spacing is a guint8
		-- pixmap_closed, pixmap_opened are GdkPixmap*
		-- mask_closed, mask_opened are GdkBitmap*
		external "C"
		end

	gtk_ctree_node_set_shift (ctree, node: POINTER;
				column, vertical, horizontal: INTEGER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_set_selectable (ctree, node: POINTER; selectable: INTEGER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_get_selectable (ctree, node: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_get_cell_type (ctree, node: POINTER;
				column: INTEGER): INTEGER is
		-- node is a GtkCTreeNode*
		-- returns a GtkCellType constant
		external "C"
		end

	gtk_ctree_node_get_text (ctree, node: POINTER; column: INTEGER;
				text: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		-- text is a gchar**
		external "C"
		end

	gtk_ctree_node_get_pixmap (ctree, node: POINTER; column: INTEGER;
				pixmap, mask: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		-- pixmap is a GdkPixmap**
		-- mask is a GdkBitmap**
		external "C"
		end

	gtk_ctree_node_get_pixtext (ctree, node: POINTER; column: INTEGER;
				text, spacing,
				pixmap, mask: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		-- text is a gchar**
		-- spacing is a guint8*
		-- pixmap is a GdkPixmap**
		-- mask is a GdkBitmap**
		external "C"
		end

	gtk_ctree_get_node_info (ctree, node, text, spacing, pixmap_closed,
				mask_closed, pixmap_opened, mask_opened,
				is_leaf, is_expanded: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		-- text is a gchar**
		-- spacing is a guint8*
		-- pixmap_closed, pixmap_opened are GdkPixmap**
		-- mask_closed, mask_opened are GdkBitmap**
		-- is_leaf, is_expanded are gboolean*
		external "C"
		end

	gtk_ctree_node_set_row_style (ctree, node, style: POINTER) is
		-- node is a GtkCTreeNode*
		-- style is GtkStyle*
		external "C"
		end

	gtk_ctree_node_get_row_style (ctree, node: POINTER): POINTER is
		-- node is a GtkCTreeNode*
		-- returns a GtkStyle*
		external "C"
		end

	gtk_ctree_node_set_cell_style (ctree, node: POINTER;
				column: INTEGER; style: POINTER) is
		-- node is a GtkCTreeNode*
		-- style is GtkStyle*
		external "C"
		end

	gtk_ctree_node_get_cell_style (ctree, node: POINTER;
				column: INTEGER): POINTER is
		-- node is a GtkCTreeNode*
		-- returns a GtkStyle*
		external "C"
		end

	gtk_ctree_node_set_foreground (ctree, node, colour: POINTER) is
		-- node is a GtkCTreeNode*
		-- colour is a GdkColor*
		external "C"
		end

	gtk_ctree_node_set_background (ctree, node, colour: POINTER) is
		-- node is a GtkCTreeNode*
		-- colour is a GdkColor*
		external "C"
		end

	gtk_ctree_node_set_row_data (ctree, node, data: POINTER) is
		-- node is a GtkCTreeNode*
		-- data is a gpointer
		external "C"
		end

	gtk_ctree_node_set_row_data_full (ctree, node,
												 data, destroy_func: POINTER) is
			-- node is a GtkCTreeNode*
			-- data is a gpointer
			-- destroy_func is a GtkDestroyNotify pointer_to_func
		external "C"
		end

	gtk_ctree_node_get_row_data (ctree, node: POINTER): POINTER is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_moveto (ctree, node: POINTER; column: INTEGER;
				row_align, col_align: REAL) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_node_is_visible (ctree, node: POINTER): INTEGER is
		-- node is a GtkCTreeNode*
		-- returns a GtkVisibility constant
		external "C"
		end


feature {NONE} --   GtkCTree specific functions

	gtk_ctree_set_indent (ctree: POINTER; indent: INTEGER) is
		external "C"
		end

	gtk_ctree_set_spacing (ctree: POINTER; spacing: INTEGER) is
		external "C"
		end

	gtk_ctree_set_show_stub (ctree: POINTER; show_stub: INTEGER) is
		external "C"
		end

	gtk_ctree_set_line_style (ctree: POINTER; line_style: INTEGER) is
		-- line_style is a GtkCTreeLineStyle constant
		external "C"
		end

	gtk_ctree_set_expander_style (ctree: POINTER;
				expander_style: INTEGER) is
		-- line_style is a GtkCTreeExpanderStyle constant
		external "C"
		end

-- Cannot directly implement a call with a pointer_to_func
--	gtk_ctree_set_drag_compare_func (ctree: POINTER;
--				GtkCTreeCompareDragFunc  cmp_func) is
--		external "C"
--		end


feature {NONE}  -- Tree sorting functions

	gtk_ctree_sort_node (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

	gtk_ctree_sort_recursive (ctree, node: POINTER) is
		-- node is a GtkCTreeNode*
		external "C"
		end

feature {NONE} -- Access to elements of the structure

	c_gtk_ctree_tree_indent (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_tree_spacing (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_tree_column (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_line_style (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_expander_style (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_show_stub (ct: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_last_text: POINTER is
		external
			"C"
		end

	c_gtk_ctree_last_pixmap: POINTER is
		external
			"C"
		end

	c_gtk_ctree_last_mask: POINTER is
		external
			"C"
		end

	c_gtk_ctree_last_spacing: INTEGER is
		external
			"C"
		end

	c_gtk_ctree_node_get_text (widget, node: POINTER;
										col: INTEGER): INTEGER is
		external
			"C"
		end

	c_gtk_ctree_node_get_pixmap (widget, node: POINTER;
										  col: INTEGER): INTEGER is
		external
			"C"
		end

	c_gtk_ctree_node_get_pixtext (widget, node: POINTER;
											col: INTEGER): INTEGER is
		external
			"C"
		end

end  -- GTK_CTREE_EXTERNALS
