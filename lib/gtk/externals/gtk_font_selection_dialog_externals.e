indexing

	description: "Externals for GTK_FONT_SELECTION_DIALOG"
	author: "Daniel Elphick"

class GTK_FONT_SELECTION_DIALOG_EXTERNALS

inherit
	GTK_FONTSEL_EXTERNALS

feature {NONE} -- C glue code
   
	c_gtk_font_selection_dialog_ok_button (fs: POINTER): POINTER is
		external "C"
		end

	c_gtk_font_selection_dialog_apply_button (fs: POINTER): POINTER is
		external "C"
		end

	c_gtk_font_selection_dialog_cancel_button (fs: POINTER): POINTER is
		external "C"
		end

	c_gtk_font_selection_dialog_fontsel (fs: POINTER): POINTER is
		external "C"
		end
end
