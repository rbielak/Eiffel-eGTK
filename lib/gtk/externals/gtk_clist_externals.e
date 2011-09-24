-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description:	"External C calls for GTK_CLIST"
   version: "v 0.3.5 GTK+ 1.2.x"
   author:		"Oliver Elphick"
   date:		"June 1999"
   cvs:		"$Id: gtk_clist_externals.e,v 1.13 2002/02/26 15:58:42 elphick Exp $"

class GTK_CLIST_EXTERNALS

inherit

   GTK_JUSTIFICATION_ENUM

   GTK_SELECTIONMODE_ENUM

   GTK_SHADOWTYPE_ENUM

   GTK_VISIBILITY_ENUM

   GTK_CELLTYPE_ENUM

feature  -- GtkSortType constants

   Gtk_sort_ascending: INTEGER		is 0
   Gtk_sort_descending: INTEGER		is 1

feature {NONE} -- GTK+ calls

   -- constructors useful for gtk-- wrappers 
   gtk_clist_construct (clist: POINTER;
			columns: INTEGER; titles: POINTER) is
	 -- titles is gchar *titles[]
      require
	 pos_columns: columns > 0
      external "C"
      end

   -- create a new GtkCList 
   gtk_clist_new (columns: INTEGER): POINTER is
      require
	 pos_columns: columns > 0
      external "C"
      end

   gtk_clist_new_with_titles (columns: INTEGER;
			      titles: POINTER): POINTER is
	 -- titles is gchar *titles[]
      require
	 pos_columns: columns > 0
      external "C"    
      end


   -- set adjustments of clist 
   gtk_clist_set_hadjustment (clist, adjustment: POINTER) is
      external "C"
      end

   gtk_clist_set_vadjustment (clist, adjustment: POINTER) is
      external "C"
      end


   -- get adjustments of clist 
   gtk_clist_get_hadjustment (clist: POINTER): POINTER is
      external "C"
      end

   gtk_clist_get_vadjustment (clist: POINTER): POINTER is
      external "C"
      end


   -- set the border style of the clist 
   gtk_clist_set_shadow_type (clist: POINTER;
			      type: INTEGER) is
	 -- type is a GtkShadowType constant 
      require
	 good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
      external "C"
      end


   -- set the clist's selection mode 
   gtk_clist_set_selection_mode (clist: POINTER;
				 mode: INTEGER) is
	 -- mode is a GtkSelectionMode constant 
      external "C"
      end


   -- enable clists reorder ability 
   gtk_clist_set_reorderable (clist: POINTER;
			      reorderable: BOOLEAN) is
      external "C"
      end

   gtk_clist_set_use_drag_icons (clist: POINTER;
				 use_icons: BOOLEAN) is
      external "C"
      end

   gtk_clist_set_button_actions (clist: POINTER;
				 button: INTEGER
				 button_actions: CHARACTER) is
	 -- button_actions is a guint8 (1 byte)
      external "C"
      end


   -- freeze all visual updates of the list, and then thaw
   -- the list after you have made a number of changes;
   -- the updates will occur more efficently than
   -- if you made them on a unfrozen list
 
   gtk_clist_freeze (clist: POINTER) is
      external "C"
      end

   gtk_clist_thaw (clist: POINTER) is
      external "C"
      end


   -- show and hide the column title buttons 
   gtk_clist_column_titles_show (clist: POINTER) is
      external "C"
      end

   gtk_clist_column_titles_hide (clist: POINTER) is
      external "C"
      end


   -- set the column title to be a active title (responds
   -- to button presses, prelights, and grabs keyboard focus),
   -- or passive where it acts as just a title
 
   gtk_clist_column_title_active (clist: POINTER;
				  column: INTEGER) is
      external "C"
      end

   gtk_clist_column_title_passive (clist: POINTER;
				   column: INTEGER) is
      external "C"
      end

   gtk_clist_column_titles_active (clist: POINTER) is
      external "C"
      end

   gtk_clist_column_titles_passive (clist: POINTER) is
      external "C"
      end


   -- set the title in the column title button 
   gtk_clist_set_column_title (clist: POINTER; column: INTEGER;
			       title: POINTER) is
	 -- title is a gchar*
      external "C"
      end


   -- returns the title of column. Returns NULL if title is not set 
   gtk_clist_get_column_title (clist: POINTER;
			       column: INTEGER): POINTER is
	 -- returns *gchar
      external "C"
      end


   -- set a widget instead of a title for the column title button 
   gtk_clist_set_column_widget (clist: POINTER; column: INTEGER;
				widget: POINTER) is
      external "C"
      end


   -- returns the column widget 
   gtk_clist_get_column_widget (clist: POINTER;
				column: INTEGER): POINTER is
      external "C"
      end


   -- set the justification on a column 
   gtk_clist_set_column_justification (clist: POINTER;
				       column, justification: INTEGER) is
	 -- justification is a GtkJustification constant
      require
	 good_just: justification >= Gtk_justify_left and justification <= Gtk_justify_fill
      external "C"
      end


   -- set visibility of a column 
   gtk_clist_set_column_visibility (clist: POINTER; column: INTEGER;
				    visible: BOOLEAN) is
      external "C"
      end


   -- enable/disable column resize operations by mouse 
   gtk_clist_set_column_resizeable (clist: POINTER; column: INTEGER;
				    resizeable: BOOLEAN) is
      external "C"
      end


   -- resize column automatically to its optimal width 
   gtk_clist_set_column_auto_resize (clist: POINTER; column: INTEGER;
				     auto_resize: BOOLEAN) is
      external "C"
      end


   gtk_clist_columns_autosize (clist: POINTER): INTEGER is
      external "C"
      end


   -- return the optimal column width, i.e. the maximum of
   --all cell widths 
   gtk_clist_optimal_column_width (clist: POINTER;
				   column: INTEGER): INTEGER is
      external "C"
      end


   -- set the pixel width of a column; this is a necessary step in
   -- creating a CList because otherwise the column width is chozen from
   -- the width of the column title, which will never be right
 
   gtk_clist_set_column_width (clist: POINTER; column, width: INTEGER) is
      external "C"
      end


   -- set column minimum/maximum width.
   -- min/max_width < 0 => no restriction 
   gtk_clist_set_column_min_width (clist: POINTER;
				   column, min_width: INTEGER) is
      external "C"
      end

   gtk_clist_set_column_max_width (clist: POINTER;
				   column, max_width: INTEGER) is
      external "C"
      end


   -- change the height of the rows, the default (height=0) is
   -- the height of the current font.
   gtk_clist_set_row_height (clist: POINTER;
			     height: INTEGER) is
      external "C"
      end


   -- scroll the viewing area of the list to the given column
   -- and row; row_align and col_align are between 0.0 and 1.0,
   -- representing where the row should appear
   -- on the screen, 0.0 being top or left, 1.0 being bottom
   -- or right; if row or column is -1 then then there is
   -- no change
   gtk_clist_moveto (clist: POINTER;
		     row, column: INTEGER;
		     row_align, col_align: REAL) is
      external "C"
      end


   -- returns whether the row is visible 
   gtk_clist_row_is_visible (clist: POINTER;
			     row: INTEGER): INTEGER is
	 -- returns GtkVisibility constant
      external "C"
      end


   -- returns the cell type 
   gtk_clist_get_cell_type (clist: POINTER;
			    row: INTEGER;
			    column: INTEGER): INTEGER is
	 -- returns GtkCellType constant
      external "C"
      end


   -- sets a given cell's text, replacing its current contents 
   gtk_clist_set_text (clist: POINTER;
		       row, column: INTEGER;
		       text: POINTER) is
	 -- text is a gchar*
      external "C"
      end


   -- for the "get" functions, any of the return pointer
   -- can be NULL if you are not interested
 
   gtk_clist_get_text (clist: POINTER;
		       row, column: INTEGER;
		       text: POINTER): INTEGER is
	 -- text is a gchar**
      external "C"
      end


   -- sets a given cell's pixmap, replacing its current contents 
   gtk_clist_set_pixmap (clist: POINTER;
			 row, column: INTEGER;
			 pixmap, mask: POINTER) is
	 -- pixmap is a GdkPixmap*
	 -- mask is a GdkBitmap*
      external "C"
      end


   gtk_clist_get_pixmap (clist: POINTER;
			 row, column: INTEGER;
			 pixmap, mask: POINTER): INTEGER is
	 -- pixmap is a GdkPixmap**
	 -- mask is a GdkBitmap**
      external "C"
      end


   -- sets a given cell's pixmap and text, replacing its
   -- current contents 
   gtk_clist_set_pixtext (clist: POINTER;
			  row, column: INTEGER;
			  text: POINTER;
			  spacing: INTEGER;
			  pixmap, mask: POINTER) is
	 -- text is a const gchar*
	 -- spacing is a guint8
	 -- pixmap is a GdkPixmap*
	 -- mask is a GdkBitmap*
      external "C"
      end


   gtk_clist_get_pixtext (clist: POINTER;
			  row, column: INTEGER;
			  text, spacing, pixmap, mask: POINTER): INTEGER is
	 -- text is a const gchar**
	 -- spacing is a guint8*
	 -- pixmap is a GdkPixmap**
	 -- mask is a GdkBitmap**
      external "C"
      end


   -- sets the foreground colour of a row; the colour must
   -- already be allocated
   gtk_clist_set_foreground (clist: POINTER;
			     row: INTEGER;
			     colour: POINTER) is
	 -- colour is a GdkColor*
      external "C"
      end


   -- sets the background colour of a row, the colour must
   -- already be allocated
   gtk_clist_set_background (clist: POINTER;
			     row: INTEGER;
			     colour: POINTER) is
	 -- colour is a GdkColor*
      external "C"
      end


   -- set / get cell styles 
   gtk_clist_set_cell_style (clist: POINTER;
			     row, column: INTEGER;
			     style: POINTER) is
	 -- style is a GtkStyle*
      external "C"
      end


   gtk_clist_get_cell_style (clist: POINTER;
			     row, column: INTEGER): POINTER is
	 -- returns a pointer to a GtkStyle
      external "C"
      end


   gtk_clist_set_row_style (clist: POINTER;
			    row: INTEGER;
			    style: POINTER) is
	 -- style is a GtkStyle*
      external "C"
      end


   gtk_clist_get_row_style (clist: POINTER;
			    row: INTEGER): POINTER is
	 -- returns a pointer to a GtkStyle
      external "C"
      end


   -- this sets a horizontal and vertical shift for drawing
   -- the contents of a cell; it can be positive or negitive;
   -- this is particulary useful for indenting items in a column
 
   gtk_clist_set_shift (clist: POINTER;
			row, column, vertical, horizontal: INTEGER) is
      external "C"
      end


   -- set/get selectable flag of a single row 
   gtk_clist_set_selectable (clist: POINTER;
			     row: INTEGER;
			     selectable: BOOLEAN) is
      external "C"
      end

   gtk_clist_get_selectable (clist: POINTER;
			     row: INTEGER): BOOLEAN is
      external "C"
      end


   -- prepend/append returns the index of the row you just
   -- added, making it easier to append and modify a row
 
   gtk_clist_prepend (clist: POINTER;
		      text: POINTER): INTEGER is
	 -- text is a gchar*[]
      external "C"
      end

   gtk_clist_append (clist: POINTER;
		     text: POINTER): INTEGER is
	 -- text is a gchar*[]
      external "C"
      end


   -- inserts a row at index row and returns the row where it
   -- was actually inserted (may be different from "row" in
   -- auto_sort mode)
   gtk_clist_insert (clist: POINTER;
		     row: INTEGER;
		     text: POINTER): INTEGER is
	 -- text is a gchar*[]
      external "C"
      end


   -- removes row at index row 
   gtk_clist_remove (clist: POINTER;
		     row: INTEGER) is
      external "C"
      end


   -- sets a arbitrary data pointer for a given row 
   gtk_clist_set_row_data (clist: POINTER;
			   row: INTEGER;
			   data: POINTER) is
	 -- data is a gpointer  
      external "C"
      end


   -- sets a data pointer for a given row with destroy
   -- notification 
   gtk_clist_set_row_data_full (clist: POINTER;
				row: INTEGER;
				data: POINTER;
				destroy: POINTER) is
	 -- data is a gpointer  
	 -- destroy is a GtkDestroyNotify (a void function taking
	 -- a single gpointer parameter)
      external "C"
      end


   -- returns the data set for a row 
   gtk_clist_get_row_data (clist: POINTER;
			   row: INTEGER): POINTER is
      external "C"
      end


   -- given a data pointer, find the first (and hopefully
   -- only!) row that points to that data, or -1 if none do
   gtk_clist_find_row_from_data (clist, data: POINTER): INTEGER is
	 -- data is a gpointer
      external "C"
      end

   -- force selection of a row 
   gtk_clist_select_row (clist: POINTER;
			 row, column: INTEGER) is
      external "C"
      end


   -- force unselection of a row 
   gtk_clist_unselect_row (clist: POINTER;
			   row, column: INTEGER) is
      external "C"
      end


   -- undo the last select/unselect operation 
   gtk_clist_undo_selection (clist: POINTER) is
      external "C"
      end


   -- clear the entire list -- this is much faster than
   -- removing each item with gtk_clist_remove
   gtk_clist_clear (clist: POINTER) is
      external "C"
      end


   -- return the row column corresponding to the x and y
   -- coordinates, the returned values are only valid if the
   -- x and y coordinates are respective to a
   -- window == clist->clist_window
   gtk_clist_get_selection_info (clist: POINTER;
				 x, y: INTEGER;
				 row, column: POINTER): INTEGER is
	 -- row and column are pointers to guint
      external "C"
      end


   -- in multiple or extended mode, select all rows 
   gtk_clist_select_all (clist: POINTER) is
      external "C"
      end


   -- in all modes except browse mode, deselect all rows 
   gtk_clist_unselect_all (clist: POINTER) is
      external "C"
      end


   -- swap the position of two rows 
   gtk_clist_swap_rows (clist: POINTER;
			row1, row2: INTEGER) is
      external "C"
      end


   -- move row from source_row position to dest_row position 
   gtk_clist_row_move (clist: POINTER;
		       source_row, dest_row: INTEGER) is
      external "C"
      end


   -- sets a compare function different to the default 
   gtk_clist_set_compare_func (clist: POINTER; func: POINTER) is
      external "C"
      end


   -- the column to sort by 
   gtk_clist_set_sort_column (clist: POINTER;
			      column: INTEGER) is
      external "C"
      end


   -- how to sort: ascending or descending 
   gtk_clist_set_sort_type (clist: POINTER;
			    sort_type: INTEGER) is
	 -- sort_type is a GtkSortType constant 
      external "C"
      end


   -- sort the list with the current compare function 
   gtk_clist_sort (clist: POINTER) is
      external "C"
      end


   -- Automatically sort upon insertion 
   gtk_clist_set_auto_sort (clist: POINTER;
			    auto_sort: BOOLEAN) is
      external "C"
      end


