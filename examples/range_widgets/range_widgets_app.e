indexing
	description: "Adapted from GTK examples/rangewidgets, demonstrates %
		%the range related widgets"
	author: "Dave E Martin XXIII"
	genesis: "199905122228 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class RANGE_WIDGETS_APP

inherit
	GTK_APPLICATION

creation {ANY}
	make

feature {NONE} -- initialization
	make is
		local
			main_window: MAIN_WINDOW
		do
			initialize_tool_kit
			set_locale
			!! main_window.make (Current)
			main_loop
		end
end
