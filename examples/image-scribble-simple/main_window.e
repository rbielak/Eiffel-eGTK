indexing
	description: "demonstrate GTK image"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903210500"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class MAIN_WINDOW
inherit
	GTK_WINDOW
	GDK_CONSTANTS
		undefine
			copy, is_equal
		end

creation
	make

feature {NONE} -- initialization
	make (app: GTK_APPLICATION) is
		do
			make_top_level
			!! image.make (visual, 400, 200)
			!! quit_cmd.make (Current, app)
			set_events (Gdk_button_press_mask + Gdk_button_motion_mask)
			add_widget (image)
			show_all
			last_plot_x := 0
			last_plot_y := 0
			!! button_press.make (Current)
			!! motion.make (Current)
		end

feature -- commands
	put_pixel (x, y: INTEGER; pixel: INTEGER) is
		do
			image.gdk_image.put_pixel (x, y, pixel)
			-- TODO, change or document, this goes directly to image
			image.redraw
--not needed, redraw takes care of it			gdk_flush --TODO why no flushie?
			last_plot_x := x
			last_plot_y := y
		end

-- Removed, because gdk_image is not a gdk_drawble
--	draw_line (x1, y1, x2, y2: INTEGER) is
--		do
--			image.gdk_image.draw_line (style.white_gc, x1, y1, x2, y2)
--			image.redraw
--			last_plot_x := x2
--			last_plot_y := y2
--		end

--	set_draw_lines (the_draw_lines: BOOLEAN) is
--		do
--			draw_lines := the_draw_lines
--		ensure
--			draw_lines = the_draw_lines
--		end


feature -- query
	draw_lines: BOOLEAN
	last_plot_x, last_plot_y: INTEGER

feature {NONE} -- implementation
	image: GTK_IMAGE
	quit_cmd: QUIT_CMD
	button_press: MAIN_WINDOW_BUTTON_PRESS
	motion: MAIN_WINDOW_MOTION

end
