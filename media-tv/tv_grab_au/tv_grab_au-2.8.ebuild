# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Australian TV grabber."
HOMEPAGE="http://www.immir.com/tv_grab_au"
#SRC_URI="http://www.immir.com/tv_grab_au"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86"
IUSE=""
RESTRICT="nomirror"

DEPEND="media-tv/xmltv
	dev-perl/DateManip
	dev-perl/DateTime-TimeZone
	dev-perl/TimeDate
	dev-perl/perl-tk
	perl-gcpan/JavaScript
	perl-gcpan/DateTime-Format-DateManip"

	
#src_install() {
#	insinto /usr/local/bin
#	doins ${DISTDIR}/tv_grab_au

#	fperms 755 /usr/local/bin/tv_grab_au
#}

