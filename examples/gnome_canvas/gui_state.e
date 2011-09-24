class GUI_STATE 

feature

	moving :BOOLEAN

	set_moving is
		do
			moving :=true 
		end

	set_not_moving is
		do 
			moving :=false
		end

	is_moving:BOOLEAN is
		do  
			Result:=moving 
		end

end
