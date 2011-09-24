-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

class GTK_CTREE_ROW

inherit

	GTK_CLIST_ROW

	GTK_CTREE_ROW_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_HANDLE_FACTORY
		undefine
			is_equal, copy
		end


creation

	make_from_pointer

feature

	parent: GTK_CTREE_NODE is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_parent (rowp)
			if p /= default_pointer then
				Result ?= registered (p)
				if Result = Void then
					create Result.make_from_pointer (p)
				end
			end
		end

	sibling: GTK_CTREE_NODE is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_sibling (rowp)
			if p /= default_pointer then
				Result ?= registered (p)
				if Result = Void then
					create Result.make_from_pointer (p)
				end
			end
		end

	child: GTK_CTREE_NODE is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_children(rowp)
			if p /= default_pointer then
				Result ?= registered (p)
				if Result = Void then
					create Result.make_from_pointer (p)
				end
			end
		end

	pixmap_closed: GDK_PIXMAP is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_pixmap_closed (rowp)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

	mask_closed: GDK_BITMAP is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_mask_closed (rowp)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

	pixmap_opened: GDK_PIXMAP is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_pixmap_opened (rowp)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

	mask_opened: GDK_BITMAP is
		local
			p: POINTER
		do
			p := c_gtk_ctree_row_mask_opened (rowp)
			if p /= default_pointer then
				create Result.make_from_pointer (p)
			end
		end

	level: INTEGER is
		do
			Result := c_gtk_ctree_row_level (rowp)
		end

	is_leaf: BOOLEAN is
		do
			Result := c_gtk_ctree_row_is_leaf (rowp) /= 0
		end

	is_expanded: BOOLEAN is
		do
			Result := c_gtk_ctree_row_expanded (rowp) /= 0
		end


end
