-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TOOLBAR - toolbar of buttons to press"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id"

class GTK_TOOLBAR

-- A row of command buttons (usually each with a pixmap)
--
-- Signals (from gtktoolbar.c):
--    "orientation_changed"
--    "style_changed"

inherit

	GTK_COMPOSED_BIN
		rename
			set_style as widget_set_style
		redefine
			add_widget,
			remove_widget
		end

	GTK_TOOLBAR_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature -- adding items

	append_item (label, tooltip, tooltip_private: STRING; 
				 icon: GTK_WIDGET; cmd: GTK_COMMAND) is
		require
			label_not_void: label /= Void
			tooltip_not_void: tooltip /= Void
			tooltip_private_not_void: tooltip_private /= Void
			icon_not_void: icon /= Void
						   
		local
			child: GTK_TOOLBAR_CHILD
			button: GTK_BUTTON
			bp: POINTER
		do
			create child
			child.set_icon (icon)
			add_toolbar_child (child)
			bp := npc.np_gtk_toolbar_append_item (widget, label, tooltip,
												  tooltip_private,
												  icon.widget,
												  default_pointer,
												  default_pointer)
			create button.make_from_pointer (bp)
			child.set_widget (button)
			if cmd /= Void then
				button.add_action ("clicked", cmd)
			end
		end

	append_item_multi_signal(label, tooltip, tooltip_private: STRING;
			icon: GTK_WIDGET; cmds: ARRAY[GTK_COMMAND];sigs:ARRAY[STRING]) is
			-- append one item with some signals to the widget at once
		require
			label_not_void: label /= Void
			tooltip_not_void: tooltip /= Void
			tooltip_private_not_void: tooltip_private /= Void
			icon_not_void: icon /= Void
		local
			child: GTK_TOOLBAR_CHILD
			button: GTK_BUTTON
			bp: POINTER
		do
			create child
			child.set_icon (icon)
			add_toolbar_child (child)
			bp := npc.np_gtk_toolbar_append_item (widget, label, tooltip,
			tooltip_private,
			icon.widget,
			default_pointer,
			default_pointer)
			create button.make_from_pointer (bp)
			child.set_widget (button)
			if 
				sigs /= Void 
				and then cmds /= Void 
				and then cmds.count = sigs.count 
				and then cmds.lower =sigs.lower 
			then
					multi_signal (button,cmds,sigs)
			end
		end

	multi_signal(an_object:GTK_OBJECT;cmds:ARRAY[GTK_COMMAND];sigs:ARRAY[STRING])is
		require
			an_object_not_void: an_object /= void
			cmd_sig_dependent: sigs /=void implies sigs /= void
			cmd_sig_same_count: sigs /= void implies sigs.count = cmds.count
			cmd_sig_same_lower: sigs /= void implies sigs.lower = cmds.lower
		local
			i : INTEGER
		do
			from
				i := sigs.lower
			until
				i > sigs.count
			loop
				an_object.add_action(sigs.item(i),cmds.item(i))
				i := i + 1
			end
		end


	append_toggle_item(label,tooltip,tooltip_private:STRING; icon:GTK_WIDGET; cmd:GTK_COMMAND) is
		require
			label_not_void: label /= Void
			tooltip_not_void: tooltip /= Void
			tooltip_private_not_void: tooltip_private /= Void
			icon_not_void: icon /= Void
						   
		local
			child: GTK_TOOLBAR_CHILD
			button: GTK_TOGGLE_BUTTON
			bp: POINTER
		do
			create child
			child.set_icon (icon)
			
			add_toolbar_child (child)
			bp:=	npc.np_gtk_toolbar_append_element (
				widget, 
				GTK_TOOLBAR_CHILD_TOGGLEBUTTON,
				default_pointer,
				label,
				tooltip,
				tooltip_private,
				icon.widget,
				default_pointer,default_pointer)
			child.set_widget (button)
			if cmd /= Void then
				button.add_action ("toggled", cmd)
			--	button.add_action ("clicked",cmd)
			end
		end

	append_radio_item(label,tooltip,tooltip_private:STRING;group:POINTER; icon:GTK_WIDGET; cmd:GTK_COMMAND) is
		require
			label_not_void: label /= Void
			tooltip_not_void: tooltip /= Void
			tooltip_private_not_void: tooltip_private /= Void
			icon_not_void: icon /= Void
						   
		local
			child: GTK_TOOLBAR_CHILD
			button: GTK_RADIO_BUTTON
			bp: POINTER
		do
			create child
			child.set_icon (icon)
			
			add_toolbar_child (child)
			bp:=	npc.np_gtk_toolbar_append_element (
				widget, 
				GTK_TOOLBAR_CHILD_RADIOBUTTON, 
				group,
				label,
				tooltip,
				tooltip_private,
				icon.widget,
				default_pointer,default_pointer)
			child.set_widget (button)
			if cmd /= Void then
				button.add_action ("toggled", cmd)
			--	button.add_action ("clicked",cmd)
			end
			last_pointer:= bp 
		end

	last_pointer : POINTER

	prepend_item (label, tooltip, tooltip_private: STRING; 
				 icon: GTK_WIDGET; cmd: GTK_COMMAND) is
		require
			label_not_void: label /= Void
			tooltip_not_void: tooltip /= Void
			tooltip_private_not_void: tooltip_private /= Void
			icon_not_void: icon /= Void
		local
			child: GTK_TOOLBAR_CHILD
			button: GTK_BUTTON
			bp: POINTER
		do
			create child
			child.set_icon (icon)
			add_toolbar_child (child)
			bp := npc.np_gtk_toolbar_prepend_item (widget, label, tooltip,
												   tooltip_private,
												   icon.widget,
												   default_pointer,
												   default_pointer)
			create button.make_from_pointer (bp)
			child.set_widget (button)
			if cmd /= Void then
				button.add_action ("clicked", cmd)
			end
		end

