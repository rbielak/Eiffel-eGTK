-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_FONTSEL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_fontsel_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_FONTSEL_EXTERNALS

feature -- GtkFontMetricType constants
	-- Used to determine whether we are using point or pixel sizes.

	Gtk_font_metric_pixels: INTEGER		is 0
	Gtk_font_metric_points: INTEGER		is 1

feature -- GtkFontType constants
	-- Used for determining the type of a font style, and also for
	-- setting filters.  These can be combined if a style has bitmaps
	-- and scalable fonts available.

	Gtk_font_bitmap: INTEGER		is  1	--  1 << 0,
	Gtk_font_scalable: INTEGER		is  2	--  1 << 1,
	Gtk_font_scalable_bitmap: INTEGER	is  4	--  1 << 2,
	Gtk_font_all: INTEGER			is  7	--  0x07

feature -- GtkFontFilterType constants
	-- These are the two types of filter available - base and user. The
	-- base filter is set by the application and can't be changed by
	-- the user. 

	Gtk_font_filter_base: INTEGER		is  0
	Gtk_font_filter_user: INTEGER		is  1

feature {NONE} -- GTK+ calls

	gtk_font_selection_new: POINTER is
		external "C"
		end

	gtk_font_selection_get_font_name (fontsel: POINTER): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_font_selection_get_font (fontsel: POINTER): POINTER is
		-- returns a GdkFont*
		external "C"
		end

	gtk_font_selection_set_font_name (fontsel: POINTER;
				fontname: POINTER): BOOLEAN is
		-- fontname is a const gchar*
		external "C"
		end

	gtk_font_selection_set_filter (fontsel: POINTER;
				filter_type, font_type: INTEGER;
				foundries, weights, slants, setwidths,
				spacings, charsets: POINTER) is
		-- filter_type is a GtkFontFilterType constant
		-- font_type is a GtkFontType constant
		-- foundries, weights, slants, setwidths, spacings and
		-- charsets are gchar**
		external "C"
		end

	gtk_font_selection_get_preview_text (fontsel: POINTER): POINTER is
		-- returns gchar*
		external "C"
		end

	gtk_font_selection_set_preview_text (fontsel: POINTER;
				 text: POINTER) is
		-- text is const gchar*
		external "C"
		end

feature {NONE}	-- GtkFontSelectionDialog functions.
		-- most of these functions simply call the corresponding
		-- function in the GtkFontSelection.

	gtk_font_selection_dialog_get_type: INTEGER is
		-- returns a GtkType constant
		external "C"
	end

	gtk_font_selection_dialog_new (title: POINTER): POINTER is
		-- title is a const gchar*
		-- returns a GtkWidget*
		external "C"
		end

	-- This returns the X Logical Font Description fontname, or NULL if
	-- no font is selected. Note that there is a slight possibility that
	-- the font might not have been loaded OK. You should call
	-- gtk_font_selection_dialog_get_font () to see if it has been
	-- loaded OK.  You should g_free () the returned font name after
	-- you're done with it. */
	gtk_font_selection_dialog_get_font_name (fsd: POINTER): POINTER is
		-- fsd is a GtkFontSelectionDialog*
		-- returns a gchar*
		external "C"
		end

	-- This will return the current GdkFont, or NULL if none is selected
	-- or there was a problem loading it. Remember to use
	-- gdk_font_ref/unref () if you want to use the font (in a style,
	-- for example).
	gtk_font_selection_dialog_get_font (fsd: POINTER): POINTER is
		-- fsd is a GtkFontSelectionDialog*
		-- returns a GdkFont*
		external "C"
		end

	-- This sets the currently displayed font. It should be a valid X
	-- Logical Font Description font name (anything else will be ignored),
	-- e.g.  "-adobe-courier-bold-o-normal--25-*-*-*-*-*-*-*". It
	-- returns TRUE on success.
	gtk_font_selection_dialog_set_font_name (fsd,
				fontname: POINTER): BOOLEAN is
		-- fsd is a GtkFontSelectionDialog*
		-- fontname is a const gchar*
		external "C"
		end

	-- This sets one of the font filters, to limit the fonts shown. The
	-- filter_type is GTK_FONT_FILTER_BASE or GTK_FONT_FILTER_USER. The
	-- font type is a combination of the bit flags GTK_FONT_BITMAP,
	-- GTK_FONT_SCALABLE and GTK_FONT_SCALABLE_BITMAP (or GTK_FONT_ALL
	-- for all font types).  The foundries, weights etc. are arrays of
	-- strings containing property values, e.g. 'bold', 'demibold', and
	-- *MUST* finish with a NULL.  Standard long names are also accepted,
	-- e.g. 'italic' instead of 'i'.

	gtk_font_selection_dialog_set_filter (fsd: POINTER;
				filter_type, font_type: INTEGER;
				foundries, weights, slants,
				setwidths, spacings, charsets: POINTER) is
		-- fsd is a GtkFontSelectionDialog*
		-- filter_type is a GtkFontFilterType constant
		-- font_type is a GtkFontType constant
		-- foundries, weights, slants, setwidths, spacings and
		-- charsets are gchar**
		external "C"
		end

	-- This returns the text in the preview entry. You should copy the
	-- returned text if you need it.
	gtk_font_selection_dialog_get_preview_text (fsd: POINTER): POINTER is
		-- fsd is a GtkFontSelectionDialog*
		-- returns gchar*
		external "C"
		end


	-- This sets the text in the preview entry. It will be copied by the
	-- entry, so there's no need to g_strdup () it first. 
	gtk_font_selection_dialog_set_preview_text (fsd, text: POINTER) is
		-- fsd is a GtkFontSelectionDialog*
		-- text is a gchar*
		external "C"
		end

end  -- GTK_FONTSEL_EXTERNALS
