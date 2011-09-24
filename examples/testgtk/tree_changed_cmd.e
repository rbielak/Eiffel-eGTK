-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TREE_CHANGED_CMD

inherit
	
	GTK_COMMAND
		redefine
			parent
		end

creation

	make

feature

	parent: GTK_TREE

	tree_widgets: CREATE_TREE_CMD

	make (cmd: like tree_widgets) is
		do
			tree_widgets := cmd
		end

	execute is
		local
			nb_selected: INTEGER
			
		do
			if parent.selection /= Void then
				nb_selected := parent.selection.length
			end
			print ("selection_changed: ")
			print (nb_selected)
			print ("%N")
			if nb_selected = 0 then
				if parent.count = 0 then
					tree_widgets.add_button.set_sensitive (True)
				else
					tree_widgets.remove_button.set_sensitive (False)
					tree_widgets.add_button.set_sensitive (False)
					tree_widgets.subtree_button.set_sensitive (False)
				end
			else
				tree_widgets.remove_button.set_sensitive (True)
				tree_widgets.add_button.set_sensitive (nb_selected = 1)
				tree_widgets.subtree_button.set_sensitive (nb_selected = 1)
			end
				
		end

end