feature -- adding widgets

	add_widget (a_widget: GTK_WIDGET) is
		do
			add_child (a_widget)
			gtk_toolbar_append_widget (widget, a_widget.widget, default_pointer, default_pointer)
		end

	append_widget (a_widget: GTK_WIDGET; tooltip, private_tooltip: STRING) is
		require
			widget_not_void: a_widget /= Void
			tooltips_not_void: (tooltip /= Void) and (private_tooltip /= Void)
		do
			add_child (a_widget)
			npc.np_gtk_toolbar_append_widget (widget, a_widget.widget, tooltip, private_tooltip)
		end

	prepend_widget (a_widget: GTK_WIDGET; tooltip, private_tooltip: STRING) is
		require
			widget_not_void: a_widget /= Void
			tooltips_not_void: (tooltip /= Void) and (private_tooltip /= Void)
		do
			add_child (a_widget)
			npc.np_gtk_toolbar_prepend_widget (widget, a_widget.widget, tooltip, private_tooltip)
		end


	remove_widget (a_widget: GTK_WIDGET) is
		do
			print ("GTK_TOOLBAR - can't remove widgets")
			-- Should really raise an exception here
		end

feature -- toolbar specific calls

	append_space is
		do
			gtk_toolbar_append_space (widget)
		end

	set_orientation (orientation: INTEGER) is
		do
			gtk_toolbar_set_orientation (widget, orientation)
		end

	set_style (lstyle: INTEGER) is
		do
			gtk_toolbar_set_style (widget, lstyle)
		end

	set_space_size (size: INTEGER) is
		require
			size > 0
		do
			gtk_toolbar_set_space_size (widget, size)
		end

	enable_tooltips is
		do
			gtk_toolbar_set_tooltips (widget, True)
		end

	disable_tooltips is
		do
			gtk_toolbar_set_tooltips (widget, False)
		end

feature {NONE} -- creation

	make (orientation, lstyle: INTEGER) is
		do
			widget := gtk_toolbar_new (orientation, lstyle)
			create children.make (1, 0)
			register_widget
		end

feature {NONE} -- implementation

	toolbar_children: ARRAY [GTK_TOOLBAR_CHILD]
			-- keep references these objects until the toolbar object 
			-- is deleted

	add_toolbar_child (ch: GTK_TOOLBAR_CHILD) is
		require
			ch_not_void: ch /= Void
		local
			last: INTEGER
		do
			if toolbar_children = Void then
				create toolbar_children.make (1,0)
			end
			last := toolbar_children.count
			toolbar_children.force (ch, last + 1)
		end

end
