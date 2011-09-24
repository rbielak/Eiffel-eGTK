-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK/GDK C structures access. The objects are %
                 %registered so that we avoid creating more than one %
                 %Eiffel object for each structure."
	cvs: "$Id: egtk_handle.e,v 1.4 2003/01/02 02:42:25 elphick Exp $"

class EGTK_HANDLE

inherit

	C_HANDLE
		undefine
			copy, is_equal
		redefine
			make_from_pointer,
			destroy_object,
			dispose
		end

	GTK_IDENTIFIED
		redefine
			dispose
		end

	EGTK_HANDLE_FACTORY
		undefine
			copy, is_equal
		end

feature

	make_from_pointer (p: POINTER) is
		-- require
		--	good_pointer: p /= Void and then p /= default_pointer
		do
			precursor (p)
			register (handle, Current)
		end

	destroy_object is
		do
			unregister (handle)
		end

	dispose is
		do
			precursor{GTK_IDENTIFIED}
			precursor{C_HANDLE}
		end

end
