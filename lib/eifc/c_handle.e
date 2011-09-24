-- Copyright (C) 1999 Andreas Leitner and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "encapsulate a C object that may be a struct or %
	              %something more magical."
	author: "Andreas Leitner"
	cvs: "$Id: c_handle.e,v 1.5 2000/04/12 03:19:35 richieb Exp $"
	
deferred class 

   C_HANDLE

inherit

	MEMORY
		redefine
			dispose
		end
	
feature  -- Initialisation

	make_from_pointer, set_handle (a_handle: POINTER) is
		do
			handle := a_handle
			if a_handle /= default_pointer then
				set_shared
			end
		ensure
			handle_set: handle = a_handle
		end
	
feature -- Access   

	handle: POINTER
			-- handle that identifies the C object we wrap.
   
	is_shared: BOOLEAN
			-- Does anybody else (Eiffel or non-Eiffel) have a reference 
			-- to `handle'? If False, then the C-object will be 
			-- destroyed when the the Eiffel object will be collected 
			-- (via destroy object). If True the C-object will not be destroyed.
	
	exists: BOOLEAN is
			-- Does `handle' point to a valid external handle.
		do
			Result := handle /= default_pointer
		ensure
			Result = (handle /= default_pointer)
		end
   
feature -- Element Change   
	
	set_shared is
			-- Sets `is_shared' to True.
		do
			is_shared := True
		ensure
			is_shared: is_shared
		end
	
	set_unshared is
			-- Sets `is_shared' to False.
		do
			is_shared := False
		ensure
			not_is_shared: not is_shared
		end
	
feature {NONE} -- Removal
	
	destroy_object is
			-- Called by the `dispose' routine to
			-- destroy `handle' by calling the
			-- corresponding external function.
		deferred
		end
	
	dispose is
			-- Ensure `handle' is destroyed when
			-- garbage collected by calling `destroy_object'
		do
			if
				exists and then not is_shared
			 then
				destroy_object
			end
		end

invariant

--	reg: handle = default_pointer or else is_registered(handle)
	
end -- C_HANDLE
