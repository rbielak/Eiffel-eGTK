/*
   Copyright 1998 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/
/*

  Version for use with SmallEiffel and GTK+ 1.2

  Created: June 26th, 1999

  Author: Richie Bielak

  This file contains the code specific to SmallEiffel. The routines
  in this file are call Eiffel routines.

 */

#include <gtk/gtk.h>
#include "eiffel.h"

/* argv and argc set by SmallEiffel runtime */
extern int se_argc;
extern char**se_argv;

typedef struct _args_data {
  guint           nparams;
  GtkArg         *args;
  GtkType        *arg_types;
  GtkArg         *return_valuep; 
} args_data;

void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type);


/* -------- Initialization -----------------------------------*/
/* Pass command line arguments to the GTK initialization code */

/* Pass command line arguments to the GTK initialization code */
void c_gtk_init_tool_kit () {
  gtk_init (&se_argc, &se_argv);
  gtk_signal_set_funcs(callback_entry_func, NULL); 
}

gboolean c_gtk_init_tool_kit_check () {
  gboolean result;

  if (result = gtk_init_check (&se_argc, &se_argv))
	 gtk_signal_set_funcs(callback_entry_func, NULL);

  return (result);
}

/* ----------------- Callbacks ------------- */

/* Connect an callback to widget/event pair */
gint c_gtk_signal_connect (GtkObject *widget,
						   gchar *name, 
						   void *object) {

  int name_len;

  return (gtk_signal_connect (widget, name, 
							  NULL,
							  (gpointer)object));

}

/* This function dispatches all the callbacks from GTK+ to Eiffel */
/* "data" is the Eiffel callback structure.                       */
void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type)
{
  args_data argsd;

  /* Save the arguments in a local struct */
  argsd.nparams = nparams;
  argsd.args = args;
  argsd.arg_types = arg_types;
  /* Set pointer to the return value */
  if (return_type == GTK_TYPE_NONE) 
	argsd.return_valuep = NULL;
  else
	argsd.return_valuep = &args[nparams];

  eiffel_entry_from_gtk ((void *)data, nparams, &argsd);


}

/* Routines for fetching args */
gpointer c_fetch_pointer (args_data *ap, int i) {
  /* Return i-th argument as a pointer */
  gpointer result;
  result = GTK_VALUE_POINTER (ap->args[i]);
  return (result);
}

gint c_fetch_integer (args_data *ap, int i) {
  /* Return i-th argument as a integer */
  gint result;
  result = GTK_VALUE_INT (ap->args[i]);
  return (result);
}

/* Set return value for a callback */
void c_set_return_value_bool (args_data *ap, int ret_val) {
  if (ap->return_valuep != NULL)
	*GTK_RETLOC_BOOL(*(ap->return_valuep)) = ret_val;
}

/* Set return value for a callback */
void c_set_return_value_int (args_data *ap, gint ret_val) {
  if (ap->return_valuep != NULL)
	*GTK_RETLOC_INT(*(ap->return_valuep)) = ret_val;
}

/* --------------- Other kinds of callback functions --------- */

/* Callback function, calls Eiffel */
gint c_gtk_function (gpointer data) {
  gint result;
  result = eiffel_gtk_function_entry ((void *)data);
  return (result);
}

/* Add quit function */
gint c_gtk_quit_add (gint level, void *object) {
  return (gtk_quit_add (level, c_gtk_function, (gpointer)object));
}

/* Add timeout function */
gint c_gtk_timeout_add (gint interval, void *object) {
  return (gtk_timeout_add (interval, c_gtk_function, (gpointer)object));
}

/* Add idle function */
gint c_gtk_idle_add (void *object) {
  return (gtk_idle_add (c_gtk_function, (gpointer)object));
}

/* Callback for GDK input function */
void c_gdk_input_function (gpointer data, gint fd, GdkInputCondition condition) {
  /* call Eiffel */
  eiffel_gdk_input_execute ((void *)data, condition);
}

void c_gdk_input_destroy_function (gpointer data) {
  /* call Eiffel */
  eiffel_gdk_input_notify ((void *)data);
}

gint c_gdk_input_add (gint fd, GdkInputCondition condition, void *object) {
  return (gdk_input_add (fd, condition , c_gdk_input_function, (gpointer )object));
}


gint c_gdk_input_add_full (gint fd, GdkInputCondition condition, void *object) {
  return (gdk_input_add_full (fd, condition , 
							  c_gdk_input_function, 
							  (gpointer )object,
							  c_gdk_input_destroy_function));
}
