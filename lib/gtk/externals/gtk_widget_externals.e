-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_WIDGET"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_widget_externals.e,v 1.8 2000/07/10 02:01:28 richieb Exp $"

class GTK_WIDGET_EXTERNALS

inherit

	GTK_STATETYPE_ENUM

	GTK_WIDGET_FLAGS_ENUM

	GDK_CONSTANTS

feature -- GdkExtensionMode constants

	Gdk_extension_events_none: INTEGER		is 0
	Gdk_extension_events_all: INTEGER		is 1
	Gdk_extension_events_cursor: INTEGER		is 2
	
feature {NONE}

-- GtkWidget* gtk_widget_new (GtkType		type,
-- 					   const gchar	       *first_arg_name,
-- 					   ...);
-- GtkWidget* gtk_widget_newv (GtkType		type,
-- 					   guint		nargs,
-- 					   GtkArg	       *args);

	gtk_widget_ref (widget: POINTER) is
		external "C"
		end

	gtk_widget_unref (widget: POINTER) is
		external "C"
		end

	gtk_widget_destroy (w: POINTER) is
		external "C"
		end

	gtk_widget_destroyed (widget, widget_pointer: POINTER) is
		-- widget_pointer is a GtkWidget**
		external "C"
		end

	gtk_widget_get (widget, arg: POINTER) is
		-- args is a GtkArg*
		external "C"
		end

	gtk_widget_getv (widget: POINTER; nargs: INTEGER; args: POINTER) is
		-- args is a GtkArg*
		external "C"
		end

-- void	   gtk_widget_set (widget: POINTER,
-- 					   const gchar         *first_arg_name,
-- 					   ...);

	gtk_widget_setv (widget: POINTER; nargs: INTEGER; args: POINTER) is
		-- args is a GtkArg*
		external "C"
		end

	gtk_widget_unparent (widget: POINTER) is
		external "C"
		end

	gtk_widget_show (w: POINTER) is
		external "C"
		end

	gtk_widget_show_now (widget: POINTER) is
		external "C"
		end

	gtk_widget_hide (w: POINTER) is
		external "C"
		end

	gtk_widget_show_all (w: POINTER) is
		external "C"
		end

	gtk_widget_hide_all (widget: POINTER) is
		external "C"
		end

	gtk_widget_map (widget: POINTER) is
		external "C"
		end

	gtk_widget_unmap (widget: POINTER) is
		external "C"
		end

	gtk_widget_realize (widget: POINTER) is
		external "C"
		end

	gtk_widget_unrealize (widget: POINTER) is
		external "C"
		end

	-- Queuing draws
	gtk_widget_queue_draw (widget: POINTER) is
		external "C"
		end

	gtk_widget_queue_draw_area (widget: POINTER;
				   x, y, width, height: INTEGER) is
		external "C"
		end

	gtk_widget_queue_clear (widget: POINTER) is
		external "C"
		end

	gtk_widget_queue_clear_area (widget: POINTER;
				   x, y, width, height: INTEGER) is
		external "C"
		end

	gtk_widget_queue_resize (widget: POINTER) is
		external "C"
		end

	gtk_widget_draw (widget, area: POINTER) is
		-- area is a GdkRectangle*
		external "C"
		end

	gtk_widget_draw_focus (widget: POINTER) is
		external "C"
		end

	gtk_widget_draw_default (widget: POINTER) is
		external "C"
		end

	gtk_widget_size_request (widget, requisition: POINTER) is
		-- requisition is a GtkRequisition*
		external "C"
		end

	gtk_widget_size_allocate (widget, allocation: POINTER) is
		-- allocations is a GtkAllocation*
		external "C"
		end

	gtk_widget_get_child_requisition (widget, requisition: POINTER) is
		-- requisition is a GtkRequisition*
		external "C"
		end

	gtk_widget_add_accelerator (widget, accel_signal, accel_group: POINTER;
			   accel_key, accel_mods, accel_flags: INTEGER) is
		-- accel_signal is a const gchar*
		-- accel_group is a GtkAccelGroup*
		-- accel_flags is a GtkAccelFlags
		external "C"
		end

	gtk_widget_remove_accelerator (widget, accel_group: POINTER;
					   accel_key, accel_mods: INTEGER) is
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

	gtk_widget_remove_accelerators (widget, accel_signal: POINTER;
					   visible_only: BOOLEAN) is
		-- accel_signal is a const gchar*
		external "C"
		end

	gtk_widget_accelerator_signal (widget, accel_group: POINTER;
				   accel_key, accel_mods: INTEGER): INTEGER is
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

	gtk_widget_lock_accelerators (widget: POINTER) is
		external "C"
		end

	gtk_widget_unlock_accelerators (widget: POINTER) is
		external "C"
		end

