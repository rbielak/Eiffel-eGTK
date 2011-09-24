-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_LIST"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_list_externals.e,v 1.6 2000/07/10 02:01:28 richieb Exp $"

class GTK_LIST_EXTERNALS

inherit

	GTK_SELECTIONMODE_ENUM

feature -- GtkScrollType scrolling types 

  Gtk_scroll_none:          INTEGER	is	0
  Gtk_scroll_step_backward: INTEGER	is	1
  Gtk_scroll_step_forward:  INTEGER	is	2
  Gtk_scroll_page_backward: INTEGER	is	3
  Gtk_scroll_page_forward:  INTEGER	is	4
  Gtk_scroll_jump:          INTEGER	is	5

feature {NONE}

	gtk_list_new: POINTER is
		external "C"
		end

	gtk_list_set_selection_mode (w: POINTER; mode: INTEGER) is
		external "C"
		end

	gtk_list_clear_items (w: POINTER; first, last: INTEGER) is
		external "C"
		end

	gtk_list_select_item (w: POINTER; it: INTEGER) is
		external "C"
		end

	gtk_list_unselect_item (w: POINTER; it: INTEGER) is
		external "C"
		end

	gtk_list_child_position (w: POINTER; child: POINTER): INTEGER is
			-- child is a *GtkWidget
		external "C"
		end

	-- GtkType	   gtk_list_get_type		  (void);

	gtk_list_insert_items (list, items: POINTER; position: INTEGER) is
			-- items is a *GList
			-- position is a gint
		external "C"
		end

	gtk_list_append_items (list, items: POINTER) is
			-- items is a *GList
		external "C"
		end

	gtk_list_prepend_items (list, items: POINTER) is
			-- items is a *GList
		external "C"
		end

	gtk_list_remove_items (list, items: POINTER) is
			-- items is a *GList
		external "C"
		end

	gtk_list_remove_items_no_unref (list, items: POINTER) is
			-- items is a *GList
		external "C"
		end

	gtk_list_select_child (list, child: POINTER) is
			-- child is a *GtkWidget
		external "C"
		end

	gtk_list_unselect_child (list, child: POINTER) is
			-- child is a *GtkWidget
		external "C"
		end

	gtk_list_extend_selection (list: POINTER;	scroll_type: INTEGER;
										position: REAL; auto_start_selection: BOOLEAN) is
			-- scroll_type is a GtkScrollType  
			-- position is a gfloat
		external "C"
		end

	gtk_list_start_selection (list: POINTER) is
		external "C"
		end

	gtk_list_end_selection (list: POINTER) is
		external "C"
		end

	gtk_list_select_all (list: POINTER) is
		external "C"
		end

	gtk_list_unselect_all (list: POINTER) is
		external "C"
		end

	gtk_list_scroll_horizontal (list: POINTER;
										 scroll_type: INTEGER;
										 position: REAL) is
			-- scroll_type is a GtkScrollType  
			-- position is a gfloat
		external "C"
		end

	gtk_list_scroll_vertical (list: POINTER;
									  scroll_type: INTEGER;
									  position: REAL) is
			-- scroll_type is a GtkScrollType  
			-- position is a gfloat
		external "C"
		end

	gtk_list_toggle_add_mode (list: POINTER) is
		external "C"
		end

	gtk_list_toggle_focus_row (list: POINTER) is
		external "C"
		end

	gtk_list_toggle_row (list, item: POINTER) is
			-- item is a *GtkWidget
		external "C"
		end

	gtk_list_undo_selection (list: POINTER) is
		external "C"
		end

	gtk_list_end_drag_selection (list: POINTER) is
		external "C"
		end

feature -- fields and utility functions

	c_gtk_list_children_count (gl: POINTER): INTEGER is
		external "C"
		end
	
	c_gtk_list_selection (gl: POINTER): POINTER is
		external "C"
		end


end  -- GTK_LIST_EXTERNALS
