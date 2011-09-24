
/*
   Copyright 1999 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/
/*

  eif_gtk_ise.c - v 0.3.4

  This file contains C code specific to ISE compiler.


 */

#include <gtk/gtk.h>
#include "eif_gtk.h"

/* Data needed for callbacks */
typedef  struct _callback_data {
  EIF_PROC rtn;
  EIF_OBJ obj;
  void *data;
} callback_data;


/* Callback arguments */
typedef struct _args_data {
  guint   nparams;
  GtkArg  *args;
  GtkType *arg_types;
  GtkArg  *return_valuep;
} args_data;


void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type);


/* -------- Initialization -----------------------------------*/
/* Pass command line arguments to the GTK initialization code */
/* In ISE's runtime there are references to these in "argv.h" */
void c_gtk_init_tool_kit () {
  gtk_init (&eif_argc, &eif_argv);
  gtk_signal_set_funcs(callback_entry_func, NULL); 
}

gboolean c_gtk_init_tool_kit_check () {
  gboolean result;

	if (result = gtk_init_check (&eif_argc, &eif_argv)) {
		gtk_signal_set_funcs(callback_entry_func, NULL);
	}

  return (result);
}

/* --------------- Callbacks ------------------*/
/* Connect a call back to a widget/event pair */
gint c_gtk_signal_connect (GtkObject *widget, 
						   gchar *name, 
						   EIF_PROC func,
						   EIF_OBJ object,
						   callback_data **p)
{
  callback_data *cbd;
  int name_len;

  eif_freeze (object);  
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);
  /* No callback routine here, all callbacks come through "callback_entry_func" */
  return (gtk_signal_connect (widget, name, NULL, (gpointer)cbd));
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
  callback_data *cbd;
  args_data argsd;

  /* Get the pointer to the callback block */
  cbd = (callback_data *)data;
  /* Save the arguments in a local struct */
  argsd.nparams = nparams;
  argsd.args = args;
  argsd.arg_types = arg_types;
  /* Set pointer to the return value */
  if (return_type == GTK_TYPE_NONE) 
	argsd.return_valuep = NULL;
  else
	argsd.return_valuep = &args[nparams];

  /* Call Eiffel */
  /*  printf ("callback= %d object= %d cbd= %d\n", cbd->rtn, (cbd->obj), cbd); */
  (cbd->rtn)(cbd->obj, nparams, &argsd);

}

/* Free callback data. Called from "dispose" */

void c_free_call_back_block (callback_data *p) 
{
  if (p != NULL)
	g_free (p);
}


/*------ Routines for fetching callback args ----- */

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

  callback_data *cbd;
  gint result;
  GtkFunction f;

  /* Get the pointer to the callback block */
  cbd = (callback_data *)data;

  /* Call Eiffel */
  /*  printf ("callback= %d object= %d cbd= %d\n", cbd->rtn, (cbd->obj), cbd); */
  f = (GtkFunction)cbd->rtn;
  result = (f)(cbd->obj);
  /*  result = (cbd->rtn)(cbd->obj); */

  return (result);

}

/* Register a quit function */
gint c_gtk_quit_add (guint level, EIF_PROC func, EIF_OBJ object, callback_data **p) {

  callback_data *cbd;
  
  eif_freeze (object);
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);
  return (gtk_quit_add (level, c_gtk_function, cbd));
}

/* Register a timeout function. */
gint c_gtk_timeout_add (guint interval, EIF_PROC func, EIF_OBJ object, callback_data **p) {

  callback_data *cbd;
  
  eif_freeze (object);
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);
  return (gtk_timeout_add (interval, c_gtk_function, cbd));
}

/* Register an idle function. */
gint c_gtk_idle_add (EIF_PROC func, EIF_OBJ object, callback_data **p) {

  callback_data *cbd;
  
  eif_freeze (object);
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);
  return (gtk_idle_add (c_gtk_function, cbd));
}

/* Callbacks for input functions */

void c_gdk_input_function (gpointer data, gint fd, GdkInputCondition condition) {
  callback_data *cbd;

  cbd = (callback_data *)data;
  /* Call Eiffel */
  (cbd->rtn)(cbd->obj, condition);

}

void c_gdk_destroy_notify (gpointer data) {
  callback_data *cbd;

  cbd = (callback_data *)data;
  /* The second block has the callback for destroy notify */
  cbd++;
  /* Call Eiffel */
  (cbd->rtn)(cbd->obj);

}


gint c_gdk_input_add (gint s_fd,
					  GdkInputCondition condition,
					  EIF_OBJ object, 
					  EIF_PROC func, 
					  callback_data **p) {

  callback_data *cbd;
  
  eif_freeze (object);
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);

  return (gdk_input_add (s_fd, condition, c_gdk_input_function, cbd));

}

gint c_gdk_input_add_full (gint s_fd, 
						   GdkInputCondition condition,
						   EIF_OBJ object, 
						   EIF_PROC func, 
						   EIF_PROC destruct,
						   callback_data **p)

{
  callback_data *cbd;


  eif_freeze (object);

  /* Allocate data for two callback blocks */
  cbd = (callback_data *)g_malloc (2 * sizeof (callback_data));
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);

  /* descriptor destruction callback */
  cbd++;
  cbd->rtn = destruct;
  cbd->obj = eif_access (object);

  return (gdk_input_add_full (s_fd, condition, 
							  c_gdk_input_function,
							  cbd,
							  c_gdk_destroy_notify));

}
