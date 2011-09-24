-- Copyright 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CLIST - a compound list (containing cells rather %
		     %than just rows)"
	cvs: "$Id: gtk_clist.e,v 1.24 2003/01/11 19:32:51 elphick Exp $"

class GTK_CLIST

-- A GTK_CLIST contains rows of cells.  It is a self-scrolling widget; to get
-- scrollbars, simply make it a child of a GTK_SCROLLED_WINDOW
	-- Signals (from gtkclist.c):
	--    "abort_column_resize"     -
	--    "click_column"            -
	--    "end_selection"           -
	--    "extend_selection"        -
	--    "resize_column"           -
	--    "row_move"                -
	--    "scroll_horizontal"       -
	--    "scroll_vertical"         -
	--    "select_all"              -
	--    "select_row"              -
	--    "set_scroll_adjustments"  -
	--    "start_selection"         -
	--    "toggle_add_mode"         -
	--    "toggle_focus_row"        -
	--    "undo_selection"          -
	--    "unselect_all"            -
	--    "unselect_row"            -

inherit
	
	GTK_CONTAINER
		redefine
			make_from_pointer
		end
	
	GTK_CLIST_EXTERNALS
		undefine
			is_equal, copy
		end
	
	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end
	
	EGTK_HANDLE_FACTORY
		undefine
			is_equal, copy
		end

creation

	make,
	make_with_titles,
	make_from_pointer

feature -- Creation

	make(c: INTEGER) is
			-- make a new empty widget
		require
			sane_cols: c > 0 
		do
			widget := gtk_clist_new(c);
			index_row := -1;
			register_widget
		ensure
			col_count: column_count = c
			no_rows: row_count = 0
		end

	make_with_titles(sa: ARRAY[STRING]) is
			-- make a new empty widget and give it column
			-- headings
		require
		   has_titles: sa /= Void and then not (sa.count = 0)
		do
			widget := npc.np_gtk_clist_new_with_titles(sa);
			index_row := -1;
			register_widget
		ensure
			col_count: column_count = sa.count
			no_rows: row_count = 0
		end

	make_from_pointer(cl: POINTER) is
			-- make from an existing GTK+ widget pointer
		do
			Precursor(cl);
			move_to(0,0,0,0);
			index_row := -1;
			register_widget
		end


feature -- Attributes

	hadjustment: GTK_ADJUSTMENT

	vadjustment: GTK_ADJUSTMENT

	index_row: INTEGER

	buttons: ARRAY[GTK_BUTTON]

	last_tot_width: INTEGER
		-- set by autosize_columns to the total width assigned
		-- to all the columns

feature -- Commands

	freeze is
			-- stop updates happening as they occur; use this
			-- if a large number of updates are being done at
			-- once, when displaying them will be a visual
			-- nuisance
		do
			gtk_clist_freeze (widget)
		end

	thaw is
			-- start updates happening as they occur
		do
			gtk_clist_thaw (widget)
		end

	show_column_titles is
			-- reveal column headings
		do
			gtk_clist_column_titles_show (widget)
		end

	hide_column_titles is
			-- hide column headings
		do
			gtk_clist_column_titles_hide (widget)
		end

	autosize_columns is
			-- autoresize all columns to the width of their largest
			-- elements
		do
			last_tot_width := gtk_clist_columns_autosize (widget)
		end

	clear_list is
			-- delete all rows from the list
		do
			gtk_clist_clear (widget)
			index_row := -1
		ensure
			no_rows: row_count = 0
			is_off: off
		end

	set_compare_function(func: POINTER) is
			-- Set the sort comparison function.  <func> must be a procedure
			-- exported to C by Cecil (or be a native C function).  In either 
			-- case you will need an Eiffel feature that returns a 
			-- pointer to it.  It must take three pointer arguments: 
			-- (GtkCList *) and 2 gconstpointers that can be cast to    
			-- (GtkCListRow *). It must return an integer in the range 
			-- -1 to 1, meaning:
			-- -1 = row1 < row2
			--  0 = row1 = row2
			--  1 = row1 > row2
      do
		  gtk_clist_set_compare_func (widget, func)
      end

	set_sort_column (c: INTEGER) is
			-- set the column which will be used for sorting
			-- the list
		require
			good_column: valid_column(c)
		do
			gtk_clist_set_sort_column (widget, c)
		end

	sort_column: INTEGER is
		do
			Result := c_gtk_clist_sort_column (widget)
		end

	set_sort_ascending is
			-- set sort to ascending
		do
			gtk_clist_set_sort_type (widget, Gtk_sort_ascending)
		end

	is_sort_ascending: BOOLEAN is
		do
			Result := sort_type = Gtk_sort_ascending
		end

	set_sort_descending is
			-- set sort to descending
		do
			gtk_clist_set_sort_type (widget, Gtk_sort_descending)
		end

	sort_type: INTEGER is
		do
			Result := c_gtk_clist_sort_type (widget)
		end

	set_auto_sort (f: BOOLEAN) is
			-- if f is True, sort automatically when rows are
			-- inserted
		do
			gtk_clist_set_auto_sort (widget, f)
		end

	sort is
			-- sort the list by "sort_column"
		do
			gtk_clist_sort (widget)
		end

