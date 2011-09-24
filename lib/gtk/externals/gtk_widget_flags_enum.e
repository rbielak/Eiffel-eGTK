-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Widget flag constants"

class GTK_WIDGET_FLAGS_ENUM

feature  -- The flags that are used by GtkWidget; (ORed with the flags
         -- field of GtkObject)

	Gtk_toplevel: INTEGER		is      16	--  1 << 4
	Gtk_no_window: INTEGER		is      32	--  1 << 5
	Gtk_realized: INTEGER		is      64	--  1 << 6
	Gtk_mapped: INTEGER		is     128	--  1 << 7
	Gtk_visible: INTEGER		is     256	--  1 << 8
	Gtk_sensitive: INTEGER		is     512	--  1 << 9
	Gtk_parent_sensitive: INTEGER	is    1024	--  1 << 10
	Gtk_can_focus: INTEGER		is    2048	--  1 << 11
	Gtk_has_focus: INTEGER		is    4096	--  1 << 12
	Gtk_can_default: INTEGER	is    8192	--  1 << 13
	Gtk_has_default: INTEGER	is   16384	--  1 << 14
	Gtk_has_grab: INTEGER		is   32768	--  1 << 15
	Gtk_rc_style: INTEGER		is   65536	--  1 << 16
	Gtk_composite_child: INTEGER	is  131072	--  1 << 17
	Gtk_no_reparent: INTEGER	is  262144	--  1 << 18
	Gtk_app_paintable: INTEGER	is  524288	--  1 << 19
	Gtk_receives_default: INTEGER	is 1048576	--  1 << 20


end
