From: "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>
Subject: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Fri, 9 Aug 2013 21:26:12 +0000
Message-ID: <201308092135.r79LZwL1013105@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:23500 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031224Ab3HIVq3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Aug 2013 17:46:29 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r79LeKKT025180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Fri, 9 Aug 2013 21:40:25 GMT
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

Authors: Michael Schmitz, Geert Uytterhoeven
Source: http://thread.gmane.org/gmane.linux.debian.devel.kernel/91476/focus=5003
Tested-By: Thorsten Glaser <tg@debian.org>
---
 arch/m68k/include/asm/irqflags.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/irqflags.h b/arch/m68k/include/asm/irqflags.h
index 7ef4115..5053092 100644
--- a/arch/m68k/include/asm/irqflags.h
+++ b/arch/m68k/include/asm/irqflags.h
@@ -67,6 +67,10 @@ static inline void arch_local_irq_restore(unsigned long flags)
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
+	if (MACH_IS_ATARI) {
+		/* Ignore HSYNC = ipl 2 on Atari */
+		return (flags & ~(ALLOWINT | 0x200)) != 0;
+	}
 	return (flags & ~ALLOWINT) != 0;
 }
 
-- 
1.7.9
