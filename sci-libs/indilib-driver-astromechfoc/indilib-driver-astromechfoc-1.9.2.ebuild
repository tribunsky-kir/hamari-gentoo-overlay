# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%%lib-driver-**}"

inherit cmake eutils

DESCRIPTION="the INDI driver for Astromechanics Lens Controller https://astromechanics.org"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="~sci-libs/indilib-${PV}"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}${PN##*-driver}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"