-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_PANED - for dividing an area into two resizable parts"
	author: "Daniel Elphick"

class GTK_PANED

inherit

	GTK_COMPOSED_BIN

	GTK_PANED_EXTERNALS
		undefine
			copy, is_equal
		end

feature

	add1(child: GTK_WIDGET) is
		do
			gtk_paned_add1(widget, child.widget)
			add_child(child)
		end

	add2(child: GTK_WIDGET) is
		do
			gtk_paned_add2(widget, child.widget)
			add_child(child)
		end

	pack1(child: GTK_WIDGET; resize, shrink: BOOLEAN) is
		do
			gtk_paned_pack1(widget, child.widget, resize, shrink)
			add_child(child)
		end
	
	pack2(child: GTK_WIDGET; resize, shrink: BOOLEAN) is
		do
			gtk_paned_pack2(widget, child.widget, resize, shrink)
			add_child(child)
		end

	set_handle_position(position: INTEGER) is
			-- can't call it set_position because it clashes
		do
			gtk_paned_set_position(widget, position)
		end

	set_handle_size(size: INTEGER) is
		do
			c_gtk_paned_set_handle_size(widget, size)
		end

	set_gutter_size(size: INTEGER) is
		do
			c_gtk_paned_set_gutter_size(widget, size)
		end

end
