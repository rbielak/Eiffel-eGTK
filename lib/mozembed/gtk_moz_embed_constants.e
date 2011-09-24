indexing

   description: "Constants for GTK_MOZEMBED"
	version: "v 0.3.5 GTK+ 1.2.x"
   author: "Andreas Leitner"
   changed: "6 June 1999"

class GTK_MOZ_EMBED_CONSTANTS

feature -- GtkMozEmbedReloadType
   Gtk_url_relead: INTEGER is 0
   Gtk_url_reload_bypass_cache: INTEGER is 1
   Gtk_url_reload_bypass_cache_and_proxy: INTEGER is 2
   Gtk_url_reload_max: INTEGER is 3
   
--  feature -- GtkMozEmbedLoadType
   
--     Gtk_load_url: INTEGER is 0
--     Gtk_load_history: INTEGER is 1
--     Gtk_load_link: INTEGER is 2
--     Gtk_load_refresh: INTEGER is 3

end -- GTK_MOZ_EMBED_CONSTANTS
