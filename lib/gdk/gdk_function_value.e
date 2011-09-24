-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "wrapper for GdkFunction enum"
	note: "You will probably want to declare this as expanded when using as %
		%an attribute or local, most of the time"
	author: "Dave E Martin XXIII"
	genesis: "199904280644 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_function_value.e,v 1.4 2000/07/10 02:01:26 richieb Exp $"

---HERE are enums really worth encapsulating in a class,
---or should contracts be used instead?  I can see arguments both ways here.
---(note that the class can be declared expanded whereever its "created", but
---i'm a bit loath to force that decision on anyone by making the class
---expanded.)

class GDK_FUNCTION_VALUE

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
	Copy_: INTEGER is 0
		-- Overwrite destination pixels with source pixels
	Invert: INTEGER is 1
		-- Invert destination pixels
	Xor_: INTEGER is 2
		-- Xor destination pixels with source pixels
	Clear: INTEGER is 3
		-- set pixels to 0
	And_: INTEGER is 4
		-- source AND destination
	And_reverse: INTEGER is 5
		-- source AND (NOT destination)
	And_invert: INTEGER is 6
		-- (NOT source) AND destination
	Noop: INTEGER is 7
		-- do nothing to destination
	Or_: INTEGER is 8
		-- source OR destination
	Equiv: INTEGER is 9
		-- (NOT source) XOR destination
	Or_reverse: INTEGER is 10
	Copy_invert: INTEGER is 11
		-- NOT source
	Or_invert: INTEGER is 12
	Nand: INTEGER is 13
		-- (NOT source) OR (NOT destination)
	Set: INTEGER is 14
		-- set pixels to 1
	Last__: INTEGER is 14

invariant

	value_valid: First__ <= value and value <= Last__ -- if this fails then
		-- either the C code is broken, doing undocumented things, or this class
		-- needs to be updated because its in violation of consistent_with_c_enum.
	-- HERE check, "comment" assertions must be at the end? (ISE is insisting
	-- this with a non-descript error 157, what does ETL say?)
	consistent_with_c_enum: -- the constants match their corresponding C enum
		-- values

end -- GDK_FUNCTION_VALUE
