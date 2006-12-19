# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Nautilus Plugin - adds a Resize Images... menu item to the context menu of all images."
HOMEPAGE="http://www.bitron.ch/software/nautilus-image-converter.php"
SRC_URI="http://www.bitron.ch/downloads/${PF}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND=">=gnome-base/nautilus-2.6.0
		 media-gfx/imagemagick
		 >=x11-libs/gtk+-2.4.0
		 >=gnome-base/libglade-2.4.0
		 >=gnome-base/gnome-vfs-2.6.0"
DEPEND="${RDEPEND}
		dev-util/pkgconfig
		dev-util/intltool"

USE_DESTDIR=1
DOCS="AUTHORS ChangeLog INSTALL NEWS README"
