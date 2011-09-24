-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Constant definitions for Position types"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_positiontype_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_POSITIONTYPE_ENUM

feature -- GtkPositionType constants

	Gtk_pos_left: INTEGER			is 0
	Gtk_pos_right: INTEGER			is 1
	Gtk_pos_top: INTEGER			is 2
	Gtk_pos_bottom: INTEGER			is 3

end -- GTK_POSITIONTYPE_ENUM
