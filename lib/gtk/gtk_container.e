-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Any widget that contains other widgets"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	changed: "11/10/98"
	cvs: "$Id: gtk_container.e,v 1.14 2000/07/10 02:01:27 richieb Exp $"

deferred class GTK_CONTAINER

-- A container widget into which one and only one other widget can be
-- placed. (Use GTK_BOX or GTK_TABLE if you want to hold multiple other
-- widgets.)
--
-- Signals (from gtkcontainer.c):
--    "add"              -
--    "check_resize"     -
--    "focus"            -
--    "remove"           -
--    "set-focus-child"  -

inherit

	GTK_WIDGET

	GTK_CONTAINER_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_SHARED_WIDGET_FACTORY
		undefine
			copy, is_equal
		end

feature

	set_border_width (new_width: INTEGER) is
		require
			width_valid: new_width >= 0
		do
			gtk_container_set_border_width (widget, new_width)
		end
	
	set_focus_vadjustment (adj: GTK_ADJUSTMENT) is
		require
			adj_not_void: adj /= Void
		do
			gtk_container_set_focus_vadjustment (widget, adj.adjustment)
		end

	set_focus_hadjustment (adj: GTK_ADJUSTMENT) is
		require
			adj_not_void: adj /= Void
		do
			gtk_container_set_focus_hadjustment (widget, adj.adjustment)
		end

	remove_widget (a_child: like child) is
		require
			child_not_void: a_child /= Void
			my_child: is_my_child (a_child)
			-- although the code would cope, violating this
			-- precondition would indicate a logic failure in
			-- the application code.
		do
			remove_child (a_child)
			gtk_container_remove (widget, a_child.widget)
		ensure
			removed: not has_child (a_child)
		end

	add_widget (a_child: like child)  is
		require
			child_not_void: a_child /= Void
			no_parent: a_child.parent = Void
		do
			-- Here we let GTK+ do the polymorphism
			gtk_container_add (widget, a_child.widget)
			add_child (a_child)
		ensure
			added:  has_child (a_child)
			my_child: a_child.parent = Current
		end

	is_my_child (a_widget: like child): BOOLEAN is
		require
			child_not_void: a_widget /= Void
		do
			Result := (a_widget.parent = Current)
		ensure
			sane: Result implies a_widget.parent = Current
		end

	focus_child: like child is
		local
			childp: POINTER
		do
			childp := c_focus_child (widget)
			if childp /= default_pointer then
				Result := widget_factory.item_from_pointer (childp)
			end
		end

	child: GTK_WIDGET is
			-- this feature is here to act as an anchor for 
			-- add/remove features
		deferred
		end

feature {GTK_WIDGET}

	add_child (a_child: like child) is
			-- this routine handles Eiffel attributes for setting
			-- up relationships between parents and children
		require
			good_child: a_child /= Void
		deferred
		ensure
			my_child: a_child.parent = Current
		end

	remove_child (a_child: like child) is
			-- this routine handles Eiffel attributes for setting
			-- up relationships between parents and children
		require
			good_child: a_child /= Void
		deferred
		ensure
			not_my_child: a_child.parent /= Current
		end

	has_child (a_child: like child): BOOLEAN is
		deferred
		end

	child_by_pointer (p: POINTER): like child is
		require
			valid_pointer: p /= default_pointer
		deferred
		ensure
			really_mine: Result /= Void implies Result.parent = Current
		end

end
