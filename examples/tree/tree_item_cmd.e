class TREE_ITEM_CMD
	
inherit

	GTK_COMMAND
	
feature
	
	tree_item: GTK_TREE_ITEM is
		do
			Result ?= parent
		end
	
	execute is
		do
			print(event_name)
			print (" called for item ")
			print (tree_item.label_text)
			print ("%N")
		end
	
end
