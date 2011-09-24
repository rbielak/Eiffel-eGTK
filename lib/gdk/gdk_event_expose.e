-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	cvs: "$Id: gdk_event_expose.e,v 1.3 2003/01/11 19:32:51 elphick Exp $"

class GDK_EVENT_EXPOSE

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	area: GDK_RECTANGLE is
			-- area exposed
		do
			create Result.make_from_pointer (c_gdk_event_expose_area (object))
		end

	count: INTEGER is
			-- if not zero, count of events to follow
		do
			Result := c_gdk_event_expose_count (object)
		end

end

