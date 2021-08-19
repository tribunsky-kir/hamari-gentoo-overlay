# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg-utils

DESCRIPTION="A free astronomical image processing software"
HOMEPAGE="https://www.siril.org/"
SRC_URI="https://gitlab.com/free-astro/siril/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="curl ffmpeg gnuplot heif jpeg openmp png raw tiff wcs"

DEPEND="
	>=dev-libs/json-glib-1.2.6
	>=dev-libs/libconfig-1.4[cxx]
	media-gfx/exiv2
	media-libs/librtprocess:0=
	>=media-libs/opencv-4.4.0:=
	sci-libs/cfitsio
	sci-libs/fftw:3.0=
	sci-libs/gsl
	>=x11-libs/gtk+-3.20.0:3
	curl? ( net-libs/curl )
	ffmpeg? ( media-video/ffmpeg:= )
	gnuplot? ( sci-visualization/gnuplot )
	heif? ( media-libs/libheif )
	jpeg? ( virtual/jpeg )
	png? ( media-libs/libpng )
	raw? ( media-libs/libraw )
	tiff? ( media-libs/tiff )
	wcs? ( sci-astronomy/wcslib )
	"
RDEPEND="${DEPEND}"

DOCS=( README.md NEWS ChangeLog )

src_unpack() {
	unpack ${A}
}

src_configure() {
	local emesonargs=(
		$(meson_use openmp)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}