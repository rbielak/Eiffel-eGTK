-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GTK_CTREE - a multi-column tree"
   cvs: "$Id: gtk_ctree.e,v 1.20 2003/01/17 16:26:55 elphick Exp $"

class GTK_CTREE

   -- A multi-column tree widget.  This is a self-scrolling widget;
   -- to get scrollbars, simply make it a child of a GTK_SCROLLED_WINDOW.
   --
   -- Signals (from gtkctree.c):
   --    "change_focus_row_expansion"
   --    "tree_collapse"
   --    "tree_expand"
   --    "tree_move"
   --    "tree_select_row"
   --    "tree_unselect_row"

inherit
	
   GTK_CLIST
      rename
	 make as make_clist,
	 make_with_titles as clist_make_with_titles,
	 clear_list as clear_tree
      redefine
	 selected_row,
	 first_selected_row
      end
	
   GTK_CTREE_EXTERNALS
      undefine
	 copy, is_equal
      end
	
   EGTK_HANDLE_FACTORY
      undefine
	 copy, is_equal
      end
	
	
creation
	
   make,
   make_with_titles,
   make_from_pointer
	
feature

   make_with_titles (columns, a_tree_column: INTEGER; titles: ARRAY [STRING]) is
	 -- Create a new GTK_CTREE with <columns> columns; the tree
	 -- graphic is drawn in column <tree_column> (the first column
	 -- is numbered 0). The column headings are initialised from
	 -- the string array.
      require
	 columns_valid: columns > 0
	 tree_column: a_tree_column >= 0
      do
	 widget := npc.np_gtk_ctree_new_with_titles (columns, a_tree_column, titles)
	 register_widget
      end
	
   make (columns, a_tree_column : INTEGER) is 
	 -- Create a new GTK_CTREE with <columns> columns; the tree
	 -- graphic is drawn in column <tree_column> (the first column
	 -- is numbered 0).
      require
	 columns_valid: columns > 0
	 tree_column: a_tree_column >= 0
      do
	 widget := gtk_ctree_new (columns, a_tree_column)
	 register_widget
      end
	
