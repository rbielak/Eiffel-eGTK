--
-- Sample appication for GtkMozilla
--
class
   
   ROOT_CLASS
   
inherit
   GTK_APPLICATION


creation
   make

feature {NONE} -- Implementation
   make is
	 -- Bring up main window and let the user do whatever he is 
	 -- up to.
      do
	 initialize_tool_kit
	 !!window.make
	 main_loop
      end

   
   window: MAIN_WINDOW


end -- ROOT_CLASS
