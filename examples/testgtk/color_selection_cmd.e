class COLOR_SELECTION_CMD

inherit

	GTK_COMMAND

feature

	color_selector: GTK_COLOR_SELECTION_DIALOG

	execute is
		local
			ok, cancel: COLOR_CMD
		do
			!!color_selector.make_with_title ("Pick Color")
			!!ok.make_as_ok (color_selector)
			!!cancel.make_as_cancel (color_selector)
			color_selector.ok.add_action ("clicked", ok)
			color_selector.cancel.add_action ("clicked", cancel)
			color_selector.show
		end

end
