-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "base class for the various button events, which have the same structure"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903210549 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_event_button.e,v 1.3 2000/07/10 02:01:26 richieb Exp $"
	HERE: "not completely glued to all c struct elements yet"
	notes: "A lot of these events seem to have a lot of common elements %
            %but the gdk library doesn't seem to put them into base classes."

class GDK_EVENT_BUTTON 

inherit

	GDK_EVENT

creation

	make_from_pointer

feature -- query

	
	time: INTEGER is 
			-- HERE make a version with an Eiffel time type? (if there
			-- is a standard time type?)
		do
			Result := c_gdk_event_button_get_time (object)
		end
	
	x: DOUBLE is
		do
			Result := c_gdk_event_button_get_x (object)
		end

	y: DOUBLE is
		do
			Result := c_gdk_event_button_get_y (object)
		end
	
	pressure: DOUBLE is
		do
			Result := c_gdk_event_button_get_pressure (object)
		end
	
	xtilt: DOUBLE is
		do
			Result := c_gdk_event_button_get_xtilt (object)
		end
	
	ytilt: DOUBLE is
		do
			Result := c_gdk_event_button_get_ytilt (object)
		end
	
	state: INTEGER is
		do
			Result := c_gdk_event_button_get_state (object)
		end
	
	button: INTEGER is
		do
			Result := c_gdk_event_button_get_button (object)
		end
	
	deviceid: INTEGER is
		do
			Result := c_gdk_event_button_get_deviceid (object)
		end
	
	x_root: DOUBLE is
		do
			Result := c_gdk_event_button_get_x_root (object)
		end
	
	y_root: DOUBLE is
		do
			Result := c_gdk_event_button_get_y_root (object)
		end
	
end
