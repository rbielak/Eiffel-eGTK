-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "intermedate class for common features of button events"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199904300528 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_button_command.e,v 1.6 2003/01/11 19:32:51 elphick Exp $"

deferred class GDK_BUTTON_COMMAND

inherit

	GDK_EVENT_COMMAND
		redefine
			fetch_callback_arguments, event
		end

feature {NONE} -- callback

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		local
			p: POINTER
		do
			debug
				print ("EVENT OCCURRED%N") -- HERE TEMP DEBUG
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
	
	event: GDK_EVENT_BUTTON

end -- GDK_BUTTON_COMMAND
