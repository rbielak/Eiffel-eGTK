class BUTTON_PRESS_COMMAND

inherit

	GDK_EVENT_COMMAND

	GDK_CONSTANTS

creation

	make

feature

	make (button: GTK_BUTTON; menu: GTK_MENU) is
		require
			button_exists: button /= Void
			menu_exists: menu /= Void
		do
			-- connect ("clicked", button)
			button.add_action ("event", Current)
			menu_to_popup := menu
		end

	menu_to_popup: GTK_MENU

	execute is
		local
			bevent: GDK_EVENT_BUTTON
		do
			bevent ?= event
			if bevent /= Void then
				menu_to_popup.popup (Void, Void, bevent.button, bevent.time)
				last_event_handled := True
			end
		end

end
	
