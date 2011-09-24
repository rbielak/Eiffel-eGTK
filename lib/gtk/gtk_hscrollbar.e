-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk horizontal scrollbar"
	author: "Dave E Martin XXIII"
	genesis: "199905130654 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_hscrollbar.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_HSCROLLBAR

inherit

	GTK_RANGE
		rename 
			range as scrollbar 
		end

creation

	make

feature {NONE} -- initialization

	make (the_adjustment: GTK_ADJUSTMENT) is
		do
			scrollbar := gtk_hscrollbar_new (the_adjustment.adjustment)
			register_widget
		end

end -- GTK_HSCROLLBAR
