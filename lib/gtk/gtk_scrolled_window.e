-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_SCROLLED_WINDOW - window that can be scrolled"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_scrolled_window.e,v 1.9 2003/01/11 19:32:51 elphick Exp $"

class GTK_SCROLLED_WINDOW

inherit

	GTK_BIN

	GTK_SCROLLED_WINDOW_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_policy (h, v: INTEGER) is
		require
			v_valid: (v >= Gtk_policy_always) and (v <= Gtk_policy_never)
			h_valid: (h >= Gtk_policy_always) and (h <= Gtk_policy_never)
		do
			gtk_scrolled_window_set_policy (widget, h, v)
		end

	add_widget_with_viewport (other_widget: GTK_WIDGET) is
		require
			valid_child: other_widget /= Void
		do
			add_child (other_widget)
			gtk_scrolled_window_add_with_viewport (widget, other_widget.widget)
		end

	hadjustment: GTK_ADJUSTMENT is
		do
			create Result.make_from_pointer (gtk_scrolled_window_get_hadjustment (widget))
		end

	vadjustment: GTK_ADJUSTMENT is
		do
			create Result.make_from_pointer (gtk_scrolled_window_get_vadjustment (widget))
		end


feature {NONE}

	make is
		do
			widget := gtk_scrolled_window_new (default_pointer, default_pointer)
			register_widget
		end

end
