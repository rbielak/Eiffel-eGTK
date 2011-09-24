-- Copyright 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Representation of styles from resource files"
	author: "Oliver Elphick"
	cvs: "$Id: gtk_rc_style.e,v 1.3 2003/01/11 19:32:51 elphick Exp $"

class GTK_RC_STYLE

	-- Representation of styles from resource files

inherit

	EGTK_HANDLE

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

	GTK_STATETYPE_ENUM
		undefine
			is_equal, copy
		end

	GTK_RC_EXTERNALS
		undefine
			is_equal, copy
		end

creation

	make, make_from_pointer

feature -- Creation

	make is
			-- Create a new object
		do
			make_from_pointer(gtk_rc_style_new)
		end

feature -- current settings

	name: STRING is
			-- The name assigned to the style when it was created
		do
			Result := npc.np_gtk_rc_style_name(handle)
		end

	font_name: STRING is
		do
			Result := npc.np_gtk_rc_style_font_name(handle)
		end

	fontset_name: STRING is
			-- fontsets override fonts
		do
			Result := npc.np_gtk_rc_style_fontset_name(handle)
		end

	pixmap_name(state: INTEGER): STRING is
			-- The name of a pixmap to be used instead of the base colour.
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			Result := npc.np_gtk_rc_style_pixmap_name(handle, state)
		end

	foreground_colour(state: INTEGER): GDK_COLOR is
			-- The foreground colour is used for the foreground of most widgets
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			create Result.make_from_pointer(c_gtk_rc_style_colour(handle, state, Gtk_rc_fg))
		end

	background_colour(state: INTEGER): GDK_COLOR is
			-- The background colour is used for the background of most widgets
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			create Result.make_from_pointer(c_gtk_rc_style_colour(handle, state, Gtk_rc_bg))
		end

	text_colour(state: INTEGER): GDK_COLOR is
			-- The text colour is used for the foreground of widgets that 
			-- contain editable text
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			create Result.make_from_pointer(c_gtk_rc_style_colour(handle, state, Gtk_rc_text))
		end

	base_colour(state: INTEGER): GDK_COLOR is
			-- The base colour is used for the background of widgets that 
			-- contain editable text
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			create Result.make_from_pointer(c_gtk_rc_style_colour(handle, state, Gtk_rc_base))
		end

	foreground_colour_is_set(state: INTEGER): BOOLEAN is
			-- True if the foreground colour has been set for the specified state
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			Result := (c_gtk_rc_style_colour_set(handle, state, Gtk_rc_fg) /= 0)
		end

	background_colour_is_set(state: INTEGER): BOOLEAN is
			-- True if the background colour has been set for the specified state
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			Result := (c_gtk_rc_style_colour_set(handle, state, Gtk_rc_bg) /= 0)
		end

	text_colour_is_set(state: INTEGER): BOOLEAN is
			-- True if the text colour has been set for the specified state
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			Result := (c_gtk_rc_style_colour_set(handle, state, Gtk_rc_text) /= 0)
		end

	base_colour_is_set(state: INTEGER): BOOLEAN is
			-- True if the base colour has been set for the specified state
		require
			state_ok: state >= Gtk_state_normal and
						 state <= Gtk_state_insensitive
		do
			Result := (c_gtk_rc_style_colour_set(handle, state, Gtk_rc_base) /= 0)
		end

	-- theme_engine: POINTER
	-- engine_data: POINTER
			
feature {NONE}

	rc_style_ref is
			-- Increment the GTK+ reference count (the object is created with a 
			-- reference count of 1)
		do
			gtk_rc_style_ref(handle)
		end

	rc_style_unref is
			-- Decrement the GTK+ reference count
		do
			gtk_rc_style_unref(handle)
		end

end -- GTK_RC_STYLE
