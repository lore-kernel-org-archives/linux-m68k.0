From: gerg@uclinux.org
Subject: [PATCH 1/4] m68k: move non-mmu 68000 platform code
Date: Thu, 21 Aug 2014 23:24:13 +1000
Message-ID: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas03p.mx.bigpond.com ([61.9.189.143]:20607 "EHLO
	nschwmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755307AbaHUNYR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Aug 2014 09:24:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-mmu 68000 specific code is inconsistently placed under a directory
named "platform". Move it to arch/m68k/ along with the other platform and
machine directories.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/{platform => }/68000/Makefile      | 0
 arch/m68k/{platform => }/68000/bootlogo-vz.h | 0
 arch/m68k/{platform => }/68000/bootlogo.h    | 0
 arch/m68k/{platform => }/68000/entry.S       | 0
 arch/m68k/{platform => }/68000/head.S        | 0
 arch/m68k/{platform => }/68000/ints.c        | 0
 arch/m68k/{platform => }/68000/m68328.c      | 0
 arch/m68k/{platform => }/68000/m68EZ328.c    | 0
 arch/m68k/{platform => }/68000/m68VZ328.c    | 0
 arch/m68k/{platform => }/68000/romvec.S      | 0
 arch/m68k/{platform => }/68000/timers.c      | 0
 arch/m68k/Makefile                           | 4 ++--
 12 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/m68k/{platform => }/68000/Makefile (100%)
 rename arch/m68k/{platform => }/68000/bootlogo-vz.h (100%)
 rename arch/m68k/{platform => }/68000/bootlogo.h (100%)
 rename arch/m68k/{platform => }/68000/entry.S (100%)
 rename arch/m68k/{platform => }/68000/head.S (100%)
 rename arch/m68k/{platform => }/68000/ints.c (100%)
 rename arch/m68k/{platform => }/68000/m68328.c (100%)
 rename arch/m68k/{platform => }/68000/m68EZ328.c (100%)
 rename arch/m68k/{platform => }/68000/m68VZ328.c (100%)
 rename arch/m68k/{platform => }/68000/romvec.S (100%)
 rename arch/m68k/{platform => }/68000/timers.c (100%)

diff --git a/arch/m68k/platform/68000/Makefile b/arch/m68k/68000/Makefile
similarity index 100%
rename from arch/m68k/platform/68000/Makefile
rename to arch/m68k/68000/Makefile
diff --git a/arch/m68k/platform/68000/bootlogo-vz.h b/arch/m68k/68000/bootlogo-vz.h
similarity index 100%
rename from arch/m68k/platform/68000/bootlogo-vz.h
rename to arch/m68k/68000/bootlogo-vz.h
diff --git a/arch/m68k/platform/68000/bootlogo.h b/arch/m68k/68000/bootlogo.h
similarity index 100%
rename from arch/m68k/platform/68000/bootlogo.h
rename to arch/m68k/68000/bootlogo.h
diff --git a/arch/m68k/platform/68000/entry.S b/arch/m68k/68000/entry.S
similarity index 100%
rename from arch/m68k/platform/68000/entry.S
rename to arch/m68k/68000/entry.S
diff --git a/arch/m68k/platform/68000/head.S b/arch/m68k/68000/head.S
similarity index 100%
rename from arch/m68k/platform/68000/head.S
rename to arch/m68k/68000/head.S
diff --git a/arch/m68k/platform/68000/ints.c b/arch/m68k/68000/ints.c
similarity index 100%
rename from arch/m68k/platform/68000/ints.c
rename to arch/m68k/68000/ints.c
diff --git a/arch/m68k/platform/68000/m68328.c b/arch/m68k/68000/m68328.c
similarity index 100%
rename from arch/m68k/platform/68000/m68328.c
rename to arch/m68k/68000/m68328.c
diff --git a/arch/m68k/platform/68000/m68EZ328.c b/arch/m68k/68000/m68EZ328.c
similarity index 100%
rename from arch/m68k/platform/68000/m68EZ328.c
rename to arch/m68k/68000/m68EZ328.c
diff --git a/arch/m68k/platform/68000/m68VZ328.c b/arch/m68k/68000/m68VZ328.c
similarity index 100%
rename from arch/m68k/platform/68000/m68VZ328.c
rename to arch/m68k/68000/m68VZ328.c
diff --git a/arch/m68k/platform/68000/romvec.S b/arch/m68k/68000/romvec.S
similarity index 100%
rename from arch/m68k/platform/68000/romvec.S
rename to arch/m68k/68000/romvec.S
diff --git a/arch/m68k/platform/68000/timers.c b/arch/m68k/68000/timers.c
similarity index 100%
rename from arch/m68k/platform/68000/timers.c
rename to arch/m68k/68000/timers.c
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 2e24775..dd96fc2 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -93,7 +93,7 @@ endif
 head-y				:= arch/m68k/kernel/head.o
 head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
 head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
-head-$(CONFIG_M68000)		:= arch/m68k/platform/68000/head.o
+head-$(CONFIG_M68000)		:= arch/m68k/68000/head.o
 head-$(CONFIG_COLDFIRE)		:= arch/m68k/coldfire/head.o
 
 core-y				+= arch/m68k/kernel/	arch/m68k/mm/
@@ -115,7 +115,7 @@ core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
 core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
 core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
 core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
-core-$(CONFIG_M68000)		+= arch/m68k/platform/68000/
+core-$(CONFIG_M68000)		+= arch/m68k/68000/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/coldfire/
 
 
-- 
1.9.1
