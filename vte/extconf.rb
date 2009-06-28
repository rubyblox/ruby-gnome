=begin
extconf.rb for Ruby/VTE extention library
=end

PACKAGE_NAME = "vte"
PACKAGE_ID = "vte"

TOPDIR = File.expand_path(File.dirname(__FILE__) + '/..')
MKMF_GNOME2_DIR = TOPDIR + '/glib/src/lib'
SRCDIR = TOPDIR + '/vte/src'

$LOAD_PATH.unshift MKMF_GNOME2_DIR

require 'mkmf-gnome2'

PKGConfig.have_package(PACKAGE_ID, 0, 12, 1) or exit 1
setup_win32(PACKAGE_NAME)

check_cairo

add_depend_package("glib2", "glib/src", TOPDIR)
add_depend_package("gtk2", "gtk/src", TOPDIR)
add_depend_package("atk", "atk/src", TOPDIR)

unless have_macro("VTE_CHECK_VERSION", ["vte/vte.h"])
  make_version_header("VTE", PACKAGE_ID)
  create_pkg_config_file('VTE', 'src/rbvteversion.h', 'vte-ruby.pc')
end

create_makefile_at_srcdir(PACKAGE_NAME, SRCDIR, "-DRUBY_VTE_COMPILATION")
create_top_makefile
