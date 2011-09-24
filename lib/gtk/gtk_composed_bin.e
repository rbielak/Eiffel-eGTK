-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_COMPOSED_BIN - a parent class for widgets that %
                 %have many children. The mirror of GTK_BIN. Note %
                 %this class does not exist in GTK+"
	 author: "Richie Bielak"
	 date: "4/9/99"
	 cvs: "$Id: gtk_composed_bin.e,v 1.12 2003/01/11 19:32:51 elphick Exp $"

class GTK_COMPOSED_BIN

-- This class is the parent of all containers with multiple children.
-- It provides the Eiffel internals for all those classes.
-- Instances of this class cannot be created - use its descendants.

inherit

	GTK_CONTAINER
		rename
			child as first_child
		redefine
			make_from_pointer
		end

feature -- for creation

	make_from_pointer (p: POINTER) is
		do
			precursor (p)
			create children.make (1, 0)
			-- TODO: We should now fill children with existing
			-- child widgets
		ensure then
			children_made: children /= Void
			-- counts_agree: count = count of children from C library
		end

feature -- access

	count: INTEGER is
		do
			Result := children.count
		end

	item (i: INTEGER): GTK_WIDGET is
			-- i-th widget
		require
			valid_index: (0 < i) and (i <= count)
		do
			Result := children @ i
		end

	is_child (a_widget: GTK_WIDGET): BOOLEAN is
		require
			a_widget_not_void: a_widget /= Void
		do
			Result := children.has (a_widget)
		end

	first_child: GTK_WIDGET is
		do
			if count > 0 then
				Result := children @ 1
			end
		end

feature {GTK_WIDGET} -- implementation

	remove_child (a_widget: like first_child) is
			-- remove a child widget from the children array. to 
			-- really get rid of it it has to be destroyed
		local
			new_children: like children
			a_child: GTK_WIDGET
			i, j: INTEGER
		do
			-- reallocate the array and copy the widgets we want to 
			-- keep. Not the most efficient way to do it.
			if children.count = 1 then
				if a_widget = children @ 1 then
					create children.make (1, 0)
					a_widget.set_parent (Void)
				end
			else
				create new_children.make (1, 0)
				from 
					i := 1
					j := 1
				until i > children.count
				loop
					a_child := children @ i
					if a_widget /= a_child then
						new_children.force (a_child, j)
						j := j + 1
					end
					i := i + 1
				end
				children := new_children
				a_widget.set_parent (Void)
			end
		ensure then
			fewer_children: count = old count - 1
		end

	children: ARRAY [GTK_WIDGET]
			-- children widgets

	add_child (a_child: like first_child) is
			-- add another widget to our children array
		do
			children.force (a_child, children.count + 1)
			a_child.set_parent (Current)
		end

	has_child (a_child: like first_child): BOOLEAN is
		local
			i: INTEGER
		do
			if a_child /= Void then
				from i := 1 until Result or (i > children.count)
				loop
					Result := children @ i = a_child
					i := i + 1
				end
			end
		end

	child_by_pointer (p: POINTER): like first_child is
		local
			i: INTEGER
			a_child: GTK_WIDGET
		do
			from i := 1
			until (i > children.count) or (Result /= Void)
			loop
				a_child :=  children @ i
				if p = a_child.widget then
					Result := a_child
				end
				i := i + 1
			end
		end

invariant

	has_children_array: children /= Void
	-- TODO: count should equal the number of child widgets 
	-- reported by the gtk C library.

end -- GTK_COMPOSED_BIN
