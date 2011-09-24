-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_RADIO_BUTTON - radio button widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_radio_button.e,v 1.6 2000/07/10 02:01:27 richieb Exp $"

class GTK_RADIO_BUTTON

-- A radio button is a small diamond whose visible state indicates whether
-- or not it is set.  Radio buttons must be joined in groups for
-- them to operate correctly: when one button is set, all others in the
-- group are unset.  Create the first button of each group
-- with make or make_with_label and the others with make_in_group or
-- make_in_group_with_label.

inherit

	GTK_TOGGLE_BUTTON
		redefine
			make,
			make_with_label
		end

	GTK_RADIO_BUTTON_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_in_group,
	make_with_label,
	make_in_group_with_label

feature {NONE}

	make is
			-- Create the first button of a radio button group
		do
			widget := gtk_radio_button_new (default_pointer)
			register_widget
		end

	make_with_label (text: STRING) is
			-- Create the first button of a radio button group
			-- and set its label
		do
			widget := npc.np_gtk_radio_button_new_with_label (default_pointer,
													   text)
			register_widget
		end

	make_in_group (other: GTK_BUTTON) is
			-- Create an additional button as part of a group;
			-- the group is the one to which other belongs.
		require
			other_valid: other /= Void
		do
			widget := gtk_radio_button_new (gtk_radio_button_group (other.widget))
			register_widget
		end

	make_in_group_with_label (other: GTK_BUTTON; text: STRING) is
			-- Create an additional button as part of a group and
			-- set its label; the group is the one to which
			-- other belongs.
		require
			other_valid: other /= Void
			text_valid: text /= Void
		do
			widget := npc.np_gtk_radio_button_new_with_label (gtk_radio_button_group (other.widget),
														  text)
			register_widget

		end

end
