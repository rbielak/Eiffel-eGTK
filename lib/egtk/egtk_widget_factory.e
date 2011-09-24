indexing

	description: "EGTK_WIDGET_FACTORY - create or retrieve Eiffel %
                 %objects corresponding to GTK widgets"
	author: "Richie Bielak"
	date: "August 13th, 1999"

class EGTK_WIDGET_FACTORY

inherit

	GTK_IDENTIFIED

	GTK_OBJECT_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_WIDGET_TYPE_NAMES
		undefine
			copy, is_equal
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

feature

	item_from_pointer (p: POINTER): GTK_WIDGET is
			-- retrieve Eiffel object that represents the widget, if 
			-- it exists
		require
			pointer_not_null: p /= default_pointer
		local
			widget_object_id: INTEGER					  
		do
			widget_object_id := c_object_id_from_pointer (p)
			if widget_object_id /= 0 then
				Result ?= gtk_id_object (widget_object_id)
			else
				-- Eiffel object doesn't exist yet, try and create it
				Result := create_new_widget_object (p)
			end
		ensure
			consistent_result: (Result /= Void) implies (Result.widget = p)
		end

	add_widget (wp: pointer; oid: INTEGER) is
			-- add new widget pointer, object id to the table
		require
			valid_widget: (wp /= default_pointer)
			not_there: not has_pointer (wp)
		do
			c_add_object_id (wp, oid)
		ensure
			inserted: has_pointer (wp)
		end


	remove_pointer (wp: POINTER) is
			-- remove widget pointer
		require
			valid_pointer: wp /= default_pointer
		do
			c_remove_pointer (wp)
		ensure
			removed: not has_pointer (wp)
		end
							   
	remove_widget (w: GTK_WIDGET) is
			-- remove an old widget from the table
		require
			valid_widget: (w /= Void) and (w.widget /= default_pointer)
		do
			c_remove_pointer (w.widget)
		ensure
			removed: not has_widget (w)
		end

	has_pointer (p: POINTER): BOOLEAN is
			-- return true if pointer exists in the table
		require
			pointer_not_null: p /= default_pointer
		do
			Result := c_object_id_from_pointer (p) /= 0
		end

	has_widget (w: GTK_WIDGET): BOOLEAN is
			-- return true if widget exists in the table
		require
			valid_widget: (w /= Void) and (w.widget /= default_pointer)
		do
			Result := has_pointer (w.widget)
		end

feature {NONE}

	create_new_widget_object (wp: POINTER): GTK_WIDGET is
		local
			w_type: STRING
		do
			w_type := npc.np_string_from_pointer (c_gtk_type_name (wp))
			-- GTK_CONTAINER is deferred
			-- if w_type.is_equal (tn_gtk_container) then
			--	  !GTK_CONTAINER!Result.make_from_pointer (wp)

			-- TODO: complete this list for all widget types

			if w_type.is_equal(tn_gtk_curve) then
				!GTK_CURVE!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_drawing_area) then
				!GTK_DRAWING_AREA!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_entry) then
				!GTK_ENTRY!Result.make_from_pointer (wp)
				-- elseif w_type.is_equal (tn_gtk_misc) then
				--   !GTK_MISC!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_notebook) then
				!GTK_NOTEBOOK!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_pixmap) then
				!GTK_PIXMAP!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_separator) then
				!GTK_SEPARATOR!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_label) then
				!GTK_LABEL!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_window) then
				!GTK_WINDOW!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_widget) then
				!GTK_WIDGET!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_vbox) then
				!GTK_BOX!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_hbox) then
				!GTK_BOX!Result.make_from_pointer (wp)
			elseif w_type.is_equal (tn_gtk_tree_item) then
				!GTK_TREE_ITEM!Result.make_from_pointer (wp)
			else
				print ("*ERROR: don't know how to create type: ")
				print (w_type)
				print ("%N")
			end
		end


	-- implementation uses "gtk_object_set_data" and 
	-- "gtk_object_get_data" to store the Eiffel object ID in the
	-- widget
	c_object_id_from_pointer (p: POINTER): INTEGER is
			-- return '0' if item not there
		external "C"
		end

	c_add_object_id (key: POINTER; oid: INTEGER) is
		external "C"
		end

	c_remove_pointer (p: POINTER) is 
		external "C"
		end

end
