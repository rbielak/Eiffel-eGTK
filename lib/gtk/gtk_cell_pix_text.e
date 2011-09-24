-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CELL_PIX_TEXT - cell containing text and a pixmap"
	author: "Richie Bielak"
	date: "April 21,2000"

class GTK_CELL_PIX_TEXT

inherit

	GTK_CELL

creation

	make_from_pointer

feature -- TODO implement these features
	
	text: STRING is
		do
		end

	spacing: INTEGER is
		do
		end

	pixmap: GDK_PIXMAP is
		do
		end

	mask: GDK_BITMAP is
		do
		end

end
