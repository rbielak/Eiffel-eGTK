(GtkMozEmbed has replaced GtkMozilla since approxomatly M16)
How to build a eGTK application that uses GtkMozEmbed:

1) Get a recent and stable build of Mozilla. It must be at least M16 but later milestones will are very likely to work too. 


2) Build Mozilla. You may want to disable unused features such as the Mail/News client to speed up compilation. Please browse to http://www.mozilla.org for detailed instructions. An easy way to specify compilation options is to create a file called ".mozconfig" in _your_ home directory. My file looks like this:
--
# sh
# Build configuration script
#
# See http://www.mozilla.org/build/unix.html for build instructions.
#

# Options for 'configure' (same as command-line options).
ac_add_options --disable-mailnews
#ac_add_options --disable-tests
ac_add_options --enable-optimize
ac_add_options --enable-strip-libs
ac_add_options --disable-debug
ac_add_options --disable-dtd-debug
ac_add_options --enable-mathml
ac_add_options --enable-svg
--

Build Mozilla by typing:
#gmake -f client.mk build

Set the following environment variables:

MOZILLA_FIVE=<dir where you untared the source tar ball>/mozilla
MOZILLA_FIVE_HOME=$MOZILLA_FIVE/dist/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MOZILLA_FIVE/dist/bin

Change to $MOZILLA_FIVE_HOME and try one of the 2 following commands
#./TestGtkEmbed
#./run_mozilla.sh ./TestGtkEmbed

If none works, you did s.th. wrong. You better make sure this test application works, before continuing. For me the first command did not work, but the second did. I don't know why. 


2) Adjust your loadpath to include the Mozilla sub-tree. (Have a look at examples/mozilla on how to do that for your compiler)

3) Link the Mozilla libraries to your application. (Have a look at examples/mozilla on how to do that for your compiler)

4) Start you eGTK/Mozilla application. Either by using run_mozilla.sh or directly, whatever works for you.

Note: As for now there are still some problems, have a look at my (Andreas Leitner) posting ("The Future of GTK_MOZILLA resp. GTK_MOZ_EMBED")  in the eGTK mailing list what's not working (to be honest barely anything works right now ):

Documentation for GtkMozEmbed can be found at: http://www.mozilla.org/unix/gtk-embedding.html