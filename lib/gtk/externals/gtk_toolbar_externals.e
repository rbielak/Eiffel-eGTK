-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TOOLBAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_toolbar_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_TOOLBAR_EXTERNALS

feature --  GtkToolbarChildType constants
	-- One of these constants is to be used as the type in calls
	-- to gtk_toolbar_insert_element

	GTK_TOOLBAR_CHILD_SPACE: INTEGER is 0

	GTK_TOOLBAR_CHILD_BUTTON: INTEGER is 1

	GTK_TOOLBAR_CHILD_TOGGLEBUTTON: INTEGER is 2

	GTK_TOOLBAR_CHILD_RADIOBUTTON: INTEGER is 3

	GTK_TOOLBAR_CHILD_WIDGET: INTEGER is 4

feature --  GtkToolbarSpaceStyle constants
	-- One of these constants is to be used as the type in calls
	-- to gtk_toolbar_set_space_style

	GTK_TOOLBAR_SPACE_EMPTY: INTEGER is 0

	GTK_TOOLBAR_SPACE_LINE: INTEGER is 1

feature {NONE}

	gtk_toolbar_new (o, s: INTEGER): POINTER is
		external "C"
		end

	gtk_toolbar_append_item (t: POINTER; text, ttext, tptext: POINTER;
			 icon: POINTER; callback, data: POINTER): POINTER is
		external "C"
		end

	gtk_toolbar_prepend_item (t: POINTER; text, ttext, tptext: POINTER;
			 icon: POINTER; callback, data: POINTER): POINTER is
		external "C"
		end

	gtk_toolbar_insert_item (t: POINTER; text, ttext, tptext: POINTER;
			icon: POINTER;
			callback, data: POINTER;
			position: INTEGER): POINTER is
		external "C"
		end

	gtk_toolbar_append_space (t: POINTER) is
		external "C"
		end

	gtk_toolbar_prepend_space (t: POINTER) is
		external "C"
		end

	gtk_toolbar_insert_space (t: POINTER; position: INTEGER) is
		external "C"
		end

	gtk_toolbar_append_element (t: POINTER; type: INTEGER;
			widget: POINTER;
			text, ttext, tptext: POINTER;
			icon: POINTER;
			callback, data: POINTER): POINTER is
		external "C"
		end

	gtk_toolbar_prepend_element (t: POINTER; type: INTEGER;
			widget: POINTER;
			text, ttext, tptext: POINTER;
			icon: POINTER;
			callback, data: POINTER): POINTER is
		external "C"
		end

	gtk_toolbar_insert_element (t: POINTER; type: INTEGER;
			widget: POINTER;
			text, ttext, tptext: POINTER;
			icon: POINTER;
			callback, data: POINTER;
			position: INTEGER): POINTER is
			-- type is a GtkToolbarChildType constant
		external "C"
		end

	gtk_toolbar_append_widget (t, w: POINTER; tip, ptip: POINTER) is
		external "C"
		end

	gtk_toolbar_prepend_widget (t, w: POINTER; tip, ptip: POINTER) is
		external "C"
		end

	gtk_toolbar_insert_widget (t, w: POINTER; tip, ptip: POINTER;
			position: INTEGER) is
		external "C"
		end

	gtk_toolbar_set_orientation (t: POINTER; o: INTEGER) is
		external "C"
		end

	gtk_toolbar_set_style (t: POINTER; style: INTEGER) is
		external "C"
		end

	gtk_toolbar_set_space_size (t: POINTER; sz: INTEGER) is
		external "C"
		end

	gtk_toolbar_set_space_style (t: POINTER; st: INTEGER) is
			-- st is a GtkToolbarSpaceStyle constant
		external "C"
		end

	gtk_toolbar_set_tooltips (t: POINTER; fl: BOOLEAN) is
		external "C"
		end

	gtk_toolbar_set_button_relief (t: POINTER; rs: INTEGER) is
		external "C"
		end

	gtk_toolbar_get_button_relief (t: POINTER): INTEGER is
		external "C"
		end

end  -- GTK_TOOLBAR_EXTERNALS
