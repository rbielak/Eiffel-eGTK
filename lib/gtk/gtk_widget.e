-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GTK_WIDGET - parent of all GTK widgets"
   version: "v 0.3.5 GTK+ 1.2.x"
   author: "Richie Bielak"
   changed: "11/10/98"
   cvs: "$Id: gtk_widget.e,v 1.24 2003/01/11 19:32:52 elphick Exp $"

class GTK_WIDGET

   -- All widgets inherit from this class, which provides such facilities as
   -- showing and hiding, resizing, attaching tooltips and so on
   --
   -- Signals (from gtkwidget.c):
   --    "button_press_event"
   --    "button_release_event"
   --    "client_event"
   --    "configure_event"
   --    "debug_msg"
   --    "delete_event"
   --    "destroy_event"
   --    "drag_begin"
   --    "drag_data_delete"
   --    "drag_data_get"
   --    "drag_data_received"
   --    "drag_drop"
   --    "drag_end"
   --    "drag_leave"
   --    "drag_motion"
   --    "draw"
   --    "draw_default"
   --    "draw_focus"
   --    "enter_notify_event"
   --    "event"
   --    "expose_event"
   --    "focus_in_event"
   --    "focus_out_event"
   --    "grab_focus"
   --    "hide"
   --    "key_press_event"
   --    "key_release_event"
   --    "leave_notify_event"
   --    "map"
   --    "map_event"
   --    "motion_notify_event"
   --    "no_expose_event"
   --    "parent_set"
   --    "property_notify_event"
   --    "proximity_in_event"
   --    "proximity_out_event"
   --    "realize"
   --    "selection_clear_event"
   --    "selection_get"
   --    "selection_notify_event"
   --    "selection_received"
   --    "selection_request_event"
   --    "show"
   --    "size_allocate"
   --    "size_request"
   --    "state_changed"
   --    "style_set"
   --    "unmap"
   --    "unmap_event"
   --    "unrealize"
   --    "visibility_notify_event"


inherit

   --	GTK_CONSTANTS

   GTK_OBJECT
      rename
	 gtk_object as widget
      redefine
	 make_from_pointer,
	 --			dispose,
	 ref,
	 unref
      end
	
   GDK_EXTERNALS
      export {NONE} all
      undefine
	 copy, is_equal
      end

   GTK_WIDGET_EXTERNALS
      undefine
	 copy, is_equal
      end

   EGTK_SHARED_TOOLTIPS
      undefine
	 copy, is_equal
      end

   GDK_WINDOW_DECORATIONS_ENUM
      undefine
	 copy, is_equal
      end

   GDK_WINDOW_FUNCTIONS_ENUM
      undefine
	 copy, is_equal
      end

creation
	
   make_from_pointer

