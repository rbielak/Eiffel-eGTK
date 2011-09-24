-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_RC"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_rc_externals.e,v 1.7 2003/01/02 02:42:25 elphick Exp $"

class GTK_RC_EXTERNALS

feature -- GtkRcFlags constants

	Gtk_rc_fg: INTEGER		is  1
	Gtk_rc_bg: INTEGER		is  2
	Gtk_rc_text: INTEGER		is  4
	Gtk_rc_base: INTEGER		is  8

feature {NONE}  -- GTK+ calls
														
	gtk_rc_init is
		external "C"
		end

	gtk_rc_add_default_file (filename: POINTER) is
			-- filename is a const gchar*
		external "C"
		end

	gtk_rc_set_default_files (filenames: POINTER) is
			-- filenames is a gchar **
		external "C"
		end

	gtk_rc_get_default_files: POINTER is
			-- returns a gchar**
		external "C"
		end


	gtk_rc_parse (f: POINTER) is
		external "C"
		end

	gtk_rc_parse_string (rc_string: POINTER) is
			-- rc_string is a const gchar*
		external "C"
		end

	gtk_rc_reparse_all: INTEGER is
		external "C"
		end

	gtk_rc_get_style (widget: POINTER): POINTER is
			-- returns a GtkStyle*
		external "C"
		end

	gtk_rc_add_widget_name_style (rc_style, pattern: POINTER) is
			-- rc_style is a GtkRcStyle*
			-- pattern is a const gchar*
		external "C"
		end

	gtk_rc_add_widget_class_style (rc_style, pattern: POINTER) is
			-- rc_style is a GtkRcStyle*
			-- pattern is a const gchar*
		external "C"
		end

	gtk_rc_add_class_style (rc_style, pattern: POINTER) is
			-- rc_style is a GtkRcStyle*
			-- pattern is a const gchar*
		external "C"
		end

	gtk_rc_style_new: POINTER is
			-- returns a GtkRcStyle* 
		external "C"
		end

	gtk_rc_style_ref (rc_style: POINTER) is
			-- rc_style is a GtkRcStyle*
		external "C"
		end

	gtk_rc_style_unref (rc_style: POINTER) is
			-- rc_style is a GtkRcStyle*
		external "C"
		end

	-- Tell gtkrc to use a custom routine to load images specified in rc files instead of
	--   the default xpm-only loader
	--
	-- Cannot implement this pointer-to-func call directly
	-- typedef	GdkPixmap* (*GtkImageLoader) 		(GdkWindow   	*window,
	-- 						 GdkColormap 	*colormap,
	-- 						 GdkBitmap     **mask,
	-- 						 GdkColor    	*transparent_color,
	-- 						 const gchar 	*filename);
	-- 	gtk_rc_set_image_loader (GtkImageLoader	 loader);

	gtk_rc_load_image (colourmap, transparent_colour,
							 filename: POINTER): POINTER is
			-- colourmap is a GdkColormap*
			-- transparent_colour is a GdkColor*
			-- filename is a const gchar*
			-- returns a GdkPixmap*
		external "C"
		end

	gtk_rc_find_pixmap_in_path (scanner, pixmap_file: POINTER): POINTER is
			-- scanner is a GScanner*
			-- pixmap_file is a const gchar*
			-- returns a gchar* which needs to be freed if not null
		external "C"
		end
														
	gtk_rc_find_module_in_path (module_file: POINTER): POINTER is
			-- module_file is a const gchar*
			-- returns a gchar*		
		external "C"
		end

	gtk_rc_get_theme_dir: POINTER is
			-- returns a gchar*		
		external "C"
		end

	gtk_rc_get_module_dir: POINTER is
			-- returns a gchar*		
		external "C"
		end
														
	c_gtk_rc_style_colour_set(h: POINTER; i, j: INTEGER): INTEGER is
		external "C"
		end

	c_gtk_rc_style_colour(h: POINTER; i, j: INTEGER): POINTER is
		external "C"
		end

	c_gtk_rc_style_name(handle: POINTER): POINTER is
		external "C"
		end

	c_gtk_rc_style_font_name(handle: POINTER): POINTER is
		external "C"
		end

	c_gtk_rc_style_fontset_name(handle: POINTER): POINTER is
		external "C"
		end

	c_gtk_rc_style_pixmap_name(handle: POINTER; i: INTEGER): POINTER is
		external "C"
		end

end  -- GTK_RC_EXTERNALS.E
