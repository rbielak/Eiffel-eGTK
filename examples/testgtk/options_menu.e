class OPTIONS_MENU

feature


	option_menu (a_list: GTK_CONTAINER): GTK_OPTION_MENU is
		require
			a_list_not_void: a_list /= Void
		local
			cmd: LIST_TOGGLE_SELECT_MODE_CMD
		do
 			!LIST_TOGGLE_SELECT_MODE_CMD!cmd.make (a_list)
			Result := build_option_menu  (<<"Single",
											"Browse",
											"Multiple",
											"Extended">>, 4,
											<<cmd, 
											  clone (cmd),
											  clone (cmd), 
											  clone (cmd)>>)

		end

	build_option_menu (labels: ARRAY [STRING]; 
					   active_item: INTEGER;
					   cmds: ARRAY [MENU_ITEM_CMD]): GTK_OPTION_MENU is
		require
			labels_and_cmds_consistent: cmds.count = labels.count
		local
			i: INTEGER
			menu: GTK_MENU
			menu_item: GTK_RADIO_MENU_ITEM
			group: POINTER
		do
			!!Result.make
			!!menu.make
			from i := 1 until i > labels.count loop
				!!menu_item.make_with_group_and_label (group, labels @ i)
				menu_item.add_action ("toggled", cmds @ i)
				cmds.item (i).set_item_index (i)
				group := menu_item.group
				menu.append (menu_item)
				if i = active_item then
					menu_item.set_active (True)
				end
				menu_item.show
				i := i + 1
			end
			Result.set_menu (menu)
			Result.set_history (active_item)
		end


end
