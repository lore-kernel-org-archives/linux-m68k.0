From: <gerg@snapgear.com>
Subject: [PATCH 33/35] m68k: do not use m68k startup or interrupt code for ColdFire CPU's
Date: Fri, 23 Dec 2011 13:15:46 +1000
Message-ID: <1324610148-20666-34-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39325 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756318Ab1LWDQD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:16:03 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire CPUs have their own startup and interrupt code (in the
platform/coldfire directory), and do not use the general m68k startup
and interrupt code. So if CONFIG_COLDFIRE is true do not compile the
general code for them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index ea0a396..a327816 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -4,13 +4,15 @@
 
 extra-$(CONFIG_MMU)	:= head.o
 extra-$(CONFIG_SUN3)	:= sun3-head.o
+extra-$(CONFIG_COLDFIRE):=
 extra-y			+= vmlinux.lds
 
 obj-y	:= entry.o init_task.o irq.o m68k_ksyms.o module.o process.o ptrace.o
 obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 
+ifndef CONFIG_COLDFIRE
 obj-$(CONFIG_MMU)	+= ints.o vectors.o
-
+endif
 ifndef CONFIG_MMU_SUN3
 obj-y			+= dma.o
 endif
-- 
1.7.0.4
