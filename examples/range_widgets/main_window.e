indexing
	description: "The application's main window"
	author: "Dave E Martin XXIII"
	genesis: "199905122231 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class MAIN_WINDOW
inherit
	GTK_WINDOW

creation
	make

feature {NONE} -- initialization
	make (the_app: GTK_APPLICATION) is
		local
			destroy_command: DESTROY_COMMAND
			box1, box2, box3: GTK_BOX
			adj1: GTK_ADJUSTMENT
			vscale: GTK_VSCALE
			hscale: GTK_HSCALE
			scrollbar: GTK_HSCROLLBAR
			policy: expanded GTK_UPDATE_VALUE
			button: GTK_CHECK_BUTTON
			label: GTK_LABEL
		do
			make_top_level
			set_title ("range controls")
			!! destroy_command.make (current, the_app)

			!! box1.make_vertical (False, 0)
			add_widget (box1)

-- these intermediate shows are in the C version of this example, but are
-- taken care of by show_all, and are not necessary here
--			box1.show

			!! box2.make_horizontal (False, 0)
			box2.set_border_width (10)
			box1.pack (box2, True, True, 0)
--			box2.show

			!! adj1.make (0.0, 0.0, 101.0, 0.1, 1.0, 1.0)
			!! vscale.make (adj1)
			set_default_values (vscale)
			box2.pack (vscale, True, True, 0)
--			vscale.show

			!! box3.make_vertical (False, 10)
			box2.pack (box3, True, True, 0)
--			box3.show

			-- reuse the same adjustment
			-- widgets with the same adjustment will update each other when one
			-- changes
			!! hscale.make (adj1)
			hscale.set_size (200, 30)
			set_default_values (hscale)
			box3.pack (hscale, True, True, 0)
--			hscale.show

			-- and again, the same adjustment
			!! scrollbar.make (adj1)
			policy.set_value (policy.Continuous)
			scrollbar.set_update_policy (policy.value)
			box3.pack (scrollbar, True, True, 0)
--			scrollbar.show

			-- reusing box2 reference
			!! box2.make_horizontal (False, 10)
			box2.set_border_width (10)
			box1.pack (box2, True, True, 0)
--			box2.show

			-- a checkbutton to control whether the value is displayed or not
			!! button.make_with_label ("Display value on scale widgets")
---TODO not implemented in button class			button.set_active (True)
---TODO hook up "toggled" command
			box2.pack (button, True, True, 0)
--			button.show

			-- reusing box2 reference
			!! box2.make_horizontal (False, 10)
			box2.set_border_width (10)

			!! label.make ("Scale Value Position:")
			box2.pack (label, False, False, 0)
--			label.show
--TODO the rest of this class (from rangewidget.c :: create_range_controls

			show_all
		end

feature {NONE} -- implementation
	set_default_values (scale: GTK_SCALE) is
		require
			arg_valid: scale /= Void
		local
			policy: expanded GTK_UPDATE_VALUE
			position: expanded GTK_POSITION_VALUE
		do
			policy.set_value (policy.Continuous)
			scale.set_update_policy (policy.value)
			scale.set_digits (1)
			position.set_value (position.Top)
			scale.set_value_pos (position.value)
			scale.set_draw_value (True)
		end
end
