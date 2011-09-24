-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_IMAGE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_image_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_IMAGE_EXTERNALS

feature {NONE}

	gtk_image_new (val, mask: POINTER): POINTER is
		external "C"
		end

	gtk_image_set (image, val, mask: POINTER) is
		-- val is a GdkImage*
		-- mask is a GdkBitmap*
		external "C"
		end

	gtk_image_get (image, val, mask: POINTER) is
		-- val is a GdkImage**
		-- mask is a GdkBitmap**
		external "C"
		end

end  -- GTK_IMAGE_EXTERNALS
