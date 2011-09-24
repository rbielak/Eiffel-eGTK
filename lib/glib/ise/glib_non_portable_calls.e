indexing

	description: "glib calls that are non-portable between ISE and %
			% SmallEiffel; ISE version"
	author: "Oliver Elphick"
	date: "8th June 2000"
	cvs: "$Id: glib_non_portable_calls.e,v 1.2 2003/01/11 19:32:51 elphick Exp $"

class GLIB_NON_PORTABLE_CALLS

feature

	npc_home_directory(p: POINTER): STRING is
		do
			create Result.make(0)
			Result.from_c(p)
		end

end -- GLIB_NON_PORTABLE_CALLS
