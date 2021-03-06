/* -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */
/*
 * This file is part of the LibreOffice project.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef INCLUDED_XMLSECURITY_SOURCE_HELPER_OOXMLSECEXPORTER_HXX
#define INCLUDED_XMLSECURITY_SOURCE_HELPER_OOXMLSECEXPORTER_HXX

#include <memory>

#include <svl/sigstruct.hxx>

namespace com
{
namespace sun
{
namespace star
{
namespace embed
{
class XStorage;
}
namespace uno
{
class XComponentContext;
}
namespace xml
{
namespace sax
{
class XDocumentHandler;
}
}
}
}
}

/// Writes a single OOXML digital signature.
class OOXMLSecExporter
{
    struct Impl;
    std::unique_ptr<Impl> m_pImpl;

public:
    OOXMLSecExporter(const css::uno::Reference<css::uno::XComponentContext>& xComponentContext,
                     const css::uno::Reference<css::embed::XStorage>& xRootStorage,
                     const css::uno::Reference<css::xml::sax::XDocumentHandler>& xDocumentHandler,
                     const SignatureInformation& rInformation);
    ~OOXMLSecExporter();
    void writeSignature();
};

#endif

/* vim:set shiftwidth=4 softtabstop=4 expandtab: */
