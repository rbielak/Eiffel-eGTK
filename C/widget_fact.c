/*
   Copyright 1999 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/

/*

  widget_fact - C routine that support the EGTK_WIDGET_FACTORY class

 */

#include <gtk/gtk.h>
#include "eif_gtk.h"



static gchar *oid_tag = "eif_oid";

gint c_object_id_from_pointer (GtkObject *op) {
  gint result;
  result = (gint)gtk_object_get_data (op, (const gchar *)oid_tag);
  /* For debugging purposes */
  /*  if (result == 0)
	printf ("object_id from pointer: %x result: %d \n", op, result);
  */
  return (result);
}

void c_add_object_id (GtkObject *op, gint oid) {
  gtk_object_set_data (op, (const gchar *)oid_tag, (gpointer)oid);
}

void c_remove_pointer (GtkObject *op) {
  gtk_object_set_data (op, (const gchar *)oid_tag, NULL);  
}

/* String the names the type of the widget */
gchar *c_gtk_type_name (GtkWidget *op) {
  return (gtk_type_name (GTK_OBJECT_TYPE (op)));
}





