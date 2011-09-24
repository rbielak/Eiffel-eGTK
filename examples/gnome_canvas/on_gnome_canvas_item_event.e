class ON_GNOME_CANVAS_ITEM_EVENT

inherit 
   GDK_EVENT_COMMAND;
   GDK_CONSTANTS;
   GNOME_CANVAS_EXTERNAL;
   APPLICATION_LIFECYCLE;
   
feature {ANY} 
   
   bx, by: INTEGER;
   
   dragging: BOOLEAN;
   
   execute is 
      local 
         drawable: GDK_WINDOW;
         h, w, item_x, item_y, x, y, new_x, new_y: INTEGER;
         old_x, old_y: DOUBLE;
         emove: GDK_EVENT_MOTION;
         item: GNOME_CANVAS_ITEM;
      do  
         --	print ("item command !! BINGO! %N")
         PRINT("->");
         print(event_name);
         print("<-%N");
            --	   item_x := event.x;
            --item_y := event.y;
         if event.event_type = gdk_button_press then 
            print("press%N");
            dragging := true;
            x := item_x;
            y := item_y;
            item ?= parent;
            check 
               item /= Void; 
            end;
            item.grab_mouse;
            visual_state.set_moving;
         elseif event.event_type = gdk_button_release then 
            print("release%N");
            item ?= parent;
            check 
               item /= Void; 
            end;
            item.ungrab_mouse;
            visual_state.set_not_moving;
         elseif event.event_type = gdk_motion_notify then 
            if visual_state.is_moving then 
               print("move item%N");
               emove ?= event;
               check 
                  emove /= Void; 
               end;
               x := emove.x.rounded;
               y := emove.y.rounded;
               new_x := x;
               new_y := y;
               item ?= parent;
               check 
                  item /= Void; 
               end;
               old_x := item.x;
               old_y := item.y;
            end; 
            gnome_canvas_item_move(parent.gtk_object,new_x - old_x,new_y - old_y);
         end; 
      end -- execute

end -- class ON_GNOME_CANVAS_ITEM_EVENT
