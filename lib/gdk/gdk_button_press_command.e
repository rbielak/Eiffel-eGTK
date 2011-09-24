-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "action for button event, redefine execute to handle it"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199904300518 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_button_press_command.e,v 1.4 2000/07/10 02:01:26 richieb Exp $"

deferred class GDK_BUTTON_PRESS_COMMAND

inherit

	GDK_BUTTON_COMMAND

feature -- initialization

	make_button_press (command_generator: GTK_OBJECT) is
		require
			valid_arg: command_generator /= Void
		do
			command_generator.add_action ("button_press_event", Current)
---		ensure
---			connected:
---				command_generator.action_by_name ("button_press_event") = Current
--- TODO: This may not hold because the action array does not prevent multiple
--- commands for the same signal_name being added, and action_by_name will only
--- return the first one it finds.  The former may or may not be desirable
--- depending on what gtk does; as for the latter, perhaps a has_action_cmd
--- query should be added.
		end

end -- GDK_BUTTON_PRESS_COMMAND
