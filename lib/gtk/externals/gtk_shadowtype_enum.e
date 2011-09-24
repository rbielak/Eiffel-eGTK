-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"Enumerated constants for Shadow types"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"August 1999"
	cvs:		"$Id: gtk_shadowtype_enum.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_SHADOWTYPE_ENUM

feature  -- GtkShadowType constants

	Gtk_shadow_none: INTEGER		is 0
	Gtk_shadow_in: INTEGER			is 1
	Gtk_shadow_out: INTEGER			is 2
	Gtk_shadow_etched_in: INTEGER		is 3
	Gtk_shadow_etched_out: INTEGER		is 4

end -- GTK_SHADOWTYPE_ENUM
