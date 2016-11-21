DESCRIPTION = "A basic image with epiphany web browser integrated"

LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

IMAGE_FEATURES += "splash package-management ssh-server-openssh x11-base"

DEPENDS = "libsecret"

PR="r1"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL += "epiphany \
		  epiphany-session \
		  xdotool \
		  matchbox-keyboard \
    		  matchbox-keyboard-im \
    		  liberation-fonts \
		 "
