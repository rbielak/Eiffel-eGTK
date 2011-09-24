-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903210418 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_event_motion.e,v 1.3 2000/07/10 02:01:26 richieb Exp $"
	HERE: "not completely glued to all c struct elements yet"

class GDK_EVENT_MOTION -- following C struct name for the event

inherit

	GDK_EVENT

	GDK_EXTERNALS
		export
			{NONE} all
		undefine
			copy, is_equal
		end

creation

	make_from_pointer

feature -- query

	time: INTEGER is -- HERE make a version with an Eiffel time type? (if there
						  -- is a standard time type?)
		do
			Result := c_gdk_event_motion_get_time (object)
		end

	x: DOUBLE is
			-- x-coordinate of event, relative to the window
		do
			Result := c_gdk_event_motion_get_x (object)
		end

	y: DOUBLE is
			-- x-coordinate of event, relative to the window
		do
			Result := c_gdk_event_motion_get_y (object)
		end

	pressure: DOUBLE is
		do
			Result := c_gdk_event_motion_get_pressure (object)
		end

	xtilt: DOUBLE is
		do
			Result := c_gdk_event_motion_get_xtilt (object)
		end

	ytilt: DOUBLE is
		do
			Result := c_gdk_event_motion_get_ytilt (object)
		end

	state: INTEGER is
		do
			Result := c_gdk_event_motion_get_state (object)
		end

	is_hint: INTEGER is -- sounds like boolean, but is a gint16
		do
			Result := c_gdk_event_motion_get_is_hint (object)
		end

	deviceid: INTEGER is
		do
			Result := c_gdk_event_motion_get_deviceid (object)
		end

	x_root: DOUBLE is
			-- x-coordinate of event, relative to the screen
		do
			Result := c_gdk_event_motion_get_x_root (object)
		end

	y_root: DOUBLE is
			-- y-coordinate of event, relative to the screen
		do
			Result := c_gdk_event_motion_get_y_root (object)
		end

end -- GDK_EVENT_MOTION
