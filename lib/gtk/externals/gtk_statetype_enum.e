-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Constant definitions for State types"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_statetype_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_STATETYPE_ENUM

feature  -- GtkStateType constants

	Gtk_state_normal: INTEGER		is 0
	Gtk_state_active: INTEGER		is 1
	Gtk_state_prelight: INTEGER		is 2
	Gtk_state_selected: INTEGER		is 3
	Gtk_state_insensitive: INTEGER		is 4

end -- GTK_STATETYPE_ENUM
