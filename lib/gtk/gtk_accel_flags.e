-- Copyright (C) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Possible states of a GTK_ACCEL_LABEL"
	date: "24th June 2000"
	cvs: "$Id: gtk_accel_flags.e,v 1.4 2000/06/28 12:19:31 elphick Exp $"

class GTK_ACCEL_FLAGS

	-- Enumeration of states applicable to a GTK_ACCEL_LABEL

feature --  GtkAccelFlags values (can be OR'ed):

	Gtk_accel_visible: INTEGER is          1	--    1 << 0
		-- should the accelerator appear in the widget's display?
	Gtk_accel_signal_visible: INTEGER is   2	--    1 << 1
		-- should the signal associated with this
		-- accelerator be visible too?
	Gtk_accel_locked: INTEGER is           4	--    1 << 2
		-- may the accelerator be removed again?

	Gtk_accel_mask: INTEGER is 7	

end
