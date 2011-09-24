-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Constant definitions for selection modes"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_selectionmode_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_SELECTIONMODE_ENUM

feature  -- GtkSelectionMode constants

	Gtk_selection_single: INTEGER		is 0
	Gtk_selection_browse: INTEGER		is 1
	Gtk_selection_multiple: INTEGER		is 2
	Gtk_selection_extended: INTEGER		is 3

end -- GTK_SELECTIONMODE_ENUM
