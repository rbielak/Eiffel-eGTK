-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Holds information about a toolbar item. Only useful %
                 %for making sure that objects do not get garbage %
                 %collected too soon"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_toolbar_child.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_TOOLBAR_CHILD

feature

	widget: GTK_WIDGET
	
	set_widget (w: like widget) is
		do
			widget := w
		end

	icon: GTK_WIDGET

	set_icon (i: like icon) is
		do
			icon := i
		end

	label: GTK_WIDGET

	set_label (l: like label) is
		do
			label := l
		end

end -- GTK_TOOLBAR_CHILD
