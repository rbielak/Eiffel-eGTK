-- Copyright (c) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"GdkCursor wrapper"
	author:		"Oliver Elphick"
	date:		"5th May 2000"
	cvs:		"$Id: gdk_cursor.e,v 1.1 2000/05/12 19:45:31 elphick Exp $"

class GDK_CURSOR

inherit

	GDK_CURSOR_ENUM

creation

	make

feature -- Creation

	make(c: INTEGER) is
		require
			valid_cursor(c)
		do
			cursor := c_set_cursor(c)
			debug
				io.put_string("Made cursor%N")
				io.put_string(tagged_out)
				io.put_new_line
			end
		ensure
			cursor_set: cursor_value = c
		end

feature -- Attribute

	cursor: POINTER
			-- this is a (GdkCursor *)

feature

	valid_cursor(c: INTEGER): BOOLEAN is
			-- the cursor enumeration runs the series of even integers from 
			-- 0 to 154: Gdk_x_cursor to Gdk_num_glyphs
		do
			Result := (c < Gdk_num_glyphs and c >= Gdk_x_cursor and (c \\ 2) = 0)
		end

	cursor_value: INTEGER is
		require
			cursor /= default_pointer
		do
			Result := c_get_cursor(cursor)
		ensure
			valid_cursor(Result)
		end

feature {NONE}

	c_set_cursor(c: INTEGER): POINTER is
		external
			"C"
		end

	c_get_cursor(p: POINTER): INTEGER is
		external
			"C"
		end

end -- GDK_CURSOR
