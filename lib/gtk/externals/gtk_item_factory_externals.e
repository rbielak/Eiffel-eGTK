-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_ITEM_FACTORY"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_item_factory_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_ITEM_FACTORY_EXTERNALS

feature {NONE}  -- GTK+ calls

	-- `container_type' must be one of GTK_TYPE_MENU_BAR, GTK_TYPE_MENU,
	-- or GTK_TYPE_OPTION_MENU.
	gtk_item_factory_new (container_type: INTEGER;
				    path, accel_group: POINTER): POINTER is
		-- container_type is a GtkType constant
		-- path is a const gchar*
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

	gtk_item_factory_construct (ifactory: POINTER; container_type: INTEGER;
				    path, accel_group: POINTER) is
		-- ifactory is a 
		-- container_type is a GtkType constant
		-- path is a const gchar*
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

     
-- These functions operate on GtkItemFactoryClass basis:

	gtk_item_factory_parse_rc (file_name: POINTER) is
		-- file_name is a const gchar*
		external "C"
		end

	gtk_item_factory_parse_rc_string (rc_string: POINTER) is
		-- rc_string is a const gchar*
		external "C"
		end

	gtk_item_factory_parse_rc_scanner (scanner: POINTER) is
		-- scanner is a GScanner*
		external "C"
		end

	gtk_item_factory_add_foreign (accel_widget, full_path,
					accel_group: POINTER;
					keyval, modifiers: INTEGER) is
		-- accel_widget is a GtkWidget*
		-- full_path is a const gchar*
		-- accel_group is a GtkAccelGroup*
		-- modifiers is a GdkModifierType constant
		external "C"
		end

     
	gtk_item_factory_from_widget (widget: POINTER): POINTER is
		-- widget is a GtkWidget*
		external "C"
		end

	gtk_item_factory_path_from_widget (widget: POINTER): POINTER is
		-- widget is a GtkWidget*
		-- returns a gchar*
		external "C"
		end


	gtk_item_factory_get_item (ifactory, path: POINTER): POINTER is
		-- path is a const gchar*
		-- returns a GtkWidget*
		external "C"
		end

	gtk_item_factory_get_widget (ifactory, path: POINTER): POINTER is
		-- path is a const gchar*
		-- returns a GtkWidget*
		external "C"
		end

	gtk_item_factory_get_widget_by_action (ifactory: POINTER;
					       action: INTEGER): POINTER is
		-- returns a GtkWidget*
		external "C"
		end

	gtk_item_factory_get_item_by_action (ifactory: POINTER;
					action: INTEGER): POINTER is
		-- returns a GtkWidget*
		external "C"
		end


-- Cannot directly implement a pointer_to_func
--	-- If `path_pspec' is passed as `NULL', this function will iterate
--	-- over all hash entries. otherwise only those entries will be
--	-- dumped for which the pattern matches, e.g. "<Image>*...".
--	gtk_item_factory_dump_items (path_pspec: POINTER;
--					 modified_only: BOOLEAN;
--					 GtkPrintFunc		 print_func,
--					 func_data: POINTER) is
--		-- path_pspec is a GtkPatternSpec*
--		-- func_data is a gpointer
--		external "C"
--		end

	gtk_item_factory_dump_rc (file_name, path_pspec: POINTER;
					 modified_only: BOOLEAN) is
		-- file_name is a const gchar*
		-- path_pspec is a GtkPatternSpec*
		external "C"
		end

	gtk_item_factory_print_func (FILE_pointer, string: POINTER) is
		-- FILE_pointer is a gpointer
		-- string is a gchar*
		external "C"
		end

	gtk_item_factory_create_item (ifactory, entry, callback_data: POINTER;
					 callback_type: INTEGER) is
		-- entry is a GtkItemFactoryEntry*
		-- callback_data is a gpointer
		external "C"
		end

	gtk_item_factory_create_items (ifactory: POINTER; n_entries: INTEGER;
					 entries, callback_data: POINTER) is
		-- entry is a GtkItemFactoryEntry*
		-- callback_data is a gpointer
		external "C"
		end

	gtk_item_factory_delete_item (ifactory, path: POINTER) is
		-- path is a const gchar*
		external "C"
		end

	gtk_item_factory_delete_entry (ifactory, entry: POINTER) is
		-- entry is a GtkItemFactoryEntry*
		external "C"
		end

	gtk_item_factory_delete_entries (ifactory: POINTER;
					 n_entries: INTEGER;
					 entries: POINTER) is
		-- entries is a GtkItemFactoryEntry*
		external "C"
		end

	gtk_item_factory_popup (ifactory: POINTER;
					 x, y,
					 mouse_button, time: INTEGER) is
		-- time is a guint32
		external "C"
		end

-- Cannot directly implement GtkDestroyNotify which is a pointer_to_func
--	gtk_item_factory_popup_with_data (ifactory, popup_data: POINTER,
--					 GtkDestroyNotify	 destroy;
--					 x, y,
--					 mouse_button, time: INTEGER) is
--		-- popup_data ia a gpointer
--		-- time is a guint32
--		external "C"
--		end

	gtk_item_factory_popup_data (ifactory: POINTER): POINTER is
		-- returns a gpointer
		external "C"
		end

	gtk_item_factory_popup_data_from_widget (widget: POINTER): POINTER is
		-- widget is a GtkWidget*
		-- returns a gpointer
		external "C"
		end

-- Cannot directly implement GtkTranslateFunc which is a pointer_to_func
-- Cannot directly implement GtkDestroyNotify which is a pointer_to_func
--	gtk_item_factory_set_translate_func (ifactory: POINTER;
--					    GtkTranslateFunc     func;
--					    gpointer             data: POINTER;
--					    GtkDestroyNotify     notify) is
--		external "C"
--		end

end  -- GTK_ITEM_FACTORY_EXTERNALS
