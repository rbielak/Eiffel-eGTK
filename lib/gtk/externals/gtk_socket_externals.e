-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SOCKET"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_socket_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_SOCKET_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_socket_new: POINTER is
		-- returns a GtkWidget*
		external "C"
		end

	gtk_socket_get_type: INTEGER is
		external "C"
		end

	gtk_socket_steal    (sockets: POINTER; wid: INTEGER) is
		-- socket is a GtkSocket*
		-- wid is a guint32
		external "C"
		end

end  -- GTK_SOCKET_EXTERNALS
