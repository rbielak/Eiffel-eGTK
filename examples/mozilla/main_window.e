indexing
   description: ""
   author: "Andreas Leitner"
   license: "GPL"

class
   MAIN_WINDOW
inherit
   GTK_WINDOW
creation
   make

feature {NONE} -- initialization
   make is
      do
	 make_top_level
	 set_title ("Mozilla Test")
	 
	 !! mozilla.make
	 mozilla.show_all
	 add_widget (mozilla)
	 
	 set_size (300,300)
	 show
	 
	 !! quit_cmd
	 !! will_load_url_cmd.make
	 !! begin_load_url_cmd.make
	 !! end_load_url_cmd.make
	 add_action ("delete_event", quit_cmd)
	 mozilla.add_action ("will_load_url", will_load_url_cmd)
	 mozilla.add_action ("begin_load_url", begin_load_url_cmd)
	 mozilla.add_action ("end_load_url", end_load_url_cmd)
	 
	 mozilla.load_url (clone ("http://www.mozillazine.org"))
      end
   
feature -- Children
   mozilla: GTK_MOZILLA


feature -- Commands

   will_load_url_cmd: WILL_LOAD_URL_CMD
   begin_load_url_cmd: BEGIN_LOAD_URL_CMD
   end_load_url_cmd: END_LOAD_URL_CMD
   quit_cmd: EGTK_QUIT_COMMAND
end
