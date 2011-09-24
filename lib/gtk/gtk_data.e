-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Data"
	author: "Dave E Martin XXIII"
	genesis: "199905120612 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_data.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

deferred class GTK_DATA

-- signal (from gtkdata.c):
--    "disconnect"

inherit
	GTK_OBJECT
		rename gtk_object as data end

	-- yes, this class is empty

end -- GTK_DATA
