-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_VIEWPORT"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_viewport_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_VIEWPORT_EXTERNALS

inherit

	GTK_SHADOWTYPE_ENUM

feature {NONE}  -- GTK+ calls

	gtk_viewport_new (hadjustment, vadjustment: POINTER): POINTER is
		-- hadjustment, vadjustment are GtkAdjustment*
		external "C"
		end

	gtk_viewport_get_hadjustment (viewport: POINTER): POINTER is
		-- returns a GtkAdjustment* 
		external "C"
		end

	gtk_viewport_get_vadjustment (viewport: POINTER): POINTER is
		-- returns a GtkAdjustment* 
		external "C"
		end

	gtk_viewport_set_hadjustment (viewport, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_viewport_set_vadjustment (viewport, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_viewport_set_shadow_type (viewport: POINTER; type: INTEGER) is
		-- type is a GtkShadowType constant
		require
			good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
		external "C"
		end

end  -- GTK_VIEWPORT_EXTERNALS
