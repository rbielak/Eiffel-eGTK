-- Copyright 1998 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_MISC"
	author: "Daniel Elphick"

class GTK_MISC

-- Classes like GTK_LABEL inherit from this. It provides common routunes like
-- setting alignment and padding

inherit

	GTK_WIDGET

	GTK_MISC_EXTERNALS
		undefine
			copy, is_equal
		end

feature

	set_alignment(x, y: REAL) is
		do
			gtk_misc_set_alignment(widget, x, y)
		end

	set_padding(xpad, ypad: INTEGER) is
		do
			gtk_misc_set_padding(widget, xpad, ypad)
		end

end -- GTK_MISC
