-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_VISIBILITY - visibility change event"

class GDK_EVENT_VISIBILITY

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	state: INTEGER is
			-- return type is GdkVisbilityState
		do
			Result := c_gdk_event_visibility_state (object)
		end
	

end
