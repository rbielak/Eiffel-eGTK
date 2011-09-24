-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_DND"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_dnd_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_DND_EXTERNALS

feature -- GtkDestDefaults constants

	Gtk_dest_default_motion: INTEGER	is  1	--  1 << 0
		-- respond to "drag_motion"

	Gtk_dest_default_highlight: INTEGER	is  2	--  1 << 1
		-- auto-highlight

	Gtk_dest_default_drop: INTEGER		is  4	--  1 << 2
		-- respond to "drag_drop"

	Gtk_dest_default_all: INTEGER		is  7	--  0x07

feature -- GtkTargetFlags constants
	-- Flags for the GtkTargetEntry on the destination side 

	Gtk_target_same_app: INTEGER		is  1	--  1 << 0
		-- < nick=same-app >

	Gtk_target_same_widget: INTEGER		is  2	--  1 << 1
		-- < nick=same-widget >

feature {NONE}  -- GTK+ calls (Destination side)

-- How do we handle GdkAtom, which is an unsigned long long (64 bits)?
--	gtk_drag_get_data (widget, context: POINTER;
--			GdkAtom         target,
--			time: INTEGER) is
--		-- context is a GdkDragContext *
--		-- time is a guint32
--		external "C"
--		end

	gtk_drag_finish   (context: POINTER; success, del: BOOLEAN;
			time: INTEGER) is
		-- context is a GdkDragContext *
		-- time is a guint32
		external "C"
		end

	gtk_drag_get_source_widget (context: POINTER): POINTER is
		-- context is a GdkDragContext *
		-- returns a GtkWidget*
		external "C"
		end

	gtk_drag_highlight   (widget: POINTER) is
		external "C"
		end

	gtk_drag_unhighlight (widget: POINTER) is
		external "C"
		end

	gtk_drag_dest_set   (widget: POINTER; flags: INTEGER;
  		          targets: POINTER; n_targets, actions: INTEGER) is
		-- flags is a GtkDestDefaults constant
		-- targets is a const GtkTargetEntry*
		-- actions is a GdkDragAction constant (so we need to
		--   include constants from gdk/gdktypes.h somewhere)
		external "C"
		end

	gtk_drag_dest_set_proxy (widget, proxy_window: POINTER;
			      protocol: INTEGER;
			      use_coordinates: BOOLEAN) is
		-- proxy_window is a GdkWindow*
		-- protocol is a GdkDragProtocol constant (so we need to
		--   include constants from gdk/gdktypes.h somewhere)
		external "C"
		end

	gtk_drag_dest_unset (widget: POINTER) is
		external "C"
		end

feature {NONE}  -- GTK+ calls (Source side)

	gtk_drag_source_set  (widget: POINTER; start_button_mask: INTEGER;
			   targets: POINTER; n_targets, actions: INTEGER) is
		-- start_button_mask is a GdkModifierType (see gdk/gdktypes.h)
		-- targets is a const GtkTargetEntry*
		-- actions is a GdkDragAction constant (so we need to
		--   include constants from gdk/gdktypes.h somewhere)
		external "C"
		end

	gtk_drag_source_unset (widget: POINTER) is
		external "C"
		end

	gtk_drag_source_set_icon (widget, colourmap, pixmap, mask: POINTER) is
		-- colourmap is a GdkColormap*
		-- pixmap is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_drag_begin (widget, targets: POINTER; actions, button: INTEGER;
				event: POINTER): POINTER is
		-- targets is a GtkTargetList*
		-- actions is a GdkDragAction constant (so we need to
		--   include constants from gdk/gdktypes.h somewhere)
		-- event is a GdkEvent*
		-- returns a GdkDragContext*
		external "C"
		end

feature {NONE}	-- GTK+ calls (Set the image being dragged around)

	gtk_drag_set_icon_widget  (context, widget: POINTER;
				hot_x, hot_y: INTEGER) is
		-- context is a GdkDragContext *
		external "C"
		end

	gtk_drag_set_icon_pixmap  (context, colourmap, pixmap, mask: POINTER;
				hot_x, hot_y: INTEGER) is
		-- context is a GdkDragContext *
		-- colourmap is a GdkColormap*
		-- pixmap is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_drag_set_icon_default (context: POINTER) is
		-- context is a GdkDragContext *
		external "C"
		end

	gtk_drag_set_default_icon (colourmap, pixmap, mask: POINTER;
				hot_x, hot_y: INTEGER) is
		-- colourmap is a GdkColormap*
		-- pixmap is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

end  -- GTK_DND_EXTERNALS
