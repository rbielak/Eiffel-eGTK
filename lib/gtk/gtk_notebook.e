-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_NOTEBOOK - notebook widget"
	author: "Jörgen Tegne´r"
	date: "1/18/99"
	cvs: "$Id: gtk_notebook.e,v 1.10 2003/01/11 19:32:51 elphick Exp $"

class GTK_NOTEBOOK

-- A notebook widget contains several related widgets and displays one at
-- a time, controlled by tabs on one edge.  This widget is suitable for
-- different sets of information on a related subject.
--
-- By default, tabs are on the top edge of the widget.
--
-- Signals (from gtknotebook.c):
--    "switch_page"  - when a new page is displayed
	
inherit 

   GTK_COMPOSED_BIN

   GTK_NOTEBOOK_EXTERNALS
		undefine
			copy, is_equal
		end

   GTK_CONSTANTS
		undefine
			copy, is_equal
		end
	
creation {ANY} 

	make,
	make_from_pointer

feature {ANY} 
   
	make is 
			-- Create a new notebook widget
		do  
			create children.make (1, 0)
			widget := gtk_notebook_new(GTK_WINDOW_TOPLEVEL);
			register_widget
		end -- make
   
	set_tab_pos(pos: INTEGER) is 
			-- Set the position of the tabs; the value of pos
			-- must be one of: GTK_POS_LEFT, GTK_POS_RIGHT, 
			-- GTK_POS_TOP or GTK_POS_BOTTOM 
		do  
			gtk_notebook_set_tab_pos(widget,pos);
		end -- set_tab_pos
	
	append_page(page: GTK_WIDGET; label: GTK_LABEL) is 
			-- add a new page at the back of the notebook, with the
			-- tab at the right/bottom
		require
			page_valid: page /= Void
			label_valid: label /= Void
		do  
			gtk_notebook_append_page(widget, page.widget, label.widget)
			add_child (page)
		end -- append_page
	
	prepend_page(page: GTK_WIDGET; label: GTK_LABEL) is 
			-- add a new page at the front of the notebook, with the
			-- tab at the left/top
		require
			page_valid: page /= Void
			label_valid: label /= Void
		do  
			gtk_notebook_prepend_page (widget, page.widget, label.widget)
			add_child (page)
		end -- prepend_page
	
	insert_page(page: GTK_WIDGET; label: GTK_LABEL; pos: INTEGER) is 
			-- insert a new page at the given position
		require
			valid_position: pos >= 1
			page_valid: page /= Void
			label_valid: label /= Void
		do  
			gtk_notebook_insert_page(widget, page.widget, label.widget, pos-1);
			add_child (page)
		end -- insert_page
	
	next_page is 
			-- bring up the next page and depress its tab; at the
			-- end of the pages it wraps round to the first page
		do  
			if current_page < children.count then
				gtk_notebook_next_page (widget)
			else
				gtk_notebook_set_page(widget, 0)
			end
		end -- next_page
	
	prev_page is 
			-- bring up the previous page and depress its tab; at the end of the
			-- pages it wraps round to the last page
		do  
			if current_page > 1 then
				gtk_notebook_prev_page (widget);
			else
				gtk_notebook_set_page(widget, children.count-1);
			end;
		end -- prev_page
	
	current_page: INTEGER is 
			-- the page that is currently displayed
		do  
			Result := gtk_notebook_get_current_page(widget) + 1
		end -- current_page

set_page(p: INTEGER) is
-- force display of page p
do
	gtk_notebook_set_page(widget, p)
end
	
	remove_page is 
			-- drop a page from the list and remove its tab
		local
			child: GTK_WIDGET;
			childp: POINTER;
		do  
			if current_page >= 1 then
				childp := gtk_notebook_get_nth_page(widget,current_page-1);
				child := widget_factory.item_from_pointer(childp)
				remove_widget(child);
				gtk_notebook_remove_page (widget, current_page-1);
           end;
		end -- remove_page
	
	current_tab_pos: INTEGER is 
			-- the number of the currently selected tab
		do  
			Result := c_gtk_notebook_current_tab_pos(widget);
		end -- current_tab_pos
	
	is_border_shown: BOOLEAN is 
			-- true if the widget is displaying a border
		do  
			Result := c_gtk_notebook_is_border_shown(widget);
		end -- is_border_shown
	
	is_tabs_shown: BOOLEAN is 
			-- true if the widget is displaying its tabs
		do  
			Result := c_gtk_notebook_is_tabs_shown(widget);
		end -- is_tabs_shown
	
	show_tabs(t: BOOLEAN) is 
			-- If t is true, display the tabs, otherwise hide them
		do  
			gtk_notebook_set_show_tabs(widget,t);
		end -- show_tabs
	
	show_border(t: BOOLEAN) is 
			-- If t is true, display the border, otherwise remove it
      do  
		  gtk_notebook_set_show_border(widget,t);
      end -- show_border

	set_scrollable_tabs(t: BOOLEAN) is 
			-- If t is true, the tabset can be scrolled sideways to
			-- handle large numbers of pages.  Two arrows are shown
			-- to control this.
      do  
		  gtk_notebook_set_scrollable(widget,t);
      end -- show_border

end -- class GTK_NOTEBOOK
