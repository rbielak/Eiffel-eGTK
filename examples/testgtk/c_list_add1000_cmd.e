class C_LIST_ADD1000_CMD

inherit

	C_LIST_COMMAND

creation

	make

feature

	pixmap: GDK_PIXMAP

	execute is
		local
			texts: ARRAY [STRING]
			first_row: STRING
			i: INTEGER
		do
			print ("Add 1000 %N")
			!!pixmap.make_from_xpm (clist.window, Void, "gtk_mini.xpm")
			!!texts.make (0, clist_columns - 1)
			-- column contents
			from i := 1 until i >= clist_columns loop
				texts.put (clone ("Column "), i)
				texts.item (i).append (i.out)
				i := i + 1
			end
			texts.put ("Right", 1)
			texts.put ("Center", 2)
			texts.put (Void, 3)
			-- add items to list
			clist.freeze
			from i := 1 until i > 1000 loop
				first_row := clone ("ClistRow: ")
				first_row.append (i.out)
				texts.put (first_row, 0)
				clist.append_row (texts)
				clist.set_cell_pixtext (clist.index_row, 3, "gtk+", 5, pixmap)
				i := i + 1
			end
			clist.thaw
		end

end
