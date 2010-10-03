From: Thorsten Glaser <tg@debian.org>
Subject: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Sun, 3 Oct 2010 18:48:51 +0000
Message-ID: <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:40506 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754525Ab0JCTAF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Oct 2010 15:00:05 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2Tn2-0007WT-E8
	for linux-m68k@vger.kernel.org; Sun, 03 Oct 2010 21:00:04 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 03 Oct 2010 21:00:04 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 03 Oct 2010 21:00:04 +0200
In-Reply-To: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

On m68k, I/O macros like inb() outw() etc. are only defined to
something useful if CONFIG_ISA is set; dummies are in place if
not, but four macros were missing from the !CONFIG_ISA case.
Adding these makes some drivers, such as speakup, compile again.
The patch was made against Debian=E2=80=99s linux-2.6_2.6.32-24, but
applies cleanly on linux-m68k master.

Signed-off-by: Thorsten Glaser <tg@debian.org>
---
 arch/m68k/include/asm/io_mm.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_m=
m.h
index 56a6555..be9d7da 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -387,9 +387,13 @@ static inline void isa_delay(void)
 #define outb(val,port)     ((void)0)
 #define outb_p(val,port)   ((void)0)
 #define inw(port)          0xffff
+#define inw_p(port)        0xffff
 #define outw(val,port)     ((void)0)
+#define outw_p(val,port)   ((void)0)
 #define inl(port)          0xffffffffUL
+#define inl_p(port)        0xffffffffUL
 #define outl(val,port)     ((void)0)
+#define outl_p(val,port)   ((void)0)
=20
 #define insb(port,buf,nr)  ((void)0)
 #define outsb(port,buf,nr) ((void)0)
--=20
1.6.0.4
