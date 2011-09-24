-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "action for motion event, redefine execute to handle it"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199904300640 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_motion_command.e,v 1.6 2003/01/11 19:32:51 elphick Exp $"

deferred class GDK_MOTION_COMMAND

inherit

	GDK_EVENT_COMMAND
		redefine
			fetch_callback_arguments, event
		end

feature -- initialization

	make_motion (command_generator: GTK_OBJECT) is
		require
			valid_arg: command_generator /= Void
		do
			command_generator.add_action ("motion_notify_event", Current)
		ensure
			connected:
				command_generator.action_by_name ("motion_notify_event") = Current
---		ensure
---			connected:
---				command_generator.action_by_name ("motion_notify_event") = Current
--- TODO: This may not hold because the action array does not prevent multiple
--- commands for the same signal_name being added, and action_by_name will only
--- return the first one it finds.  The former may or may not be desirable
--- depending on what gtk does; as for the latter, perhaps a has_action_cmd
--- query should be added.
		end

feature {NONE} -- callback

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		local
			p: POINTER
		do
			debug
				print ("motion EVENT OCCURRED%N") -- HERE TEMP DEBUG
			end
			-- get the event data
			p := fetch_pointer (argp, 0)
			check
				event_data_valid: p /= default_pointer
			end
			if event = Void then
				create  event.make_from_pointer (p)
			else
				event.make_from_pointer (p)
			end
		end

feature -- query

	event: GDK_EVENT_MOTION

end -- GDK_MOTION_COMMAND
