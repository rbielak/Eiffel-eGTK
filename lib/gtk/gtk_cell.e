-- Copyright (C) 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CELL - root class for GTK_CLIST and GTK_CTREE cells"
	author: "Richie Bielak"

class GTK_CELL

inherit

	EGTK_HANDLE
		rename
			handle as cell
		end

	GTK_CELL_EXTERNALS
		undefine
			is_equal, copy
		end

creation

	make_from_pointer

feature 

	type: INTEGER is
			-- type of the cell (see GTK_CELLTYPE_ENUM)
		do
			Result := c_gtk_cell_type (cell)
		end

	vertical: INTEGER is
		do
			Result := c_gtk_cell_vertical (cell)
		end
	
	horizontal: INTEGER is
		do
			Result := c_gtk_cell_horizontal (cell)
		end
	
	style: GTK_STYLE is
		local
			sp: POINTER
		do
			sp := c_gtk_cell_style (cell)
			if sp /= default_pointer then
				if style_cache /= Void and then sp = style_cache.style then
					Result := style_cache
				else
					create Result.make_from_pointer (sp)
				end
			end
		end

feature {NONE}

	style_cache: like style

end
