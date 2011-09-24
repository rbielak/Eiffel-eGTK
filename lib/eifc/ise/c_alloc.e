-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "ISE version of calloc declaration"

class C_ALLOC


feature {NONE}

	c_alloc (a_num, a_size: INTEGER): POINTER is
			-- C calloc
			-- `a_num' is the number of elements to allocate memory 
			-- for. This is usually 1.
			-- `a_size' is the number of bytes to allocate for each 
			-- element. This is usually struct_size
		external
			"C"
		alias
			"calloc"
		end


end
