-- Copyright (C) 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Horizontal Ruler"
	author: "Daniel Elphick"

class GTK_HRULER

inherit

	GTK_RULER

	GTK_HRULER_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature {NONE}

	make is
		do
			widget := gtk_hruler_new
			register_widget
		end

end -- GTK_HRULER
