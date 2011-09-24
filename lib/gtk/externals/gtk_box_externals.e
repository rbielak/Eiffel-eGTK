-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_BOX"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_box_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_BOX_EXTERNALS

feature  -- GtkPackType constants

	Gtk_pack_start: INTEGER	is 0

	Gtk_pack_end: INTEGER	is 1

feature {NONE}

	gtk_box_pack_start (box, widget: POINTER; e, f: BOOLEAN; p: INTEGER) is
		external "C"
		end

	gtk_box_pack_end (box, widget: POINTER; e, f: BOOLEAN; p: INTEGER) is
		external "C"
		end

	gtk_box_pack_start_defaults (box, widget: POINTER) is
		external "C"
		end

	gtk_box_pack_end_defaults (box, widget: POINTER) is
		external "C"
		end

	gtk_box_set_homogeneous (box: POINTER; homogeneous: BOOLEAN) is
		external "C"
		end

	gtk_box_set_spacing (box: POINTER; spacing: INTEGER) is
		external "C"
		end

	gtk_box_reorder_child (box, child: POINTER; position: INTEGER) is
		external "C"
		end

	gtk_box_query_child_packing (box, child, expand, fill,
			padding, pack_type: POINTER) is
		-- expand, fill are pointers to gboolean
		-- padding is a pointer to guint
		-- pack_type is a pointer to GtkPackType
		external "C"
		end

	gtk_box_set_child_packing (box, child: POINTER; expand: BOOLEAN;
			fill: BOOLEAN; padding, pack_type: INTEGER) is
		external "C"
		end

end  -- GTK_BOX_EXTERNALS
