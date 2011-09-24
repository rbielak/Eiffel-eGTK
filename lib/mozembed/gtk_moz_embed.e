indexing

   description: "GTK_MOZ_EMBED - full fledged webbrowser in a box"
	version: "v 0.3.5 GTK+ 1.2.x"
   author: "Andreas Leitner"
   changed: "6 June 1999"

class GTK_MOZ_EMBED
   
   -- Signals (from gtkmozembd.c):
   --    "link_message"
   --    "js_status"
   --    "location"
   --    "title"
   --    "progress"
   --    "net_status"
   --    "net_start"
   --    "net_stop"
   --    "new_window"
   --    "visibility"
   --    "destroy_browser"
   --    "open_uri"

inherit

   GTK_BIN
   
   GTK_MOZ_EMBED_NP
      undefine
	 copy,
	 is_equal
      end
creation

   make

feature {NONE} -- creation

   make is
	 -- create a new mozilla widget
      do
	 widget := gtk_moz_embed_new
--	 create  children.make (1, 0)
	 register_widget
      end

feature -- Access
   can_go_back: BOOLEAN is
	 -- Can browser go back one level.
	 -- rename to `is_first'?
      do
	 Result := gtk_moz_embed_can_go_back (widget) /= 0
      end
   
   can_go_forward: BOOLEAN is
	 -- Can browser go forth one level.
	 -- rename to `is_last'?
      do
	 Result := gtk_moz_embed_can_go_back (widget) /= 0
      end
   
--     history_length: INTEGER is
--  	 -- Length of history.
--        do
--  	 Result := gtk_moz_embed_get_history_length (widget)
--        end
   
feature -- Basic Operations
   load_url (url: STRING) is
	 -- load `url' into the browser.
      require
	 url_not_void: url /= Void
      do
	 np_gtk_moz_embed_load_url (widget, url)
      end
   
   stop is
	 -- stop all online tasks in this browser.
      do
	 gtk_moz_embed_stop (widget)
      end
   
   reload (reload_type: INTEGER) is 
	 -- Reload current browser content. 
	 -- See GTK_MOZEMBED_CONSTANTS for information on
	 -- `reload_type'.
      do
	 gtk_moz_embed_reload (widget, reload_type)
      end
   
--     resize (a_width, a_height: INTEGER) is
--  	 -- Resize window.
--        do
--  	 gtk_moz_embed_resize (widget, a_width, a_height)
--        end
   
   go_back is
	 -- Same as a click to "back" on a browser.
      require
	can_back: can_go_back
      do
	 gtk_moz_embed_go_back (widget)
      end
   
   go_forward is
	 -- Same as a click to "forward" on a browser.
	 -- rename to `forth'?
      require
	 can_forward: can_go_forward
      do
	 gtk_moz_embed_go_back (widget)
      end
   
   
--     goto_history (index: INTEGER) is
--  	 -- Goto `i'-th entry in the history.
--        require
--  	 valid_index: index >= 0 and index < history_length
--        do
--  	 gtk_moz_embed_goto_history (widget, index)
--        end
   
   
--     stream_stream_start (base_url, action, content_type: STRING) is
--  	 -- Start streaming data into the browser.
--        do
--  	 np_gtk_moz_embed_stream_start (widget, base_url, action, content_type)
--        end
   
--     stream_stream_start_html (base_url: STRING) is
--  	 -- Start streaming HTML-data into the browser.
--        do
--  	 np_gtk_moz_embed_stream_start_html (widget, base_url)
--        end
   
--     stream_stream_write (data: STRING; offset, len: INTEGER) is
--  	 -- Stream data in browser.
--        do
--  	 np_gtk_moz_embed_stream_write (widget, data, offset, len)
--        end
   
--     stream_end is
--  	 -- Stop streaming data.
--        do
--  	 gtk_moz_embed_stream_end (widget)
--        end


end -- GTK_MOZ_EMBED
