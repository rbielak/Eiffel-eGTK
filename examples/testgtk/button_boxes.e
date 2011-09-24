class BUTTON_BOXES

inherit

	GTK_COMMAND
	
	GTK_BUTTON_BOX_STYLE_ENUM

feature

	window: GTK_WINDOW

	execute is
		local
			main_vbox: GTK_BOX
			frame_horz, frame_vert: GTK_FRAME
			vbox, hbox: GTK_BOX
		do
			if window = Void then
				!!window.make_top_level
				window.set_title ("Button Boxes")
				window.set_border_width (10)
				!!main_vbox.make_vertical (False, 0)
				window.add_widget (main_vbox)

				-- Horizontal boxes
				!!frame_horz.make ("Horizontal Button Boxes")
				main_vbox.pack (frame_horz, True, True, 10)
				!!vbox.make_vertical (False, 0)
				vbox.set_border_width (10)
				frame_horz.add_widget (vbox)
				vbox.pack (create_bbox (True, "Spread", 40, 85, 20, Gtk_buttonbox_spread),
						   True, True, 0);
				vbox.pack (create_bbox (True, "Edge", 40, 85, 20, Gtk_buttonbox_edge),
						   True, True, 5);
				vbox.pack (create_bbox (True, "Start", 40, 85, 20, Gtk_buttonbox_start),
						   True, True, 5);
				vbox.pack (create_bbox (True, "End", 40, 85, 20, Gtk_buttonbox_end),
						   True, True, 5);
				
				-- Vertical boxes
				!!frame_vert.make ("Vertical Button Boxes")
				main_vbox.pack (frame_vert, True, True, 10)
				!!hbox.make_horizontal (False, 0)
				hbox.set_border_width (10)
				frame_vert.add_widget (hbox)

				hbox.pack (create_bbox (False, "Spread", 30, 85, 20, Gtk_buttonbox_spread),
						   True, True, 0)
				hbox.pack (create_bbox (False, "Edge", 30, 85, 20, Gtk_buttonbox_edge),
						   True, True, 5)
				hbox.pack (create_bbox (False, "Start", 30, 85, 20, Gtk_buttonbox_start),
						   True, True, 0)
				hbox.pack (create_bbox (False, "End", 30, 85, 20, Gtk_buttonbox_end),
						   True, True, 5)
			
				window.show_all
			end
		end

	create_bbox (horizontal: BOOLEAN;
				 title: STRING;
				 spacing, child_w, child_h, layout: INTEGER): GTK_FRAME is
		local
			bbox: GTK_BUTTON_BOX
			button: GTK_BUTTON
		do
			!!Result.make (title)
			if horizontal then
				!!bbox.make_horizontal
			else
				!!bbox.make_vertical
			end
			bbox.set_border_width (5)
			Result.add_widget (bbox)
			
			bbox.set_layout (layout)
			bbox.set_spacing (spacing)
			bbox.set_child_size (child_w, child_h)

			!!button.make_with_label ("OK")
			bbox.add_widget (button)
			!!button.make_with_label ("Cancel")
			bbox.add_widget (button)
			!!button.make_with_label ("Help")
			bbox.add_widget (button)
		end

end
