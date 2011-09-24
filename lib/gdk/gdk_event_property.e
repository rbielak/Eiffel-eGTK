
-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_PROPERTY - a property  change event"

class GDK_EVENT_PROPERTY

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	atom: INTEGER is
			-- type is GdkAtom
		do
			Result := c_gdk_event_property_atom (object)
		end

	time: INTEGER is
			-- time as an integer
		do
			Result := c_gdk_event_property_time (object)
		end

	state: INTEGER is
		do
			Result := c_gdk_event_property_state (object)
		end
	

end
