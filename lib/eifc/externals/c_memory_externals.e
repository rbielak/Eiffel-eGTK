-- Copyright (C) 1999 Andreas Leitner and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
   
   description: "Externals for C memory management in Eiffel."
   author: "Andreas Leitner"

class C_MEMORY_EXTERNALS

inherit

	C_ALLOC -- compiler specific declarations

feature {NONE} -- External

	
	c_free (ptr: POINTER) is
			-- C free
			-- Frees memory allocated for `ptr'
		external
			"C"
		alias
			"free"
		end
	
	c_memcpy (destination, source: POINTER; count: INTEGER): POINTER is
			-- C memcpy
			-- Copies `count' bytes from `destination' to `source'.
		external
			"C"
		alias
			"memcpy"
		end

end -- C_MEMORY_EXTERNALS
