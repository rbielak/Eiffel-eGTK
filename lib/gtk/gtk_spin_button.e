-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_SPIN_BUTTON - number entry widget with arrows"
	author: "Daniel Elphick"
	

class GTK_SPIN_BUTTON

inherit

	GTK_ENTRY
		rename
			make as entry_make
		end

	GTK_SPIN_BUTTON_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_digits(digits: INTEGER) is
			-- Set the number of decimal places
		require
			sane_digits: digits >= 0
		do
			gtk_spin_button_set_digits(widget, digits)
		end

	set_adjustment(adj: GTK_ADJUSTMENT) is
		require
			valid_adjustment: adj /= Void
		do
			gtk_spin_button_set_adjustment(widget, adj.adjustment)
			cached_adjustment := adj
		end

	adjustment: GTK_ADJUSTMENT is
		do
			if cached_adjustment = Void then
				create Result.make_from_pointer(gtk_spin_button_get_adjustment(widget))
			else
				Result := cached_adjustment
			end
		end

	value_as_real: REAL is
		do
			Result := gtk_spin_button_get_value_as_float(widget)
		end

	value_as_integer: INTEGER is
		do
			Result := gtk_spin_button_get_value_as_int(widget)
		end
		
	set_value(value: REAL) is
		do
			gtk_spin_button_set_value(widget, value)
		end

	set_update_policy(policy: INTEGER) is
		require
			valid_policy: policy >= Gtk_update_always and
							policy <= Gtk_update_if_valid
		do
			gtk_spin_button_set_update_policy(widget, policy)
		end

	set_numeric(numeric: BOOLEAN) is
		do
			gtk_spin_button_set_numeric(widget, numeric)
		end

	spin (direction: INTEGER; increment: REAL) is
		require
			valid_direction: direction >= Gtk_spin_step_forward and
								direction <= Gtk_spin_user_defined
		do
			gtk_spin_button_spin(widget, direction, increment)
		end

	set_wrap (wrap: BOOLEAN) is
		do
			gtk_spin_button_set_wrap(widget, wrap)
		end

	set_shadow_type (type: INTEGER) is
		require
			valid_shadow: type >= Gtk_shadow_none and 
									type <= Gtk_shadow_etched_out
		do
			gtk_spin_button_set_shadow_type(widget, type)
		end

	set_snap_to_ticks (snap_to_ticks: BOOLEAN) is
		do
			gtk_spin_button_set_snap_to_ticks(widget, snap_to_ticks)
		end

	update is
		do
			gtk_spin_button_update(widget)
		end

	configure (adj: GTK_ADJUSTMENT; climb_rate: REAL; digits: INTEGER) is
			-- climb_rate is a REAL between 0 and 1 and indicates the
			-- acceleration. digits is the number of decimal places.
		require
			valid_adjustment: adj /= Void
			sane_digits: digits >= 0
		do
			gtk_spin_button_configure(widget, adj.adjustment, climb_rate, digits)
			cached_adjustment := adj
		end

feature {NONE}

	cached_adjustment: GTK_ADJUSTMENT

	make (adj: GTK_ADJUSTMENT; climb_rate: REAL; digits: INTEGER) is
			-- climb_rate is a REAL between 0 and 1 and indicates the
			-- acceleration. digits is the number of decimal places.
		require
			valid_adjustment: adj /= Void
			sane_digits: digits >= 0
		do
			widget := gtk_spin_button_new(adj.adjustment, climb_rate, digits)
			cached_adjustment := adj
			register_widget
		end

end