-- Not in gtk 1.2.0
--	gtk_widget_accelerators_locked (widget: POINTER): BOOLEAN is
--		external "C"
--		end

	gtk_widget_event (widget, event: POINTER): INTEGER is
		-- event is a GdkEvent*
		external "C"
		end

	gtk_widget_activate (widget: POINTER): BOOLEAN is
		external "C"
		end

	gtk_widget_set_scroll_adjustments (widget,
			      hadjustment, vadjustment: POINTER): BOOLEAN is
		-- hadjustment, vadjustment are GtkAdjustment*
		external "C"
		end
     
	gtk_widget_reparent (w: POINTER; p: POINTER) is
		external "C"
		end

	gtk_widget_popup (widget: POINTER; x, y: INTEGER) is
		external "C"
		end

	gtk_widget_intersect (widget, area, intersection: POINTER): INTEGER is
		-- area, intersection are GdkRectangle*
		external "C"
		end

	gtk_widget_grab_focus (widget: POINTER) is
		external "C"
		end

	gtk_widget_grab_default (w: POINTER) is
		external "C"
		end

	gtk_widget_set_name (widget, name: POINTER) is
		-- name is a const gchar*
		external "C"
		end

	gtk_widget_get_name (widget: POINTER): POINTER is
		-- returns gchar*
		external "C"
		end

	gtk_widget_set_state (widget: POINTER; state: INTEGER) is
		-- state is a GtkStateType	constant
		require
			good_state: state >= Gtk_state_normal and state <= Gtk_state_insensitive
		external "C"
		end

	gtk_widget_set_sensitive (w: POINTER; sensitive: BOOLEAN) is
		external "C"
		end

	gtk_widget_set_app_paintable (widget: POINTER;
				app_paintable: BOOLEAN) is
		external "C"
		end

	gtk_widget_set_parent (widget, parent: POINTER) is
		external "C"
		end

	gtk_widget_set_parent_window (widget, parent_window: POINTER) is
		-- parent_window is a GdkWindow*
		external "C"
		end

	gtk_widget_get_parent_window (widget: POINTER): POINTER is
		-- returns a GdkWindow*
		external "C"
		end

	gtk_widget_set_uposition (widget: POINTER; x,y: INTEGER) is
		external "C"
		end

	gtk_widget_set_usize (widget: POINTER; w,h: INTEGER) is
		external "C"
		end

	gtk_widget_set_events (w: POINTER; mask: INTEGER) is
		external "C"
		end
	
	gtk_widget_add_events (w: POINTER; mask: INTEGER) is
		external "C"
		end
	
	gtk_widget_set_extension_events (widget: POINTER; mode: INTEGER) is
		-- mode is a GdkExtensionMode constant
		external "C"
		end

	gtk_widget_get_extension_events (widget: POINTER) is
		-- returns a GdkExtensionMode constant
		external "C"
		end

	gtk_widget_get_toplevel (widget: POINTER): POINTER is
		-- returns a GtkWidget*
		external "C"
		end

	gtk_widget_get_ancestor (widget: POINTER;
					 widget_type: INTEGER): POINTER is
		-- widget_type is a GtkType constant
		-- returns a GtkWidget*
		external "C"
		end

	gtk_widget_get_colormap (widget: POINTER): POINTER is
		-- returns a GtkColormap*
		external "C"
		end

	gtk_widget_get_visual (w: POINTER):POINTER is
		external "C"
		end


	-- The following functions must not be called on an already realized
	-- widget. Because it is possible that somebody can call
	-- get_colormap() or get_visual() and save the result, these
	-- functions are probably only safe to call in a widget's
	-- init() function.

	gtk_widget_set_colormap (widget, colormap: POINTER) is
		-- colormap is a GdkColormap*
		external "C"
		end

	gtk_widget_set_visual (widget, visual: POINTER) is
		-- visual is a GdkVisual*
		external "C"
		end

	gtk_widget_get_events (widget: POINTER): INTEGER is
		external "C"
		end

	gtk_widget_get_pointer (widget, x, y: POINTER) is
		-- x, y are int*
		external "C"
		end


	gtk_widget_is_ancestor (widget, ancestor: POINTER): INTEGER is
		-- ancestor is GtkWidget*
		external "C"
		end


	-- Hide widget and return TRUE.
	gtk_widget_hide_on_delete (widget: POINTER): INTEGER is
		external "C"
		end


	-- Widget styles.
	gtk_widget_set_style (widget, style: POINTER) is
		-- style is a GtkStyle*
		external "C"
		end

	gtk_widget_set_rc_style (widget: POINTER) is
		external "C"
		end

	gtk_widget_ensure_style (widget: POINTER) is
		external "C"
		end

	gtk_widget_get_style (widget: POINTER): POINTER is
		-- returns a GtkStyle*
		external "C"
		end

	gtk_widget_restore_default_style (widget: POINTER) is
		external "C"
		end


	gtk_widget_modify_style (widget, style: POINTER) is
		-- style is a GtkRcStyle*
		external "C"
		end


	-- handle composite names for GTK_COMPOSITE_CHILD widgets, the
	-- returned name is newly allocated.
	gtk_widget_set_composite_name (widget, name: POINTER) is
		-- name is gchar*
		external "C"
		end

	gtk_widget_get_composite_name (widget: POINTER): POINTER is
		-- returns a gchar* 
		external "C"
		end

     
	-- Descend recursively and set rc-style on all widgets without
	-- user styles
	gtk_widget_reset_rc_styles (widget: POINTER) is
		external "C"
		end


	-- Push/pop pairs, to change default values upon a widget's creation.
	-- This will override the values that got set by the
	-- gtk_widget_set_default_* () functions.

	gtk_widget_push_style (style: POINTER) is
		-- style is GtkStyle*
		external "C"
		end

	gtk_widget_push_colormap (cmap: POINTER) is
		-- cmap is GdkColormap*
		external "C"
		end

	gtk_widget_push_visual (visual: POINTER) is
		-- visual is GdkVisual*
		external "C"
		end

	gtk_widget_push_composite_child is
		external "C"
		end

	gtk_widget_pop_composite_child is
		external "C"
		end

	gtk_widget_pop_style is
		external "C"
		end

	gtk_widget_pop_colormap is
		external "C"
		end

	gtk_widget_pop_visual is
		external "C"
		end


	-- Set certain default values to be used at widget creation time.
	gtk_widget_set_default_style (style: POINTER) is
		-- style is GtkStyle*
		external "C"
		end

	gtk_widget_set_default_colormap (colormap: POINTER) is
		-- colormap is GdkColormap*
		external "C"
		end

	gtk_widget_set_default_visual (visual: POINTER) is
		-- visual is GdkVisual*
		external "C"
		end

	gtk_widget_get_default_style: POINTER is
		-- returns GtkStyle*
		external "C"
		end

	gtk_widget_get_default_colormap: POINTER is
		-- returns GdkColormap*
		external "C"
		end

	gtk_widget_get_default_visual: POINTER is
		-- returns GdkVisual*
		external "C"
		end


	-- Counterpart to gdk_window_shape_combine_mask.
	gtk_widget_shape_combine_mask (widget, shape_mask: POINTER;
					    offset_x, offset_y: INTEGER) is
		-- shape_mask is GdkBitmap*
		external "C"
		end


	-- Compute a widget's path in the form "GtkWindow.MyLabel", and
	-- return newly allocated strings.
	gtk_widget_path (widget, path_length, path, path_reversed: POINTER) is
		-- path_length is guint*
		-- path, path_reversed is gchar**
		external "C"
		end

	gtk_widget_class_path (widget, path_length,
				path, path_reversed: POINTER) is
		external "C"
		end


