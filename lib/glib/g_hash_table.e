-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Wrapping of g_hash_table, for pointer keys and integer values. This %
                 %code needs to be extended to handle arbitrary types"
	author: "Richie Bielak"
	date: "April 2, 2000"

class G_HASH_TABLE

inherit

	MEMORY
		redefine
			dispose
		end

creation

	make

feature
	
	make is
		do
			g_ht := c_g_hash_table_new_gpointer_int
		ensure
			allocated: g_ht /= default_pointer
		end

	insert (key: POINTER; value: INTEGER) is
		require
			key_valid: key /= default_pointer
			value_valid: value /= 0
		do
			g_hash_table_insert (g_ht, key, value)
		end

	remove (key: POINTER) is
		require
			key_valid: key /= default_pointer
		do
			g_hash_table_remove (g_ht, key)
		end

	lookup (key: POINTER): INTEGER is
		require
			key_valid: key /= default_pointer
		do
			Result := g_hash_table_lookup (g_ht, key)
		end

	freeze is
			-- do not allow resizing of the table
		do
			g_hash_table_freeze (g_ht)
		end

	thaw is
			-- allow resizing of the table
		do
			g_hash_table_thaw (g_ht)
		end

feature {NONE}

	g_ht: POINTER

	dispose is
		do
			g_hash_table_destroy (g_ht)
		end

feature {NONE} -- external

	g_hash_table_destroy (h: POINTER) is
		external "C"
		end
	
	g_hash_table_freeze (h: POINTER) is
		external "C"
		end

	g_hash_table_thaw (h: POINTER) is
		external "C"
		end

	g_hash_table_insert (h: POINTER; key: POINTER; value: INTEGER) is
			-- value is cast to gpointer here
		external "C"
		end

	g_hash_table_remove (h: POINTER; key: POINTER) is
		external "C"
		end

	g_hash_table_lookup (h: POINTER; key: POINTER): INTEGER is
			-- result is cast to integer here
		external "C"
		end

	c_g_hash_table_new_gpointer_int: POINTER is
			-- this function sets up a hash table with very basic 
			-- compare and hash functions
		external "C"
		end

end
