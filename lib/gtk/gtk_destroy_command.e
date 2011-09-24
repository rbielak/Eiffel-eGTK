-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Handle the GTK destroy signal"
	author: "Dave E Martin XXIII"
	genesis: "199905122310 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_destroy_command.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

deferred class GTK_DESTROY_COMMAND

inherit

	GTK_COMMAND_TYPE

feature -- initialization
	make_destroy (command_generator: GTK_OBJECT) is
		require
			valid_arg: command_generator /= Void
		do
			command_generator.add_action ("destroy", Current)
		end

end -- GTK_DESTROY_COMMAND
