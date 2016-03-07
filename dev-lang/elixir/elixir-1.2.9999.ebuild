# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib
inherit versionator
inherit git-r3

MY_PV="v$(get_version_component_range 1-2)"
MY_P="${PN}-git-${PV}"

EGIT_REPO_URI="git://github.com/elixir-lang/elixir.git"
EGIT_BRANCH="$MY_PV"
EGIT_CHECKOUT_DIR="${WORKDIR}/elixir"
S="${EGIT_CHECKOUT_DIR}"

DESCRIPTION="Elixir programming language"
HOMEPAGE="http://elixir-lang.org"

LICENSE="Apache-2.0 ErlPL-1.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/erlang-18"
RDEPEND="${DEPEND}"

src_compile() {
	emake Q=""
}

src_install() {
	emake DESTDIR="${D}" LIBDIR="$(get_libdir)" PREFIX="/usr" install
	dodoc README.md CHANGELOG.md CONTRIBUTING.md
}
