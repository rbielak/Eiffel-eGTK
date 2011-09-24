-- Copyright (C) 2000  RIchie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Root class for GTK callbacks that are not %
                 %associated with widgets"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

deferred class GTK_FUNCTION

inherit

	MEMORY
		redefine
			dispose
		end

feature

	execute: BOOLEAN is
			-- define this code in descendant to perform the required action
		deferred
		end

feature {NONE}

	gtk_function_entry: INTEGER is
			-- the Eiffel code is entered through here
		do
			-- Result is set to 0 by default.
			if execute then
				Result := 1
			end
		end


feature {NONE} -- ISE specific implementation

	call_block_pointer: POINTER
			-- this points to a block of memory needed to hold data 
			-- about the call back. How this data is obtained depends 
			-- of type of callback, so it's implementation is in 
			-- descendant class

	c_free_call_back_block (p: POINTER) is
			-- called from dispose
		external "C"
		end

	dispose is
		do
			c_free_call_back_block (call_block_pointer)
		end

end



