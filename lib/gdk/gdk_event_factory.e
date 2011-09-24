-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_EVENT_FACTORY - create GDK_EVENT object based %
                 %on call back data"
	author: "Richie Bielak"
	verions: "0.3.4 Gtk+ 1.2.1"
	cvs: "$Id: gdk_event_factory.e,v 1.10 2003/01/11 19:32:51 elphick Exp $"

class GDK_EVENT_FACTORY

inherit

	GDK_EVENT_EXTERNALS

	GDK_CONSTANTS

feature

	make_event (eventp: POINTER): GDK_EVENT is
			-- create an Eiffel object for the event
		require
			eventp_not_void: eventp /= default_pointer
		local
			event_type: INTEGER
		do
			event_type := c_gdk_event_type (eventp)
			debug
				print("event_type = " + event_type.out + "%N")
			end
			inspect event_type 
			when Gdk_button_press,
				Gdk_2button_press,
				Gdk_3button_press,
				Gdk_button_release
			 then
				!GDK_EVENT_BUTTON!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_BUTTON%N")
				end
			when Gdk_key_press,
				Gdk_key_release 
			 then
				!GDK_EVENT_KEY!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_KEY%N")
				end
			when Gdk_configure then
				!GDK_EVENT_CONFIGURE!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_CONFIGURE%N")
				end
			when Gdk_expose then
				!GDK_EVENT_EXPOSE!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_EXPOSE%N")
				end
			when Gdk_no_expose then
				create Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT (no_expose)%N")
				end
			when Gdk_motion_notify then
				!GDK_EVENT_MOTION!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_MOTION%N")
				end
			when Gdk_destroy then
				create Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT (destroy)%N")
				end
			when Gdk_visibility_notify then
				!GDK_EVENT_VISIBILITY!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_VISIBILITY%N")
				end
			when Gdk_focus_change then
				!GDK_EVENT_FOCUS!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_FOCUS%N")
				end
			when Gdk_property_notify then
				!GDK_EVENT_PROPERTY!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_PROPERTY%N")
				end
			when Gdk_selection_clear,
				Gdk_selection_request,
				Gdk_selection_notify
			 then
				!GDK_EVENT_SELECTION!Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT_SELECTION%N")
				end
			when Gdk_delete, 
				Gdk_enter_notify,
				Gdk_leave_notify,
				Gdk_map,
				Gdk_unmap,
				Gdk_proximity_in,
				Gdk_proximity_out,
				Gdk_drag_enter,
				Gdk_drag_leave,
				Gdk_drag_motion,
				Gdk_drag_status,
				Gdk_drop_start,
				Gdk_drop_finished,
				Gdk_client_event
			 then
				create Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT (various)%N")
				end
			else
				create Result.make_from_pointer (eventp)
				debug
					print("Made GDK_EVENT (unkown)%N")
				end
			end
		end

end -- GDK_EVENT_FACTORY
