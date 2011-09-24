class ON_ZOOM

inherit
	GTK_COMMAND
creation

	make

feature

	window: GTK_OBJECT
root_canvas: GNOME_CANVAS;
 zoom_factor: DOUBLE


	execute is
		do
		 root_canvas.set_pixels_per_units(zoom_factor);

		end

	make(canvas: GNOME_CANVAS; zoom: DOUBLE) is
		do
			root_canvas := canvas
			zoom_factor := zoom
		end

end
