#include <gnome.h>
#include "eif_eiffel.h"
#include "eif_cecil.h"
#include "eif_argv.h"

/* argv and argc set by SmallEiffel runtime */

extern void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type);


void c_gnome_init_tool_kit (char *app_id, const char *app_version) {
	gnome_init(app_id, app_version, eif_argc, &eif_argv);
	gtk_signal_set_funcs(callback_entry_func, NULL); 
}
