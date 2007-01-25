# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 mono eutils

DESCRIPTION="Personal photo management application for the gnome desktop"
HOMEPAGE="http://f-spot.org"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=dev-lang/mono-1.1.10
	>=sys-apps/dbus-0.30
	>=dev-libs/glib-2
	>=x11-libs/gtk+-2.6
	>=dev-dotnet/gtk-sharp-2.7
	>=dev-dotnet/gtkhtml-sharp-2.7
	>=dev-dotnet/gconf-sharp-2.7
	>=dev-dotnet/glade-sharp-2.7
	>=dev-dotnet/gnomevfs-sharp-2.7
	>=gnome-base/libgnome-2.2
	>=gnome-base/libgnomeui-2.2
	>=media-libs/libexif-0.6
	<media-libs/libexif-0.7.0
	>=media-libs/libgphoto2-2.1.4
	>=media-libs/lcms-1.14
	media-libs/jpeg
	>=dev-db/sqlite-3"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	>=dev-util/intltool-0.29"

USE_DESTDIR="1"
DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"

pkg_setup()
{
	if ! built_with_use sys-apps/dbus mono ; then
		echo
		eerror "In order to compile f-spot, you need to have sys-apps/dbus emerged"
		eerror "with 'mono' in your USE flags. Please add that flag, re-emerge"
		eerror "dbus, and then emerge f-spot."
		die "sys-apps/dbus is missing the .NET binding."
	fi
}

src_unpack()
{
	unpack ${A}
	cd ${S}

	# Gentoo uses older EXIF so name for now
	sed -i -e 's/EXIF_SOVERSION=12/EXIF_SOVERSION=10/' configure.in

	# Multilib fix
	sed -i -e 's:prefix mono`/lib:libdir mono`:' \
		configure.in || die "sed failed"

	#epatch ${FILESDIR}/${P}-adjustcolor.patch
	epatch ${FILESDIR}/${P}-glade.patch

	autoconf || die "autoconf failed"
}
