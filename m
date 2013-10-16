From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/16] m68k: Drop remainings and API of BOOTINFO_COMPAT_1_0
Date: Wed, 16 Oct 2013 14:31:21 +0200
Message-ID: <1381926693-6392-5-git-send-email-geert__23818.8515337699$1381926734$gmane$org@linux-m68k.org>
References: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Drop remainings and API for backwards compatibility with bootinfo interface
version 1.0.  This was used when booting a 2.1.x or newer kernel on Amiga,
Atari, or Mac using a bootstrap for kernel 2.0.x.

Everybody upgraded his bootstrap a long time ago, so this can go.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/bootinfo.h |  112 --------------------------------------
 arch/m68k/mac/config.c           |    1 -
 arch/m68k/mac/misc.c             |    1 -
 3 files changed, 114 deletions(-)

diff --git a/arch/m68k/include/asm/bootinfo.h b/arch/m68k/include/asm/bootinfo.h
index a66a7f9200f7..b992aa726082 100644
--- a/arch/m68k/include/asm/bootinfo.h
+++ b/arch/m68k/include/asm/bootinfo.h
@@ -269,116 +269,4 @@ struct bootversion {
 #define Q40_BOOTI_VERSION      MK_BI_VERSION( 2, 0 )
 #define HP300_BOOTI_VERSION    MK_BI_VERSION( 2, 0 )
 
-#ifdef BOOTINFO_COMPAT_1_0
-
-    /*
-     *  Backwards compatibility with bootinfo interface version 1.0
-     */
-
-#define COMPAT_AMIGA_BOOTI_VERSION    MK_BI_VERSION( 1, 0 )
-#define COMPAT_ATARI_BOOTI_VERSION    MK_BI_VERSION( 1, 0 )
-#define COMPAT_MAC_BOOTI_VERSION      MK_BI_VERSION( 1, 0 )
-
-#include <linux/zorro.h>
-
-#define COMPAT_NUM_AUTO    16
-
-struct compat_bi_Amiga {
-    int model;
-    int num_autocon;
-    struct ConfigDev autocon[COMPAT_NUM_AUTO];
-    unsigned long chip_size;
-    unsigned char vblank;
-    unsigned char psfreq;
-    unsigned long eclock;
-    unsigned long chipset;
-    unsigned long hw_present;
-};
-
-struct compat_bi_Atari {
-    unsigned long hw_present;
-    unsigned long mch_cookie;
-};
-
-#ifndef __ASSEMBLY__
-
-struct compat_bi_Macintosh
-{
-	unsigned long videoaddr;
-	unsigned long videorow;
-	unsigned long videodepth;
-	unsigned long dimensions;
-	unsigned long args;
-	unsigned long boottime;
-	unsigned long gmtbias;
-	unsigned long bootver;
-	unsigned long videological;
-	unsigned long sccbase;
-	unsigned long id;
-	unsigned long memsize;
-	unsigned long serialmf;
-	unsigned long serialhsk;
-	unsigned long serialgpi;
-	unsigned long printmf;
-	unsigned long printhsk;
-	unsigned long printgpi;
-	unsigned long cpuid;
-	unsigned long rombase;
-	unsigned long adbdelay;
-	unsigned long timedbra;
-};
-
-#endif
-
-struct compat_mem_info {
-    unsigned long addr;
-    unsigned long size;
-};
-
-#define COMPAT_NUM_MEMINFO  4
-
-#define COMPAT_CPUB_68020 0
-#define COMPAT_CPUB_68030 1
-#define COMPAT_CPUB_68040 2
-#define COMPAT_CPUB_68060 3
-#define COMPAT_FPUB_68881 5
-#define COMPAT_FPUB_68882 6
-#define COMPAT_FPUB_68040 7
-#define COMPAT_FPUB_68060 8
-
-#define COMPAT_CPU_68020    (1<<COMPAT_CPUB_68020)
-#define COMPAT_CPU_68030    (1<<COMPAT_CPUB_68030)
-#define COMPAT_CPU_68040    (1<<COMPAT_CPUB_68040)
-#define COMPAT_CPU_68060    (1<<COMPAT_CPUB_68060)
-#define COMPAT_CPU_MASK     (31)
-#define COMPAT_FPU_68881    (1<<COMPAT_FPUB_68881)
-#define COMPAT_FPU_68882    (1<<COMPAT_FPUB_68882)
-#define COMPAT_FPU_68040    (1<<COMPAT_FPUB_68040)
-#define COMPAT_FPU_68060    (1<<COMPAT_FPUB_68060)
-#define COMPAT_FPU_MASK     (0xfe0)
-
-#define COMPAT_CL_SIZE      (256)
-
-struct compat_bootinfo {
-    unsigned long machtype;
-    unsigned long cputype;
-    struct compat_mem_info memory[COMPAT_NUM_MEMINFO];
-    int num_memory;
-    unsigned long ramdisk_size;
-    unsigned long ramdisk_addr;
-    char command_line[COMPAT_CL_SIZE];
-    union {
-	struct compat_bi_Amiga     bi_ami;
-	struct compat_bi_Atari     bi_ata;
-	struct compat_bi_Macintosh bi_mac;
-    } bi_un;
-};
-
-#define bi_amiga	bi_un.bi_ami
-#define bi_atari	bi_un.bi_ata
-#define bi_mac		bi_un.bi_mac
-
-#endif /* BOOTINFO_COMPAT_1_0 */
-
-
 #endif /* _M68K_BOOTINFO_H */
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index afb95d5fb26b..677244e0371c 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -26,7 +26,6 @@
 #include <linux/adb.h>
 #include <linux/cuda.h>
 
-#define BOOTINFO_COMPAT_1_0
 #include <asm/setup.h>
 #include <asm/bootinfo.h>
 
diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 5e085554ac7f..3d02a3c3a93a 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -25,7 +25,6 @@
 #include <asm/mac_via.h>
 #include <asm/mac_oss.h>
 
-#define BOOTINFO_COMPAT_1_0
 #include <asm/bootinfo.h>
 #include <asm/machdep.h>
 
-- 
1.7.9.5
