# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_CppunitTest_CppunitTest,sc_macros_test))

$(eval $(call gb_CppunitTest_use_externals,sc_macros_test, \
    boost_headers \
    mdds_headers \
))

$(eval $(call gb_CppunitTest_use_common_precompiled_header,sc_macros_test))

$(eval $(call gb_CppunitTest_add_exception_objects,sc_macros_test, \
    sc/qa/extras/macros-test \
))

$(eval $(call gb_CppunitTest_use_libraries,sc_macros_test, \
    basegfx \
    comphelper \
    cppu \
    cppuhelper \
    drawinglayer \
    editeng \
    for \
    forui \
    i18nlangtag \
    msfilter \
    oox \
    sal \
    salhelper \
    sax \
    sb \
    sc \
    sfx \
    sot \
    subsequenttest \
    svl \
    svt \
    svx \
    svxcore \
	test \
    tk \
    tl \
    ucbhelper \
	unotest \
    utl \
    vbahelper \
    vcl \
    xo \
))

$(eval $(call gb_CppunitTest_set_include,sc_macros_test,\
    -I$(SRCDIR)/sc/source/ui/inc \
    -I$(SRCDIR)/sc/inc \
    $$(INCLUDE) \
))

$(eval $(call gb_CppunitTest_use_api,sc_macros_test,\
    offapi \
    oovbaapi \
    udkapi \
))

$(eval $(call gb_CppunitTest_use_ure,sc_macros_test))
$(eval $(call gb_CppunitTest_use_vcl,sc_macros_test))

$(eval $(call gb_CppunitTest_use_components,sc_macros_test,\
    basic/util/sb \
    comphelper/util/comphelp \
    configmgr/source/configmgr \
    dbaccess/util/dba \
    emfio/emfio \
    eventattacher/source/evtatt \
    filter/source/config/cache/filterconfig1 \
    filter/source/storagefilterdetect/storagefd \
    forms/util/frm \
    framework/util/fwk \
    framework/util/fwl \
    i18npool/source/search/i18nsearch \
    i18npool/util/i18npool \
    linguistic/source/lng \
    oox/util/oox \
    package/source/xstor/xstor \
    package/util/package2 \
    sax/source/expatwrap/expwrap \
    scripting/source/basprov/basprov \
    scripting/source/dlgprov/dlgprov \
    scripting/source/vbaevents/vbaevents \
    scripting/util/scriptframe \
    sc/util/sc \
    sc/util/scd \
    sc/util/scfilt \
    $(call gb_Helper_optional,SCRIPTING, \
	    sc/util/vbaobj) \
    sfx2/util/sfx \
    sot/util/sot \
    svl/source/fsstor/fsstorage \
    svtools/util/svt \
    svx/util/svx \
    svx/util/svxcore \
    toolkit/util/tk \
    ucb/source/core/ucb1 \
    ucb/source/ucp/file/ucpfile1 \
    ucb/source/ucp/tdoc/ucptdoc1 \
    unotools/util/utl \
    unoxml/source/rdf/unordf \
    unoxml/source/service/unoxml \
    uui/util/uui \
    vcl/vcl.common \
    vbahelper/util/msforms \
    xmloff/util/xo \
))

$(eval $(call gb_CppunitTest_use_configuration,sc_macros_test))

# vim: set noet sw=4 ts=4:
