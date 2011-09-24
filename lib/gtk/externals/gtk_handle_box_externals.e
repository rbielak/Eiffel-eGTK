-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_HANDLE_BOX"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	changed:	"August 1999"
	cvs:		"$Id: gtk_handle_box_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_HANDLE_BOX_EXTERNALS

inherit
	
	GTK_SHADOWTYPE_ENUM

	GTK_POSITIONTYPE_ENUM

feature {NONE}  -- GTK+ calls

	gtk_handle_box_new: POINTER is
		external "C"
		end

	gtk_handle_box_set_shadow_type (handle_box: POINTER;
					type: INTEGER) is
		-- type is a GtkShadowType constant
		require
			good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_handle_box_set_handle_position (handle_box: POINTER;
					position: INTEGER) is
		-- position is a GtkPositionType constant
		require
			good_pos: position >= Gtk_pos_left and position <= Gtk_pos_bottom
		external "C"
		end

	gtk_handle_box_set_snap_edge (handle_box: POINTER;
					edge: INTEGER) is
		-- edge is a GtkPositionType constant
		require
			good_edge: edge >= Gtk_pos_left and edge <= Gtk_pos_bottom
		external "C"
		end

end  -- GTK_HANDLE_BOX_EXTERNALS
