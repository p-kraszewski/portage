# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit bash-completion-r1

DESCRIPTION="A sophisticated build-tool for Erlang projects that follows OTP principles"
HOMEPAGE="https://github.com/rebar/rebar"
MY_PV=${PV/3.0.0_}
MY_PV=${MY_PV/beta/beta-}
SRC_URI="https://github.com/rebar/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-${MY_PV}

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

src_test() {
	emake xref
}

src_compile() {
	./bootstrap
}

src_install() {
	dobin rebar3
	dodoc rebar.config.sample THANKS
	dobashcomp priv/shell-completion/bash/${PN}
}
