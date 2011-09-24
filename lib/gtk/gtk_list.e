-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_LIST box widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_list.e,v 1.12 2003/01/11 19:32:51 elphick Exp $"

class GTK_LIST

-- A list box widget
--
-- Signals (from gtklist.c):
--    "select_child"
--    "selection_changed"
--    "unselect_child"


inherit

	GTK_COMPOSED_BIN
		redefine
			add_widget,
			count
		end

	GTK_LIST_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_pointer

feature

	make is 
		do
			create children.make (1, 0)
			widget := gtk_list_new
			register_widget
		end

	add_widget (l_item: GTK_LIST_ITEM) is
			-- only allow list items to be added
		do
			precursor (l_item)
		end

	child_position (child: GTK_LIST_ITEM): INTEGER is
			-- position of this widget in the list
		require
			child_not_void: child /= Void
		do
			Result := gtk_list_child_position (widget, child.widget)
		ensure
			sane: Result >= 0 and Result < count
		end

	count: INTEGER is
		do
			Result := c_gtk_list_children_count (widget)
		end

feature -- deletions

	clear_items (first, last: INTEGER) is
		require
			sane: first >=0 and then first <= last and then last < count
		do
			gtk_list_clear_items (widget, first, last)
		ensure
			reduced: count = old count - last + first - 1
		end
	
	clear_all is
		do
			if count > 0 then
				gtk_list_clear_items (widget, 0, count)
				-- remake the child array
				children.make (1, 0)
			end
		ensure
			empty: count = 0
		end

	remove_items (items: G_LIST) is
		require
			items_not_void: items /= Void
		do
			gtk_list_remove_items (widget, items.g_list)	
		ensure
			decremented:  count = (old count) - items.length
		end

	remove_items_no_unref(items: G_LIST) is
		require
			valid_list: items /= Void and then items.length /= 0
		do
			gtk_list_remove_items_no_unref (widget, items.g_list)
		ensure
			decremented:  count = (old count) - items.length
		end

feature -- insertions

	insert_items (items: G_LIST; p: INTEGER) is
		require
			valid_list: items /= Void and then items.length /= 0
			good_position: p >= 0 and p <= count
		do
			gtk_list_insert_items (widget, items.g_list, p)
		ensure
			incremented:  count = (old count) + items.length
		end

	append_items (items: G_LIST) is
		require
			valid_list: items /= Void and then items.length /= 0
		do
			gtk_list_append_items (widget, items.g_list)
		ensure
			incremented:  count = (old count) + items.length
		end

	prepend_items (items: G_LIST) is
		require
			valid_list: items /= Void and then items.length /= 0
		do
			gtk_list_prepend_items (widget, items.g_list)
		ensure
			incremented:  count = (old count) + items.length
		end

feature -- selections

	selection: G_LIST is
		local
			sp: POINTER
		do
			sp := c_gtk_list_selection (widget)
			if sp /= default_pointer then
				create Result.make_from_pointer (sp)
			end
		end

	select_item (it: INTEGER) is
		require
			valid_item_index: (it >= 0) and (it < count)
		do
			gtk_list_select_item (widget, it)
		end

	unselect_item (it: INTEGER) is
		require
			valid_item_index: (it >= 0) and (it < count)
		do
			gtk_list_unselect_item (widget, it)
		end

	set_selection_mode (mode: INTEGER) is
		require
			valid_mode: is_mode_valid (mode)
		do
			gtk_list_set_selection_mode (widget, mode)
		end

	select_child (c: GTK_LIST_ITEM) is
		require
			valid_item: c /= Void
		do
			gtk_list_select_child (widget, c.widget)
		end

	unselect_child (c: GTK_LIST_ITEM) is
		require
			valid_item: c /= Void
		do
			gtk_list_unselect_child (widget, c.widget)
		end

	extend_selection (tp: INTEGER; p: REAL; auto_start: BOOLEAN) is
		require
--			good_type: tp >= Gtkxxx and tp <= Gtkyyy
			good_position: p >= 0.0 and p <= 1.0
		do
			gtk_list_extend_selection (widget, tp, p, auto_start)
		end

	start_selection is
		do
			gtk_list_start_selection (widget)
		end

	end_selection is
		do
			gtk_list_end_selection (widget)
		end

	undo_selection is
		do
			gtk_list_undo_selection (widget)
		end

	end_drag_selection is
		do
			gtk_list_end_drag_selection (widget)
		end

	select_all is
		do
			gtk_list_select_all (widget)
		end

	unselect_all is
		do
			gtk_list_unselect_all (widget)
		end

feature -- miscellaneous

	scroll_horizontal (tp: INTEGER; p: REAL) is
		require
--			good_type: tp >= Gtkxxx and tp <= Gtkyyy
			good_position: p >= 0.0 and p <= 1.0
		do
			gtk_list_scroll_horizontal (widget, tp, p)
		end

	scroll_vertical (tp: INTEGER; p: REAL) is
		require
--			good_type: tp >= Gtkxxx and tp <= Gtkyyy
			good_position: p >= 0.0 and p <= 1.0
		do
			gtk_list_scroll_vertical (widget, tp, p)
		end

	toggle_add_mode is
		do
			gtk_list_toggle_add_mode (widget)
		end

	toggle_focus_row is
		do
			gtk_list_toggle_focus_row (widget)
		end

	toggle_row (w: GTK_LIST_ITEM) is
		do
			gtk_list_toggle_row (widget, w.widget)
		end

	is_mode_valid (mode: INTEGER): BOOLEAN is
		do
			Result := (mode = Gtk_selection_single) 
				or else (mode = Gtk_selection_browse)
				or else (mode = Gtk_selection_multiple)
				or else (mode = Gtk_selection_extended)

		end

end -- GTK_LIST
