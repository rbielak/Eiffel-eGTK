-- Copyright 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Handling of resource files"
	author: "Oliver Elphick"
	cvs: "$Id: gtk_rc.e,v 1.4 2003/01/11 19:32:51 elphick Exp $"

class GTK_RC

	-- GTK+ uses its own resource files for setting the appearance and 
	-- behaviour of widgets.  This class provides routines for using 
	-- resource files with eGTK.
	--
	-- An application can cause GTK+ to parse a specific RC file by calling 
	-- rc_parse.  In addition to this, certain files will be read at the 
	-- end of initialise_tool_kit in GTK_APPLICATION. Unless modified, the 
	-- files looked for will be .gtkrc in the user's home directory, and 
	-- $localstatedir/gtk/gtkrc ($localstatedir defaults to /usr/local/etc).
	--
	-- The list of these default files can be retrieved with get_default_files 
	-- and modified with add_default_file or set_default_files.
	--
	-- For each default file, in addition to the file itself, GTK+ will look 
	-- for a locale-specific file that will be parsed in addition to the main 
	-- file.  For instance, if LANG is set to ja_JP.ujis when loading the 
	-- default file ~/.gtkrc, GTK+ also looks for ~/.gtkrc.ja_JP.ujis, 
	-- ~/.gtkrc.ja_JP, and ~/.gtkrc.ja, and parses the first one it finds.
	--
	-- The structure of resource files is described in the GTK+ 
	-- reference manual.

inherit

	GTK_RC_EXTERNALS

	EGTK_NON_PORTABLE

feature

	rc_add_default_file (filename: STRING) is
			-- Adds a file to the list of files to be parsed at the end of 
			-- gtk_initialise_tool_kit in GTK_APPLICATION
		do
			npc.np_gtk_rc_add_default_file (filename)
		end

	rc_set_default_files (filenames: ARRAY[STRING]) is
			-- Sets the list of files to be parsed at the end of
			-- gtk_initialise_tool_kit in GTK_APPLICATION
		do
			npc.np_gtk_rc_set_default_files (filenames)
		end

	rc_get_default_files: ARRAY[STRING] is
			-- Gets the list of files to be parsed at the end of
			-- gtk_initialise_tool_kit in GTK_APPLICATION
		do
			Result := clone(npc.np_gtk_rc_get_default_files)
		end

	parse_rc_file, rc_parse (filename: STRING) is
			-- parse the file
		require
			file: filename /= Void
		do
			npc.np_gtk_rc_parse(filename)
		end

	rc_parse_string (s: STRING) is
			-- parse the string for resource information
		require
			not_void: s /= Void
		do
			npc.np_gtk_rc_parse_string (s)
		end

	rc_reparse_all is
			-- if any of the rc files has changed, reparse them.  If any 
			-- were reparsed, set rc_was_reparsed to True.
		do
			rc_was_reparsed := (gtk_rc_reparse_all /= 0)
		end

	rc_was_reparsed: BOOLEAN

	rc_get_style (w: GTK_WIDGET): GTK_STYLE is
		-- returns a style representing the appearance of the widget
		do
			create Result.make_from_pointer(gtk_rc_get_style(w.widget))
		end

	rc_add_widget_name_style (style: GTK_RC_STYLE; pattern: STRING) is
			-- Add a GTK_RC_STYLE that will be looked up by a match against the 
			-- widget's pathname. This is equivalent to a
			-- `widget PATTERN style STYLE' line in a rc file
		do
			npc.np_gtk_rc_add_widget_name_style(style.handle, pattern)
		end

	rc_add_widget_class_style (style: GTK_RC_STYLE; pattern: STRING) is
			-- Add a GTK_RC_STYLE that will be looked up by a match against the 
			-- widget's class pathname. This is equivalent to a
			-- `widget_class PATTERN style STYLE' line in a rc file
		do
			npc.np_gtk_rc_add_widget_class_style(style.handle, pattern)
		end

	rc_add_class_style (style: GTK_RC_STYLE; pattern: STRING) is
			-- Add a GTK_RC_STYLE that will be looked up by a match against 
			-- the class hierarchy of the widget. This is equivalent to a 
			-- `class PATTERN style STYLE' statement in a RC file.
		do
			npc.np_gtk_rc_add_class_style (style.handle, pattern)
		end	

	rc_find_pixmap_in_path (pixmap_file: STRING): STRING is
			-- Looks up a file in the current pixmap path. If the file is not 
			-- found,  it outputs a warning message using g_warning() and returns 
			-- Void.
		do
			Result := npc.np_gtk_rc_find_pixmap_in_path (pixmap_file)
		end	

	rc_find_module_in_path (module_file: STRING): STRING is
			-- Looks up a file in the current pixmap path. If the file is not 
			-- found,  it outputs a warning message using g_warning() and returns 
			-- Void.
		do
			Result := npc.np_gtk_rc_find_module_in_path (module_file)
		end

	rc_get_theme_dir: STRING is
			-- Returns the standard directory in which themes should be 
			-- installed.  (GTK+ does not actually use this directory itself.)
		do
			Result := npc.np_gtk_rc_get_theme_dir
		end

	rc_get_module_dir: STRING is
			-- Returns the directory in which GTK+ will look for theme engines.
		do
			Result := npc.np_gtk_rc_get_module_dir
		end

end -- GTK_RC
