-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "GDK_KEY_EVENT - key press or release event"
	version: "v 0.3.5 GTK+ 1.2.x"

class GDK_EVENT_KEY

inherit

	GDK_EVENT

	GDK_EVENT_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_from_pointer

feature

	keyval: INTEGER is
		do
			Result := c_gdk_event_get_keyval (object)
		end

end