feature -- row commands

	row_list: G_LIST is
			-- visible rows
		local
			p: POINTER
		do
			p := c_gtk_clist_row_list (widget)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

	focus_row: INTEGER is
		do
			Result := c_gtk_clist_focus_row (widget)
		end

	move_to (r, c: INTEGER; row_align, col_align: REAL) is
			-- scroll the viewing area of the list to the given
			-- column and row; row_align and col_align are between
			-- 0.0 and 1.0, representing where the row should
			-- appear on the screen, 0.0 being top or left, 1.0
			-- being bottom or right; if row or column is -1 then
			-- there is no change
		require
			good_row: valid_row(r)
			good_col: c >= -1 and c < column_count
			good_row_align: row_align >= 0.0 and row_align <= 1.0
			good_col_align: col_align >= 0.0 and col_align <= 1.0
		do
			gtk_clist_moveto (widget, r, c, row_align, col_align)
		end

	prepend_row (ar: ARRAY[STRING]) is
			-- insert a new row at the start of the list
			-- (if autosort is in effect, it may not stay there)
			-- index_row is set to the row actually inserted
		require
			row_text: ar /= Void and not (ar.count = 0)
		do
			index_row := npc.np_gtk_clist_prepend (widget, ar)
		ensure
			sane_index: index_row >= 0 and index_row < row_count
		end

	append_row (ar: ARRAY[STRING]) is
			-- add a new row at the end of the list
			-- (if autosort is in effect, it may not stay there)
		require
			row_text: ar /= Void and not (ar.count = 0)
		do
			index_row := npc.np_gtk_clist_append (widget, ar)
		ensure
			sane_index: index_row >= 0 and index_row < row_count
		end

	insert_row (r: INTEGER; ar: ARRAY[STRING]) is
			-- add a new row at row r and set index_row to
			-- the row where it was actually inserted (may be
			-- different from r in auto_sort mode)
		require
			good_row: valid_row(r)
			row_text: ar /= Void and not (ar.count = 0)
		do
			index_row := npc.np_gtk_clist_insert (widget, r, ar)
		ensure
			sane_index: index_row >= 0 and index_row < row_count
		end

	delete_row (r: INTEGER) is
			-- remove the row numbered r
		require
			good_row: valid_row(r)
		do
			gtk_clist_remove(widget, r)
			if index_row >= row_count then
				index_row := row_count - 1
			end
		ensure
			-- don't forget the empty list case
			sane_index: (row_count = 0) 
						or else (index_row >= 0 and index_row < row_count)
		end

	swap_rows (r1, r2:INTEGER) is
			-- exchange two rows
		require
			no_sort: autosorting = False
			good_row1: r1 >= 0 and r1 < row_count
			good_row2: r2 >= 0 and r2 < row_count
		do
			gtk_clist_swap_rows (widget, r1, r2)
		end

	move_row (r1, r2:INTEGER) is
			-- move row r1 in front of the row at position r2
		require
			no_sort: autosorting = False
			good_row1: r1 >= 0 and r1 < row_count
			good_row2: r2 >= 0 and r2 <= row_count
		do
			gtk_clist_row_move (widget, r1, r2)
		end

	set_row_data (r: INTEGER; d: EGTK_EXPORTABLE) is
			-- Set the data associated with row r to d.
		require
			good_row: valid_row(r)
		do
			gtk_clist_set_row_data_full (widget,
						     r,
						     d.c_object,
						     d.c_pointer_to_free)
		end

