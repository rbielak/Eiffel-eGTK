-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PANED"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_paned_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_PANED_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_paned_add1 (paned, child: POINTER) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_paned_add2 (paned, child: POINTER) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_paned_pack1 (paned, child: POINTER;
				   resize, shrink: BOOLEAN) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_paned_pack2 (paned, child: POINTER;
				   resize, shrink: BOOLEAN) is
		-- child is a GtkWidget*
		external "C"
		end

	gtk_paned_set_position (paned: POINTER; position: INTEGER) is
		external "C"
		end

	gtk_paned_set_handle_size (paned: POINTER;
				   size: INTEGER) is
		-- size is a guint16
		external "C"
		end

	gtk_paned_set_gutter_size (paned: POINTER;
				   size: INTEGER) is
		-- size is a guint16
		external "C"
		end

-- C externals

	c_gtk_paned_set_gutter_size(paned: POINTER; size: INTEGER) is
			-- size is actually a guint16 which is why this is needed
		external "C"
		end

	c_gtk_paned_set_handle_size(paned: POINTER; size: INTEGER) is
			-- size is actually a guint16 which is why this is needed
		external "C"
		end

end  -- GTK_PANED_EXTERNALS
