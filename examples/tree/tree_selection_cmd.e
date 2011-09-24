class TREE_SELECTION_CMD

inherit

	GTK_COMMAND
		redefine
			fetch_callback_arguments
		end

	EGTK_SHARED_WIDGET_FACTORY

feature
	
	root_tree: GTK_TREE is
		do
			Result ?= parent
		end
	
	child : GTK_TREE_ITEM
	
	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		do
			-- first argument is the pointer to the child item
			child ?= widget_factory.item_from_pointer (fetch_pointer (argp, 0))
			if child = Void then
				!!child.make_from_pointer (fetch_pointer (argp, 0))
			end
		end
	
	execute is
		do
			print ("Selected item: ")
			print (child)
			print ("%N")
		end

end
