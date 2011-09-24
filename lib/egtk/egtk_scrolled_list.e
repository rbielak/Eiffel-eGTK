-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "List box with scrollbar(s)"
	author: "Oliver Elphick"
	cvs: "$Id: egtk_scrolled_list.e,v 1.4 2003/01/11 19:32:51 elphick Exp $"

class EGTK_SCROLLED_LIST

-- This is a list box with vertical and horizontal scrollbars.  The
-- appearance of these is controlled by set_policy, from GTK_SCROLLED_WINDOW.
--
-- An existing list can be incorporated, by creating with make_from_list

inherit

	GTK_SCROLLED_WINDOW
		rename
			make as make_window
		end;

creation

	make, make_from_list

feature -- Creation

	make is
			-- Create a new list box and a scrolled window
			-- to contain it
		do
			create list.make
			make_from_list(list)
		ensure
			list_made: list /= Void
		end

	make_from_list(l: GTK_LIST) is
			-- Make a scrolled window for an existing list
		require
			good_list: l /= Void and then l.widget /= Void
		do
			list := l
			make_window
			add_widget_with_viewport(list)
			set_policy(Gtk_policy_automatic, Gtk_policy_automatic)
		end

feature -- Attributes

	list: GTK_LIST

end -- EGTK_SCROLLED_LIST
