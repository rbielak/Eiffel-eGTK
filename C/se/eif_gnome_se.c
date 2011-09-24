#include <gnome.h>
#include "eif_gtk.h"

/* argv and argc set by SmallEiffel runtime */
extern int se_argc;
extern char**se_argv;
extern void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type);


void c_gnome_init_tool_kit (char *app_id, char *app_version) {
	gnome_init(app_id, app_version, se_argc, se_argv);
	gtk_signal_set_funcs(callback_entry_func, NULL); 
}
