# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Amateur Radio Net Control Program"
HOMEPAGE="http://w1hkj.com/Net-help/index.html"
SRC_URI="mirror://sourceforge/fldigi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	x11-libs/fltk:1
	x11-libs/libX11
	x11-misc/xdg-utils
"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )
