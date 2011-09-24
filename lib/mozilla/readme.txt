How to build a eGTK application that uses GtkMozilla:

1) Get a recent and stable build of Mozilla. I used M12 but later milestones will are very likely to work too. To compile your eGTk/Mozilla application you need to have the headers, library-stubs and shared libraries installed. Downloading the source distribution and compiling it yourself takes a little time but works. You only need to issue a simple "#gmake". GtkMozilla is build by default. You may want to disable unused features such as the Mail/News client to speed up compilation. Please browse to http://www.mozilla.org for detailed instructions.

2) Adjust your loadpath to include the Mozilla sub-tree. (Have a look at examples/mozilla on how to do that for your compiler)

3) Link the Mozilla libraries to your application. (Have a look at examples/mozilla on how to do that for your compiler)
