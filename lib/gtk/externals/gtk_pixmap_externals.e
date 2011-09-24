-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PIXMAP"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_pixmap_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_PIXMAP_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_pixmap_new (pixmap, mask: POINTER): POINTER is
		-- pixmap is a GdkPixmap*
		-- mask is a GtkBitmap*
		external "C"
		end

	gtk_pixmap_set (pixmap, val, mask: POINTER) is
		-- pixmap is a GtkPixmap*
		-- val is a GdkPixmap*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_pixmap_get (pixmap, val, mask: POINTER) is
		-- pixmap is a GtkPixmap*
		-- val is a GdkPixmap**
		-- mask is a GdkBitmap**
		external "C"
		end

	gtk_pixmap_set_build_insensitive (pixmap: POINTER; build: INTEGER) is
		-- pixmap is a GtkPixmap*
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_pixmap_create_from_xpm (parent, fname: POINTER): POINTER is
		external "C"
		end

end  -- GTK_PIXMAP_EXTERNALS