feature

   make_from_pointer (p: POINTER) is
      do
	 precursor (p)
	 register_widget
      end

   show is
	 -- Make this widget visible
      do
	 gtk_widget_show (widget)
      ensure
	 is_visible: visible
      end

   show_all is
	 -- show the widgets and all its children
      do
	 gtk_widget_show_all (widget)
      ensure
	 is_visible: visible
      end


   hide is
	 -- make this widget invisible, without destroying it
      do
	 gtk_widget_hide (widget)
      ensure
	 is_hidden: not visible
      end

   realize is
	 -- realize this widget: this involves creating the
	 -- associated X window, but not showing it.  This is not
	 -- normally used - show is the more usual feature to use.
      do
	 gtk_widget_realize (widget)
      ensure
	 realized: is_realized
      end

   unrealize is
	 -- unrealize this widget: this involves destroying the
	 -- associated X window, but not showing it.  This is not
	 -- normally used.
      do
	 gtk_widget_unrealize (widget)
      ensure
	 unrealized: not is_realized
      end


   set_tool_tip (tip: STRING) is
	 -- define a short message that is shown if the
	 -- mouse pointer lingers on this widget
      require
	 tip /= Void
      do
	 tool_tips_controller.set_tool_tip (tip, Current)
      end

   set_size (new_width, new_height: INTEGER) is
	 -- Change the size of the widget in pixels
      require
	 (new_width >= -2) and (new_height >= -2)
      do
	 gtk_widget_set_usize (widget, new_width, new_height)
	 --		ensure
	 --			size_set: width = new_width and height = new_height
	 -- NOTE: This postcondition becomes true only if the widget is 
	 -- visible, until then the size is not changed..
      end

   width: INTEGER is
	 -- width of the widget in pixels
      do
	 Result := c_gtk_widget_width (widget)
      ensure
	 sane: Result >= 0
      end

   height: INTEGER is
	 -- height of the widget in pixels
      do
	 Result := c_gtk_widget_height (widget)			
      ensure
	 sane: Result >= 0
      end

   set_position (x, y: INTEGER) is
	 -- change position of the widget in its parent; the
	 -- x and y co-ordinates are in pixels relative to the
	 -- top left corner (0,0)
      require
	 (x >= -2) and (y >= -2)
      do
	 gtk_widget_set_uposition (widget, x, y)
      end

   set_sensitive (sens: BOOLEAN) is
	 -- make the widget act on events (if sensitive is
	 -- true) or ignore them (if it is false)
      do
	 gtk_widget_set_sensitive (widget, sens)
      end

   set_flags (flag: INTEGER) is
	 -- set flags that determine the widget's capabilities;
	 -- flag is the sum of certain constants - see in
	 -- class GTK_CONSTANTS under Widget flags
      do
	 c_gtk_widget_set_flags (widget, flag)
      end

   grab_default is
	 -- make the current widget the default (if the
	 -- user presses <return>); this is typically
	 -- used for an OK button
      do
	 gtk_widget_grab_default (widget)
      end

   grab_focus is
	 -- Force the keyboard focus to the current widget
      do
	 gtk_widget_grab_focus(widget)
      end

   parent: GTK_WIDGET
	 -- containing widget

   destroy is
	 -- destroy the widget completely (irreversible)
      require
	 exists: widget /= default_pointer
      do
	 gtk_widget_destroy (widget)
	 widget := default_pointer
      end

   reparent (new_parent: GTK_CONTAINER) is
	 -- attach the widget to a different parent; this
	 -- can include attaching it for the first time to
	 -- any widget
      require
	 new_parent /= Void
      local
	 old_parent: GTK_CONTAINER
      do
	 -- Remove this widget from the children of the
	 -- old parent and add to the new parent.
	 -- This is bit hokey because GTK_TOOLBAR is a widget
	 -- that can contain other widgets, but is not a
	 -- descendant of GTK_CONTAINER
	 old_parent ?= parent
	 print("Reparenting ")
	 print(widget.out)
	 print(": new = ")
	 print(new_parent.widget.out)
	 print("; ")
	 if old_parent /= Void then
	    print("old = ")
	    print(old_parent.widget.out)
	    old_parent.remove_child (Current)
	    gtk_widget_reparent (widget, new_parent.widget)
	 else
	    print("old = Void")
	    set_parent(new_parent)
	    gtk_widget_set_parent (widget, new_parent.widget)
	 end
	 new_parent.add_child (Current)
	 print ("%N")
      ensure
	 valid_parent: parent = new_parent			
      end

   set_events (gdk_event_mask: INTEGER) is
	 -- set the events this widget should send through;
	 -- gdk_event_mask is the sum of all the desired
	 -- events, as listed in the class GDK_CONSTANTS.
	 -- Any events not included will be removed from the
	 -- mask.
      do
	 gtk_widget_set_events (widget, gdk_event_mask)
      end

   add_events (gdk_event_mask: INTEGER) is
	 -- add more events that this widget should send
	 -- through; this mask is combined with the
	 -- existing one.
      do
	 gtk_widget_add_events (widget, gdk_event_mask)
      end

   set_style (st: GTK_STYLE) is
      require
	 style_set: st /= Void
      do
	 gtk_widget_set_style(widget, st.style)
      end

   containing_window: like parent is
	 -- find and return the most direct parent widget which
	 -- is a window; the Current widget is not considered.
	 -- Void will be returned if there is no parent widget
	 -- which is a window.
      do
	 from
	    Result := parent
	 until
	    Result = Void or else Result.is_window
	 loop
	    Result := Result.parent
	 end
      ensure
	 sane_result: Result = Void or else Result.is_window
      end

