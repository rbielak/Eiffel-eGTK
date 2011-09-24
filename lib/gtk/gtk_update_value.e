-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "wrapper for GdkUpdateType enum"
	note: "You will probably want to declare this as expanded when using as %
		%an attribute or local, most of the time"
	author: "Dave E Martin XXIII"
	genesis: "199905120536 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_update_value.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_UPDATE_VALUE

feature -- query

	value: INTEGER

feature -- command

	set_value (the_value: INTEGER) is
		require
			value_valid: First__ <= the_value and the_value <= Last__
		do
			value := the_value
		ensure
			value_set: value = the_value
		end

feature -- constants
		-- C enums start at 0

	First__: INTEGER is 0

	Continuous: INTEGER is 0

	Discontinuous: INTEGER is 1

	Delayed: INTEGER is 2

	Last__: INTEGER is 2

invariant

	value_valid: First__ <= value and value <= Last__ -- if this fails then
		-- either the C code is broken, doing undocumented things, or this class
		-- needs to be updated because its in violation of consistent_with_c_enum.
	-- HERE check, "comment" assertions must be at the end? (ISE is insisting
	-- this with a non-descript error 157, what does ETL say?)
	consistent_with_c_enum: -- the constants match their corresponding C enum
		-- values

end -- GTK_UPDATE_VALUE
