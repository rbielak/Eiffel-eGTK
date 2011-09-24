-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_LABEL - text label widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_label.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_LABEL

-- A label is a static field, whose text gives information; a label cannot
-- have events associated with it.

inherit

	GTK_MISC

	GTK_LABEL_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_pointer

feature {NONE} -- Creation

	make (new_label: STRING) is
			-- Create a label and set its text.
		require
			valid_label: new_label /= Void
		do
			widget := npc.np_gtk_label_new (new_label)
			register_widget
		end

feature

	left_justify is
			-- Make the text left-justified in the field
		do
			gtk_label_set_justify(widget, Gtk_justify_left)
		end

	right_justify is
			-- Make the text right-justified in the field
		do
			gtk_label_set_justify(widget, Gtk_justify_right)
		end

	centre is
			-- centre the text in the field
		do
			gtk_label_set_justify(widget, Gtk_justify_center)
		end

	fill is
			-- make the text fully justified in the field
		do
			gtk_label_set_justify(widget, Gtk_justify_fill)
		end

	text: STRING is
		do
			Result := npc.np_string_from_pointer (c_label_text (widget))
		end

	set_text(new_text: STRING) is
			-- Change the text in an existing label
		require
			valid_text: new_text /= Void
		do
			npc.np_gtk_label_set_text(widget, new_text)
		ensure
			text_set: text.is_equal(new_text)
		end

	set_line_wrap(wrap: BOOLEAN) is
		do
			gtk_label_set_line_wrap(widget, wrap)
		end

end -- GTK_LABEL
