TERMUX_PKG_HOMEPAGE=https://filebrowser.org/
TERMUX_PKG_DESCRIPTION="Web file browser based on Go"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="2.31.1"
TERMUX_PKG_SRCURL="https://github.com/filebrowser/filebrowser/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=fdc93a00b614ea365ff4cb980d36d167ed961b0a32fe219b612d92e0045e569f
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_QUIET_BUILD=false

termux_step_pre_configure() {
	termux_setup_golang
	termux_setup_nodejs
}

termux_step_make() {
	make build-frontend
	go build
}

termux_step_make_install() {
	install -Dm700 filebrowser $TERMUX_PREFIX/bin/
}
