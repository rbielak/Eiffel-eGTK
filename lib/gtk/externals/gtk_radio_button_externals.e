-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_RADIO_BUTTON"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_radio_button_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_RADIO_BUTTON_EXTERNALS


feature {NONE}

	gtk_radio_button_new (gp: POINTER): POINTER is
		external "C"
		end

	gtk_radio_button_new_from_widget (group: POINTER): POINTER is
		-- group is a GtkRadioButton*
		external "C"
		end

	gtk_radio_button_new_with_label (gp: POINTER;
						label: POINTER): POINTER is
		external "C"
		end

	gtk_radio_button_new_with_label_from_widget (group,
						label: POINTER): POINTER is
		-- group is a GtkRadioButton*
		-- label is a const gchar*
		external "C"
		end

	gtk_radio_button_group (gp: POINTER): POINTER is
		external "C"
		end

	gtk_radio_button_set_group (radio_button, group: POINTER) is
		-- group is a GSList*
		external "C"
		end

end  -- GTK_RADIO_BUTTON_EXTERNALS
