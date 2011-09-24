class GTK_CTREE_NODE

inherit

	G_LIST
		rename
			g_list as ctree_node
		end

creation

	make,
	make_from_pointer

feature

	data_as_ctree_row: GTK_CTREE_ROW is
			-- return list data as GTK_CTREE_NODE
		local
			p: POINTER
		do
			p := data_as_pointer
			if p /= default_pointer then
				if ctree_row_cache = Void or else ctree_row_cache.rowp /= p then
					create ctree_row_cache.make_from_pointer (p)
				end
				Result := ctree_row_cache
			end
		end

	is_leaf: BOOLEAN is
		do
			Result := data_as_ctree_row.is_leaf
		end

	is_expanded: BOOLEAN is
		do
			Result := data_as_ctree_row.is_expanded
		end

feature {NONE}

	ctree_row_cache: GTK_CTREE_ROW

end
