-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_BIMAP - represents a GDK_BITMAP"

class GDK_BITMAP

inherit

	GDK_DRAWABLE
		rename
			drawable as bitmap
		redefine
			dispose
		end

	GDK_BITMAP_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_from_pointer

feature -- creation

	make_from_pointer (a_bitmap: POINTER) is
		do
			bitmap := a_bitmap
			ref
		end

feature -- memory management

	ref is
		do
			bitmap := gdk_bitmap_ref (bitmap)
		end

	unref is
		do
			gdk_bitmap_unref (bitmap)
		end

	dispose is
		do
			precursor
			unref
		end
end
