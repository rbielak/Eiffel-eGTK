-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "External GDK lib calls for GDK Events"

class GDK_EVENT_EXTERNALS

feature {NONE} -- GdkEvent fields

	c_gdk_event_type (object: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_window (gdk_event_motion: POINTER): POINTER is
		external "C"
		end

	c_gdk_event_send_event (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

feature	{NONE} -- GdkEventMotion


	c_gdk_event_motion_get_time (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_motion_get_x (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_y (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_pressure (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_xtilt (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_ytilt (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_state (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_motion_get_is_hint (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_motion_get_deviceid (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_motion_get_x_root (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_motion_get_y_root (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

feature	{NONE} -- GdkEventButton


	c_gdk_event_button_get_time (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_button_get_x (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_y (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_pressure (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_xtilt (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_ytilt (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_state (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_button_get_button (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_button_get_deviceid (gdk_event_motion: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_button_get_x_root (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

	c_gdk_event_button_get_y_root (gdk_event_motion: POINTER): DOUBLE is
		external "C"
		end

feature {NONE} -- GdkEventKey

	c_gdk_event_get_time (event: POINTER): INTEGER  is
		external "C"
		end

	c_gdk_event_get_state  (event: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_get_keyval (event: POINTER): INTEGER is
		external "C"
		end

feature {NONE} -- GdkEventConfigure

	c_gdk_event_configure_x (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_configure_y (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_configure_width (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_configure_height (ep: POINTER): INTEGER is
		external "C"
		end

feature {NONE} -- GdkEventExpose

	c_gdk_event_expose_area (ep: POINTER): POINTER is
		external "C"
		end

	c_gdk_event_expose_count (ep: POINTER): INTEGER is
		external "C"
		end

feature {NONE} -- GdkEventVisibility

	c_gdk_event_visibility_state (ep: POINTER): INTEGER is
		external "C"
		end


feature {NONE} -- GdkEventFocus

	c_gdk_event_focus_in (ep: POINTER): INTEGER is
		external "C"
		end

feature {NONE} -- GdkEventProperty

	c_gdk_event_property_atom (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_property_time (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_property_state (ep: POINTER): INTEGER is
		external "C"
		end

feature {NONE} -- GdkEventSelection

	c_gdk_event_selection_selection (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_selection_target (ep: POINTER): INTEGER is
		external "C"
		end		

	c_gdk_event_selection_property (ep: POINTER): INTEGER is
		external "C"
		end		

	c_gdk_event_selection_requestor (ep: POINTER): INTEGER is
		external "C"
		end

	c_gdk_event_selection_time (ep: POINTER): INTEGER is
		external "C"
		end

end
