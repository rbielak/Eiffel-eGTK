-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Constant definitions for Arrow types"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_arrowtype_enum.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_ARROWTYPE_ENUM

feature -- GtkArrowType constants

	Gtk_arrow_up: INTEGER			is 0
	Gtk_arrow_down: INTEGER			is 1
	Gtk_arrow_left: INTEGER			is 2
	Gtk_arrow_right: INTEGER		is 3

end -- GTK_ARROWTYPE_ENUM
