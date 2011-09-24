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
	 set_title ("MozEmbed eGTK Test")
	 
	 !! mozilla.make
	 add_widget (mozilla)
	 
	 set_size (600,400)
	 show_all
	 
	 !! quit_cmd
	 add_action ("delete_event", quit_cmd)
	 
	 mozilla.load_url (clone ("http://www.mozillazine.org"))
      end
   
feature -- Children
   mozilla: GTK_MOZ_EMBED


feature -- Commands

   quit_cmd: EGTK_QUIT_COMMAND
end
