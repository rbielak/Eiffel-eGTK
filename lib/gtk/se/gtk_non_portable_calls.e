-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "Calls to gtk toolkit that are not portable between %
   %compilers. This is the SE version "
   cvs: "$Id: gtk_non_portable_calls.e,v 1.34 2003/01/11 19:32:52 elphick Exp $"


class GTK_NON_PORTABLE_CALLS

inherit

	GLIB

   GTK_WINDOW_EXTERNALS

   GTK_ACCEL_GROUP_EXTERNALS

   GTK_MENU_ITEM_EXTERNALS

   GTK_CHECK_MENU_ITEM_EXTERNALS

   GTK_RADIO_MENU_ITEM_EXTERNALS

   GTK_EDITABLE_EXTERNALS

   GTK_TEXT_EXTERNALS

   GTK_TOOLBAR_EXTERNALS

   GTK_LIST_ITEM_EXTERNALS

   GTK_BUTTON_EXTERNALS

   GTK_RADIO_BUTTON_EXTERNALS

   GTK_CHECK_BUTTON_EXTERNALS

   GTK_TOGGLE_BUTTON_EXTERNALS

   GTK_FILESEL_EXTERNALS

   GTK_ENTRY_EXTERNALS
	
   GTK_FRAME_EXTERNALS

   GTK_RC_EXTERNALS

   GTK_LABEL_EXTERNALS

   GTK_TOOLTIPS_EXTERNALS

   GTK_PIXMAP_EXTERNALS
	
   GTK_TREE_ITEM_EXTERNALS

   GTK_COMBO_EXTERNALS

   GTK_CLIST_EXTERNALS

   GTK_CTREE_EXTERNALS

   GTK_STATUS_BAR_EXTERNALS

   GTK_ACCEL_LABEL_EXTERNALS

   GTK_PROGRESS_EXTERNALS

   GTK_COLORSEL_EXTERNALS

   GTK_COLOR_SELECTION_DIALOG_EXTERNALS

   GTK_FONTSEL_EXTERNALS

   GTK_ASPECT_FRAME_EXTERNALS

   GTK_CURVE_EXTERNALS

   GTK_PREVIEW_EXTERNALS

   GTK_CELL_EXTERNALS

