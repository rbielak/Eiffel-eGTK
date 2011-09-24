indexing

	description: "Externals for GTK_COLOR_SELECTION_DIALOG"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	date: "September 1999"

class GTK_COLOR_SELECTION_DIALOG_EXTERNALS

feature {NONE} -- GTK+ calls for ColorSelectionDialog
   
	c_gtk_color_selection_dialog_ok_button (cs: POINTER): POINTER is
		external "C"
		end

	c_gtk_color_selection_dialog_cancel_button (cs: POINTER): POINTER is
		external "C"
		end

	c_gtk_color_selection_dialog_help_button (cd: POINTER): POINTER is
		external "C"
		end

	c_gtk_color_selection_dialog_colorsel (cs: POINTER): POINTER is
		external "C"
		end
	
feature {NONE}

	gtk_color_selection_dialog_get_type: INTEGER is
		external "C"
		end
	
	gtk_color_selection_dialog_new (title: POINTER): POINTER is
			-- title is a const gchar*
		external "C"
		end


end