feature -- 
	
	
   insert_node (parent_node, sibling : GTK_CTREE_NODE; 
		text : ARRAY[STRING]; spacing : INTEGER; 
		pixmap_closed : GDK_PIXMAP; mask_closed : GDK_BITMAP;
		pixmap_opened : GDK_PIXMAP; mask_opened : GDK_BITMAP;
		is_leaf : BOOLEAN; is_expanded : BOOLEAN ) : GTK_CTREE_NODE is
	 -- Insert a new node into the tree.  If <parent_node> is Void,
	 -- the node will be at the root of the tree; if <sibling> is
	 -- null, the node will be at the end of the list of nodes
	 -- for its parent, otherwise it will be inserted just before
	 -- its sibling.  The strings in <text> will appear in successive
	 -- column to the right of the pixmap. <spacing> is the width
	 -- in pixels of extra space between pixmap and text.
	 -- The respective pixmaps are shown when the node is collapsed or
	 -- expanded, and the masks are applied to those pixmaps.
	 -- If the node is to be a leaf (that is, it will have no
	 -- children), <is_leaf> should be set to True.  If <is_expanded>
	 -- is True, the node will first be shown expanded; if False
	 -- the node will be shown collapsed.
	 -- Insert_node returns a C pointer to the node just 
	 -- created
      require
	 parent_not_leaf: parent_node /= Void implies not parent_node.is_leaf
      local
	 pp, sp: POINTER
	 pp1, pp2: POINTER
	 mm1, mm2: POINTER
      do
	 if parent_node /= Void then
	    pp := parent_node.ctree_node
	 end
	 if sibling /= Void then
	    sp := sibling.ctree_node
	 end
	 if pixmap_closed /= Void then
	    pp1 := pixmap_closed.pixmap
	 end
	 if pixmap_opened /= Void then
	    pp2 := pixmap_opened.pixmap
	 end
	 if mask_closed /= Void then
	    mm1 := mask_closed.bitmap
	 end
	 if mask_opened /= Void then
	    mm2 := mask_opened.bitmap
	 end
	 create Result.make_from_pointer (npc.np_gtk_ctree_insert_node (widget, pp, sp,
								   text,
								   spacing,
								   pp1, mm1,
								   pp2, mm2,
								   is_leaf, 
								   is_expanded ))
      end
	
   remove_node (node: GTK_CTREE_NODE) is
	 -- Removes the node and all its descendants
      require
	 node_not_void: node /= Void
      do
	 gtk_ctree_remove_node (widget, node.ctree_node )
      end
	
   --    insert_gnode ( parent_node : POINTER; sibling : POINTER; gnode : POINTER; func : POINTER; data : POINTER ) : POINTER is
   --       do
   --          Result := gtk_ctree_insert_gnode ( widget, parent_node, sibling, gnode, func, data )
   --       end
	
   --    export_to_gnode ( parent_node : POINTER; sibling : POINTER; node : POINTER; func : POINTER; data : POINTER ) : POINTER is
   --       do
   --          Result := gtk_ctree_export_to_gnode ( widget, parent_node, sibling, node, func, data )
   --       end
	
   --    post_recursive ( node : POINTER; func : POINTER; data : POINTER ) is
   --       do
   --          gtk_ctree_post_recursive ( widget, node, func, data )
   --       end
	
   --    post_recursive_to_depth ( node : POINTER; depth : INTEGER; func : POINTER; data : POINTER ) is
   --       do
   --          gtk_ctree_post_recursive_to_depth ( widget, node, depth, func, data )
   --       end
	
   --    pre_recursive ( node : POINTER; func : POINTER; data : POINTER ) is
   --       do
   --          gtk_ctree_pre_recursive ( widget, node, func, data )
   --       end
	
   --    pre_recursive_to_depth ( node : POINTER; depth : INTEGER; func : POINTER; data : POINTER ) is
   --       do
   --          gtk_ctree_pre_recursive_to_depth ( widget, node, depth, func, data )
   --       end
	
   is_viewable (node : GTK_CTREE_NODE) : BOOLEAN is
	 -- True if all the parents of this node are expanded
      require
	 node_not_void: node /= Void
      do
	 Result := gtk_ctree_is_viewable (widget, node.ctree_node)
      end
	
   last (node: GTK_CTREE_NODE): GTK_CTREE_NODE is
	 -- The last child of the bottommost descendant of node
      require
	 node_not_void: node /= Void
      local
	 np: POINTER
      do
	 np := gtk_ctree_last (widget, node.ctree_node)
	 Result ?= registered (np)
	 if Result = Void then
	    create Result.make_from_pointer (np)
	 end
      end
	
   find_node_ptr (ctree_row: POINTER): POINTER is
	 -- Given a row, find the associated node
      do
	 Result := gtk_ctree_find_node_ptr ( widget, ctree_row )
      end
	
   node_nth (row: INTEGER ): GTK_CTREE_NODE is
	 -- returns the node associated with the specified row 
	 -- number 
      require
	 row_valid: row >= 0
      local
	 np: POINTER
      do
	 np := gtk_ctree_node_nth (widget, row)
	 Result ?= registered (np)
	 if Result = Void then
	    create Result.make_from_pointer (np);
	 end
      end

   node_parent(node: GTK_CTREE_NODE): GTK_CTREE_NODE is
      require
	 node /= Void
      do
	 Result := node.data_as_ctree_row.parent
      end

   node_sibling(node: GTK_CTREE_NODE): GTK_CTREE_NODE is
      require
	 node /= Void
      do
	 Result := node.data_as_ctree_row.sibling
      end

   node_child(node: GTK_CTREE_NODE): GTK_CTREE_NODE is
      require
	 node /= Void
      do
	 Result := node.data_as_ctree_row.child
      end
	
   find (node, a_child: GTK_CTREE_NODE): BOOLEAN is
	 -- True if child is a descendant of node
      require
	 node_not_void: node /= Void
	 a_child_not_void: a_child /= Void
      do
	 Result := gtk_ctree_find (widget, node.ctree_node, a_child.ctree_node)
      end
	
   is_ancestor (node, a_child: GTK_CTREE_NODE): BOOLEAN is
	 -- True if node is an ancestor of child
	 -- [NB: this seems to be semantically identical to find();
	 -- is that correct?]
      require
	 node_not_void: node /= Void
	 a_child_not_void: a_child /= Void			
      do
	 Result := gtk_ctree_is_ancestor (widget, node.ctree_node, a_child.ctree_node)
      end
	
   find_by_row_data (node: GTK_CTREE_NODE; data : POINTER ): GTK_CTREE_NODE is
	 -- Returns a node associated with the given data pointer
      require
	 node_not_void: node /= Void 
      local
	 np: POINTER
      do
	 np := gtk_ctree_find_by_row_data (widget, node.ctree_node, data)
	 Result ?=  registered (np)
	 if Result /= Void then
	    create Result.make_from_pointer (np)
	 end
      end
	
   find_all_by_row_data (node: GTK_CTREE_NODE; data : POINTER): G_LIST is
	 -- Returns an array of all nodes with the given data 
	 -- pointer
      require
	 node_not_void: node /= Void
      local
	 np: POINTER
      do
	 np := gtk_ctree_find_all_by_row_data (widget, node.ctree_node, data)
	 Result ?= registered (np)
	 if Result /= Void then
	    create Result.make_from_pointer (np)
	 end
      end
	
   --    find_by_row_data_custom ( node : POINTER; data : POINTER; func : POINTER ) : POINTER is
   --   			-- Return a node for which func() is satisfied
   --       do
   --          Result := gtk_ctree_find_by_row_data_custom ( widget, node, data, func )
   --       end
	
   --    find_all_by_row_data_custom ( node : POINTER; data : POINTER; func : POINTER ) : POINTER is
   --   			-- Return all nodes for which func() is satisfied
   --       do
   --          Result := gtk_ctree_find_all_by_row_data_custom ( widget, node, data, func )
   --       end
	
   is_hot_spot (x: INTEGER; y: INTEGER): BOOLEAN is
	 -- True if the coordinates (x,y) lie on an expander button
      do
	 Result := gtk_ctree_is_hot_spot ( widget, x, y )
      end
	
   move (node, new_parent, new_sibling: GTK_CTREE_NODE) is
	 -- move node to be under new_parent and before new_sibling
      require
	 node_not_void: node /= Void
	 new_parent_not_void: new_parent /= Void
	 new_sibling_not_void: new_sibling /= Void
      do
	 gtk_ctree_move ( widget, node.ctree_node, 
			  new_parent.ctree_node,
			  new_sibling.ctree_node )
      end
	
   expand (node: GTK_CTREE_NODE) is
	 -- expand the given node
      require
	 node_not_void: node /= Void			
      do
	 gtk_ctree_expand (widget, node.ctree_node)
      end
	
   expand_recursive (node: GTK_CTREE_NODE) is
	 -- expand the given node and all its descendants, if node 
	 -- is Void the tree is expanded from the root
      local
	 np: POINTER
      do
	 if node /= Void then
	    np := node.ctree_node
	 end
	 gtk_ctree_expand_recursive (widget, np)
      end
	
   expand_to_depth (node: GTK_CTREE_NODE; depth: INTEGER) is
	 -- expand the given node and all its descendants up to <depth>
	 -- levels down
      require
	 node_not_void: node /= Void 
      do
	 gtk_ctree_expand_to_depth (widget, node.ctree_node, depth )
      end
	
   collapse (node: GTK_CTREE_NODE) is
	 -- collapse the given node
      require
	 node_not_void: node /= Void 
      do
	 gtk_ctree_collapse (widget, node.ctree_node)
      end
	
   collapse_recursive (node: GTK_CTREE_NODE) is
	 -- collapse the given node and all its descendants
      local
	 np: POINTER
      do
	 if node /= Void then
	    np := node.ctree_node
	 end
	 gtk_ctree_collapse_recursive (widget, np)
      end
	
   collapse_to_depth (node: GTK_CTREE_NODE; depth: INTEGER) is
	 -- collapse the given node and all its descendants up to <depth>
	 -- levels down
      require
	 node_not_void: node /= Void 
      do
	 gtk_ctree_collapse_to_depth (widget, node.ctree_node, depth )
      end
	
   toggle_expansion (node: GTK_CTREE_NODE) is
	 -- expand/collapse the node
      require
	 node_not_void: node /= Void
      do
	 gtk_ctree_toggle_expansion (widget, node.ctree_node)
      end
	
   toggle_expansion_recursive (node: GTK_CTREE_NODE) is
	 -- expand/collapse the node and all its descendants
      require
	 node_not_void: node /= Void
      do
	 gtk_ctree_toggle_expansion_recursive (widget, node.ctree_node)
      end
	
   select_node (node: GTK_CTREE_NODE) is
         -- select the given node and cause the appropriate signal to
         -- be emitted
      require
	 node_not_void: node /= Void
      do
	 gtk_ctree_select (widget, node.ctree_node)
      end
	
   select_recursive (node: GTK_CTREE_NODE) is
	 -- select the given node and all its descendants and cause
	 -- the appropriate signal to be emitted. If argument is 
	 -- Void we start at the root of the tree
      local
	 nodep: POINTER
      do
	 if node /= Void then
	    nodep := node.ctree_node
	 end
	 gtk_ctree_select_recursive (widget, nodep)
      end
	
   unselect (node: GTK_CTREE_NODE) is
	 -- unselect the given node and cause the appropriate signal to
	 -- be emitted
      do
	 gtk_ctree_unselect (widget, node.ctree_node)
      end
	
   unselect_recursive (node: GTK_CTREE_NODE) is
	 -- unselect the given node and all its descendants and cause
	 -- the appropriate signal to be emitted
      local
	 nodep: POINTER
      do
	 if node /= Void then
	    nodep := node.ctree_node
	 end
	 gtk_ctree_unselect_recursive (widget, nodep)
      end
	
   real_select_recursive (node: GTK_CTREE_NODE; state: INTEGER) is
         -- select or unselect the given node and all its descendants
         -- and cause the appropriate signal to be emitted. If state
         -- is True, the node is selected else it is unselected.
      require
	 node_not_void: node /= Void
      do
	 gtk_ctree_real_select_recursive (widget, node.ctree_node, state)
      end

   first_selected_node: GTK_CTREE_NODE is
	 -- the first node in the current selection
      do
	 if selection /= Void then
	    create Result.make_from_pointer(selection.data_as_pointer)
	 end
      end
	
