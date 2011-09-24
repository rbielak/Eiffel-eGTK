-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class EGTK_HANDLE_FACTORY

feature

	register (h: POINTER; object: EGTK_HANDLE) is
		require
			valid: h /= default_pointer
		do
			handle_table.insert (h, object.gtk_object_id)
		end

	unregister (h: POINTER) is
			-- remove pointer from registration table
		require
			valid: h /= default_pointer
		do
			handle_table.remove (h)
		end
	
	registered (h:POINTER): EGTK_HANDLE is
			-- eiffel object that goes together with this handle, 
			-- Void if none
		require
			valid: h /= default_pointer
		local
			lobject_id: INTEGER
		do
			lobject_id := handle_table.lookup (h)
			if lobject_id /= 0 then
				Result ?= identifier.gtk_id_object (lobject_id)
			end
		end

	is_registered (h: POINTER): BOOLEAN is
			-- is this pointer registered
		do
			Result := handle_table.lookup (h) /= 0
		end

	
feature {NONE}

	handle_table: G_HASH_TABLE is
			-- indexed by pointers, returns Eiffel object IDs
		once
			create Result.make
		end

	identifier: GTK_IDENTIFIED is
		once
			create Result
		end

end
