-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "EGTK_MESSAGE - ancestor of all message dialogs"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message.e,v 1.9 2003/01/11 19:32:51 elphick Exp $"

deferred class EGTK_MESSAGE

   -- A dialog box containing a message and a close button

inherit

   GTK_DIALOG
      rename
	 make as make_dialog,
	 dispose as widget_dispose
      end

	GTK_RC
	undefine
		copy, is_equal
	end

feature -- Creation

   make(w: GTK_WINDOW; s: STRING) is
	 -- create the dialog box, with w as parent.
	 -- s is the message
      require
	 good_parent: w /= Void
	 good_message: s /= Void and then s.count /= 0
      local
			g: GDK_PIXMAP
			f: STRING
      do
	 make_dialog
	 set_pathname
	 create hbox1.make_horizontal(false, 10)
	 f := rc_find_pixmap_in_path (pathname)
	 create g.make_from_xpm(w.gdk_window, Void, f)
	 create pixmap.make(g, default_pointer)
	 hbox1.pack(pixmap, true, true, 5)
	 create message.make(s)
	 hbox1.pack(message, true, true, 5)
	 vbox.pack(hbox1, true, true, 5)
	 make_button_box
	 Current.reparent(w)
	 realize
	 create close_cmd.make(Current)
	 set_close_cmd(close_cmd)
      ensure
	 parent_set: parent = w
      end

   make_with_command(w: GTK_WINDOW; s: STRING; c: EGTK_MESSAGE_HIDE_CMD) is
	 -- create the dialog box, with w as parent.
	 -- s is the message;
	 -- c is the command to run when the close button is clicked
      require
	 command_set: c /= Void
      do
	 make(w, s)
	 set_close_cmd(c)
      end

feature -- Attributes

   hbox1: GTK_BOX

   pixmap: GTK_PIXMAP

   message: GTK_LABEL

   hbox2: GTK_BOX

   close_button: GTK_BUTTON

   pathname: STRING
	 -- path to .xpm file

feature -- Procedures

   set_pathname is
	 -- set the path to the pixmap
      deferred
      ensure
	 path_set: pathname /= Void and then pathname.count /= 0
      end

   set_close_cmd(cmd: EGTK_MESSAGE_HIDE_CMD) is
	 -- replace all the Close button callbacks with cmd
      do
	 close_button.remove_all_signal_handlers
	 add_close_cmd(cmd)
      end

   add_close_cmd(cmd: GTK_COMMAND_TYPE) is
	 -- add cmd to the Close button callbacks
      do
	 close_button.add_action("clicked", cmd)
      end

   make_button_box is
	 -- Create the control button_box
      do
	 create hbox2.make_horizontal(true, 30)
	 make_buttons
	 action_area.pack(hbox2, true, true, 15)
      end

   make_buttons is
	 -- Create the control button(s)
	 -- redefine this in descendants
      do
	 make_close_button
      ensure
	 close_button: close_button /= Void and then close_button.parent = hbox2
      end

   make_close_button is
      local
	 h: EGTK_MESSAGE_HIDE_CMD
      do
	 create close_button.make_with_label("Close")
	 hbox2.pack(close_button, false, false, 5)
	 create h.make(Current)
	 set_close_cmd(h)
      end

   dispose is
      do
	 destroy
	 widget_dispose
      end

   set_text(s: STRING) is
      require
	 not_void: s /= Void
      do
	 message.set_text(s)
      end

   set_close_button_text(s: STRING) is
      require
	 string_set: s /= Void and then not s.is_empty
	 close_button_made: close_button /= Void
      do
	 close_button.set_label(s)
      end

   set_close_button_default is
      require
	 close_button_made: close_button /= Void
      do
	 close_button.set_label("Close")
      end

   close_cmd: EGTK_MESSAGE_HIDE_CMD

end -- EGTK_MESSAGE
