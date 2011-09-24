-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_BIN - widget that contains one child widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	date: "4/9/99"
	cvs: "$Id: gtk_bin.e,v 1.11 2000/07/10 02:01:26 richieb Exp $"

class GTK_BIN

-- A widget that contains a single child widget

inherit

	GTK_CONTAINER
		redefine
			make_from_pointer
		end

	GTK_BIN_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_SHARED_WIDGET_FACTORY
		undefine
			is_equal, copy
		end

feature -- bins have only one child widget

	child: GTK_WIDGET
			-- child widget


	make_from_pointer (p: POINTER) is
		do
			precursor (p)
			-- retrieve child widget
			child := widget_factory.item_from_pointer (c_gtk_bin_child (p))
		end

feature {GTK_WIDGET}

	add_child (a_child: like child) is
		do
			child := a_child
			child.set_parent (Current)
		end

	remove_child (a_child: like child) is
		do
			if child = a_child then
				child := Void
				a_child.set_parent (Void)
			end
		end

	has_child (a_child: like child): BOOLEAN is
		do
			Result := (a_child /= Void) and then a_child = child
		end

	child_by_pointer (p: POINTER): GTK_WIDGET is
		do
			if p = child.widget then
				Result := child
			end
		end

end -- GTK_BIN
