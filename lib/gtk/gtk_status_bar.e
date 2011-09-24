-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_STATUS_BAR widget"
	author: "Daniel Elphick"
	cvs: "$Id: gtk_status_bar.e,v 1.9 2003/01/11 19:32:51 elphick Exp $"

class GTK_STATUS_BAR

-- A status bar, with a text stack
--
-- Signals (from gtkstatusbar.c):
--    "text_popped"
--    "text_pushed"

   
inherit

	GTK_BOX

	GTK_STATUS_BAR_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation
	
	make

feature

	get_context_id(description: STRING): INTEGER is
		require
			description_string: description /= Void
		do
			Result := npc.np_gtk_statusbar_get_context_id(widget, description)
		end

	push(context_id: INTEGER; text: STRING): INTEGER is
			-- HAS SIDE EFFECT
		require
			valid_string: text /= Void
		do
			Result := npc.np_gtk_statusbar_push(widget, context_id, text)
		end

	pop(context_id: INTEGER) is
			-- HAS SIDE EFFECT
		do
			gtk_statusbar_pop(widget, context_id)
		end

	remove(context_id, message_id: INTEGER) is
		do
			gtk_statusbar_remove(widget, context_id, message_id)
		end

feature {NONE}

	make is
		do
			widget := gtk_statusbar_new
			create children.make (1, 0)
			register_widget
		end

end -- GTK_STATUS_BAR
