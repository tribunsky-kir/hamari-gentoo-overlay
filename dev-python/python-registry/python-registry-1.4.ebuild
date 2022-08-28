# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Pure Python parser for Windows Registry hives"
HOMEPAGE="https://github.com/williballenthin/python-registry"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/williballenthin/${PN}.git"
else
	SRC_URI="https://github.com/williballenthin/python-registry/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"

RESTRICT="!test? ( test )"