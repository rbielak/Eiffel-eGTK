-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_ACCEL_LABEL - text label widget with accelerator"
	author: "Daniel Elphick"

class GTK_ACCEL_LABEL

inherit

	GTK_LABEL
		redefine
			make
		end

	GTK_ACCEL_LABEL_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_pointer

feature {NONE} -- Creation

	make (new_label: STRING) is
			-- Create an accel_label and set its text.
		do
			widget := npc.np_gtk_accel_label_new (new_label)
			register_widget
		end

feature

	get_accel_width: INTEGER is
			-- Returns the width needed to display the accelerator key(s). 
			-- This is used by menus to align all of the GtkMenuItem widgets, 
			-- and shouldn't be needed by applications.
		do
			Result := gtk_accel_label_get_accel_width(widget)
		end

	set_accel_widget(accel_widget: GTK_WIDGET) is
			-- Sets the widget whose accelerators are to be shown.
		do
			gtk_accel_label_set_accel_widget(widget, accel_widget.widget)
		end

	refetch is
			-- Recreates the string representing the accelerator keys. This 
			-- should not be needed since the string is automatically 
			-- updated whenever accelerators are added or removed from 
			-- the associated widget.
		local
			unused_bool: BOOLEAN
		do
			-- NB: this C routine always returns False
			unused_bool := gtk_accel_label_refetch(widget)
		end

end -- GTK_ACCEL_LABEL
