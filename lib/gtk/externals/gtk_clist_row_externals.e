-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CLIST_ROW_EXTERNALS"
	author: "Richie Bielak"
	date: "April 21,2000"

class GTK_CLIST_ROW_EXTERNALS

feature {NONE}

	c_gtk_clist_row_cell (rp: POINTER): POINTER is
		external "C"
		end

	c_gtk_clist_row_style (cp: POINTER): POINTER is
		external "C"
		end

end
