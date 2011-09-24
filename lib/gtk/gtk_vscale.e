-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GtkVScale"
	author: "Dave E Martin XXIII"
	genesis: "199905130324 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_vscale.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_VSCALE

inherit

	GTK_SCALE

creation

	make

feature {NONE} -- initialization

	make (the_adjustment: GTK_ADJUSTMENT) is
		do
			scale := gtk_vscale_new (the_adjustment.adjustment)
			register_widget
		end

end -- GTK_VSCALE