feature -- selection

	select_all is
			-- select all rows
		do
			gtk_clist_select_all (widget)
		end

	unselect_all is
			-- unselect all rows
		do
			gtk_clist_unselect_all (widget)
			selected_item := Void
		end
	

	select_row (r: INTEGER) is
			-- force the specified row to be selected
		require
			good_row: valid_row(r)
		do
			gtk_clist_select_row (widget, r, 0)
		ensure
			-- row_sel: row_is_selected(r)
		end

	unselect_row (r: INTEGER) is
			-- force the specified row to be unselected
		require
			good_row: valid_row(r)
		do
			gtk_clist_unselect_row (widget, r, 0)
		ensure
			-- row_sel: not row_is_selected(r)
		end

	undo_selection is
			-- undo the last selection or unselection
		do
			gtk_clist_undo_selection (widget)
		end

	first_selected_row: INTEGER is
			-- the first row in the current selection
		require
			something_selected: selected_item /= Void
		do
			Result := converted_selection_pointer(selection)
		ensure
			in_range: Result >= 0 and Result < row_count
		end
	
feature -- Iteration through the selection

	selected_row: INTEGER is
			-- for GtkCList, selection is a list of integer row numbers
		require
			something_selected: not selection_off
		do
			Result := converted_selection_pointer(selected_item)
		ensure
			in_range: Result >= 0 and Result < row_count
		end

	selected_item: G_LIST
	
   selection_start is
      do
			selected_item := selection
      end
	
   selection_forth is
      require
			in_list: not selection_off
      do
			selected_item := selected_item.next
      end
	
   selection_back is
      do
			if selection_off then
				selected_item := selection_end
			else
				selected_item := selected_item.previous
			end
      end
	
   selection_off: BOOLEAN is
      do
			Result := (selected_item = Void)
      end

	selection_nth(i: INTEGER): like selected_item is
		require
			i >= 0
		local
			c: INTEGER
		do
			if selection /= Void then
				from
					selection_start
					c := 0
				variant
					i - c + 1
				until
					i = c or selection_off
				loop
					selected_item := selection.next
					c := c + 1
				end
			end
		end

feature

	selection: G_LIST is
			-- currently selected rows
		local
			p: POINTER
			gl: G_LIST
		do
			p := c_gtk_clist_selection (widget)
			if p /= default_pointer then
				gl ?= registered (p)
				if gl = Void then
					create gl.make_from_pointer (p)
				end
				Result := gl
			end
		end
	
	selection_end: G_LIST is
			-- selection in reverse order (???)
		local
			p: POINTER
		do
			p := c_gtk_clist_selection_end (widget)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

		  
feature -- selection of a single cell
 
    cell_selected_row: INTEGER
 
    cell_selected_col: INTEGER
 
    get_selection_info(eb: GDK_EVENT_BUTTON) is
 	 -- find out the cell where the selection button press occurred
 	 -- sets cell_selected_row and cell_selected_col; they are set 
 	 -- to -1 if there was no information to be had
       require
 	 good_event: eb /= Void
       local
 	 x, y: INTEGER
       do
 	 cell_selected_row := -1
 	 cell_selected_col := -1
 	 x := eb.x.truncated_to_integer
 	 y := eb.y.truncated_to_integer
 	 c_gtk_clist_get_selection_info(widget, x, y)
 	 cell_selected_row := c_cell_selected_row
 	 cell_selected_col := c_cell_selected_col
       end
    

feature {NONE}

	converted_selection_pointer(gl: G_LIST): INTEGER is
		require
			something_selected: gl /= Void
		do
			Result := selected_item.data_as_integer
		end

