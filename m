From: Tim Abbott <tabbott@ksplice.com>
Subject: [PATCH v2 1/2] m68k: Make thread_info.h usable from assembly.
Date: Wed, 16 Sep 2009 12:44:25 -0400
Message-ID: <1253119466-19488-2-git-send-email-tabbott@ksplice.com>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from BISCAYNE-ONE-STATION.MIT.EDU ([18.7.7.80]:42448 "EHLO
	biscayne-one-station.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759815AbZIPQr2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 16 Sep 2009 12:47:28 -0400
In-Reply-To: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Tim Abbott <tabbott@ksplice.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>

Signed-off-by: Tim Abbott <tabbott@ksplice.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 arch/m68k/include/asm/thread_info_mm.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/include/asm/thread_info_mm.h
index b6da388..5f36cf1 100644
--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info_mm.h
@@ -8,6 +8,7 @@
 #include <asm/types.h>
 #include <asm/page.h>
 
+#ifndef __ASSEMBLY__
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
@@ -16,6 +17,7 @@ struct thread_info {
 	__u32 cpu; /* should always be 0 on m68k */
 	struct restart_block    restart_block;
 };
+#endif /* __ASSEMBLY__ */
 
 #define PREEMPT_ACTIVE		0x4000000
 
-- 
1.6.3.3

