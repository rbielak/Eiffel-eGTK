class C_LIST_INSERT_ROW_CMD

inherit

	C_LIST_COMMAND

creation

	make 

feature 

	text: ARRAY [STRING] is
		once
			Result := <<"This", "is an", "inserted", "row.",
						"This", "is an", "inserted", "row.",
						"This", "is an", "inserted", "row.">>
		end

	execute is
		do
			print ("Insert rows %N")
			if clist.focus_row > 0 then
				clist.insert_row (clist.focus_row, text)
			else
				clist.prepend_row (text)
			end
		end

end
