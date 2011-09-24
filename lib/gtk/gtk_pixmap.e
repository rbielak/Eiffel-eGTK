
-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_PIXMAP - pixmap widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_pixmap.e,v 1.15 2003/01/11 19:04:23 elphick Exp $"

class GTK_PIXMAP

-- An image defined by an array of characters at one byte per pixeL

inherit
	
	GTK_MISC

	GTK_RC
		undefine
			copy, is_equal
		end

	GTK_PIXMAP_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

	EXCEPTIONS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_xpm,
	make_from_pointer

feature {NONE}

	make (pixmap: GDK_PIXMAP; mask: POINTER) is
		require
			pixmap_not_void: pixmap /= Void
		do
			widget := gtk_pixmap_new (pixmap.pixmap, mask)
			register_widget
		end

	xpm_path: STRING

	make_from_xpm (new_parent: GTK_WIDGET; file_name: STRING) is
		require
			parent_not_void: new_parent /= Void
			file_name_valid: file_name /= Void and then file_name.count /= 0
		local
			p: GDK_PIXMAP
		do	
			xpm_path := rc_find_pixmap_in_path(file_name)
			if xpm_path /= Void then
				create p.make_from_xpm(new_parent.window, Void, xpm_path)
				make(p, Default_pointer)
			else
				raise("Pixmap " + file_name + " not found")
			end
		end

	find_xpm(x: STRING) is
			-- locate the xpm file and set xpm_path to its path
		obsolete "Use rc files to set the pixmap search path"
		do
			-- default to current directory for now
			xpm_path := clone("./")
			xpm_path.append(x)
		end
	
end
