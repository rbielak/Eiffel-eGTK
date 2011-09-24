-- Copyright 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Definitions for Visibility constants"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"August 1999"
	cvs:		"$Id: gtk_visibility_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_VISIBILITY_ENUM

feature -- GtkVisibility constants

  Gtk_visibility_none: INTEGER		is	0
  Gtk_visibility_partial: INTEGER	is	1
  Gtk_visibility_full: INTEGER		is	2

end -- GTK_VISIBILITY_ENUM
