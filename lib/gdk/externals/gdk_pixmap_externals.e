indexing

	description: "A class that provides access to a pixmap"
	author: "Richie Bielak"
	date: "July 19th, 1999"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class GDK_PIXMAP_EXTERNALS

feature

	gdk_pixmap_new (window: POINTER; width, height, depth: INTEGER): POINTER is
			-- GdkWindow  *window,
			-- gint	     width,
			-- gint	     height,
			-- gint	     depth
		external "C"
		end

	gdk_pixmap_create_from_data (window: POINTER; data: POINTER; width, height, depth: INTEGER;
								 fg_color, bg_color: POINTER): POINTER is
			-- GdkWindow   *window
			-- const gchar *data
			-- gint	      width
			-- gint	      height
			-- gint	      depth
			-- GdkColor    *fg
			-- GdkColor    *bg
		external "C"
		end
								 
	gdk_pixmap_create_from_xpm (window, mask, transparent_color, file_name: POINTER): POINTER is
			-- GdkWindow  *window,
			-- GdkBitmap **mask,
			-- GdkColor   *transparent_color,
			-- const gchar *filename
		external "C"
		end
	
	gdk_pixmap_colormap_create_from_xpm (window, colormap, mask, transparent_color,
										 file_name: POINTER): POINTER is
			-- GdkWindow  *window,
			-- GdkColormap *colormap,
			-- GdkBitmap **mask,
			-- GdkColor   *transparent_color,
			-- const gchar *filename
		external "C"
		end
	
	gdk_pixmap_create_from_xpm_d (window, mask, transparent_color, data: POINTER): POINTER is
			-- GdkWindow  *window,
			-- GdkBitmap **mask,
			-- GdkColor   *transparent_color,
			-- gchar	   **data
		external "C"
		end

	gdk_pixmap_colormap_create_from_xpm_d (window, colormap, mask, tranparent_color, 
										   data: POINTER): POINTER is
			-- GdkWindow   *window,
			-- GdkColormap *colormap,
			-- GdkBitmap  **mask,
			-- GdkColor    *transparent_color,
			-- gchar     **data
		external "C"
		end

	gdk_pixmap_unref (p: POINTER) is
		external "C"
		end

	gdk_pixmap_ref (p: POINTER) : POINTER is
		external "C"
		end

end
