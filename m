From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68k: fix io functions for ColdFire/MMU/PCI case
Date: Wed,  8 Jul 2015 23:12:19 +1000
Message-ID: <1436361139-13910-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv01p.mx.bigpond.com ([61.9.189.231]:51889 "EHLO
	nschwqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933550AbbGHNWg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 09:22:36 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The inb/outb/... family of IO methods end up being multiply defined when
building PCI support for the ColdFire. Compiling gives this:

  CC      init/main.o
In file included from ./arch/m68k/include/asm/io.h:4:0,
                 from include/linux/bio.h:30,
                 from include/linux/blkdev.h:18,
                 from init/main.c:75:
./arch/m68k/include/asm/io_mm.h:420:0: warning: "inb" redefined
./arch/m68k/include/asm/io_mm.h:108:0: note: this is the location of the previous definition
...

The ColdFire/PCI case defines its own IO access methods, so no others
should be defined or used in this case. Conditionally disable other
definitions that clash with it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/io_mm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 618c85d3..f55cad5 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -413,7 +413,8 @@ static inline void isa_delay(void)
 #define writew(val, addr)	out_le16((addr), (val))
 #endif /* CONFIG_ATARI_ROM_ISA */
 
-#if !defined(CONFIG_ISA) && !defined(CONFIG_ATARI_ROM_ISA)
+#if !defined(CONFIG_ISA) && !defined(CONFIG_ATARI_ROM_ISA) && \
+    !(defined(CONFIG_PCI) && defined(CONFIG_COLDFIRE))
 /*
  * We need to define dummy functions for GENERIC_IOMAP support.
  */
-- 
1.9.1
