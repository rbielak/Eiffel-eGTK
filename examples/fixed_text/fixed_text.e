-- Copyright 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Example of use of text and entry widgets inside a %
		%fixed widget."
	author: "Oliver Elphick"
	date: "June 1999"
	cvs: "$Id: fixed_text.e,v 1.4 2000/03/30 17:47:48 elphick Exp $"

class FIXED_TEXT

inherit

	GTK_APPLICATION

creation

	make 

feature

	window: GTK_WINDOW
	fixed: GTK_FIXED
	vbox: GTK_BOX
	table: GTK_TABLE
	text: GTK_TEXT
	vscrollbar: GTK_VSCROLLBAR
	hscrollbar: GTK_HSCROLLBAR
	entry: GTK_ENTRY
	close_button: GTK_BUTTON
--	bbox: GTK_BUTTON_BOX
	word_wrap_button: GTK_BUTTON
	line_wrap_button: GTK_BUTTON
	no_wrap_button: GTK_BUTTON

	make is 
		local
			bquit_cmd: BQUIT_COMMAND
			quit_cmd: QUIT_COMMAND
		do
			initialize_tool_kit
			!!window.make_top_level
			window.set_border_width (10)

			-- make a vertical GTK_BOX to hold a fixed widget and
			-- a close close_button
			!!vbox.make_vertical (False, 5)
			window.add_widget(vbox)

			-- make a GTK_FIXED widget
			!!fixed.make
			fixed.set_size(300,300)

			-- make a GTK_TABLE widget to hold a text widget
			-- and its scrollbars
			!!table.make(2, 2, False)

			-- make a GTK_TEXT widget; this automatically
			-- creates a pair of adjustments for vertical and
			-- horizontal scrolling...
			!!text.make
			table.attach_defaults(text, 0, 1, 0, 1)
			-- ...so we make the scrollbars and put them into
			-- the table widget
			!!vscrollbar.make(text.v_adj)
			table.attach_defaults(vscrollbar, 1, 2, 0, 1)
			!!hscrollbar.make(text.h_adj)
			table.attach_defaults(hscrollbar, 0, 1, 1, 2)
			-- (unfortunately, horizontal scrolling is not yet
			-- supported by the gtk+ library, but we live in hope)

			-- set some characteristics of the text widget
			text.set_size(250,250)
			text.set_editable(True)
			text.do_word_wrapping
			set_initial_text

			-- I include a GTK_ENTRY in this example because,
			-- like GTK_TEXT, it inherits from GTK_EDITABLE;
			-- you can use the built-in capabilities of that
			-- class to cut and paste between the two
			!!entry.make_with_max_length(20)
			entry.set_size(250, 20)

			-- now we place the table (containing the text box)
			-- into the fixed widget, with the GTK_ENTRY below it
			fixed.attach(table, 10, 10)
			fixed.attach(entry, 10, 270)
			-- and we put the fixed widget in the vertical box
			vbox.pack(fixed, True, False, 5)

			-- now we want a button to end the program with
			!!close_button.make_with_label ("Close")
			!!bquit_cmd
			close_button.add_action ("clicked", bquit_cmd)

			-- and we put it in the bottom of the vertical box
			vbox.pack_end(close_button, True, False, 5)

			-- handle "destroy" window event
			!!quit_cmd.make (window)

			-- we don't need to show each widget individually...
			window.show_all

			-- ...but in the initial state, the text box's
			-- horizontal scrollbar is not needed (with wrapping
			-- in force) so we hide it
			hscrollbar.hide

			-- now we can open for business...
			main_loop
		end
	
	set_initial_text is
		do
			text.set_text(the_text)
		end

	the_text: STRING is "In the beginning, God created the heaven and the%
			% earth;%Nand the earth was without form and void, %
			%and darkness was upon the face of the deep.%NAnd the %
			%Spirit of God moved on the face of the waters.%NAnd %
			%God said, %'Let there be light!%'; and there was %
			%light."

end -- FIXED_TEXT
