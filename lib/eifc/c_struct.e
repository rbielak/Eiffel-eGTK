-- Copyright (C) 1999 Andreas Leitner and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
   
	description: "Encapsulate a C struct."
	author: "Andreas Leitner"
	changed: "correction of memory_copy 05/26/2000 Olivier Sauterel(tecnox@econophone.ch)"
	
deferred class C_STRUCT

inherit
	
	C_HANDLE
	C_MEMORY_EXTERNALS
	
feature  -- Initialisation

	make is
			-- Allocate uninitialized structure
		do
			handle := c_alloc (1, struct_size)
			check
				allocation_success: handle /= default_pointer
			end
			set_unshared
		ensure
			not_shared: not is_shared
		end
	
feature -- Basic operations

	memory_copy (source_pointer: POINTER; length: INTEGER) is
			-- Copy `length' bytes from `source_pointer' to `handle'.
		require
			valid_length: length > 0 and length <= struct_size
			source_pointer_not_void: source_pointer /= default_pointer
		do
			handle := c_memcpy (handle, source_pointer, length)
		end
	
feature -- Measurement

	struct_size: INTEGER is
			-- Size of external structure in bytes.
		deferred
		ensure
			positive_result: Result > 0
		end
	
feature {NONE} -- Removal
	
	destroy_object is
			-- Free memory allocated for structure
		do
			if exists then
				c_free (handle)
			end
		end
	
end -- C_STRUCT
