
-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_SELECTION - a selection related event"

class GDK_EVENT_SELECTION

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	selection: INTEGER is
		do
			Result := c_gdk_event_selection_selection (object)
		end

	target: INTEGER is
		do
			Result := c_gdk_event_selection_target (object)
		end

	property: INTEGER is
		do
			Result := c_gdk_event_selection_property (object)
		end

	requestor: INTEGER is
		do
			Result := c_gdk_event_selection_requestor (object)
		end

	time: INTEGER is
		do
			Result := c_gdk_event_selection_time (object)
		end

end

