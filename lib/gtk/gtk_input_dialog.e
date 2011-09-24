-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_INPUT_DIALOG"
	cvs: "$Id: gtk_input_dialog.e,v 1.3 1999/08/30 20:09:32 pi Exp $"

class GTK_INPUT_DIALOG

-- An input dialog (whatever that is)
--
-- Signals (from gtkinputdialog.c):
--    "disable_device"
--    "enable_device"

inherit
	
   GTK_DIALOG
      rename
	 make as make_dialog
      end
   
   GTK_INPUTDIALOG_EXTERNALS
      undefine
	 copy, is_equal
      end

creation
	
	make,
	make_from_pointer
	
feature
	
	make is 
		do
			dialog := gtk_input_dialog_new
			register_widget
		end
	
end -- GTK_INPUT_DIALOG
