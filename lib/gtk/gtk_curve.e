-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CURVE"
	author: "Daniel Elphick"

class GTK_CURVE

inherit

	GTK_DRAWING_AREA
		rename
			area as curve
		redefine
			make
		end
	
	GTK_CURVE_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_pointer

feature

	reset is
		do
			gtk_curve_reset(curve)
		end

	set_gamma(gamma: REAL) is
		do
			gtk_curve_set_gamma(curve, gamma)
		end

	set_range(min_x, max_x, min_y, max_y: REAL) is
		do
			gtk_curve_set_range(curve, min_x, max_x, min_y, max_y)
		end

	get_vector(veclen: INTEGER; vector: ARRAY[REAL]) is
			-- veclen is the number of elements in vector
		do
			npc.np_gtk_curve_get_vector(curve, veclen, vector)
		end

	set_vector(veclen: INTEGER; vector: ARRAY[REAL]) is
			-- veclen is the number of elements in vector 
		do
			npc.np_gtk_curve_set_vector(curve, veclen, vector)
		end

	set_curve_type(type: INTEGER) is
		do
			gtk_curve_set_curve_type(curve, type)
		end

feature {NONE}

	make is
		do
			curve := gtk_curve_new
			register_widget
		end

end