feature -- Set characteristics

	set_hadjustment(adj: GTK_ADJUSTMENT) is
			-- set the adjustment that can control a horizontal
			-- scrollbar
		require
			good_adj: adj /= Void
		do
			gtk_clist_set_hadjustment (widget, adj.adjustment)
			hadjustment := adj
		ensure
			hadj_cset: gtk_clist_get_hadjustment(widget) = adj.adjustment
			hadj_set: hadjustment = adj
		end

	set_vadjustment(adj: GTK_ADJUSTMENT) is
			-- set the adjustment that can control a vertical
			-- scrollbar
		require
			good_adj: adj /= Void
		do
			gtk_clist_set_vadjustment (widget, adj.adjustment)
			vadjustment := adj
		ensure
			vadj_cset: gtk_clist_get_vadjustment(widget) = adj.adjustment
			vadj_set: vadjustment = adj
		end

	set_shadow_type(t: INTEGER) is
			-- set the border shadow style (none, in, out,
			-- etched_in or etched_out); constants are
			-- defined in GTK_SHADOWTYPE_ENUM
		require
			good_type: t >= Gtk_shadow_none and t <= Gtk_shadow_etched_out
		do
			gtk_clist_set_shadow_type (widget, t)
		end
	
	set_selection_mode(m: INTEGER) is
			-- set the selection mode (single, browse, multiple,
			-- or extended); constants are defined in
			-- GTK_SELECTIONMODE_ENUM
		require
			good_mode: m >= Gtk_selection_single and m <= Gtk_selection_extended
		do
			gtk_clist_set_selection_mode(widget, m)
		end

	set_reorderable(flag: BOOLEAN) is
			-- enable (flag=True) or disable clist's ability
			-- to reorder itself
		do
			gtk_clist_set_reorderable (widget, flag)
		end

	set_use_drag_icons(flag: BOOLEAN) is
			-- start (flag=True) or stop clist from using
			-- drag icons
		do
			gtk_clist_set_use_drag_icons (widget, flag)
		end
	
	set_column_title_active (c: INTEGER) is
			-- make the specified column's header active, so
			-- that it responds to button presses, focus, etc.
		require
			good_column: valid_column(c)
		do
			gtk_clist_column_title_active (widget, c)
		end

	set_column_title_passive (c: INTEGER) is
			-- make the specified column's header passive, so
			-- that it does not respond to button presses, etc.
		require
			good_column: valid_column(c)
		do
			gtk_clist_column_title_passive (widget, c)
		end

	set_all_column_titles_active is
		do
			gtk_clist_column_titles_active (widget)
		end

	set_all_column_titles_passive is
		do
			gtk_clist_column_titles_passive (widget)
		end

	set_column_title_text (c: INTEGER; t: STRING) is
			-- Set the title of column c to t
		require
			good_column: valid_column(c)
			string_set: t /= Void
		do
			npc.np_gtk_clist_set_column_title (widget, c, t)
		end
	
	set_column_title_widget (c: INTEGER; w: GTK_WIDGET) is
			-- Place the specified widget in the title button of
			-- column c instead of a text label
		require
			good_widget: w /= Void
			good_column: valid_column(c)
		do
			gtk_clist_set_column_widget (widget, c, w.widget)
		end

	set_column_justification (c, j: INTEGER) is
			-- Set the justification of column c to j (j is a
			-- constant from GTK_JUSTIFICATION_ENUM)
		require
			good_just: j >= Gtk_justify_left and j <= Gtk_justify_fill
			good_column: valid_column(c)
		do
			gtk_clist_set_column_justification (widget, c, j)
		end

	set_column_visibility (c: INTEGER; v: BOOLEAN) is
			-- Make the column visible (v = True), or invisible
		require
			good_column: valid_column(c)
		do
			gtk_clist_set_column_visibility (widget, c, v)
		end

	set_column_resizeable (c: INTEGER; r: BOOLEAN) is
			-- Make the column resizeable (r = True), or not
		require
			good_column: valid_column(c)
		do
			gtk_clist_set_column_resizeable (widget, c, r)
		end

	set_column_auto_resizeable (c: INTEGER; r: BOOLEAN) is
			-- Make the column automatically resize itself
			-- (r = True) to the width of its widest element, or not
		require
			good_column: valid_column(c)
		do
			gtk_clist_set_column_auto_resize (widget, c, r)
		end

	set_column_width, set_column_pixel_width (c, w: INTEGER) is
			-- set the pixel width of a column; this is a necessary
			-- step in creating a GTK_CLIST because otherwise the
			-- column width is chosen from the width of the column
			-- title, which will never be right
		require
			good_column: valid_column(c)
			good_width: w > 0
		do
			gtk_clist_set_column_width (widget, c, w)
		end

	set_column_minimum_width (c, w: INTEGER) is
			-- set the minimum pixel width of a column
		require
			good_column: valid_column(c)
			good_width: w > 0
		do
			gtk_clist_set_column_min_width (widget, c, w)
		end

	set_column_maximum_width (c, w: INTEGER) is
			-- set the maximum pixel width of a column
		require
			good_column: valid_column(c)
			good_width: w > 0
		do
			gtk_clist_set_column_max_width (widget, c, w)
		end

	set_row_height (h: INTEGER) is
			-- change the height of the rows (in pixels), the
			-- default (height=0) is the height of the current font.
		require
			good_height: h >= 0
		do
			gtk_clist_set_row_height (widget, h)
		end

	set_row_style (row: INTEGER; new_style: GTK_STYLE) is
		require
			style_not_void: new_style /= Void
		do
			gtk_clist_set_row_style (widget, row, new_style.style)
		end

	set_cell_text (r, c: INTEGER; s: STRING) is
			-- set a cell to the given text
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
			good_text: s /= Void
		do
			npc.np_gtk_clist_set_text (widget, r, c, s)
		ensure
			has_text: cell_type(r, c) = Gtk_cell_text
			text_set: cell_text(r, c).is_equal(s)
		end

	set_cell_pixtext (r, c: INTEGER; text: STRING; spacing: INTEGER;
					  p: GDK_PIXMAP) is
			-- set pixmap and text in a cell
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
			good_pixmap: p /= Void
			good_text: text /= Void
		do
			npc.np_gtk_clist_set_pixtext (widget, r, c,
										  text, spacing,
										  p.pixmap, p.mask.bitmap)
		end

	set_cell_pixmap (r, c: INTEGER; p: GDK_PIXMAP) is
			-- set a cell to the given pixmap
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
			good_pixmap: p /= Void
		do
			-- TODO: verify that this works together with cell_pixmap 
			-- routine. Also check whether a gtk_pixmap or gdk_pixmap 
			-- is to be returned
			gtk_clist_set_pixmap (widget, r, c, p.pixmap, p.mask.bitmap)
		ensure
			has_pixmap: cell_type(r, c) = Gtk_cell_pixmap
			pixmap_set: cell_pixmap(r, c).is_equal(p)
		end


	set_cell_style (row, column: INTEGER; new_style: GTK_STYLE) is
		do
			gtk_clist_set_cell_style (widget, row, column, new_style.style)
		end

	set_shift (r, c, v, h: INTEGER) is
			-- this sets a horizontal and vertical shift for
			-- drawing the contents of a cell; it can be positive
			-- or negitive; this is particulary useful for
			-- indenting items in a column
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
		do
			gtk_clist_set_shift (widget, r, c, v, h)
		end

	set_selectable (r: INTEGER; s: BOOLEAN) is
			-- set a single row to be selectable (s = True) or not
		require
			good_row: valid_row(r)
		do
			gtk_clist_set_selectable (widget, r, s)
		ensure
			row_set: is_selectable(r) = s
		end

	set_background_colour (r: INTEGER; c: GDK_COLOR) is
		require
			good_row: valid_row(r)
		do
			gtk_clist_set_background (widget, r, c.color)
		end

	set_foreground_colour (r: INTEGER; c: GDK_COLOR) is
		require
			good_row: valid_row(r)
		do
			gtk_clist_set_foreground (widget, r, c.color)
		end

