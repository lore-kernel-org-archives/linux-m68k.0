From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix arg types for outs* functions
Date: Tue, 21 Jan 2014 11:29:09 +1000
Message-ID: <1390267749-2816-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv03p.mx.bigpond.com ([61.9.189.237]:34117 "EHLO
	nschwqsrv03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751543AbaAUBsV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 20 Jan 2014 20:48:21 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compiling for any m68knommu targets will give the following warnings:

  CC      lib/iomap_copy.o
lib/iomap.c: In function =E2=80=98iowrite8_rep=E2=80=99:
lib/iomap.c:213:2: warning: passing argument 2 of =E2=80=98io_outsb=E2=80=
=99 discards qualifiers from pointer target type
arch/m68k/include/asm/io_no.h:58:20: note: expected =E2=80=98void *=E2=80=
=99 but argument is of type =E2=80=98const void *=E2=80=99
lib/iomap.c: In function =E2=80=98iowrite16_rep=E2=80=99:
lib/iomap.c:217:2: warning: passing argument 2 of =E2=80=98io_outsw=E2=80=
=99 discards qualifiers from pointer target type
arch/m68k/include/asm/io_no.h:66:20: note: expected =E2=80=98void *=E2=80=
=99 but argument is of type =E2=80=98const void *=E2=80=99
lib/iomap.c: In function =E2=80=98iowrite32_rep=E2=80=99:
lib/iomap.c:221:2: warning: passing argument 2 of =E2=80=98io_outsl=E2=80=
=99 discards qualifiers from pointer target type
arch/m68k/include/asm/io_no.h:74:20: note: expected =E2=80=98void *=E2=80=
=99 but argument is of type =E2=80=98const void *=E2=80=99

=46ix it by puting in the appropriate const qualifier on the buf argume=
nt of
the m68knommu outs* inline functions.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/io_no.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_n=
o.h
index e153478..52f7e84 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -55,7 +55,7 @@ static inline unsigned int _swapl(volatile unsigned l=
ong v)
 #define __raw_writew writew
 #define __raw_writel writel
=20
-static inline void io_outsb(unsigned int addr, void *buf, int len)
+static inline void io_outsb(unsigned int addr, const void *buf, int le=
n)
 {
 	volatile unsigned char *ap =3D (volatile unsigned char *) addr;
 	unsigned char *bp =3D (unsigned char *) buf;
@@ -63,7 +63,7 @@ static inline void io_outsb(unsigned int addr, void *=
buf, int len)
 		*ap =3D *bp++;
 }
=20
-static inline void io_outsw(unsigned int addr, void *buf, int len)
+static inline void io_outsw(unsigned int addr, const void *buf, int le=
n)
 {
 	volatile unsigned short *ap =3D (volatile unsigned short *) addr;
 	unsigned short *bp =3D (unsigned short *) buf;
@@ -71,7 +71,7 @@ static inline void io_outsw(unsigned int addr, void *=
buf, int len)
 		*ap =3D _swapw(*bp++);
 }
=20
-static inline void io_outsl(unsigned int addr, void *buf, int len)
+static inline void io_outsl(unsigned int addr, const void *buf, int le=
n)
 {
 	volatile unsigned int *ap =3D (volatile unsigned int *) addr;
 	unsigned int *bp =3D (unsigned int *) buf;
--=20
1.8.1.4
