-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_EVENT_BOX - allows widgets which don't to accept signals"
	author: "Daniel Elphick"

class GTK_EVENT_BOX

inherit

	GTK_BIN

	GTK_EVENT_BOX_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature {NONE}

	make is
			-- Create an event box
		do
			widget := gtk_event_box_new
			register_widget
		end
   
end -- GTK_EVENT_BOX
