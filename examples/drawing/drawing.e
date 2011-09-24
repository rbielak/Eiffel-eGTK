class DRAWING

inherit

	GTK_APPLICATION

creation

	make

feature

	window: GTK_WINDOW

	make is
		do
			initialize_tool_kit
			build_widgets
			main_loop
		end

	build_widgets is
		local
			hbox, vbox: GTK_BOX
			button1, button2, button3: GTK_BUTTON
			d_area: GTK_DRAWING_AREA
			quit: EGTK_QUIT_COMMAND
			cmd: GTK_COMMAND
			gcmd: GDK_EVENT_COMMAND
		do
			!!window.make_top_level
			window.set_title ("Drawing example")
			!!quit
			window.add_action ("delete_event", quit)

			!!hbox.make_vertical (False, 1)
			window.add_widget (hbox)
			!!vbox.make_horizontal (True, 1)
			hbox.pack (vbox, False, False, 1)
			-- make some buttons
			!!button1.make_with_label ("Line")
			vbox.pack (button1, True, True, 1)
			!!button2.make_with_label ("Rectangle")
			vbox.pack (button2, True, True, 1)
			!!button3.make_with_label ("Circle")
			vbox.pack (button3, True, True, 1)
			
			!!d_area.make
			d_area.set_area_size (200, 200)
			hbox.pack (d_area, True, True, 1)

			-- define callback here
			!LINE_ON_CLICK!cmd.make (d_area)
			button1.add_action ("clicked", cmd)
			!RECTANGLE_ON_CLICK!cmd.make (d_area)
			button2.add_action ("clicked", cmd)
			!CIRCLE_ON_CLICK!cmd.make (d_area)
			button3.add_action ("clicked", cmd)
			
			-- drawing area events
			!ON_CONFIGURE_EVENT!gcmd
			d_area.add_action ("configure_event", gcmd)
			!ON_EXPOSE_EVENT!gcmd
			d_area.add_action ("expose_event", gcmd)

			window.show_all
		end

end



