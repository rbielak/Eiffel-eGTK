-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CLIST_ROW - row in a GTK_CLIST"
	author: "Richie Bielak"
	date: "April 21,2000"

class GTK_CLIST_ROW

inherit 

	EGTK_HANDLE
		rename
			handle as rowp
		end

	GTK_CLIST_ROW_EXTERNALS
		undefine
			is_equal, copy
		end

creation

	make_from_pointer

feature

	cell: GTK_CELL is
		local
			cp: POINTER
		do
			cp := c_gtk_clist_row_cell (rowp)
			if cp /= default_pointer then
				Result ?= registered (cp)
				if Result = Void then
					-- TODO: this should be smarter and create a 
					-- GTK_CELL of appropriate type
					create Result.make_from_pointer (cp)
				end
			end
		end

	set_cell (a_cell: like cell) is
		do
			-- TODO: 
		end

	state: INTEGER is
		do
			-- TODO: 
		end

	set_state (s_state: like state) is
		do
			-- TODO: 
		end

	foreground: GDK_COLOR is
		do
			-- TODO: 
		end
	
	set_foreground (fg: like foreground) is
		do
			-- TODO: 
		end

	background: GDK_COLOR is
		do
			-- TODO: 
		end

	set_background (bg: like background) is
		do
			-- TODO: 
		end

	style: GTK_STYLE is
		local
			sp: POINTER
		do
			sp := c_gtk_clist_row_style (rowp)
			if (sp = default_pointer) or else (style_cache.style /= sp) then
				create style_cache.make_from_pointer (sp)
			end
			Result := style_cache
		end

	set_style (a_style: like style) is
		do
			-- TODO: 
		end

	fg_set: INTEGER is
		do
			-- TODO: 
		end

	bg_set: INTEGER is
		do
			-- TODO: 
		end

	selectable: INTEGER is
		do
			-- TODO: 
		end

feature {NONE}

	style_cache: like style

end

