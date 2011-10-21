From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: move definition of mach_gettod to where it is used
Date: Fri, 21 Oct 2011 17:07:14 +1000
Message-ID: <1319180834-11085-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53352 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124Ab1JUHH1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:07:27 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The mach_gettod function pointer is only called from the time_no.c
code. So move its actual definition to there too. It is currently in
setup_no.c for no particularly good reason.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/setup_no.c |    1 -
 arch/m68k/kernel/time_no.c  |    3 +++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 2ed8c0f..ca3df0d 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -47,7 +47,6 @@ EXPORT_SYMBOL(memory_end);
 char __initdata command_line[COMMAND_LINE_SIZE];
 
 /* machine dependent timer functions */
-void (*mach_gettod)(int*, int*, int*, int*, int*, int*);
 int (*mach_set_clock_mmss)(unsigned long);
 
 /* machine dependent reboot functions */
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
index 6623909..3ef0f77 100644
--- a/arch/m68k/kernel/time_no.c
+++ b/arch/m68k/kernel/time_no.c
@@ -26,6 +26,9 @@
 
 #define	TICK_SIZE (tick_nsec / 1000)
 
+/* machine dependent timer functions */
+void (*mach_gettod)(int*, int*, int*, int*, int*, int*);
+
 static inline int set_rtc_mmss(unsigned long nowtime)
 {
 	if (mach_set_clock_mmss)
-- 
1.7.0.4
