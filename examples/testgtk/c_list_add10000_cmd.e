class C_LIST_ADD10000_CMD

inherit

	C_LIST_COMMAND

creation

	make

feature

	execute is
		local
			texts: ARRAY [STRING]
			i: INTEGER
		do
			print ("Add 10,0000 %N")
			-- make texts for each column
			!!texts.make (0, clist_columns - 1)
			from i := 1 until i >= clist_columns loop
				texts.put (clone ("Column "), i)
				texts.item (i).append (i.out)
				i := i + 1
			end
			texts.put ("Right", 1)
			texts.put ("Center", 1)
			-- add items
			clist.freeze
			from i :=  1 until i > 10000 loop
				texts.put (clone ("CListRow "), 0)
				texts.item (0).append (i.out)
				clist.append_row (texts)
				if i \\ 1000 = 0 then
					print (i) print (" rows done%N")
				end
				i := i + 1
			end
			clist.thaw
		end

end
