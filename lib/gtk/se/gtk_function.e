-- Copyright (C) 2000  RIchie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Root class for GTK callbacks that are not %
                 %associated with widgets (SE version)"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GTK_FUNCTION

feature

	execute: BOOLEAN is
			-- redefine this code in descendant to perform the required 
			-- action
			-- *****
			-- SE Note: This function should really be deferred, but 
			-- because it is mentioned in cecil.se SE issues warnings 
			-- if the system you are compiling has no descendants, so 
			-- I just made it an empty routine.
			-- *****
		do
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


end



