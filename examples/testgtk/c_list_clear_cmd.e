class C_LIST_CLEAR_CMD

inherit

	C_LIST_COMMAND

creation
	
	make

feature

	execute is
		do
			print ("Clear list%N")
			clist.clear_list
		end

end
