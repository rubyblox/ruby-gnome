/* -*- c-file-style: "ruby"; indent-tabs-mode: nil -*- */
/*
 *  Copyright (C) 2015  Ruby-GNOME2 Project Team
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 *  MA  02110-1301  USA
 */

#include "rb-gio2.h"

#define RG_TARGET_NAMESPACE mActionGroup

#define _SELF(self) ((G_ACTION_GROUP(RVAL2GOBJ(self))))

static VALUE
rg_list_actions(VALUE self)
{
    gchar** actions;

    actions = g_action_group_list_actions(_SELF(self));
    return STRV2RVAL_FREE(actions);
}

static VALUE
rg_action_enabled_p(VALUE self, VALUE name)
{
    const gchar* action;

    action = RVAL2CSTR(name);
    return CBOOL2RVAL(g_action_group_get_action_enabled(_SELF(self), action));
}

void
rb_gio2_init_action_group (VALUE mGio)
{
    VALUE RG_TARGET_NAMESPACE;

    RG_TARGET_NAMESPACE = rb_define_module_under(mGio, "ActionGroup");

    RG_DEF_METHOD(list_actions, 0);
    RG_DEF_METHOD_P(action_enabled, 1);
}
