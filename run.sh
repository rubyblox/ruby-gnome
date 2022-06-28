#!/bin/sh

source_dir="$(cd $(dirname $0) && pwd)"
build_dir=${RUBY_GNOME_BUILD_DIR:-${source_dir}}
rcairo_source_dir="$(dirname "$source_dir")"/"$(basename "$source_dir" | sed -e 's/ruby-gnome/rcairo/')"
rcairo_build_dir="$(dirname "$build_dir")"/"$(basename "$build_dir" | sed -e 's/ruby-gnome/rcairo/')"

RUBYLIB="${rcairo_build_dir}/ext/cairo:${RUBYLIB}"
RUBYLIB="${rcairo_source_dir}/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/glib2/ext/glib2:${RUBYLIB}"
RUBYLIB="${source_dir}/glib2/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gobject-introspection/ext/gobject-introspection:${RUBYLIB}"
RUBYLIB="${source_dir}/gobject-introspection/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gio2/ext/gio2:${RUBYLIB}"
RUBYLIB="${source_dir}/gio2/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/cairo-gobject/ext/cairo-gobject:${RUBYLIB}"
RUBYLIB="${source_dir}/cairo-gobject/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/atk/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/pango/ext/pango:${RUBYLIB}"
RUBYLIB="${source_dir}/pango/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gdk_pixbuf2/ext/gdk_pixbuf2:${RUBYLIB}"
RUBYLIB="${source_dir}/gdk_pixbuf2/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gtk2/ext/gtk2:${RUBYLIB}"
RUBYLIB="${source_dir}/gtk2/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/gdk3/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gtk3/ext/gtk3:${RUBYLIB}"
RUBYLIB="${source_dir}/gtk3/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/rsvg2/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/poppler/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gstreamer/ext/gstreamer:${RUBYLIB}"
RUBYLIB="${source_dir}/gstreamer/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/vte3/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/clutter/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/clutter-gdk/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/clutter-gtk/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/clutter-gstreamer/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/webkit-gtk/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/webkit-gtk2/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/webkit2-gtk/lib:${RUBYLIB}"
RUBYLIB="${build_dir}/gtksourceview2/ext/gtksourceview2:${RUBYLIB}"
RUBYLIB="${source_dir}/gtksourceview2/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/gtksourceview3/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/gsf/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/goffice/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/gnumeric/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/gegl/lib:${RUBYLIB}"
RUBYLIB="${source_dir}/libsecret/lib:${RUBYLIB}"

RUBYLIB="${RUBYLIB}" "$@"
