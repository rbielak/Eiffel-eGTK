-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_POLICY_TYPE_ENUM - scrollbar policy enumerations"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Oliver Elphick"
	cvs: "$Id: gtk_policy_type_enum.e,v 1.2 2000/07/10 02:01:28 richieb Exp $"

class GTK_POLICY_TYPE_ENUM

feature

	-- GtkPolicyType - controls when scrollbars are shown
	Gtk_policy_always:		INTEGER is 0
	Gtk_policy_automatic:	INTEGER is 1
	Gtk_policy_never:		INTEGER is 2

end
