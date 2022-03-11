# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1

DESCRIPTION="Search for gadgets in binaries to facilitate your ROP exploitation"
HOMEPAGE="http://shell-storm.org/project/ROPgadget/"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/JonathanSalwan/ROPgadget"
else
	SRC_URI="https://github.com/JonathanSalwan/ROPgadget/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	dev-libs/capstone[python,${PYTHON_USEDEP}]
"

S="${WORKDIR}"/ROPgadget-${PV}

src_test() {
	pushd test-suite-binaries || die
	./test.sh || die
	popd || die
}
