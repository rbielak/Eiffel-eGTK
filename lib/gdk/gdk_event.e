-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "GDK_EVENT data"
	version: "v 0.3.5 GTK+ 1.2.x"
	cvs: "$Id: gdk_event.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GDK_EVENT 

inherit

	C_HANDLE
		rename
			handle as object
		end

	GDK_EVENT_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_from_pointer

feature -- fields common to all GDK events

	event_type: INTEGER is
		do
			Result := c_gdk_event_type (object)
		end

	window: GDK_WINDOW is
		local
			p: POINTER
		do
			p := c_gdk_event_window (object)
			if window_cache = Void or else window_cache.window /= p then
				create  window_cache.make (p)
			end
			Result := window_cache
		end

	send_event: INTEGER is
		do
			Result := c_gdk_event_send_event (object)
		end

feature {NONE}

	window_cache: GDK_WINDOW

	destroy_object is
		do
			-- nothing to do
		end

end
