-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class GTK_CTREE_ROW_EXTERNALS

feature

	c_gtk_ctree_row_sibling (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_parent (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_children (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_pixmap_closed (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_mask_closed (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_pixmap_opened (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_mask_opened (row: POINTER): POINTER is
		external "C"
		end

	c_gtk_ctree_row_level (row: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_row_is_leaf (row: POINTER): INTEGER is
		external "C"
		end

	c_gtk_ctree_row_expanded (row: POINTER): INTEGER is
		external "C"
		end

end