feature {NONE}  -- glue library calls

   c_gtk_clist_col_count (p: POINTER): INTEGER is
	 -- number of columns from the GTK+ code
      external "C"
      end

   c_gtk_clist_row_count (p: POINTER): INTEGER is
	 -- number of rows from the GTK+ code
      external "C"
      end

   c_gtk_clist_autosorting (p: POINTER): BOOLEAN is
	 -- autosort flag from the GTK+ code
      external "C"
      end

   c_gtk_clist_focus_row (p: POINTER): INTEGER is
      external "C"
      end

   c_gtk_clist_selection (p: POINTER): POINTER is
	 -- Returns a GList *
      external "C"
      end

   c_gtk_clist_selection_end (p: POINTER): POINTER is
	 -- Returns a GList *
      external "C"
      end
		
   c_gtk_clist_sort_type (p: POINTER): INTEGER is
      external "C"
      end

   c_gtk_clist_sort_column (p: POINTER): INTEGER is
      external "C"
      end
													  
   c_gtk_clist_row_list (p: POINTER): POINTER is
	 -- Returns a GList *
      external "C"
      end

   c_gtk_clist_get_selection_info(w: POINTER; x, y: INTEGER) is
      external "C"
      end

   c_cell_selected_row: INTEGER is
      external "C"
      end

   c_cell_selected_col: INTEGER is
      external "C"
      end

