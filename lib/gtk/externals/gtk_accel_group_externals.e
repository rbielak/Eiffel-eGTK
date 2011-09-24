-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)

indexing

	description:	"Externals for Gtk accelator group"
	author:		"Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"
	cvs:		"$Id: gtk_accel_group_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_ACCEL_GROUP_EXTERNALS

inherit

	GTK_ACCEL_FLAGS

feature -- constants

	-- GdkModifierType values (can be OR'ed):
	Gdk_shift_mask: INTEGER is    1	--    1 << 0
	Gdk_lock_mask: INTEGER is    2	--    1 << 1
	Gdk_control_mask: INTEGER is    4	--    1 << 2
	Gdk_mod1_mask: INTEGER is   8	--    1 << 3
	Gdk_mod2_mask: INTEGER is 16	--    1 << 4
	Gdk_mod3_mask: INTEGER is 32	--    1 << 5
	Gdk_mod4_mask: INTEGER is 64	--    1 << 6
	Gdk_mod5_mask: INTEGER is  128	--    1 << 7
	Gdk_button1_mask: INTEGER is  256	--    1 << 8
	Gdk_button2_mask: INTEGER is  512	--    1 << 9
	Gdk_button3_mask: INTEGER is 1024	--    1 << 10
	Gdk_button4_mask: INTEGER is 2048	--    1 << 11
	Gdk_button5_mask: INTEGER is 4096	--    1 << 12
	Gdk_release_mask: INTEGER is 8192	--    1 << 13

feature {NONE}

	gtk_accel_group_new: POINTER is
		external "C"
		end

	gtk_accel_group_get_default: POINTER is
		external "C"
		end

	gtk_accel_group_ref (ag: POINTER): POINTER is
		external "C"
		end

	gtk_accel_group_unref (ag: POINTER) is
		external "C"
		end

	gtk_accel_group_activate (ag: POINTER;
							  accel_key,
							  accel_mask: INTEGER): BOOLEAN is
		-- accel_mask is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_groups_activate (obj: POINTER;
							   accel_key,
							   accel_mask: INTEGER): BOOLEAN is
		-- accel_mask is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_attach (ag: POINTER; o: POINTER) is
		external "C"
		end

	gtk_accel_group_detach (ag: POINTER; o: POINTER) is
		external "C"
		end

	gtk_accel_group_lock (ag: POINTER) is
		external "C"
		end

	gtk_accel_group_unlock (ag: POINTER) is
		external "C"
		end

	gtk_accel_group_get_entry (ag: POINTER;
			accel_key,
			accel_mods: INTEGER): POINTER is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_lock_entry (ag: POINTER;
			accel_key,
			accel_mods: INTEGER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_unlock_entry (ag: POINTER;
			accel_key,
			accel_mods: INTEGER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_add (ag: POINTER;
			accel_key,
			accel_mods,
			accel_flags: INTEGER;
			object,
			signal: POINTER) is
		-- accel_mods is GdkModifierType OR'ed values
		-- accel_flags is GtkAccelFlags OR'ed values
		external "C"
		end

	gtk_accel_group_remove (ag: POINTER;
			accel_key,
			accel_mods: INTEGER;
			object: POINTER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

feature {NONE} -- accelerator signals

	gtk_accel_group_handle_add (object: POINTER;
								accel_signal_id: INTEGER;
								accel_group: POINTER;
								accel_key: INTEGER;
								accel_mods, accel_flags: INTEGER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_handle_remove (object: POINTER;
								   accel_group: POINTER;
								   accel_key: INTEGER;
								   accel_mods: INTEGER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accel_group_create_add (class_type,
			signal_flags,
			handler_offset: INTEGER): INTEGER is
		external "C"
		end

	gtk_accel_group_create_remove (class_type,
			signal_flags,
			handler_offset: INTEGER) : INTEGER is
		external "C"
		end

	-- These two functions take an argument which is a pointer to a
	-- function; they cannot be directly represented in Eiffel:
	--   gtk_accel_group_marshal_add()
	--   gtk_accel_group_marshal_remove()

feature {NONE} -- miscellaneous

	gtk_accel_groups_from_object (object: POINTER) is
		external "C"
		end

	gtk_accel_group_entries_from_object (object: POINTER) is
		external "C"
		end

feature {NONE} -- accelerators

	gtk_accelerator_valid (keyval, accel_mods: INTEGER): BOOLEAN is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accelerator_parse (accelerator: POINTER;
			accelerator_key,
			accel_mods: INTEGER) is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accelerator_name (accelerator_key,
			accel_mods: INTEGER): POINTER is
		-- accel_mods is GdkModifierType OR'ed values
		external "C"
		end

	gtk_accelerator_set_default_mod_mask (default_mod_mask: INTEGER) is
		external "C"
		end

	gtk_accelerator_get_default_mod_mask is
		external "C"
		end

end -- GTK_ACCEL_GROUP_EXTERNALS
