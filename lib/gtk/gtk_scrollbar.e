-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Scrollbar"
	author: "Dave E Martin XXIII"
	genesis: "199905130654 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_scrollbar.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

deferred class GTK_SCROLLBAR

inherit
	GTK_RANGE
		rename range as scrollbar end

end -- GTK_SCROLLBAR
