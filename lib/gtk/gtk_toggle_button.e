-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TOGGLE_BUTTON - button that stays in or out"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_toggle_button.e,v 1.8 2002/08/26 05:04:43 DJAC Exp $"

class GTK_TOGGLE_BUTTON

-- A button which changes its state (normal or depressed) each time it is
-- clicked.
--
-- Signals (from gtktogglebutton.c):
--    "toggled"

-- TODO: implement the ability to change the button's child,
--       whereupon the rename and export{NONE} below can be
--       removed.

inherit

	GTK_BUTTON
		rename
			-- to avoid the pre/postconditions of make_with_label
			make_with_label as mwl
		export {NONE}
			-- restrict export because the creation routines don't
			-- set child up properly, and this is true of other
			-- descendant classes
			label, pixmap, child, label_text, set_label, set_pixmap,
			child_is_label, child_is_pixmap, make_with_pixmap, mwl
		redefine
			make
		end

	GTK_TOGGLE_BUTTON_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_with_label,
	make,
	make_from_pointer,
	make_with_pixmap
feature

	button_is_down: BOOLEAN is
		do
			Result := c_gtk_toggle_button_active (widget)
		end

	button_is_up: BOOLEAN is
		do
			Result := not button_is_down
		end

	set_state_up is
		do
			gtk_toggle_button_set_active (widget, 0)
		end

	set_state_down is
		do
			gtk_toggle_button_set_active (widget, 1)
		end

feature {NONE}

	make_with_label (text: STRING) is
		do
			widget := npc.np_gtk_toggle_button_new_with_label (text)
			register_widget
		end

	make is
		do
			widget := gtk_toggle_button_new
		end

end
