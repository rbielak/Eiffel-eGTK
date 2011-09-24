-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PREVIEW"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_preview_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_PREVIEW_EXTERNALS

feature  -- GdkRgbDither constants

	Gdk_rgb_dither_none: INTEGER		is 0
	Gdk_rgb_dither_normal: INTEGER		is 1
	Gdk_rgb_dither_max: INTEGER		is 2

feature  -- GtkPreviewType constants

	Gtk_preview_color: INTEGER		is 0
	Gtk_preview_grayscale: INTEGER		is 1

feature {NONE}  -- GTK+ calls

	gtk_preview_uninit is
		external "C"
		end

	gtk_preview_new (type: INTEGER): POINTER is
		-- type is a GtkPreviewType constant
		external "C"
		end

	gtk_preview_size (preview: POINTER; width, height: INTEGER) is
		external "C"
		end

	gtk_preview_put (preview, window, gc: POINTER;
				srcx, srcy,
				destx, desty,
				width, height: INTEGER) is
		-- window is a GdkWindow*
		-- gc is a GdkGC*
		external "C"
		end

	gtk_preview_draw_row (preview, data: POINTER;
					x, y, w: INTEGER) is
		-- data is a guchar*
		external "C"
		end

	gtk_preview_set_expand (preview: POINTER; expand: BOOLEAN) is
		external "C"
		end


	gtk_preview_set_gamma (gamma: DOUBLE) is
		external "C"
		end

	gtk_preview_set_color_cube (nred_shades, ngreen_shades,
				nblue_shades, ngray_shades: INTEGER) is
		external "C"
		end

	gtk_preview_set_install_cmap (install_cmap: INTEGER) is
		external "C"
		end

	gtk_preview_set_reserved (nreserved: INTEGER) is
		external "C"
		end

	gtk_preview_set_dither (preview: POINTER; dither: INTEGER) is
		-- dither is a GdkRgbDither constant
		external "C"
		end

	gtk_preview_get_visual: POINTER is
		-- returns a GdkVisual*
		external "C"
		end

	gtk_preview_get_cmap: POINTER is
		-- returns a GdkColormap*
		external "C"
		end

	gtk_preview_get_info: POINTER is
		-- returns a GtkPreviewInfo*
		external "C"
		end

	-- This function reinitializes the preview colormap and visual from
	-- the current gamma/color_cube/install_cmap settings. It must only
	-- be called if there are no previews or users of the preview
	-- colormap in existence.
	gtk_preview_reset is
		external "C"
		end

end  -- GTK_PREVIEW_EXTERNALS
