#!/bin/sh

base_dir=$(cd $(dirname $0) && pwd)
rcairo_dir=$(dirname $base_dir)/$(basename $base_dir | sed -e 's/ruby-gnome2/rcairo/')

RUBYLIB="${rcairo_dir}/ext/cairo:${RUBYLIB}"
RUBYLIB="${rcairo_dir}/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/glib2/ext/glib2:${RUBYLIB}"
RUBYLIB="${base_dir}/glib2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gobject-introspection/ext/gobject-introspection:${RUBYLIB}"
RUBYLIB="${base_dir}/gobject-introspection/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gio2/ext/gio2:${RUBYLIB}"
RUBYLIB="${base_dir}/gio2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/cairo-gobject/ext/cairo-gobject:${RUBYLIB}"
RUBYLIB="${base_dir}/cairo-gobject/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/atk/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/pango/ext/pango:${RUBYLIB}"
RUBYLIB="${base_dir}/pango/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gdk_pixbuf2/ext/gdk_pixbuf2:${RUBYLIB}"
RUBYLIB="${base_dir}/gdk_pixbuf2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gtk2/ext/gtk2:${RUBYLIB}"
RUBYLIB="${base_dir}/gtk2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gdk3/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gtk3/ext/gtk3:${RUBYLIB}"
RUBYLIB="${base_dir}/gtk3/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/rsvg2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/poppler/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gstreamer/ext/gstreamer:${RUBYLIB}"
RUBYLIB="${base_dir}/gstreamer/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/vte3/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/clutter/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/clutter-gdk/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/clutter-gtk/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/clutter-gstreamer/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/webkit-gtk/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/webkit-gtk2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/webkit2-gtk/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gtksourceview2/ext/gtksourceview2:${RUBYLIB}"
RUBYLIB="${base_dir}/gtksourceview2/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gtksourceview3/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gsf/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/goffice/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gnumeric/lib:${RUBYLIB}"
RUBYLIB="${base_dir}/gegl/lib:${RUBYLIB}"

RUBYLIB="${RUBYLIB}" "$@"