feature -- Get characteristics

	valid_row(r: INTEGER): BOOLEAN is
			-- True if r is in the range of rows
		do
			 Result := (r >= 0 and then r < row_count)
		end

	valid_column(c: INTEGER): BOOLEAN is
			-- True if c is in the range of columns
		do
			 Result := (c >= 0 and then c < column_count)
		end

	column_title_text (c: INTEGER): STRING is
			-- The title text of column c
		require
			good_column: valid_column(c)
		do
			Result := npc.np_string_from_pointer(gtk_clist_get_column_title (widget, c))
		end
	
--	column_title_widget (c: INTEGER): GTK_WIDGET is
--			-- The widget from the title button of
--			-- column c instead of a text label
----  TODO: we need to know what kind of widget this is and build an Eiffel
----        object from the GTK+ one.   GtkCList doesn't have this data.
--		require
--			good_column: valid_column(c)
--		local
--			p: POINTER
--		do
--			p := gtk_clist_get_column_widget (widget, c)
--			create Result.make_from_pointer(p)
--		end
--
--	column_title_button (c: INTEGER): GTK_BUTTON is
--		require
--			good_column: valid_column(c)
--		local
--			p: GTK_WIDGET
--			b: GTK_BUTTON
--		do
--			p := column_title_widget(c).parent
--			b := (buttons @ c)
--			if b /= Void and then b = p then 
--				Result := b
--			else
--				Result ?= p
--				buttons.put(Result, c)
--			end
--		end
	
	optimal_column_width(c: INTEGER): INTEGER is
			-- return the optimal column width, i.e. the maximum of
			-- all cell widths
		do
			Result := gtk_clist_optimal_column_width (widget, c)
		end
	
	row_visibility (r: INTEGER): INTEGER is
			-- returns a GtkVisibility constant
		require
			good_row: valid_row(r)
		do
			Result := gtk_clist_row_is_visible (widget, r)
		ensure
			sane_result: Result >= Gtk_visibility_none and
				     Result <= Gtk_visibility_full
		end

	
