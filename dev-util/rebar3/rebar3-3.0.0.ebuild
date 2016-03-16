# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit bash-completion-r1

DESCRIPTION="A sophisticated build-tool for Erlang projects that follows OTP principles"
HOMEPAGE="https://github.com/rebar/rebar3"

SRC_URI="https://github.com/rebar/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64"
IUSE="bash-completion zsh-completion"

RDEPEND="
	dev-lang/erlang
	zsh-completion? ( app-shells/gentoo-zsh-completions )
"
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
	use bash-completion && dobashcomp priv/shell-completion/bash/${PN}
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins priv/shell-completion/zsh/_${PN}
	fi
}
