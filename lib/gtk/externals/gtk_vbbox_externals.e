-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_VBBOX"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_vbbox_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_VBBOX_EXTERNALS

feature {NONE} -- GTK+ calls

	gtk_vbutton_box_new: POINTER is
		external "C"
		end

	gtk_vbutton_box_get_spacing_default: INTEGER is
		external "C"
		end

	gtk_vbutton_box_set_spacing_default (spacing: INTEGER) is
		external "C"
		end

	gtk_vbutton_box_get_layout_default: INTEGER is
		-- returns a GtkButtonBoxStyle constant
		external "C"
		end

	gtk_vbutton_box_set_layout_default (layout: INTEGER) is
		-- layout is a GtkButtonBoxStyle constant
		external "C"
		end

end  -- GTK_VBBOX_EXTERNALS
