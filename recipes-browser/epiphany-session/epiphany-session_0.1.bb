#
# Setup Epiphany Gnome Session
#
DESCRIPTION = "Epiphany X session files for poky"
HOMEPAGE = "http://www.yoctoproject.org"
BUGTRACKER = "http://bugzilla.pokylinux.org"

PR = "r1"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://epiphany-session;md5=8cbb9f4c04f6b7de32cc9e5ebabab48a"

SECTION = "x11"
RCONFLICTS_${PN} = "matchbox-common"

SRC_URI = "file://epiphany-session \
           file://autostart-epiphany.sh \
	   file://change_epiphany_url.sh \
	   file://epiphany-config \
          "

S = "${WORKDIR}"

inherit update-alternatives

BROWSER="epiphany"
USER="root"

ALTERNATIVE_${PN} = "x-session-manager"
ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/epiphany-session"
ALTERNATIVE_PRIORITY = "90"

do_install() {
        install -d ${D}/${bindir}
	install -d ${D}/home/${USER}/.config/epiphany
        install -m 0755 ${S}/epiphany-session ${D}/${bindir}
        install -m 0755 ${S}/autostart-epiphany.sh ${D}/${bindir}
	install -m 0755 ${S}/change_epiphany_url.sh ${D}/${bindir}
	install ${S}/epiphany-config ${D}/home/${USER}/.config/
}

FILES_${PN} += "/home/${USER}/.config/epiphany-config"
