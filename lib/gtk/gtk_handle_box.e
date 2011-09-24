-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_HANDLE_BOX - a widget which detaches from its window"
	author: "Daniel Elphick"
	cvs: "$Id: gtk_handle_box.e,v 1.5 1999/09/08 10:51:40 dan Exp $"

class GTK_HANDLE_BOX

-- A handle box (to allow widgets to be dragged in and out of their parents)
--
-- Signals (from gtkhandlebox.c):
--    "child_attached"
--    "child_detached"

inherit

	GTK_BIN

	GTK_HANDLE_BOX_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_shadow_type(type: INTEGER) is
		require
			good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
		do
			gtk_handle_box_set_shadow_type(widget, type)
		end

	set_handle_position(posn: INTEGER) is
		require
			good_posn: posn >= Gtk_pos_left and posn <= Gtk_pos_bottom
		do
			gtk_handle_box_set_handle_position(widget, posn)
		end
	
	set_snap_edge(edge: INTEGER) is
		require
			good_edge: edge >= Gtk_pos_left and edge <= Gtk_pos_bottom
		do
			gtk_handle_box_set_snap_edge(widget, edge)
		end
		
feature {NONE}

	make is
			-- Create a new handle box.
		do
			widget := gtk_handle_box_new
			register_widget
		end
   
end -- GTK_HANDLE_BOX
