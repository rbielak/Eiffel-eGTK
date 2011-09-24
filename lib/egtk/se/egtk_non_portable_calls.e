-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Non-portable calls for EGTK_... classes"
	date: "10 May 2000"
	author: "Oliver Elphick"
	cvs: "$Id: egtk_non_portable_calls.e,v 1.3 2003/01/11 19:32:51 elphick Exp $"

class EGTK_NON_PORTABLE_CALLS

inherit

	C_EXPORTABLE

feature

	-- handle export of objects to gpointers

	npc_export_data(a: STRING): POINTER is
		do
			Result := c_load_export(a.to_external)
		end

	npc_import_data(p: POINTER): STRING is
		do
			create Result.make(0)
			Result.from_external_copy(p)
		end

end -- EGTK_NON_PORTABLE_CALLS
