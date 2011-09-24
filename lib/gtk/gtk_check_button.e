-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CHECK_BUTTON - check button widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_check_button.e,v 1.6 2000/07/10 02:01:27 richieb Exp $"

class GTK_CHECK_BUTTON

-- A check button is a small square button whose visible state indicates
-- whether or not it is set.

inherit
	
	GTK_TOGGLE_BUTTON
		redefine
			make, make_with_label
		end

	GTK_CHECK_BUTTON_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make, make_with_label

feature {NONE}

	make_with_label (text: STRING) is
			-- Create a check button and set its label
		do
			widget := npc.np_gtk_check_button_new_with_label (text)
			register_widget
		end

	make is
			-- Create a check button
		do
			widget := gtk_check_button_new
			register_widget
		end

end -- GTK_CHECK_BUTTON
		
