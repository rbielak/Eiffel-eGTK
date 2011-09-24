-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CELL_EXTERNALS - externals for all types of GtkCell"
	author: "Richie Bielak"
	date: "April 18, 2000"

class GTK_CELL_EXTERNALS

feature {NONE}

	c_gtk_cell_type (c: POINTER): INTEGER is
		external "C"
		end

	c_gtk_cell_vertical (c: POINTER): INTEGER is
		external "C"
		end

	c_gtk_cell_horizontal (c: POINTER): INTEGER is
		external "C"
		end

	c_gtk_cell_style (c: POINTER): POINTER is
		external "C"
		end

	c_gtk_cell_text_text (c: POINTER): POINTER is
		external "C"
		end

	c_gtk_cell_text_set_text (c: POINTER; text: POINTER) is
		external "C"
		end


end
