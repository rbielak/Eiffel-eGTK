-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_LIST_ITEM"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_list_item_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_LIST_ITEM_EXTERNALS

feature

	gtk_list_item_new_with_label (l: POINTER): POINTER is
		external "C"
		end

	gtk_list_item_new: POINTER is
		external "C"
		end

	gtk_list_item_select (it: POINTER) is
		external "C"
		end

	gtk_list_item_deselect (it: POINTER) is
		external "C"
		end

-- GtkType    gtk_list_item_get_type       (void);

end  -- GTK_LIST_ITEM_EXTERNALS
