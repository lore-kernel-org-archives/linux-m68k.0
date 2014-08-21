From: gerg@uclinux.org
Subject: [PATCH 2/4] m68k: move non-mmu 68360 platform code
Date: Thu, 21 Aug 2014 23:24:14 +1000
Message-ID: <1408627456-26718-2-git-send-email-gerg@uclinux.org>
References: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas02p.mx.bigpond.com ([61.9.189.140]:34870 "EHLO
	nschwmtas02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755305AbaHUNYR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Aug 2014 09:24:17 -0400
In-Reply-To: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-mmu 68360 specific code is inconsistently placed under a directory
named "platform". Move it to arch/m68k/ along with the other platform and
board directories.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/{platform => }/68360/Makefile   | 0
 arch/m68k/{platform => }/68360/commproc.c | 0
 arch/m68k/{platform => }/68360/config.c   | 0
 arch/m68k/{platform => }/68360/entry.S    | 0
 arch/m68k/{platform => }/68360/head-ram.S | 0
 arch/m68k/{platform => }/68360/head-rom.S | 0
 arch/m68k/{platform => }/68360/ints.c     | 0
 arch/m68k/Makefile                        | 4 ++--
 8 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/m68k/{platform => }/68360/Makefile (100%)
 rename arch/m68k/{platform => }/68360/commproc.c (100%)
 rename arch/m68k/{platform => }/68360/config.c (100%)
 rename arch/m68k/{platform => }/68360/entry.S (100%)
 rename arch/m68k/{platform => }/68360/head-ram.S (100%)
 rename arch/m68k/{platform => }/68360/head-rom.S (100%)
 rename arch/m68k/{platform => }/68360/ints.c (100%)

diff --git a/arch/m68k/platform/68360/Makefile b/arch/m68k/68360/Makefile
similarity index 100%
rename from arch/m68k/platform/68360/Makefile
rename to arch/m68k/68360/Makefile
diff --git a/arch/m68k/platform/68360/commproc.c b/arch/m68k/68360/commproc.c
similarity index 100%
rename from arch/m68k/platform/68360/commproc.c
rename to arch/m68k/68360/commproc.c
diff --git a/arch/m68k/platform/68360/config.c b/arch/m68k/68360/config.c
similarity index 100%
rename from arch/m68k/platform/68360/config.c
rename to arch/m68k/68360/config.c
diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/68360/entry.S
similarity index 100%
rename from arch/m68k/platform/68360/entry.S
rename to arch/m68k/68360/entry.S
diff --git a/arch/m68k/platform/68360/head-ram.S b/arch/m68k/68360/head-ram.S
similarity index 100%
rename from arch/m68k/platform/68360/head-ram.S
rename to arch/m68k/68360/head-ram.S
diff --git a/arch/m68k/platform/68360/head-rom.S b/arch/m68k/68360/head-rom.S
similarity index 100%
rename from arch/m68k/platform/68360/head-rom.S
rename to arch/m68k/68360/head-rom.S
diff --git a/arch/m68k/platform/68360/ints.c b/arch/m68k/68360/ints.c
similarity index 100%
rename from arch/m68k/platform/68360/ints.c
rename to arch/m68k/68360/ints.c
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index dd96fc2..0b29dcf 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -92,7 +92,7 @@ endif
 #
 head-y				:= arch/m68k/kernel/head.o
 head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
-head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
+head-$(CONFIG_M68360)		:= arch/m68k/68360/head.o
 head-$(CONFIG_M68000)		:= arch/m68k/68000/head.o
 head-$(CONFIG_COLDFIRE)		:= arch/m68k/coldfire/head.o
 
@@ -114,7 +114,7 @@ core-$(CONFIG_NATFEAT)		+= arch/m68k/emu/
 core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
 core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
 core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
-core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
+core-$(CONFIG_M68360)		+= arch/m68k/68360/
 core-$(CONFIG_M68000)		+= arch/m68k/68000/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/coldfire/
 
-- 
1.9.1
