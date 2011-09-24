-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_ARROW - configurable arrow"
	author: "Daniel Elphick"
	

class GTK_ARROW

-- An arrow which can point up, down, left or right

inherit

	GTK_MISC

	GTK_ARROW_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_type(arrow_type: INTEGER; shadow_type: INTEGER) is
		require
			arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
			shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		do
			gtk_arrow_set(widget, arrow_type, shadow_type)
		end

feature {NONE}

	make(arrow_type: INTEGER; shadow_type: INTEGER) is
		require
			arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
			shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		do
			widget := gtk_arrow_new(arrow_type, shadow_type)
			register_widget
		end
end -- GTK_ARROW
