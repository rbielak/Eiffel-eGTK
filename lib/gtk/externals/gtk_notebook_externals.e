-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_NOTEBOOK"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_notebook_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_NOTEBOOK_EXTERNALS


feature {NONE} -- Creation, insertion, deletion
			
	gtk_notebook_new (opt: INTEGER): POINTER is
		external "C"
		end
	
	gtk_notebook_append_page (notebook, container, label: POINTER) is
		external "C"
		end
	
	gtk_notebook_append_page_menu (notebook, child, tab_label,
				     menu_label: POINTER) is
		external "C"
		end

	gtk_notebook_prepend_page (notebook, container, label: POINTER) is
		-- child, tab_label and menu_label are GtkWidget*
		external "C"
		end

	gtk_notebook_prepend_page_menu (notebook, child, tab_label,
				     menu_label: POINTER) is
		-- child, tab_label and menu_label are GtkWidget*
		external "C"
		end

	gtk_notebook_insert_page (notebook, container, label: POINTER;
					pos:INTEGER) is
		external "C"
		end

	gtk_notebook_insert_page_menu (notebook, child, tab_label,
				     menu_label: POINTER;
				     position: INTEGER) is
		-- child, tab_label and menu_label are GtkWidget*
		external "C"
		end
				     
	gtk_notebook_remove_page (notebook: POINTER; p: INTEGER) is
		external "C"
		end

feature {NONE} -- query, set current NoteebookPage

	gtk_notebook_get_current_page (notebook: POINTER): INTEGER is
		external "C"
        	end

	gtk_notebook_get_nth_page (notebook: POINTER;
				      page_num: INTEGER): POINTER is
		-- returns a GtkWidget*
		external "C"
		end

	gtk_notebook_page_num (notebook, child: POINTER): INTEGER is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_notebook_set_page (notebook: POINTER; page_num: INTEGER) is
		external "C"
		end

	gtk_notebook_next_page (notebook: POINTER) is
		external "C"
		end

	gtk_notebook_prev_page (notebook: POINTER) is
		external "C"
		end
	
feature {NONE}  --set Notebook, NotebookTab style

	gtk_notebook_set_show_border (notebook:POINTER; t:BOOLEAN) is
		external "C"
		end

	gtk_notebook_set_show_tabs (notebook:POINTER; t:BOOLEAN) is
		external "C"
		end
	
	gtk_notebook_set_tab_pos (notebook: POINTER; pos: INTEGER) is
		external "C"
		end
	
	gtk_notebook_set_scrollable (notebook:POINTER; t:BOOLEAN) is
		external "C"
		end

	gtk_notebook_set_homogeneous_tabs (notebook: POINTER;
					homogeneous: BOOLEAN) is
		external "C"
		end

	gtk_notebook_set_tab_border (notebook: POINTER;
					border_width: INTEGER) is
		external "C"
		end

	gtk_notebook_set_tab_hborder (notebook: POINTER;
					tab_hborder: INTEGER) is
		external "C"
		end

	gtk_notebook_set_tab_vborder (notebook: POINTER;
					tab_vborder: INTEGER) is
		external "C"
		end

feature {NONE} -- enable/disable PopupMenu

	gtk_notebook_popup_enable (notebook: POINTER) is
		external "C"
		end

	gtk_notebook_popup_disable (notebook: POINTER) is
		external "C"
		end

feature {NONE} -- query/set NotebookPage Properties

	gtk_notebook_get_tab_label (notebook, child: POINTER): POINTER is
		-- child is a GtkWidget*
		-- returns a GtkWidget* 
		external "C"
		end

	gtk_notebook_set_tab_label (notebook, child, tab_label: POINTER) is
		-- child and tab_label are GtkWidget*
		external "C"
		end

	gtk_notebook_set_tab_label_text (notebook, child, tab_text: POINTER) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_notebook_get_menu_label (notebook, child: POINTER): POINTER is
		-- returns a GtkWidget* 
		external "C"
		end

	gtk_notebook_set_menu_label (notebook, child, menu_label: POINTER) is
		-- child and menu_label are GtkWidget*
		external "C"
		end

	gtk_notebook_set_menu_label_text (notebook, child, menu_text: POINTER) is
		-- child is a GtkWidget*
		-- menu_text is a const gchar*
		external "C"
		end

	gtk_notebook_query_tab_label_packing (notebook, child,
					   expand, fill, pack_type: POINTER) is
		-- child is a GtkWidget*
		-- expand and fill are gbooean*
		-- pack_type si GtkPackType*
		external "C"
		end

	gtk_notebook_set_tab_label_packing (notebook, child: POINTER;
					   expand, fill: BOOLEAN;
					   pack_type: INTEGER) is
		-- child is a GtkWidget*
		-- pack_type is a GtkPackType constant
		external "C"
		end

	gtk_notebook_reorder_child (notebook, child: POINTER;
					   position: INTEGER) is
		-- child is a GtkWidget*
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_notebook_is_tabs_shown (w: POINTER): BOOLEAN is
		external "C"
		end
	
	c_gtk_notebook_is_border_shown (w: POINTER): BOOLEAN is
		external "C"
		end

	c_gtk_notebook_current_tab_pos (w: POINTER): INTEGER is
		external "C"
		end

end  -- GTK_NOTEBOOK_EXTERNALS
