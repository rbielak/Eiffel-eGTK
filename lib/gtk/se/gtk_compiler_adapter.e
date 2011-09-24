-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "adapters to handle compiler specific issues"
	note: "if it's in here, then either NICE or the compiler vendor probably %
		%needs to address it"
	author: "Dave E Martin XXIII"
	genesis: "199904270650 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	compiler: "SmallEiffel"
	cvs: "$Id: gtk_compiler_adapter.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_COMPILER_ADAPTER [ARRAY_TYPE]
	-- inherit as many times as necessary and rename array_to_c_pointer
	-- to cover all the array types you need

feature

	array_to_c_pointer (a: ARRAY [ARRAY_TYPE]): POINTER is
		require
			a_valid: a /= Void
		do
			Result := a.to_external
		end

	string_to_c_pointer (s: STRING): POINTER is
		require
			s_valid: s /= Void
		do
			Result := s.to_external
		end

end -- GTK_COMPILER_ADAPTER
