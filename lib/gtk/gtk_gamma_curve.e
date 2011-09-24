-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_GAMMA_CURVE"
	author: "Daniel Elphick"

class GTK_GAMMA_CURVE

inherit

	GTK_BOX

	GTK_GAMMA_EXTERNALS
		undefine
			copy, is_equal
		end
	
creation

	make
	
feature

	make is
		do
			create children.make (1, 0)
			widget := gtk_gamma_curve_new
			create curve.make_from_pointer(c_gtk_gamma_curve_curve(widget))
			register_widget
		end

	curve: GTK_CURVE

end
