class ON_GNOME_CANVAS_EVENT

inherit

	GDK_EVENT_COMMAND
	GDK_CONSTANTS



feature

   bx, by: INTEGER
   dragging : BOOLEAN
   
   execute is
      local
		  drawable: GDK_WINDOW
		  h, w,item_x, item_y, x, y: INTEGER
		  emove : GDK_EVENT_MOTION
      do
	 --	print ("item command !! BINGO! %N")
	 PRINT("c->")	
	 print(event_name)
	 print("<-%N")
	 --	   item_x := event.x;
	 --item_y := event.y;
	 if( event.event_type = gdk_button_press) then 
	    
	    print("press%N") 
	    dragging := True
	    x := item_x;
	    y := item_y;
	    
	    
	 elseif  (event.event_type = gdk_button_release) then 
	    
	    print("release%N")
	    dragging := False
	 elseif (event.event_type = gdk_motion_notify) then
	    print("move%N")
		emove ?= event
		 check emove /= void end
	    print("x, y :")
		x := emove.x.rounded
	    print(x) print (",")
		y := emove.y.rounded
		print(y)
	    io.put_new_line
	  --  gnome_canvas_item_move(parent.gtk_object, x ,y )
	 end
	 
      end

   gnome_canvas_item_move(w :POINTER; item_x, item_y : DOUBLE) is
      external "C"
      end
   

end
