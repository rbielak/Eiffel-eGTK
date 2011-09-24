-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GTK_WINDOW - top-level window"
   version: "v 0.3.5 GTK+ 1.2.x"
   author: "Richie Bielak"
   changed: "??"
   cvs: "$Id: gtk_window.e,v 1.11 2002/04/16 23:02:33 elphick Exp $"

class GTK_WINDOW

   -- A top level window
   --
   -- Signals (from gtkwindow.c):
   --    "set_focus"

inherit

   GTK_BIN
      rename
	 window as gdk_window,
	 widget as window
      end

   GTK_WINDOW_EXTERNALS
      undefine
	 copy, is_equal
      end

   GTK_CONSTANTS
      undefine
	 copy, is_equal
      end

creation

   make_top_level,
   make_from_pointer

feature

   set_title (title: STRING) is
	 -- set the title in the window decoration
      require
	 valid_title: title /= Void
      do
	 -- gtk_window_set_title (window, $(title.to_c))
	 npc.np_gtk_window_set_title (window, title)
      end

   set_policy (allow_shrink, allow_grow, auto_shrink: BOOLEAN) is
	 -- set the resizing policy
      do
	 gtk_window_set_policy (window, allow_shrink, allow_grow, auto_shrink)
      end

   set_wmclass(wmclass_name, wmclass_class: STRING) is
      require
	 name_set: wmclass_name /= Void
	 class_set: wmclass_class /= Void
      do
	 --  TODO: needs a non-portable call for the string pointers
	 -- 	gtk_window_set_wmclass (window, wmclass_name, wmclass_class)
      end

   add_accel_group(ag: GTK_ACCEL_GROUP) is
      do
	 gtk_window_add_accel_group(window, ag.gtk_object)
      end

   remove_accel_group(ag: GTK_ACCEL_GROUP) is
      do
	 gtk_window_remove_accel_group(window, ag.gtk_object)
      end

   set_window_position(pos: INTEGER) is
      require
	 --TODO: define GtkWindowPosition constants
	-- in_range: pos >= 0 and pos <= max
      do
	 gtk_window_set_position (window, pos)
      end

   activate_default is
      -- Undocumented in GTK_+ reference.  What is the return value?
      local
      	i: INTEGER
      do
      	i := gtk_window_activate_default (window)
      end

   activate_focus is
      -- Undocumented in GTK_+ reference.  What is the return value?
      local
      	i: INTEGER
      do
      	i := gtk_window_activate_focus (window)
      end

   set_transient_for(other: GTK_WINDOW) is
      do
	 gtk_window_set_transient_for (window, other.window)
      end

   set_geometry_hints(geometry_widget: GTK_WIDGET;
		      geometry: GDK_GEOMETRY;
		      geom_mask: INTEGER) is
      do
	 gtk_window_set_geometry_hints (window, geometry_widget.widget,
					geometry.gdk_object,
					geom_mask)
      end

   set_default_size (wdth, ht: INTEGER) is
      do
	gtk_window_set_default_size (window, wdth, ht)
      end

   set_modal(modal: BOOLEAN) is
      do
	 gtk_window_set_modal (window, modal)
      end
       
   lower is
      do
         gdk_window.lower
      end

   raise is
      do
         gdk_window.raise
      end

feature {NONE}

   make_top_level is
	 -- creation procedure
      do
	 window := gtk_window_new (GTK_WINDOW_TOPLEVEL);
	 register_widget
      ensure
	 window /= default_pointer
      end

							 

end
