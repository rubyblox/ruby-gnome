# Copyright (C) 2015  Ruby-GNOME2 Project Team
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


class TestActionGroup < Test::Unit::TestCase
  def setup
    @map = Gio::SimpleActionGroup.new
    @action_name = "test"
    @action = Gio::SimpleAction.new(@action_name)
  end

  sub_test_case "#list_actions" do

    test "empty" do
      actions = @map.list_actions
      assert_equal([], actions)
    end

    test "add" do
      @map.add_action(@action)
      actions = @map.list_actions
      assert_equal([@action_name], actions)
    end

    test "remove" do
      @map.add_action(@action)
      @map.remove_action(@action_name)
      actions = @map.list_actions
      assert_equal([], actions)
    end
  end

  sub_test_case "#has_action?" do

    test "empty" do
      action_p = @map.has_action?(@action_name)
      assert_false(action_p)
    end

    test "add" do
      @map.add_action(@action)
      action_p = @map.has_action?(@action_name)
      assert_true(action_p)
    end

    test "remove" do
      @map.add_action(@action)
      @map.remove_action(@action_name)
      action_p = @map.has_action?(@action_name)
      assert_false(action_p)
    end
  end

  sub_test_case "#action_enabled?" do

    test "enabled" do
      @map.add_action(@action)
      @action.enabled = true
      enabled_p = @action.enabled?
      map_enabled_p = @map.action_enabled?(@action_name)
      assert_equal(enabled_p, map_enabled_p)
    end

    test "not enabled" do
      @map.add_action(@action)
      @action.enabled = false
      enabled_p = @action.enabled?
      map_enabled_p = @map.action_enabled?(@action_name)
      assert_equal(enabled_p, map_enabled_p)
    end
  end

end