-- TODO
-- cell_type and cell_text should probably be replaced along the 
-- lines of the routines in GTK_CTREE.  We should set last_text and/or 
-- last_pixmap and set a flag to say whether a read was successful.  
-- We can then check for pixtext as well.

	cell_type (r, c: INTEGER): INTEGER is
			-- returns a GtkCellType constant
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
		do
			Result := gtk_clist_get_cell_type (widget, r, c)
		ensure
			sane_result: Result >= Gtk_cell_empty and
				     Result <= Gtk_cell_widget
		end
	
	cell_text (r,c: INTEGER): STRING is
			-- returns the text in a cell
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
			has_text: cell_type(r,c) = Gtk_cell_text
		do
			Result := npc.np_gtk_clist_get_text (widget, r, c)
		ensure
			good_result: Result /= Void
		end

	cell_pixmap (r,c: INTEGER): GDK_PIXMAP is
			-- returns the pixmap in a cell
		require
			good_row: valid_row(r)
			good_column: valid_column(c)
			has_pixmap: cell_type(r,c) = Gtk_cell_pixmap
		do
			-- TODO: non-portable call to recover pixmap into
			-- a supplied pointer and make a GTK_PIXMAP from it
			-- Result := np_gtk_clist_get_pixmap (widget, r, c)
		ensure
			good_result: Result /= Void
		end

	is_selectable (r: INTEGER): BOOLEAN is
			-- True if the row is selectable
		require
			good_row: valid_row(r)
		do
			Result := gtk_clist_get_selectable (widget, r)
		end

	get_row_data (r: INTEGER): EGTK_EXPORTABLE is
			-- return the user data associated with row r
		require
			good_row: valid_row(r)
		do
			create Result.make_from_pointer(gtk_clist_get_row_data(widget, r))
		end

	find_row_with_data (d: EGTK_EXPORTABLE) is
			-- set index_row to the first row associated with d
		do
			index_row := gtk_clist_find_row_from_data (widget, d.c_object)
		ensure
			index_set: off or index_row >= 0 and index_row < row_count
		end

	off: BOOLEAN is
		do
			Result := (index_row < 0)
		ensure
			sane_off: Result implies index_row = -1	
		end

	column_count: INTEGER is
			-- number of columns at the moment
		do
			Result := c_gtk_clist_col_count (widget)
		ensure
			not_negative: Result >= 0
		end

	row_count: INTEGER is
			-- number of rows at the moment
		do
			Result := c_gtk_clist_row_count (widget)
		ensure
			not_negative: Result >= 0
		end

	autosorting: BOOLEAN is
		-- true if the list is autosorting
		do
			Result := c_gtk_clist_autosorting(widget)
		end

feature -- from container, features that are not used - just here for consistency

	add_child (a_child: like child) is
			-- calling this routine violates assertions
		do
		end

	remove_child (a_child: like child) is
			-- calling this routine violates assertions
		do
		end

	child: GTK_WIDGET is
		do
		end

	has_child (a_child: like child): BOOLEAN is
		do
		end

	child_by_pointer (p: POINTER): like child is
		do
		end

feature {NONE}

   ptr1, ptr2: POINTER


end -- GTK_CLIST
