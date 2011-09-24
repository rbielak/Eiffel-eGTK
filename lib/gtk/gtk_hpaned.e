-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_HPANED - Horizontal paned widget"
	author: "Daniel Elphick"

class GTK_HPANED

inherit

	GTK_PANED

	GTK_HPANED_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature {NONE}

	make is
		do
			create children.make(1,0)
			widget := gtk_hpaned_new
			register_widget
		end

end
