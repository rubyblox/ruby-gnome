#!/usr/bin/env ruby
#
# Copyright (C) 2022  Ruby-GNOME Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require "pathname"

base_dir = Pathname(__FILE__).dirname.parent.parent.expand_path
top_dir = base_dir.parent
top_build_dir = Pathname(".").parent.parent.parent.expand_path

mkmf_gnome2_dir = top_dir + "glib2" + "lib"
version_suffix = ""
unless mkmf_gnome2_dir.exist?
  if /(-\d+\.\d+\.\d+)\z/ =~ base_dir.basename.to_s
    version_suffix = $1
    mkmf_gnome2_dir = top_dir + "glib2#{version_suffix}" + "lib"
  end
end

$LOAD_PATH.unshift(mkmf_gnome2_dir.to_s)

module_name = "gtk4"
package_id = "gtk4"

require "mkmf-gnome"

depended_packages = [
  "glib2",
  "gobject-introspection",
  "cairo-gobject",
  "atk",
  "pango",
  "gdk_pixbuf2",
  "gdk4",
]
depended_packages.each do |package|
  directory = "#{package}#{version_suffix}"
  build_base_path = "#{directory}/tmp/#{RUBY_PLATFORM}"
  package_library_name = package.gsub(/-/, "_")
  build_dir = "#{build_base_path}/#{package_library_name}/#{RUBY_VERSION}"
  add_depend_package(package, "#{directory}/ext/#{package}",
                     top_dir.to_s,
                     :top_build_dir => top_build_dir.to_s,
                     :target_build_dir => build_dir)
end

unless check_cairo(:top_dir => top_dir)
  exit(false)
end

unless required_pkg_config_package(package_id,
                                   :alt_linux => "libgtk4-devel",
                                   :debian => "libgtk-4-dev",
                                   :redhat => "pkgconfig(#{package_id})",
                                   :arch_linux => "gtk4",
                                   :homebrew => "gtk4",
                                   :macports => "gtk4",
                                   :msys2 => "gtk4")
  exit(false)
end

unless PKGConfig.have_package("gobject-introspection-1.0")
  exit(false)
end

create_pkg_config_file("Ruby/GTK4", package_id)

$defs << "-DRUBY_GTK4_COMPILATION"
create_makefile(module_name)

pkg_config_dir = with_config("pkg-config-dir")
if pkg_config_dir.is_a?(String)
  File.open("Makefile", "ab") do |makefile|
    makefile.puts
    makefile.puts("pkgconfigdir=#{pkg_config_dir}")
  end
end