feature 

   np_gtk_window_set_title (w: POINTER; title: STRING) is
      do
	 gtk_window_set_title (w, title.to_external)
      end

   np_gtk_rc_parse (fname: STRING) is
      do
	 gtk_rc_parse (fname.to_external)
      end

   np_gtk_accel_group_add (gtk_object: POINTER;
			   accel_key, accel_mods, accel_flags: INTEGER;
                           object: POINTER;
			   accel_signal: STRING) is
      do
	 gtk_accel_group_add (gtk_object, accel_key, accel_mods,
			      accel_flags,
			      object,
			      accel_signal.to_external)
      end

   np_gtk_button_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_button_new_with_label (label.to_external)
      end

   np_gtk_tooltips_set_tip (tooltips, w: POINTER; tip: STRING) is
      do
	 gtk_tooltips_set_tip (tooltips, w, tip.to_external, default_pointer)
      end

   np_gtk_label_new (l: STRING): POINTER is
      do
	 Result := gtk_label_new (l.to_external)
      end

   np_gtk_label_set_text (widget: POINTER; l: STRING) is
      do
	 gtk_label_set_text (widget, l.to_external)
      end

   np_gtk_pixmap_create_from_xpm (widget: POINTER; file_name: STRING): POINTER is
      do
	 Result := c_gtk_pixmap_create_from_xpm (widget, file_name.to_external)
      end

   np_gtk_entry_set_text (entry: POINTER; new_text: STRING) is
      do
	 gtk_entry_set_text (entry, new_text.to_external)
      end

   np_gtk_entry_append_text (entry: POINTER; new_text: STRING) is
      do
	 gtk_entry_append_text (entry, new_text.to_external)
      end

   np_gtk_entry_prepend_text (entry: POINTER; new_text: STRING) is
      do
	 gtk_entry_prepend_text (entry, new_text.to_external)			
      end

   np_gtk_toggle_button_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_toggle_button_new_with_label (label.to_external)
      end

   np_gtk_frame_new (label: STRING): POINTER is
      do
	 Result := gtk_frame_new (label.to_external)
      end

   np_gtk_aspect_frame_new (label: STRING; xalign, yalign, ratio: REAL;
			    obey_child: BOOLEAN): POINTER is
      do
	 Result := gtk_aspect_frame_new (label.to_external, xalign, yalign,
					 ratio, obey_child)
      end

   np_gtk_frame_set_label (w: POINTER; label: STRING) is
      do
	 gtk_frame_set_label (w, label.to_external)
      end

   np_gtk_radio_button_new_with_label (group: POINTER; label: STRING): POINTER is
      do
	 Result := gtk_radio_button_new_with_label (group, label.to_external)
      end

   np_gtk_check_button_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_check_button_new_with_label (label.to_external)
      end

   np_string_from_pointer (p: POINTER): STRING is
      do
	 create Result.make (0)
	 Result.from_external_copy (p)
      end

   np_gtk_file_selection_set_filename (fselector: POINTER; fname: STRING) is
      do
	 gtk_file_selection_set_filename (fselector, fname.to_external)
      end

   np_gtk_file_selection_complete (fselector: POINTER; pattern: STRING) is
      do
	 gtk_file_selection_complete (fselector, pattern.to_external)
      end

   np_gtk_file_selection_new (title: STRING): POINTER is
      do
	 Result :=  gtk_file_selection_new (title.to_external)
      end
	
   np_gtk_check_menu_item_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_check_menu_item_new_with_label (label.to_external)
      end

   np_gtk_radio_menu_item_new_with_label (group: POINTER;
					  label: STRING): POINTER is
      do
	 Result := gtk_radio_menu_item_new_with_label (group, label.to_external)
      end

   np_gtk_menu_item_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_menu_item_new_with_label (label.to_external)
      end

   np_gtk_toolbar_append_item (widget: POINTER;
			       label, tip, private_tip: STRING;
			       icon: POINTER; func: POINTER; data: POINTER): POINTER is
		
      do
	 Result := gtk_toolbar_append_item (widget, 
					    label.to_external,
					    tip.to_external,
					    private_tip.to_external,
					    icon, func, data)
      end
	np_gtk_toolbar_append_element (widget:POINTER;
					const:INTEGER;radiogroup:POINTER;
					label,tip,private_tip:STRING;
					icon,callback,data:POINTER):POINTER is
			do
			Result:= gtk_toolbar_append_element(
			widget, 
			const,--GTK_TOOLBAR_CHILD_TOGGLEBUTTON,--type: INTEGER; 
			radiogroup,--default_pointer,--			widget,--: POINTER;
		
			      label.to_external,      --pointer, -- element label
			        tip.to_external,        --pointer ,--label
			private_tip.to_external,--pointer,--tptext,--: POINTER; --tooltip private label
			icon,        --: POINTER;	--
			callback,
			data)--callback, data: POINTER): POINTER is
	end
   np_gtk_toolbar_prepend_item (widget: POINTER;
				label, tip, private_tip: STRING;
				icon: POINTER; func: POINTER; data: POINTER): POINTER is
		
      do
	 Result := gtk_toolbar_prepend_item (widget, 
					     label.to_external,
					     tip.to_external,
					     private_tip.to_external,
					     icon, func, data)
      end

   np_gtk_toolbar_append_widget (widget: POINTER; a_widget: POINTER;
				 tooltip, tooltip_private: STRING) is
      do
	 gtk_toolbar_append_widget (widget, a_widget, 
				    tooltip.to_external, 
				    tooltip_private.to_external)

      end

   np_gtk_toolbar_prepend_widget (widget: POINTER; a_widget: POINTER;
				  tooltip, tooltip_private: STRING) is
      do
	 gtk_toolbar_prepend_widget (widget, a_widget, 
				     tooltip.to_external,
				     tooltip_private.to_external)

      end

   np_gtk_list_item_new_with_label (label: STRING): POINTER is
      do
	 Result := gtk_list_item_new_with_label (label.to_external)
      end

   np_gtk_editable_insert_text(w: POINTER; txt: STRING; c, p: INTEGER) is
      do
	 pointed_int := p
	 gtk_editable_insert_text(w, txt.to_external, c, $pointed_int)
      end

   np_gtk_text_insert (w, fnt, fore, back: POINTER; txt: STRING) is
      do
	 gtk_text_insert (w, fnt, fore, back, txt.to_external, txt.count)
      end
							
   np_gtk_tree_item_new_with_label (text: STRING): POINTER is
      do
	 Result := gtk_tree_item_new_with_label (text.to_external)
      end

   np_make_array_pointer(strings: ARRAY[STRING]): POINTER is
         -- Convert an ARRAY of STRINGs to char **
      local
         res: NATIVE_ARRAY[NATIVE_ARRAY[CHARACTER]]; -- Yes it is char **
         i, j: INTEGER;
         string: STRING;
         na: NATIVE_ARRAY[CHARACTER];
      do
         i := strings.count;
         if i > 0 then
            from
               res := res.calloc(i);
               i := i - 1;
               j := strings.upper;
            until
               i < 0
            loop
               string := strings.item(j);
               if string /= Void then
                  na := na.from_pointer(string.to_external);
                  res.put(na,i)
               end
               i := i - 1;
               j := j - 1;
            end
            Result := res.to_pointer;
         else
            -- GTK gives an assertion failed if passed a NULL pointer
            -- so maybe we should require not strings.empty???
         end;
      end;

   --	np_make_array_pointer(strings: ARRAY[STRING]): POINTER is
   --			-- Convert an ARRAY of STRINGs to char **
   --		local
   --			temp: ARRAY[POINTER]
   --			i: INTEGER
   --			str: STRING
   --		do
   --			create temp.make(strings.lower, strings.upper)
   --			from
   --				i := strings.lower
   --			until
   --				i > strings.upper
   --			loop
   --				str := strings @ i
   --				if str /= Void then
   --					temp.put(str.to_external, i)
   --				end
   --				i := i + 1
   --			end
   --			-- to_external requires not empty, so this prevents exception
   --			-- However GTK gives an assertion failed if passed a NULL pointer
   --			-- so maybe we should require not strings.empty???
   --			if not temp.empty then
   --				Result := temp.to_external
   --			end
   --		end
	
   np_gtk_combo_set_popdown_strings(widget: POINTER; strings: ARRAY[STRING]) is
      do
	 c_gtk_combo_set_popdown_strings(widget, np_make_array_pointer(strings), strings.count);
      end

   np_gtk_clist_new_with_titles(sa: ARRAY[STRING]): POINTER is
      do
	 Result := gtk_clist_new_with_titles(sa.count, np_make_array_pointer(sa))
      end

   np_gtk_clist_prepend(w: POINTER; sa: ARRAY[STRING]): INTEGER is
      do
	 Result := gtk_clist_prepend(w, np_make_array_pointer(sa))
      end

   np_gtk_clist_append(w: POINTER; sa: ARRAY[STRING]): INTEGER is
      do
	 Result := gtk_clist_append(w, np_make_array_pointer(sa))
      end

   np_gtk_clist_insert(w: POINTER; r: INTEGER; sa: ARRAY[STRING]): INTEGER is
      do
	 Result := gtk_clist_insert(w, r, np_make_array_pointer(sa))
      end
	
   np_gtk_clist_set_column_title (w: POINTER; c: INTEGER; s: STRING) is
      do
	 gtk_clist_set_column_title (w, c, s.to_external)
      end

   np_gtk_clist_set_text (w: POINTER; r, c: INTEGER; s: STRING) is
      do
	 gtk_clist_set_text (w, r, c, s.to_external)
      end

   temp_pointer: POINTER
	 -- because SmallEiffel doesn't allow $ to be applied to a 
	 -- local variable

   np_gtk_clist_get_text (w: POINTER; r,c: INTEGER): STRING is
      do
	 if gtk_clist_get_text (w, r, c, $temp_pointer) = 1 then
	    create Result.from_external_copy (temp_pointer)
	 end
      end

   np_gtk_clist_set_pixtext (w: POINTER; r, c: INTEGER; text: STRING; spacing: INTEGER;
			     pixmap: POINTER; mask: POINTER) is
      do
	 gtk_clist_set_pixtext (w, r, c, text.to_external,
				spacing, pixmap, mask)
      end

   np_gtk_ctree_new_with_titles (c, cl: INTEGER; titles: ARRAY [STRING]): POINTER is
      do
	 Result := gtk_ctree_new_with_titles	(c, cl, np_make_array_pointer(titles))
      end

   np_gtk_ctree_insert_node (ctree, parent, sibling: POINTER;
			     text: ARRAY [STRING]; spacing: INTEGER;
			     pp1, mask1, pp2, mask2: POINTER;
			     is_leaf, is_expanded: BOOLEAN): POINTER is
      do
	 Result := gtk_ctree_insert_node (ctree, parent, sibling,
					  np_make_array_pointer (text),
					  spacing,
					  pp1, mask1, pp2, mask2,
					  is_leaf, is_expanded)
      end

   np_gtk_ctree_last_text: STRING is
      do
	 create Result.from_external_copy (c_gtk_ctree_last_text)
      end

   np_gtk_ctree_node_set_text (widget, node: POINTER; column: INTEGER;
			       text: STRING) is
      do
	 gtk_ctree_node_set_text (widget, node, column, text.to_external)
      end

   np_gtk_ctree_node_set_pixtext (widget, node: POINTER; column: INTEGER;
				  text: STRING; spacing: INTEGER;
				  pixmap: GDK_PIXMAP) is
      do
	 gtk_ctree_node_set_pixtext (widget, node, column, text.to_external,
				     spacing, pixmap.pixmap, pixmap.mask.bitmap)
      end

   np_gtk_combo_set_item_string(widget: POINTER; item: GTK_ITEM;
				item_value: STRING) is
      do
	 gtk_combo_set_item_string(widget, item.widget, item_value.to_external)
      end

   np_gtk_statusbar_get_context_id(statusbar: POINTER; description: STRING): INTEGER is
      do
	 Result := 
	    gtk_statusbar_get_context_id(statusbar, description.to_external)
      end

   np_gtk_statusbar_push(statusbar: POINTER; id: INTEGER; text: STRING): INTEGER is
      do
	 Result := gtk_statusbar_push(statusbar, id, text.to_external)
      end
	
   np_gtk_accel_label_new (l: STRING): POINTER is
      do
	 Result := gtk_accel_label_new (l.to_external)
      end

   np_gtk_progress_set_format_string(widget: POINTER; format: STRING) is
      do
	 gtk_progress_set_format_string(widget, format.to_external)
      end

   np_gtk_progress_get_current_text(widget: POINTER): STRING is
      do
	 create Result.from_external_copy (gtk_progress_get_current_text(widget))
      end

   np_gtk_progress_get_text_from_value(widget: POINTER; 
				       value: REAL): STRING is
      do
	 create Result.from_external_copy (gtk_progress_get_text_from_value(widget, value))
      end

   np_gtk_color_selection_dialog_new (title: STRING): POINTER is
      do
	 Result := gtk_color_selection_dialog_new (title.to_external)
      end

   np_gtk_color_selection_get_color (widget: POINTER; colors: ARRAY [DOUBLE]) is
      do
	 gtk_color_selection_get_color ( widget, colors.to_external ) 
      end

   np_gtk_font_selection_get_font_name(widget: POINTER): STRING is
      do
	 create Result.from_external_copy (gtk_font_selection_get_font_name(widget))
      end

   np_gtk_font_selection_set_font_name(widget: POINTER; fontname: STRING): BOOLEAN is
      do
	 Result := gtk_font_selection_set_font_name(widget, fontname.to_external)
      end

   np_gtk_font_selection_set_filter(widget: POINTER;
				    filter_type, font_type: INTEGER; foundries, 
				    weights, slants, setwidths, spacings, charsets: ARRAY[STRING]) is
      do
	 gtk_font_selection_set_filter(widget, filter_type, font_type,
				       np_make_array_pointer(foundries), np_make_array_pointer(weights),
				       np_make_array_pointer(slants), np_make_array_pointer(setwidths),
				       np_make_array_pointer(spacings), np_make_array_pointer(charsets))
      end

   np_gtk_font_selection_get_preview_text(widget: POINTER): STRING is
      do
	 create Result.from_external_copy (gtk_font_selection_get_preview_text(widget))
      end

   np_gtk_font_selection_set_preview_text(widget: POINTER; text: STRING) is
      do
	 gtk_font_selection_set_preview_text(widget, text.to_external)
      end
	
   np_gtk_font_selection_dialog_new (title: STRING): POINTER is
      do
	 Result := gtk_font_selection_dialog_new (title.to_external)
      end

   np_gtk_font_selection_dialog_get_font_name(widget: POINTER): STRING is
      do
	 create Result.from_external_copy (gtk_font_selection_dialog_get_font_name(widget))
      end

   np_gtk_font_selection_dialog_set_font_name(widget: POINTER; fontname: STRING): BOOLEAN is
      do
	 Result := gtk_font_selection_dialog_set_font_name(widget, fontname.to_external)
      end

   np_gtk_font_selection_dialog_set_filter(widget: POINTER;
					   filter_type, font_type: INTEGER; foundries, 
					   weights, slants, setwidths, spacings, charsets: ARRAY[STRING]) is
      do
	 gtk_font_selection_dialog_set_filter(widget, filter_type, font_type,
					      np_make_array_pointer(foundries), np_make_array_pointer(weights),
					      np_make_array_pointer(slants), np_make_array_pointer(setwidths),
					      np_make_array_pointer(spacings), np_make_array_pointer(charsets))
      end

   np_gtk_font_selection_dialog_get_preview_text(widget: POINTER): STRING is
      do
	 create Result.from_external_copy (gtk_font_selection_dialog_get_preview_text(widget))
      end

   np_gtk_font_selection_dialog_set_preview_text(widget: POINTER; text: STRING) is
      do
	 gtk_font_selection_dialog_set_preview_text(widget, text.to_external)
      end

   np_gtk_curve_set_vector(curve: POINTER; veclen: INTEGER; vector: ARRAY[REAL]) is
      do
	 gtk_curve_set_vector(curve, veclen, vector.to_external)
      end
			
   np_gtk_curve_get_vector(curve: POINTER; veclen: INTEGER; vector: ARRAY[REAL]) is
      do
	 gtk_curve_get_vector(curve, veclen, vector.to_external)
      end
			
   np_gtk_preview_draw_row(widget: POINTER; data: ARRAY[CHARACTER];
			   x, y, w: INTEGER) is
	 -- don't know if this will work
      do
	 gtk_preview_draw_row(widget, data.to_external, x, y, w)
      end

   np_gtk_cell_text_get_text (cell: POINTER): STRING is
      do
	 create Result.from_external_copy (c_gtk_cell_text_text (cell))
      end

   np_gtk_cell_text_set_text (cell: POINTER; str: STRING) is
      do
	 c_gtk_cell_text_set_text (cell, str.to_external)
      end

   -- rc

   np_gtk_rc_add_default_file (filename: STRING) is
      do
	 gtk_rc_add_default_file (filename.to_external)
      end

   np_gtk_rc_set_default_files (filenames: ARRAY[STRING]) is
      do
	 gtk_rc_set_default_files (filenames.to_external)
      end

   np_gtk_rc_get_default_files: ARRAY[STRING] is
      do
	 --TODO: implement.  Problems in fetching an array from C
	 --Result := clone(gtk_rc_get_default_files.from_external)
      end

   np_gtk_rc_parse_string (s: STRING) is
      do
	 gtk_rc_parse_string (s.to_external)
      end

   np_gtk_rc_add_widget_name_style(style: POINTER; pattern: STRING) is
      do
	 gtk_rc_add_widget_name_style(style, pattern.to_external)
      end

   np_gtk_rc_add_widget_class_style(style: POINTER; pattern: STRING) is
      do
	 gtk_rc_add_widget_class_style(style, pattern.to_external)
      end

   np_gtk_rc_add_class_style (style: POINTER; pattern: STRING) is
      do
	 gtk_rc_add_class_style(style, pattern.to_external)
      end

   np_gtk_rc_find_module_in_path (module_file: STRING): STRING is
      do
	 create Result.from_external_copy(gtk_rc_find_module_in_path (module_file.to_external))
      end

   np_gtk_rc_find_pixmap_in_path (pixmap_file: STRING): STRING is
		local
			p: POINTER
			scanner: POINTER
      do
			scanner := gscanner_new
			p := gtk_rc_find_pixmap_in_path (scanner, pixmap_file.to_external)
			if p /= default_pointer then
				create Result.from_external_copy(p)
				g_free(p)
			end
      end

   np_gtk_rc_get_theme_dir: STRING is
      do
	 create Result.from_external_copy(gtk_rc_get_theme_dir)
      end

   np_gtk_rc_get_module_dir: STRING is
      do
	 create Result.from_external_copy(gtk_rc_get_module_dir)
      end

   np_gtk_rc_style_name(handle: POINTER): STRING is
      do
	 create Result.from_external_copy(c_gtk_rc_style_name(handle))
      end

   np_gtk_rc_style_font_name(handle: POINTER): STRING is
      do
	 create Result.from_external_copy(c_gtk_rc_style_font_name(handle))
      end

   np_gtk_rc_style_fontset_name(handle: POINTER): STRING is
      do
	 create Result.from_external_copy(c_gtk_rc_style_fontset_name(handle))
      end

   np_gtk_rc_style_pixmap_name(handle: POINTER; i: INTEGER): STRING is
      do
	 create Result.from_external_copy(c_gtk_rc_style_pixmap_name(handle, i))
      end

feature -- non portable externals

   c_gtk_signal_connect (widget: POINTER; event: POINTER; 
			 object: GTK_COMMAND_TYPE): INTEGER is
      external "C"
      end

   c_gtk_timeout_add (interval: INTEGER; object: GTK_FUNCTION): INTEGER is
      external "C"
      end

   c_gtk_quit_add (level: INTEGER; object: GTK_FUNCTION): INTEGER is
      external "C"
      end

   c_gtk_idle_add (object: GTK_FUNCTION): INTEGER is
      external "C"
      end

feature -- fudge for pernickety SmallEiffel compiler which won't allow
   -- a pointer reference to a parameter

   pointed_int: INTEGER			

end -- GTK_NON_PORTABLE_CALLS
