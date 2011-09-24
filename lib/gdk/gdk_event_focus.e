-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_FOCUS - focus change event"

class GDK_EVENT_FOCUS

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	in: INTEGER is
		do
			Result := c_gdk_event_focus_in (object)
		end
	

end
