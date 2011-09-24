-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_ASPECT_FRAME - frame widget which keeps shape"
	author: "Daniel Elphick"

class GTK_ASPECT_FRAME

inherit

	GTK_FRAME
		rename
			make as make_frame,
			make_no_label as make_frame_no_label
		end

	GTK_ASPECT_FRAME_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_no_label

feature

	set(xalign, yalign, ratio: REAL; obey_child: BOOLEAN) is
		do
			gtk_aspect_frame_set(widget, xalign, yalign, ratio, obey_child)
		end

feature {NONE}

	make (text: STRING; xalign, yalign, ratio: REAL; obey_child: BOOLEAN) is
			-- Create a new aspect frame widget with a label
		require
			text_valid: text /= Void
		do
			widget := npc.np_gtk_aspect_frame_new (text, xalign, yalign, ratio,
													obey_child)
			register_widget
		end

	make_no_label(xalign, yalign, ratio: REAL; obey_child: BOOLEAN) is
			-- Create a new aspect frame widget with no label
		do
			widget := gtk_aspect_frame_new (default_pointer, xalign, yalign,
												ratio, obey_child)
			register_widget
		end

end
