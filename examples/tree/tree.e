-- Copyright 1998 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Example of a tree widget"
	author: "Pirmin Kalberer"
	date: "August 1999"

class TREE

inherit

   GTK_APPLICATION

creation

   make 

feature

   window: WINDOW_WITH_CLOSE_BUTTON

   tree: GTK_TREE
   
   button: GTK_BUTTON
   
   itemnames : ARRAY[STRING] is
		once
			Result := << "Foo", "Bar", "Baz", "Quux", "Maurice" >>
		end
	
	add_item_actions(item: GTK_TREE_ITEM) is
		local
			item_cmd: TREE_ITEM_CMD
		do
			!!item_cmd
			item.add_action ("select", item_cmd)
			!!item_cmd
			item.add_action ("deselect", item_cmd)
			!!item_cmd
			item.add_action ("toggle", item_cmd)
			!!item_cmd
			item.add_action ("expand", item_cmd)
			!!item_cmd
			item.add_action ("collapse", item_cmd)
		end
			
	make is 
		local
			i, j: INTEGER
			swindow: GTK_SCROLLED_WINDOW
			subtree: GTK_TREE
			sel_cmd: TREE_SELECTION_CMD
			item, subitem: GTK_TREE_ITEM
		do
			initialize_tool_kit
			
			-- create a window with a tree
			!!window.make ("Tree Demo")
			window.box.set_border_width (10)
			window.set_size (150, 300)
			!!swindow.make
			window.box.pack (swindow, True, True, 0)
			!!tree.make
			!!sel_cmd
			tree.add_action ("select_child", sel_cmd)
			swindow.add_widget_with_viewport (tree)
			from i := itemnames.lower
			until i > itemnames.upper
			loop
				!!item.make_with_label (itemnames.item(i))
				add_item_actions(item)
				tree.append_item (item)
				item.show
				
				!!subtree.make
				!!sel_cmd
				subtree.add_action ("select_child", sel_cmd)
				item.set_subtree(subtree)
				from j := itemnames.lower
				until j > itemnames.upper
				loop
					!!subitem.make_with_label (itemnames.item(j))
					add_item_actions(subitem)
					subtree.append_item (subitem)
					subitem.show
					j := j + 1
				end
				
				i := i + 1
			end
			
			tree.set_view_mode(1)
			window.show_all
			
			-- wait_for_events
			main_loop
		end
	
end

