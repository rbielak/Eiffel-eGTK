-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MISC"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_misc_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_MISC_EXTERNALS

feature {NONE}
			
	gtk_misc_set_alignment (w: POINTER; x,y: REAL) is
		external "C"
		end
	
	gtk_misc_set_padding   (misc: POINTER; xpad, ypad: INTEGER) is
		-- misc is a GtkMisc*
		external "C"
		end

end  -- GTK_MISC_EXTERNALS
