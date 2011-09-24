-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "encapsulation of the gdk constants from the C headers"
	author: "Dave E Martin XXIII"
	genesis: "199904070100 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_constants.e,v 1.7 2000/07/10 02:01:26 richieb Exp $"

class GDK_CONSTANTS

--feature -- constants
-- the safe way: (for SmallEiffel)
--	Gdk_exposure_mask:BIT Integer_bits is
--		local
--			i: INTEGER
--		once
--			c_inline_c("i = GDK_EXPOSURE_MASK")
--			Result := i.to_bit
--		end

-- the efficent, most likely to be portable between eiffel compilers, least
-- pain in the butt way...

feature -- GdkEventMask

	Gdk_exposure_mask: INTEGER is 2
	Gdk_pointer_motion_mask: INTEGER is 4
	Gdk_pointer_motion_hint_mask: INTEGER is 8
	Gdk_button_motion_mask: INTEGER is 16
	Gdk_button1_motion_mask: INTEGER is 32
	Gdk_button2_motion_mask: INTEGER is 64
	Gdk_button3_motion_mask: INTEGER is 128
	Gdk_button_press_mask: INTEGER is 256
	Gdk_button_release_mask: INTEGER is 512
	Gdk_key_press_mask: INTEGER is 1_024
	Gdk_key_release_mask: INTEGER is 2_048
	Gdk_enter_notify_mask: INTEGER is 4_096
	Gdk_leave_notify_mask: INTEGER is 8_192
	Gdk_focus_change_mask: INTEGER is 16_384
	Gdk_structure_mask: INTEGER is 32_768
	Gdk_property_change_mask: INTEGER is 65_536
	Gdk_visibility_notify_mask: INTEGER is 131_072
	Gdk_proximity_in_mask: INTEGER is 262_144
	Gdk_visibility_out_mask: INTEGER is 524_288
	Gdk_substructure_mask: INTEGER is 1_048_576
	Gdk_all_events_mask: INTEGER is 1_048_575
		-- see comment in _B version, below about all_events not including
		-- substructure

	-- aligns when tab stops are set to 3
	-- bit version
	Gdk_exposure_mask_B: BIT 2 is				10b
	Gdk_pointer_motion_mask_B: BIT 3 is		100b
	Gdk_pointer_motion_hint_mask_B: BIT 4 is	1000b
	Gdk_button_motion_mask_B: BIT 5 is			10000b
	Gdk_button1_motion_mask_B: BIT 6 is		100000b
	Gdk_button2_motion_mask_B: BIT 7 is		1000000b
	Gdk_button3_motion_mask_B: BIT 8 is		10000000b
	Gdk_button_press_mask_B: BIT 9 is			100000000b
	Gdk_button_release_mask_B: BIT 10 is		1000000000b
	Gdk_key_press_mask_B: BIT 11 is				10000000000b
	Gdk_key_release_mask_B: BIT 12 is			100000000000b
	Gdk_enter_notify_mask_B: BIT 13 is			1000000000000b
	Gdk_leave_notify_mask_B: BIT 14 is			10000000000000b
	Gdk_focus_change_mask_B: BIT 15 is			100000000000000b
	Gdk_structure_mask_B: BIT 16 is				1000000000000000b
	Gdk_property_change_mask_B: BIT 17 is		10000000000000000b
	Gdk_visibility_notify_mask_B: BIT 18 is	100000000000000000b
	Gdk_proximity_in_mask_B: BIT 19 is			1000000000000000000b
	Gdk_visibility_out_mask_B: BIT 20 is		10000000000000000000b
	Gdk_substructure_mask_B: BIT 21 is			100000000000000000000b
	Gdk_all_events_mask_B: BIT 20 is			11111111111111111111b
		-- HERE This is one bit short of all bits really being set, HOWEVER
		-- it is the value given in gdktypes.h as of 7-apr-1999
		-- its *probably* a bug in the gdktypes.h, check for updates
		-- or else subscructure_mask is special

	-- Constants for GDK event types
	Gdk_nothing: INTEGER is  -1;
	Gdk_delete: INTEGER is 0;
	Gdk_destroy		: INTEGER is 1
	Gdk_expose		: INTEGER is 2
	Gdk_motion_notify	: INTEGER is 3
	Gdk_button_press	: INTEGER is 4
	Gdk_2button_press	: INTEGER is 5
	Gdk_3button_press	: INTEGER is 6
	Gdk_button_release	: INTEGER is 7
	Gdk_key_press		: INTEGER is 8
	Gdk_key_release	: INTEGER is 9
	Gdk_enter_notify	: INTEGER is 10
	Gdk_leave_notify	: INTEGER is 11
	Gdk_focus_change	: INTEGER is 12
	Gdk_configure		: INTEGER is 13
	Gdk_map		: INTEGER is 14
	Gdk_unmap		: INTEGER is 15
	Gdk_property_notify	: INTEGER is 16
	Gdk_selection_clear	: INTEGER is 17
	Gdk_selection_request : INTEGER is 18
	Gdk_selection_notify	: INTEGER is 19
	Gdk_proximity_in	: INTEGER is 20
	Gdk_proximity_out	: INTEGER is 21
	Gdk_drag_enter        : INTEGER is 22
	Gdk_drag_leave        : INTEGER is 23
	Gdk_drag_motion       : INTEGER is 24
	Gdk_drag_status       : INTEGER is 25
	Gdk_drop_start        : INTEGER is 26
	Gdk_drop_finished     : INTEGER is 27
	Gdk_client_event	: INTEGER is 28
	Gdk_visibility_notify : INTEGER is 29
	Gdk_no_expose		: INTEGER is 30

			-- GdkInputCondition
	Gdk_input_read       : INTEGER is  1
	Gdk_input_write      : INTEGER is  2
	Gdk_input_exception  : INTEGER is  4

			-- GdkVilibilityState
	Gdk_visibility_unobscured: INTEGER is 0
	Gdk_visibility_partial: INTEGER is 1
	Gdk_visibility_fully_obscured: INTEGER is 2





invariant

	constants_are_constant:
		-- these values match the values in the gdktypes.h file

end -- GDK_CONSTANTS

