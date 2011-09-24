-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TOOLBARS

inherit

	GTK_COMMAND
	
	GTK_CONSTANTS

feature

	window: GTK_WINDOW

	close_cmd: CLOSE_WINDOW_COMMAND

	pixmap: GTK_PIXMAP

	pix: GDK_PIXMAP is
		local
			bg: GDK_COLOR
		once
			-- Note that the ".xpm" files are taken from the default 
			-- directory. This is a back hack that should be fixed
			bg := window.style.bg (window.Gtk_state_normal)
			!!Result.make_from_xpm (window.gdk_window, bg, "test.xpm")
		end

	execute is
		local
			toolbar: GTK_TOOLBAR
			tool: TOOLBAR_CMD
			entry: GTK_ENTRY
		do
			!!window.make_top_level
			window.set_title ("Toolbar")
			window.set_policy (False, True, True)
			!!close_cmd.make (window)
			-- close_cmd.connect ("delete_event", window)
			window.add_action ("delete_event", close_cmd)

			!!toolbar.make (GTK_ORIENTATION_HORIZONTAL, GTK_TOOLBAR_BOTH)

			-- set up the commands
			!HORIZONTAL_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Horizontal", "Horizontal", "Horizontal toolbar layout",
								 pixmap, tool)

			!VERTICAL_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ( "Vertical",   "Vertical", "Vertical toolbar layout",
								  pixmap, tool)
								 
			toolbar.append_space

			!ICON_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Icons",   "Icons", "Only show icons",
								 pixmap, tool)

			!TEXT_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Text",  "Text", "Only show text",
								 pixmap, tool)


			!!pixmap.make (pix, default_pointer)
			!BOTH_CMD!tool.make (toolbar)
			toolbar.append_item ("Both", "Both", "Show text and icons",
								 pixmap, tool)

			toolbar.append_space
			!!entry.make_with_max_length (5)
			toolbar.append_widget (entry, "Useless entry", "Don't Click me")

			toolbar.append_space

			!SMALL_CMD!tool.make (toolbar)	
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Small", "Small", "Use small spaces",
								  pixmap, tool)
								 
			!BIG_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Big",   "Big", "Use big spaces",
								 pixmap, tool)
								 
			toolbar.append_space

			!ENABLE_TIPS_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Enable",  "Enable", "Enable tooltips",
								 pixmap, tool)
								  
			!DISABLE_TIPS_CMD!tool.make (toolbar)
			!!pixmap.make (pix, default_pointer)
			toolbar.append_item ("Disable", "Disable", "Disable tooltips",
								   pixmap, tool)

			-- set up the tool bar
			window.add_widget (toolbar)
			window.show_all
		end

end