feature -- clist flags

   Gtk_clist_in_drag: INTEGER		    is    1
   Gtk_clist_row_height_set: INTEGER	    is    2
   Gtk_clist_show_titles: INTEGER	    is    4
   Gtk_clist_child_has_focus: INTEGER	    is    8
   Gtk_clist_add_mode: INTEGER		    is   16 
   Gtk_clist_auto_sort: INTEGER		    is   32
   Gtk_clist_auto_resize_blocked: INTEGER   is   64 
   Gtk_clist_reorderable: INTEGER	    is  128 
   Gtk_clist_use_drag_icons: INTEGER	    is  256
   Gtk_clist_draw_drag_line: INTEGER	    is  512
   Gtk_clist_draw_drag_rect: INTEGER	    is 1024
   
feature -- GtkCListDragPos constants
   
   Gtk_clist_drag_none: INTEGER		    is    0
   Gtk_clist_drag_before: INTEGER	    is    1
   Gtk_clist_drag_into: INTEGER		    is    2
   Gtk_clist_drag_after: INTEGER            is    3
   
feature -- GtkButtonAction constants
   
   Gtk_button_ignored: INTEGER		is    0
   Gtk_button_selects: INTEGER		is    1
   Gtk_button_drags  : INTEGER		is    2 
   Gtk_button_expands: INTEGER		is    4
   
end  -- GTK_CLIST_EXTERNALS
