# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# This file incorporates work covered by the following license notice:
#
#   Licensed to the Apache Software Foundation (ASF) under one or more
#   contributor license agreements. See the NOTICE file distributed
#   with this work for additional information regarding copyright
#   ownership. The ASF licenses this file to you under the Apache
#   License, Version 2.0 (the "License"); you may not use this file
#   except in compliance with the License. You may obtain a copy of
#   the License at http://www.apache.org/licenses/LICENSE-2.0 .
#

$(eval $(call gb_Library_Library,vclplug_win))

$(eval $(call gb_Library_set_include,vclplug_win,\
    $$(INCLUDE) \
    -I$(SRCDIR)/vcl/inc \
    -I$(SRCDIR)/vcl/inc/win \
))

$(eval $(call gb_Library_add_defs,vclplug_win,\
    -DVCLPLUG_WIN_IMPLEMENTATION \
))

$(eval $(call gb_Library_use_custom_headers,vclplug_win,\
    officecfg/registry \
))

$(eval $(call gb_Library_use_sdk_api,vclplug_win))

$(eval $(call gb_Library_use_common_precompiled_header,vclplugin_win))

$(eval $(call gb_Library_use_libraries,vclplug_win,\
    $(call gb_Helper_optional,BREAKPAD, \
        crashreport) \
    basegfx \
    comphelper \
    cppu \
    i18nlangtag \
    i18nutil \
    sal \
    salhelper \
    tl \
    utl \
    vcl \
))

$(eval $(call gb_Library_use_externals,vclplug_win,\
    boost_headers \
    epoxy \
    glm_headers \
    harfbuzz \
))

$(eval $(call gb_Library_add_exception_objects,vclplug_win,\
    vcl/opengl/win/gdiimpl \
    vcl/win/app/saldata \
    vcl/win/app/salinfo \
    vcl/win/app/salinst \
    vcl/win/app/salshl \
    vcl/win/app/saltimer \
    vcl/win/gdi/gdiimpl \
    vcl/win/gdi/salbmp \
    vcl/win/gdi/salgdi \
    vcl/win/gdi/salgdi2 \
    vcl/win/gdi/salfont \
    vcl/win/gdi/salgdi_gdiplus \
    vcl/win/gdi/salnativewidgets-luna \
    vcl/win/gdi/salprn \
    vcl/win/gdi/salvd \
    vcl/win/gdi/winlayout \
    vcl/win/gdi/DWriteTextRenderer \
    vcl/win/window/salframe \
    vcl/win/window/keynames \
    vcl/win/window/salmenu \
    vcl/win/window/salobj \
))

$(eval $(call gb_Library_use_system_win32_libs,vclplug_win,\
    d2d1 \
    dwrite \
    gdi32 \
    gdiplus \
    imm32 \
    ole32 \
    shell32 \
    shlwapi \
    version \
    winspool \
))

$(eval $(call gb_Library_add_nativeres,vclplug_win,vcl/salsrc))

# HACK: dependency on icon themes so running unit tests don't
# prevent delivering these by having open file handles on WNT
$(eval $(call gb_Library_use_package,vclplug_win,postprocess_images))

# vim: set noet sw=4 ts=4:
