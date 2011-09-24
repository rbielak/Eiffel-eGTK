-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TABLE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_table_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_TABLE_EXTERNALS


feature {NONE}

	gtk_table_new (rows, columns: INTEGER; homogenous: BOOLEAN): POINTER is
		external "C"
		end

	gtk_table_resize (table: POINTER; rows, columns: INTEGER) is
		external "C"
		end

	gtk_table_attach (table, widget: POINTER; lef, right, top, bottom,
			  x_opt, y_opt, x_pad, y_pad: INTEGER) is
		external "C"
		end
			
	gtk_table_attach_defaults (table, widget: POINTER;
				       left_attach, right_attach,
				       top_attach, bottom_attach: INTEGER) is
		external "C"
		end

	gtk_table_set_row_spacing (table: POINTER; row, spacing: INTEGER) is
		external "C"
		end

	gtk_table_set_col_spacing (table: POINTER;
				       column, spacing: INTEGER) is
		external "C"
		end

	gtk_table_set_row_spacings (t: POINTER; n: INTEGER) is
		external "C"
		end

	gtk_table_set_col_spacings (t: POINTER; n: INTEGER) is
		external "C"
		end

	gtk_table_set_homogeneous (table: POINTER;
				       homogeneous: BOOLEAN) is
		external "C"
		end

end  -- GTK_TABLE_EXTERNALS
