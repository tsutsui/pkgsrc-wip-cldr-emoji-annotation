# $NetBSD$

DISTNAME=	cldr-emoji-annotation-31.90.0_1
PKGNAME=	${DISTNAME:S/_/./g}
CATEGORIES=	fonts
MASTER_SITES=	${MASTER_SITE_GITHUB:=fujiwarat/}
GITHUB_PROJECT=	${DISTNAME:S/-${PKGVERSION_NOREV}//}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	tsutsui@NetBSD.org
HOMEPAGE=	https://github.com/fujiwarat/cldr-emoji-annotation
COMMENT=	Emoji annotation files in CLDR
LICENSE=	unicode

WRKSRC=		${WRKDIR}/${DISTNAME}

USE_LIBTOOL=	yes
USE_TOOLS+=	aclocal autoheader autoconf automake

# autogen.sh script also handles configure
NO_CONFIGURE=	YES	

do-build:
	(cd ${WRKSRC} && ${SH} autogen.sh --prefix=${PREFIX})

.include "../../mk/bsd.pkg.mk"
