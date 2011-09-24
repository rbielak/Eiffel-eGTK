-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Global function for GTK apps, including event loop"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_application.e,v 1.9 2000/07/10 02:01:26 richieb Exp $"

class GTK_APPLICATION

-- Top-level class that must be included in every program that uses this
-- library.
--
-- You must call initialize_tool_kit before any other GTK features.
-- Use wait_for_events to start the main event loop.

inherit

	GTK_APPLICATION_EXTERNALS

	GTK_MAIN
 
	GTK_RC

	EGTK_NON_PORTABLE

feature -- attribute

	tool_kit_is_initialised: BOOLEAN
			-- True if GTK+ has been successfully initialised

feature -- actions

	set_locale is
			-- Sets the current locale according to the program environment. This 
			-- is the same as calling the libc function setlocale(LC_ALL, "") but 
			-- also takes care of the locale specific setup of the windowing 
			-- system used by GDK.
			--
			-- You should call this function before initialize_tool_kit to 
			-- support internationalization of your eGTK applications.
		do
			gtk_set_locale 
		end
			   
	initialize_tool_kit is
			-- this must be called first before GTK can be used (but 
			-- call set_locale before this, if you are using 
			-- internationalisation)
		do
			c_gtk_init_tool_kit
			tool_kit_is_initialised := True
		end
			   
	initialize_tool_kit_with_check is
			-- This feature may be called instead of initialise_tool_kit 
			-- if you wish to be able to run an alternative interface 
			-- should the GUI fail to initialise.  Test the boolean feature
			-- tool_kit_is_initialised to see whether initialisation was 
			-- successful.
		do
			tool_kit_is_initialised := (c_gtk_init_tool_kit_check /= 0)
		end

	wait_for_events is
		obsolete "Use 'main_loop' from GTK_MAIN"
		do
			gtk_main
		end

	quit_application is
		obsolete "Use 'main_loop_quit' from GTK_MAIN"
		do
			gtk_main_quit
		end

	exit (n: INTEGER) is
			-- Terminate the program and return n as the exit code to the 
			-- caller.  This function will shut down the GUI and free all 
			-- resources allocated for GTK.
		do
			gtk_exit (n)
		end

end -- GTK_APPLICATION
