class C_LIST_WARNING_TEST_CMD

inherit

	C_LIST_COMMAND

creation

	make

feature

	add: BOOLEAN

	execute is
		local
			child: GTK_LABEL
			rescued: BOOLEAN
		do
			-- this test is pointless in Eiffel because the 
			-- assertions prevent the "add" and "remove" calls from 
			-- working. Only if you run without assertions you will be
			-- able to see the warnings from GTK.

			-- this test basically shows that when container routines 
			-- are called on gtk_clist, they produce warnings.
			if not rescued then
				add := not add
				!!child.make ("Test")
				child.ref
				child.sink
				if add then
					clist.add_widget (child)
				else
					child.set_parent (clist)
					clist.remove_widget (child)
					child.set_parent (Void)
				end
				child.destroy
				child.unref
			else
				print ("You can't do this... %N")
			end
		rescue
			print ("Exception rescued %N")
			rescued := True
			retry
		end

end

