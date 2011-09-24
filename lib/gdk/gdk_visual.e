-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "type-safe wrapper for GdkVisual"
	author: "Dave E Martin XXIII"
	genesis: "199903110148 mst"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_visual.e,v 1.4 2000/07/10 02:01:26 richieb Exp $"

class GDK_VISUAL

inherit

	GDK_OBJECT
		rename
			object as visual
		end

creation

	make

feature {GTK_WIDGET}

	make (the_visual: POINTER) is
		do
			visual := the_visual
		end

end -- GDK_VISUAL
