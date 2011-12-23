From: <gerg@snapgear.com>
Subject: [PATCH 25/35] m68k: compile appropriate mm arch files for ColdFire MMU support
Date: Fri, 23 Dec 2011 13:15:38 +1000
Message-ID: <1324610148-20666-26-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39282 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756385Ab1LWDPI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:15:08 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Create a config symbol to enable when using a ColdFire MMU. We then
use that to only compile the necessary arch mm files.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/Kconfig     |    5 ++++-
 arch/m68k/mm/Makefile |    8 +++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 5f860cf..330eb88 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,9 +88,12 @@ config MMU
 config MMU_MOTOROLA
 	bool
 
+config MMU_COLDFIRE
+	bool
+
 config MMU_SUN3
 	bool
-	depends on MMU && !MMU_MOTOROLA
+	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
 menu "Platform setup"
 
diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
index 09cadf1..cfbf320 100644
--- a/arch/m68k/mm/Makefile
+++ b/arch/m68k/mm/Makefile
@@ -4,6 +4,8 @@
 
 obj-y	:= init.o
 
-obj-$(CONFIG_MMU)		+= cache.o fault.o hwtest.o
-obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
-obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o
+obj-$(CONFIG_MMU)		+= cache.o fault.o
+obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o hwtest.o
+obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o hwtest.o
+obj-$(CONFIG_MMU_COLDFIRE)	+= kmap.o memory.o mcfmmu.o
+
-- 
1.7.0.4
