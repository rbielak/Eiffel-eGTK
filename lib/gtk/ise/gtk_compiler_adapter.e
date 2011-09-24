-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "adapters to handle compiler specific issues"
	note: "if its in here, then either NICE or the compiler vendor probably %
		%needs to address it"
	author: "Dave E Martin XXIII"
	genesis: "199904270635 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	compiler: "ISE"
	cvs: "$Id: gtk_compiler_adapter.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_COMPILER_ADAPTER [ARRAY_TYPE]
	-- inherit as many times as necessary and rename array_to_c_pointer
	-- to cover all the array types you need

feature

	array_to_c_pointer (a: ARRAY [ARRAY_TYPE]): POINTER is
		require
			a_valid: a /= Void
		do
			-- This doesn't work. "to_c" returns ANY not a pointer.
			-- You can't keep pointers to objects anyways, because 
			-- the collector can move the object between the time you 
			-- save the pointer and use it (been there done that ;-) rb)
			--   Result := a.to_c
			-- ** Removed in order to allow a precompilation to
			-- continue. **
		end

	string_to_c_pointer (s: STRING): POINTER is
		require
			s_valid: s /= Void
		do
			--   Result := s.to_c
			-- ** Removed in order to allow a precompilation to
			-- continue. **
		end

end -- GTK_COMPILER_ADAPTER
