ROOT=$(EGTK)/examples/gnome_canvas
EIFFEL_ROOT_CLASS= canvas_test
EIFFEL_CREATION_ROUTINE= make


all:
	$(EGTK)/bin/egtkbuild -with_gnome $(EIFFEL_ROOT_CLASS)

clean:
	-rm -f *.o *.h *.c *~
	-rm -f $(EIFFEL_ROOT_CLASS)
	-rm -f *.make
