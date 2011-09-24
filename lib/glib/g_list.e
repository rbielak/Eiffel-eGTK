-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description: "Wrapping of glib/glist - based on VEGTK"
	author: "Richie Bielak"
	date: "February 7th, 2000"

class G_LIST

-- A GList is a node in a doubly-linked list, which is implemented as 
-- a structure in the glib C library.  It consists of a gpointer to 
-- some memory together with pointers to the next and previous GLists
-- in the list.  This class encapsulates that structure with Eiffel 
-- routines to access the sibling nodes.

inherit

	EGTK_HANDLE
		rename 
			handle as g_list
		redefine
			copy, is_equal, destroy_object
		end

creation

	make,
	make_from_pointer,
	make_from_widget_array

feature -- creation

	make_from_widget_array (arr: ARRAY [GTK_WIDGET]) is
		require
			arr_not_void: arr /= Void
		do
			-- TODO: implement this
		ensure
			created: g_list /= default_pointer
		end

	make is
		do
			g_list := g_list_alloc
			register (g_list, Current)
		ensure
			created: g_list /= default_pointer
		end

	copy (other: like Current) is
		do
			g_list := g_list_copy (other.g_list)
			register (g_list, Current)
		end

	is_equal (other: like Current): BOOLEAN is
			-- TODO: finish this routine
		do
			Result := length = other.length
		end

feature -- queries

	length, count: INTEGER is
			-- number of items in the list. "count" is a Eiffel style 
			-- synonym 
		do
			Result := g_list_length (g_list)
		end

	nth_data (n: INTEGER): POINTER is
		require
			valid_n: (n > 0) and (n <= length)
		do
			Result := g_list_nth_data (g_list, n - 1)
		end

	nth (n: INTEGER): POINTER is
		require
			valid_n: (n > 0) and (n <= length)
		do
			Result := g_list_nth (g_list, n - 1)
		end

	data_as_pointer: POINTER is
		do
			Result := c_glist_data_as_pointer (g_list)
		end

	data_as_integer: INTEGER is
		do
			Result := c_glist_data_as_integer(g_list)
		end

	next: G_LIST is
		local
			np: POINTER
		do
			np := c_glist_next (g_list)
			if np /= default_pointer then
				create Result.make_from_pointer (np)
			end
		end

	previous: G_LIST is
		local
			np: POINTER
		do
			np := c_glist_prev (g_list)
			if np /= default_pointer then
				create Result.make_from_pointer (np)
			end
		end

feature -- memory deallocation

	destroy_object is
		do
			precursor
			g_list_free (g_list)
			g_list := default_pointer
		end

feature {NONE} -- externals

	g_list_alloc: POINTER is
		external "C"
		end

	g_list_free (gl: POINTER) is
		external "C"
		end

	g_list_length (lg: POINTER): INTEGER is
		external "C"
		end
	g_list_nth_data (lg:POINTER; n: INTEGER): POINTER is
		external "C"
		end

	g_list_nth (lg:POINTER; n: INTEGER): POINTER is
		external "C"
		end

	g_list_copy (lg: POINTER): POINTER is
		external "C"
		end

	c_glist_data_as_integer(lg: POINTER): INTEGER is
		external "C"
		end

-- Not yet in C code
--	c_glist_data_as_pointed_integer(lg: POINTER): INTEGER is
--		external "C"
--		end

	c_glist_data_as_pointer(lg: POINTER): POINTER is
		external "C"
		end

	c_glist_next (lg: POINTER): POINTER is
		external "C"
		end

	c_glist_prev (lg: POINTER): POINTER is
		external "C"
		end
	

end