feature -- boolean flag queries
	
   visible: BOOLEAN is
	 -- true if this widget is visible
      do
	 Result := c_gtk_widget_visible (widget)
      end

   is_window: BOOLEAN is
	 -- is this widget a window?
      do
	 --HERE need *portable* bit/integer conversion
	 if c_gtk_widget_no_window (widget) = 0 then -- ugh, double negative
	    Result := True
	 end
      end
	
   realized, is_realized: BOOLEAN is
	 -- is this widget currently realized?
      do
	 if c_gtk_widget_realized (widget) /= 0 then
	    Result := True
	 end
      end

   mapped: BOOLEAN is
	 -- true if mapped
      do
	 -- extract and test proper bit
	 Result := ((flags // Gtk_mapped) \\ 2) = 1
      end

   sensitive: BOOLEAN is
	 -- true if sensitive
      do
	 Result := ((flags // Gtk_sensitive) \\ 2) = 1
      end
	
   has_focus: BOOLEAN is
	 -- true if has focus
      do
	 Result := ((flags // Gtk_has_focus) \\ 2) = 1
      end

feature {GTK_WIDGET, GTK_COMMAND, GTK_TOOLTIPS, GDK_EVENT}
	
   set_parent (new_parent: GTK_CONTAINER) is
	 -- set the parent widget.  This feature is for 
	 -- internal use only: use reparent.
      do
	 parent := new_parent
      end

	
feature -- query
	
   visual: GDK_VISUAL is
	 -- !! what is a GDK_VISUAL? !!
      local
	 p: POINTER
      do
	 p := gtk_widget_get_visual (widget)
	 if visual_cache = Void or else visual_cache.visual /= p then
	    create  visual_cache.make (p)
	 end
	 Result := visual_cache
      ensure
	 Result /= Void
      end

   window: GDK_WINDOW is
	 -- the underlying X object
      local
	 p: POINTER
      do
	 p := c_gtk_widget_get_window (widget)
	 if p = default_pointer then
	    -- GDK window may not be created yet, force creation
	    realize
	    p := c_gtk_widget_get_window (widget)
	 end
	 if window_cache = Void or else window_cache.window /= p then
	    create  window_cache.make (p)
	 end
	 Result := window_cache
      ensure
	 Result /= Void
      end

   style: GTK_STYLE is
	 -- the style encapsulates font and colours
      local
	 p: POINTER
      do
	 p := c_gtk_widget_get_style (widget)
	 if style_cache = Void or else style_cache.style /= p then
	    create  style_cache.make_from_pointer (p)
	 end
	 Result := style_cache
      ensure
	 Result /= Void
      end

   valid_widget: BOOLEAN is
	 -- true, if represents a valid widget
      do
	 Result := c_gtk_is_widget (widget) /= 0
      end

feature -- manual memory management

   ref is
	 -- increment reference count of the widget
      do
	 gtk_widget_ref (widget)
	 saved_type := clone(type_name)
      end

   unref is
	 -- decrement reference count of the widget
      do
	 if valid_widget then
	    gtk_widget_unref (widget)
	 end
      end

feature -- GdkWindow manipulations

   set_cursor(c: GDK_CURSOR) is
	 -- c can be Void - this forces the widget to use its 
	 -- parent's cursor
      do
	 window.set_cursor(c)
      end

   set_decorations(d: INTEGER) is
	 -- Set the decorations that the window manager will put on 
	 -- this window.
	 -- See GDK_WINDOW_DECORATIONS_ENUM for valid decorations
      require
	 d_in_range: d >= 0 and d <= Gdk_max_decoration
      do
	 window.set_decorations(d)
      end

   set_functions(f: INTEGER) is
	 -- Set the functions that the window manager will make 
	 -- available to this window.
	 -- See GDK_WINDOW_FUNCTIONS_ENUM for valid functions
      require
	 f_in_range: f >= 0 and f <= Gdk_max_function
      do
	 window.set_functions( f)
      end

feature {NONE} -- memory management

   --	dispose is
   --		do
   --			precursor			
   -- if the widget wasn't already destroyed, destroy it now
   --			if c_gtk_is_widget (widget) /= 0 then
   --				gtk_widget_destroy (widget)
   --			end
   --			-- this is to satisfy the invariant and the end of this call
   --			widget := default_pointer
   --		end

feature {NONE} -- cache

   visual_cache: GDK_VISUAL

   window_cache: GDK_WINDOW

   style_cache: GTK_STYLE

invariant

   widget_registered: valid_widget implies widget_factory.has_pointer (widget)

end -- GTK_WIDGET

