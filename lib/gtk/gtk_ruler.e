-- Copyright (C) 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Ruler"
	author: "Daniel Elphick"

class GTK_RULER

inherit

	GTK_WIDGET

	GTK_RULER_EXTERNALS
		undefine
			copy, is_equal
		end

feature

	set_metric(metric: INTEGER) is
		do
			gtk_ruler_set_metric(widget, metric)
		end

	set_range(lower, upper, position, max_size: REAL) is
		do
			gtk_ruler_set_range(widget, lower, upper, position, max_size)
		end

	draw_ticks is
		do
			gtk_ruler_draw_ticks(widget)
		end

	draw_pos is
		do	
			gtk_ruler_draw_pos(widget)
		end

end -- GTK_RULER
