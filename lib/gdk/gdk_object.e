-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "encapsulate some gdk object, semantics are defined by %
		%the derived objects"
	author: "Dave E Martin XXIII"
	genesis: "199904270404 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_object.e,v 1.9 2003/01/11 19:04:23 elphick Exp $"

class GDK_OBJECT

inherit

	GTK_IDENTIFIED

	GDK_EXTERNALS
		export
			{NONE} all
		undefine
			copy, is_equal
		end

feature {GDK_OBJECT, GDK_EVENT_COMMAND, GTK_WIDGET, GDK_EVENT, GTK_STYLE,
   GTK_NON_PORTABLE_CALLS, GNOME_CANVAS_RE, GNOME_CANVAS_RECTANGLE, GNOME_CANVAS_ELLIPSE, GNOME_CANVAS_POLYGON} -- query

	object: POINTER

invariant

	gdk_object_not_null: object /= default_pointer

end -- GDK_OBJECT