feature {NONE} -- code in the glue library

	c_gtk_widget_set_flags (w: POINTER; flags: INTEGER) is
		external "C"
		end

	c_gtk_widget_visible (w: POINTER): BOOLEAN is
		external "C"
		end

	c_gtk_widget_width (w: POINTER): INTEGER is
		external "C"
		end

	c_gtk_widget_height (w: POINTER): INTEGER is
		external "C"
		end

	c_gtk_widget_window (w: POINTER): POINTER is
		external "C"
		end

	-- ISE forces external "C" names to lower case
	c_gtk_widget_get_window (widget: POINTER): POINTER is
		external "C"
		end

	c_gtk_widget_get_style (widget: POINTER): POINTER is
		external "C"
		end

	-- C MACRO boolean queries, return 0 for false, non 0 for true
	c_gtk_widget_no_window (widget: POINTER): INTEGER is
			-- returns 0 for false non-0 for true
			-- (that is to say: 0 if this IS a window)
			-- ah don't names em, ah just encapsulates em
		external "C"
		end
														 
	c_gtk_widget_realized (widget: POINTER): INTEGER is
			-- returns 0 for false non-0 for true
		external "C"
		end
														 
	c_gtk_is_widget (widget: POINTER): INTEGER is
		external "C"
		end

	-- end C MACRO boolean queries

end  -- GTK_WIDGET_EXTERNALS
