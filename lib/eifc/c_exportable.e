-- Copyright (C) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
   
	description: "Support for export of arbitrary data to C"
	author: "Oliver Elphick"
	date: "11th May 2000"
	cvs: "$Id: c_exportable.e,v 1.2 2000/05/17 04:48:39 elphick Exp $"
	
class C_EXPORTABLE

feature {EGTK_NON_PORTABLE_CALLS}

	c_load_export(a: POINTER): POINTER is
		external
			"C"
		end

end -- C_EXPORTABLE
