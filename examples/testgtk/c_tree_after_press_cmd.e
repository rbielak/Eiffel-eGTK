class C_TREE_AFTER_PRESS_CMD

inherit

	GDK_EVENT_COMMAND

creation

	make

feature

	c_tree_cmd: C_TREE_CMD

	make (ctc: like c_tree_cmd) is
		do
			c_tree_cmd := ctc
		end

	execute is
		do
			print (event_name)
			print ("-->")
			c_tree_cmd.after_press
		end

end