feature -- Iteration through the selection

   selected_node: GTK_CTREE_NODE is
	 -- for GtkCList, selection is a list of integer row numbers
	 -- This feature requires the iteration to have been 
	 -- initialised with selection_start.
      require
	 something_selected: not selection_off
      do
	 create Result.make_from_pointer(selected_item.data_as_pointer)
      end

feature {NONE}

   selected_row: INTEGER is
	 -- This inherited feature is not usable in GTK_CTREE
      do
	 Result := -1
      end

   first_selected_row: INTEGER is
	 -- This inherited feature is not usable in GTK_CTREE
      do
	 Result := -1
      end

feature
	
   node_set_text (node: GTK_CTREE_NODE; column: INTEGER; text: STRING) is
	 -- Set the text for the given cell (node+column)
      do
	 npc.np_gtk_ctree_node_set_text (widget, node.ctree_node,
					 column, text)
      end
	
   node_set_pixmap (node: GTK_CTREE_NODE; column: INTEGER;
		    pixmap: GDK_PIXMAP) is
	 -- Set a pixmap for the given cell
      do
	 gtk_ctree_node_set_pixmap (widget, node.ctree_node, column,
				    pixmap.pixmap, pixmap.mask.bitmap)
      end
	
   node_set_pixtext (node: GTK_CTREE_NODE; column: INTEGER; 
		     text: STRING; spacing: INTEGER; pixmap: GDK_PIXMAP) is
         -- Set text and a pixmap for the given cell
      do
	 npc.np_gtk_ctree_node_set_pixtext (widget, node.ctree_node, column,
					    text, spacing, pixmap)
      end
	
   set_node_info ( node : POINTER; text : POINTER; spacing : INTEGER; pixmap_closed : POINTER; mask_closed : POINTER; pixmap_opened : POINTER; mask_opened : POINTER; is_leaf : BOOLEAN; is_expanded : BOOLEAN ) is
	 -- TODO: not properly iplemented yet
         -- Alters the information set by insert_node() when node was
         -- created
      do
	 gtk_ctree_set_node_info (widget, node, text, spacing, pixmap_closed, mask_closed, pixmap_opened, mask_opened, is_leaf, is_expanded)
      end
	
   node_set_shift (node: GTK_CTREE_NODE;
		   column,vertical,horizontal: INTEGER) is
         -- Shift the given cell the given amounts in pixels.
      do
	 gtk_ctree_node_set_shift (widget, node.ctree_node, 
				   column, vertical, horizontal)
      end
	
   node_set_selectable (node: GTK_CTREE_NODE; selectable: BOOLEAN ) is
	 -- If selectable is True, this node can be selected by the
	 -- user
      require
	 node_not_void: node /= Void
      local
	 i: INTEGER
      do
	 if selectable then
	    i := 1
	 end
	 gtk_ctree_node_set_selectable (widget, node.ctree_node, i)
      end
	
   node_get_selectable (node: GTK_CTREE_NODE) : BOOLEAN is
         -- True if this node can be selected by the user
      do
	 Result := (gtk_ctree_node_get_selectable (widget, node.ctree_node) /= 0)
      end
	
   node_get_cell_type (node: GTK_CTREE_NODE; column : INTEGER ): INTEGER is
         -- Returns the cell type, which is one of these:
         --  Gtk_cell_empty,
         --  Gtk_cell_text,
         --  Gtk_cell_pixmap,
         --  Gtk_cell_pixtext,
         --  Gtk_cell_widget
      do
	 Result := gtk_ctree_node_get_cell_type (widget,
						 node.ctree_node,
						 column)
      ensure
	 in_range: Result >= Gtk_cell_empty and Result <= Gtk_cell_widget
      end

   node_get_text (node: GTK_CTREE_NODE; column: INTEGER) is
	 -- If the specified cell contains only text, the text is copied to 
	 -- last_text and last_get_succeeded is set to True.  If the 
	 -- cell does not contain text, last_text is unchanged and 
	 -- last_get_succeeded is set to False.
      do
	 last_get_succeeded := (c_gtk_ctree_node_get_text (widget,
							   node.ctree_node,
							   column) /= 0)
	 if last_get_succeeded then
	    last_text := npc.np_gtk_ctree_last_text
	 end
      end
	
   node_get_pixmap (node: GTK_CTREE_NODE; column: INTEGER) is
	 -- If the specified cell contains only a pixmap, the pixmap 
	 -- and its mask are copied to last_pixmap and    
	 -- last_get_succeeded is set to True.  If the cell does not  
	 -- contain a pixmap, last_pixmap is left unchanged and 
	 -- last_get_succeeded is set to False.
      do
	 last_get_succeeded := (c_gtk_ctree_node_get_pixmap (widget,
							     node.ctree_node,
							     column) /= 0)
	 if last_get_succeeded then
	    create last_pixmap.make_from_pointers(c_gtk_ctree_last_pixmap,
					     c_gtk_ctree_last_mask)
	 end
      end
	
   node_get_pixtext (node: GTK_CTREE_NODE; column: INTEGER) is
	 -- If the specified cell contains both text and a pixmap, the 
	 -- text is copied to last_text, the pixmap  and its mask to     
	 -- last_pixmap and last_get_succeeded is set to True. 
	 -- If the cell does not contain both text and a pixmap,
	 -- last_text and last_pixmap are left unchanged and 
	 -- last_get_succeeded is set to False.
      do
	 last_get_succeeded := (c_gtk_ctree_node_get_pixtext (widget,
							      node.ctree_node,
							      column) /= 0)
	 if last_get_succeeded then
	    last_text := npc.np_gtk_ctree_last_text
	    create last_pixmap.make_from_pointers(c_gtk_ctree_last_pixmap,
					     c_gtk_ctree_last_mask)
	 end
      end
	
   get_node_info ( node : POINTER; text : POINTER; spacing : POINTER; pixmap_closed : POINTER; mask_closed : POINTER; pixmap_opened : POINTER; mask_opened : POINTER; is_leaf : POINTER; is_expanded : POINTER ) : INTEGER is
	 -- Returns into the parameters the current status of the node
	 -- (being the information with which it was initialised)
	 -- TODO: convert this to proper Eiffel style and make it work
      do
	 Result := gtk_ctree_get_node_info ( widget, node, text, spacing, pixmap_closed, mask_closed, pixmap_opened, mask_opened, is_leaf, is_expanded )
      end
	
   node_set_row_style (node: GTK_CTREE_NODE; new_style: GTK_STYLE) is
	 -- Set the style for cells in this node
      require
	 node_not_void: node /= Void
	 style_not_void: new_style /= void
      do
	 gtk_ctree_node_set_row_style (widget, node.ctree_node, new_style.style)
      end
	
   node_get_row_style (node: GTK_CTREE_NODE): GTK_STYLE is
	 -- Get the style for cells in this node
      do
	 create Result.make_from_pointer (
				     gtk_ctree_node_get_row_style (widget, node.ctree_node))
      end
	
   node_set_cell_style (node: GTK_CTREE_NODE; column: INTEGER;
			new_style: GTK_STYLE) is
	 -- Set the style for the specified cell
      require
	 node_not_void: node /= Void
	 style_not_void: new_style /= void
      do
	 gtk_ctree_node_set_cell_style (widget, node.ctree_node,
					column, new_style.style)
      end
	
   node_get_cell_style (node: GTK_CTREE_NODE; column: INTEGER ): GTK_STYLE is
	 -- Get the style for the specified cell
      do
	 create Result.make_from_pointer (
				     gtk_ctree_node_get_cell_style (widget, node.ctree_node, column))
      end
	
   node_set_foreground (node: GTK_CTREE_NODE; color: GDK_COLOR) is
	 -- Set the node's foreground colour
      do
	 gtk_ctree_node_set_foreground (widget, node.ctree_node, color.color)
      end
	
   node_set_background (node: GTK_CTREE_NODE; color: GDK_COLOR) is
	 -- Set the node's background colour
      require
	 node_not_void: node /= Void
	 color_not_void: color /= Void
      do
	 gtk_ctree_node_set_background (widget, node.ctree_node, color.color)
      end
	
   node_set_row_data_full (node: GTK_CTREE_NODE; data: EGTK_EXPORTABLE ) is
	 -- Set the custom data associated with a node.
	 -- This uses the full interface to setting row data, so that
	 -- a destructor can be given for the data.  The destructor 
	 -- is pointed to by (EGTK_EXPORTABLE c_pointer_to_free).
      require
	 node_not_void: node /= Void
	 data_exported: data /= Void and then data.c_object /= default_pointer
      do
	 gtk_ctree_node_set_row_data_full (widget,
					   node.ctree_node,
					   data.c_object,
					   data.c_pointer_to_free)
      end
	
   node_get_row_data (node: GTK_CTREE_NODE): EGTK_EXPORTABLE is
	 -- Get the row data associated with a node
      do
	 create Result.make_from_pointer(gtk_ctree_node_get_row_data(
								widget, node.ctree_node))
      end
	
   node_moveto (node: GTK_CTREE_NODE; column: INTEGER;
		row_align, col_align: REAL) is
	 -- Make visible the specified column of the specified node.
	 -- <node> and <column> specify which to make visible; 
	 -- <row_align> and <col_align> specify where in the window 
	 -- the row and column should appear by means of a decimal 
	 -- number between 0 and 1, indicating top to bottom and left 
	 -- to right respectively..
      require
	 row_aligned: row_align >= 0 and row_align <= 1
	 col_aligned: col_align >= 0 and col_align <= 1
      do
	 gtk_ctree_node_moveto (widget, node.ctree_node, column,
				row_align, col_align )
      end
	
   node_is_visible (node: GTK_CTREE_NODE): BOOLEAN is
	 -- Returns the visibility state of the node.
	 -- Result is one of:
	 --		 Gtk_visibility_none,
	 --		 Gtk_visibility_partial,
	 --		 Gtk_visibility_full
      do
	 Result := (gtk_ctree_node_is_visible (widget, node.ctree_node) /= 0)
      end
	
   set_indent (indent: INTEGER) is
	 -- Set the number of pixels by which each successive level 
	 -- of the tree is to be shifted right
      do
	 gtk_ctree_set_indent ( widget, indent )
      end
	
   set_spacing (spacing : INTEGER) is
	 -- Set the spacing between the tree graphic and the actual   
	 -- node content.
      do
	 gtk_ctree_set_spacing (widget, spacing)
      end
	
   set_show_stub (a_show_stub: BOOLEAN ) is
	 -- ???
      local
	 i: INTEGER
      do
	 if a_show_stub then
	    i := 1
	 end
	 gtk_ctree_set_show_stub (widget, i)
      end
	
   set_line_style (a_line_style: INTEGER) is
	 -- set the style of the lines that connect nodes of the 
	 -- tree. See gtk_ctree_enum for options
      require
	 in_range: a_line_style >= Gtk_ctree_lines_none and
		   a_line_style <= Gtk_ctree_lines_tabbed
      do
	 gtk_ctree_set_line_style (widget, a_line_style)
      end
	
   set_expander_style (an_expander_style: INTEGER) is
      require
	 in_range: an_expander_style >= Gtk_ctree_expander_none and
		   an_expander_style <= Gtk_ctree_expander_circular
      do
	 gtk_ctree_set_expander_style (widget, an_expander_style)
      end
	
   --    set_drag_compare_func (cmp_func: POINTER) is
   --       do
   --          gtk_ctree_set_drag_compare_func (widget, cmp_func)
   --       end
	
   sort_node (node: GTK_CTREE_NODE) is
	 -- Sort the children of a node. See GtkCList for how to 
	 -- set the sorting criteria etc.
      local
	 np: POINTER
      do
	 if node /= Void then
	    np := node.ctree_node
	 end
	 gtk_ctree_sort_node (widget, np)
      end
	
   sort_recursive (node: GTK_CTREE_NODE) is
	 -- Sort the descendants of a node. See GtkCList for how to set the 
	 -- sorting criteria etc.
      local
	 np: POINTER
      do
	 if node /= Void then
	    np := node.ctree_node
	 end
	 gtk_ctree_sort_recursive (widget, np)
      end

feature -- outputs of node_get... procedures
	
   last_text: STRING
	
   last_pixmap: GDK_PIXMAP
	
   last_get_succeeded: BOOLEAN
	
feature -- fields in gtk_ctree structure

   tree_indent: INTEGER is
      do
	 Result := c_gtk_ctree_tree_indent (widget)
      end

   tree_spacing: INTEGER is
      do
	 Result := c_gtk_ctree_tree_spacing (widget)
      end

   tree_column: INTEGER is
      do
	 Result := c_gtk_ctree_tree_column (widget)
      end

   line_style: INTEGER is
      do
	 Result := c_gtk_ctree_line_style (widget)
      end

   expander_style: INTEGER is
      do
	 Result := c_gtk_ctree_expander_style (widget)
      end

   show_stub: INTEGER is
      do
	 Result := c_gtk_ctree_show_stub (widget)
      end


end -- GTK_CTREE
