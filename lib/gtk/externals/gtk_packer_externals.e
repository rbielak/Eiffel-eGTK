-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PACKER"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_packer_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_PACKER_EXTERNALS

feature  -- GtkPackerOptions constants

	Gtk_pack_expand: INTEGER	is 1	--  1 << 0
	Gtk_fill_x: INTEGER		is 2	--  1 << 1
	Gtk_fill_y: INTEGER		is 4	--  1 << 2

feature  -- GtkSideType constants

	Gtk_side_top: INTEGER		is 0
	Gtk_side_bottom: INTEGER	is 0
	Gtk_side_left: INTEGER		is 2
	Gtk_side_right: INTEGER		is 3

feature  -- GtkAnchorType constants

	Gtk_anchor_center: INTEGER	is 0
	Gtk_anchor_n,
	Gtk_anchor_north: INTEGER	is 1
	Gtk_anchor_nw,
	Gtk_anchor_north_west: INTEGER	is 2
	Gtk_anchor_ne,
	Gtk_anchor_north_east: INTEGER	is 3
	Gtk_anchor_s,
	Gtk_anchor_south: INTEGER	is 4
	Gtk_anchor_sw,
	Gtk_anchor_south_west: INTEGER	is 5
	Gtk_anchor_se,
	Gtk_anchor_south_east: INTEGER	is 6
	Gtk_anchor_w,
	Gtk_anchor_west: INTEGER	is 7
	Gtk_anchor_e,
	Gtk_anchor_east: INTEGER	is 8

feature {NONE}  -- GTK+ calls

	gtk_packer_new: POINTER is
		external "C"
		end

	gtk_packer_add_defaults (packer, child: POINTER;
				side, anchor, options: INTEGER) is
		-- child is a GtkWidget*
		-- side is a GtkSideType constant
		-- anchor is a GtkAnchorType constant
		-- side is a GtkSideType constant
		external "C"
		end

	gtk_packer_add (packer, child: POINTER;
				side, anchor, options, border_width, 
				pad_x, pad_y, i_pad_x, i_pad_y: INTEGER) is
		-- child is a GtkWidget*
		-- side is a GtkSideType constant
		-- anchor is a GtkAnchorType constant
		-- options is a GtkPackerOptions constant
		external "C"
		end

	gtk_packer_set_child_packing (packer, child: POINTER;
				side, anchor, options, border_width, 
				pad_x, pad_y, i_pad_x, i_pad_y: INTEGER) is
		-- child is a GtkWidget*
		-- side is a GtkSideType constant
		-- anchor is a GtkAnchorType constant
		-- options is a GtkPackerOptions constant
		external "C"
		end

	gtk_packer_reorder_child (packer, child: POINTER;
					position: INTEGER) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_packer_set_spacing (packer: POINTER; spacing: INTEGER) is
		external "C"
		end

	gtk_packer_set_default_border_width (packer: POINTER;
				border: INTEGER) is
		external "C"
		end

	gtk_packer_set_default_pad (packer: POINTER;
				pad_x, pad_y: INTEGER) is
		external "C"
		end

	gtk_packer_set_default_ipad (packer: POINTER;
				i_pad_x, i_pad_y: INTEGER) is
		external "C"
		end


end  --	GTK_PACKER_EXTERNALS
