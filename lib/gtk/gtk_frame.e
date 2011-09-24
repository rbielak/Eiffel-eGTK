-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_FRAME - frame widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_frame.e,v 1.8 2000/07/10 02:01:27 richieb Exp $"

class GTK_FRAME

-- A frame is a box enclosing one or more other widgets. The
-- framebox can be labelled and the position of the label can
-- be varied within the top edge of the frame.

inherit

	GTK_BIN

	GTK_FRAME_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_CONSTANTS
		undefine
			copy, is_equal
		end

creation

	make,
	make_no_label

feature

	set_label (text: STRING) is
			-- Change the widget's label text
		require
			text_valid: text /= Void
		do
			npc.np_gtk_frame_set_label (widget, text)
		end

	clear_label is
			-- Remove the frame's label
		do
			gtk_frame_set_label (widget, default_pointer)
		end

	align_label (pos: REAL) is
			-- Change the alignment of the frame's label text
		require
			pos_valid: pos >= 0. and pos <= 1.
		do
			gtk_frame_set_label_align (widget, pos)
		end

	set_shadow_type (t: INTEGER) is
			-- Change the widget's appearance to one of: GTK_SHADOW_NONE,
			-- GTK_SHADOW_IN, GTK_SHADOW_OUT, GTK_SHADOW_ETCHED_IN
			-- (the default) or GTK_SHADOW_ETCHED_OUT 
		do
			gtk_frame_set_shadow_type (widget, t)
		end

feature {NONE}

	make (text: STRING) is
			-- Create a new frame widget with a label
		require
			text_valid: text /= Void
		do
			widget := npc.np_gtk_frame_new (text)
			register_widget
		end

	make_no_label is
			-- Create a new frame widget with no label
		do
			widget := gtk_frame_new (default_pointer)
			register_widget
		end

end
