-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PLUG"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_plug_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_PLUG_EXTERNALS

feature {NONE} -- GTK+ calls

	gtk_plug_construct (plug: POINTER; socket_id: INTEGER) is
		-- socket_id ia a guint32
		external "C"
		end

	gtk_plug_new (socket_id: INTEGER): POINTER is
		-- socket_id ia a guint32
		external "C"
		end

end  -- GTK_PLUG_EXTERNALS
