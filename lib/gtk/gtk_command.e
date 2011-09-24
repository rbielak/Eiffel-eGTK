-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_COMMAND - attach these to widgets to perform actions %
	              % when something happens"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_command.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

deferred class GTK_COMMAND

inherit

	GTK_COMMAND_TYPE
	
feature

	execute is
			-- code to execute when the event occurs
		deferred
		end


end
