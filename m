From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] m68k/q40: Undefine insl/outsl before redefining them
Date: Mon, 17 Jun 2013 21:07:30 +0200
Message-ID: <1371496051-16566-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>, Richard Zidlicky <rz@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

To use the PC parallel port driver on Q40, we need non-standard versions of
the insl/outsl accessors. Make sure to undefine them first, to kill this
compiler warning:

In file included from drivers/parport/parport_pc.c:67:
arch/m68k/include/asm/parport.h:14:1: warning: "insl" redefined
In file included from arch/m68k/include/asm/io.h:4,
                 from include/linux/scatterlist.h:10,
                 from include/linux/dma-mapping.h:9,
                 from drivers/parport/parport_pc.c:54:
arch/m68k/include/asm/io_mm.h:370:1: warning: this is the location of the previous definition
In file included from drivers/parport/parport_pc.c:67:
arch/m68k/include/asm/parport.h:15:1: warning: "outsl" redefined
In file included from arch/m68k/include/asm/io.h:4,
                 from include/linux/scatterlist.h:10,
                 from include/linux/dma-mapping.h:9,
                 from drivers/parport/parport_pc.c:54:
arch/m68k/include/asm/io_mm.h:373:1: warning: this is the location of the previous definition

Reported-by: Thorsten Glaser <tg@debian.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/parport.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/parport.h b/arch/m68k/include/asm/parport.h
index 5ea75e6..c85cece 100644
--- a/arch/m68k/include/asm/parport.h
+++ b/arch/m68k/include/asm/parport.h
@@ -11,6 +11,8 @@
 #ifndef _ASM_M68K_PARPORT_H
 #define _ASM_M68K_PARPORT_H 1
 
+#undef insl
+#undef outsl
 #define insl(port,buf,len)   isa_insb(port,buf,(len)<<2)
 #define outsl(port,buf,len)  isa_outsb(port,buf,(len)<<2)
 
-- 
1.7.0.4
