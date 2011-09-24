-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_CONFIGURE"
	cvs: "$Id: gdk_event_configure.e,v 1.1 2000/01/12 02:57:23 richieb Exp $"

class GDK_EVENT_CONFIGURE

inherit

	GDK_EVENT

creation

	make_from_pointer

feature

	x: INTEGER is
		do
			Result := c_gdk_event_configure_x (object)
		end

	y: INTEGER is
		do
			Result := c_gdk_event_configure_y (object)
		end

	width: INTEGER is
		do
			Result := c_gdk_event_configure_width (object)
		end

	height: INTEGER is
		do
			Result := c_gdk_event_configure_height (object)
		end

end

