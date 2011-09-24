-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_BUTTON - simple button widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_button.e,v 1.10 2003/01/11 19:32:51 elphick Exp $"

class GTK_BUTTON

-- A button is a widget that may be pressed by clicking it with the mouse;
-- this is generally linked to a callback that executes the action indicated
-- by the button's label.
--
-- Signals (from gtkbutton.c):
--    "clicked"  -  the left mouse button is pressed and immediately released
--    "enter"    -  the pointer enters the button
--    "leave"    -  the pointer leaves the button
--    "pressed"  -  the left mouse button is pressed
--    "released" -  the left mouse button is released

inherit

	GTK_BIN

	GTK_BUTTON_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

	EGTK_SHARED_WIDGET_FACTORY
		undefine
			copy, is_equal
		end

creation

	make_with_label,
	make_from_pointer,
	make,
	make_with_pixmap

feature

	label_text: STRING is
				-- Return the text of a button label
		do
			if child_is_label then
				Result := label.text
			end
		end

	set_label(text: STRING) is
				-- Set the text of a button label; create a label if
				-- there wasn't one already
		require
			can_be_label: child = Void or else child_is_label
		local
			l: GTK_LABEL
		do
			if child_is_label then
				label.set_text(text)
			else
				create l.make(text)
				add_widget (l)
			end
		end

	set_pixmap(pix: GTK_PIXMAP) is
				-- Set the pixmap of a button
		require
			can_be_pixmap: child = Void or else child_is_pixmap
		do
			if child /= Void then
				remove_widget(child)
				child := Void
			end
			add_widget(pix)
		end

	child_is_label: BOOLEAN is
			-- Returns true if the button's child widget is a label
		do
			Result := (label /= Void)
		end

	child_is_pixmap: BOOLEAN is
			-- Returns true if the button's child widget is a pixmap
		do
			Result := (pixmap /= Void)
		end

	label: GTK_LABEL is
		do
			Result ?= child
		end

	pixmap: GTK_PIXMAP is
		do
			Result ?= child
		end

feature {NONE}

	make is
			-- Create a new button.
		do
			widget := gtk_button_new
			register_widget
		end

	make_with_label (text: STRING) is
			-- Create a new button and set its label text.
		require
			good_text: text /= Void
		do
			widget := npc.np_gtk_button_new_with_label (text)
			register_widget
			child := widget_factory.item_from_pointer (c_gtk_bin_child (widget))
		ensure
			label_set: child_is_label and then label.text.is_equal(text)
		end

	make_with_pixmap (p: GTK_PIXMAP) is
			-- Create a new button and set its pixmap
		require
			good_pixmap: p /= Void
		do
			make
			add_widget(p)
		ensure
			pixmap_set: child_is_pixmap and then pixmap = p
		end

end -- GTK_BUTTON
