From: <gerg@snapgear.com>
Subject: [PATCH 24/36] m68k: compile appropriate mm arch files for ColdFire V4e MMU support
Date: Tue, 25 Oct 2011 17:19:16 +1000
Message-ID: <1319527168-11166-25-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25223 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754817Ab1JYHVP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:15 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Compile the mcfmmu.c code when the ColdFire V4e MMU is enabled.
And don't compile the unnecessary hwtest.c code for it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/Makefile |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
index 09cadf1..1732e31 100644
--- a/arch/m68k/mm/Makefile
+++ b/arch/m68k/mm/Makefile
@@ -4,6 +4,12 @@
 
 obj-y	:= init.o
 
-obj-$(CONFIG_MMU)		+= cache.o fault.o hwtest.o
+obj-$(CONFIG_MMU)		+= cache.o fault.o
 obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
 obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o
+
+ifdef CONFIG_COLDFIRE
+obj-$(CONFIG_MMU)		+= kmap.o memory.o mcfmmu.o
+else
+obj-$(CONFIG_MMU)		+= hwtest.o
+endif
-- 
1.7.0.4
