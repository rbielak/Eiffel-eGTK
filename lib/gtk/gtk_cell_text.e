-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CELL_TEXT - cell containing text"
	author: "Richie Bielak"
	date: "April 21,2000"

class GTK_CELL_TEXT

inherit

	GTK_CELL

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make_from_pointer

feature

	text: STRING is
		do
			Result := npc.np_gtk_cell_text_get_text(cell)
		end

	set_text (str: STRING) is
		do
			npc.np_gtk_cell_text_set_text (cell, str)
		end

end
