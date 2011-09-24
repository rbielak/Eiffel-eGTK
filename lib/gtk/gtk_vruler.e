-- Copyright (C) 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Vertical Ruler"
	author: "Daniel Elphick"

class GTK_VRULER

inherit

	GTK_RULER

	GTK_VRULER_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature {NONE}

	make is
		do
			widget := gtk_vruler_new
			register_widget
		end

end -- GTK_VRULER
