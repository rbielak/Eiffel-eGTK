-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Constant definitions for justification types"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_justification_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_JUSTIFICATION_ENUM

feature -- GtkJustification constants

	Gtk_justify_left: INTEGER		is 0
	Gtk_justify_right: INTEGER		is 1
	Gtk_justify_center: INTEGER		is 2
	Gtk_justify_fill: INTEGER		is 3

end -- GTK_JUSTIFICATION_ENUM
