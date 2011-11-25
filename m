From: <gerg@snapgear.com>
Subject: [PATCH 02/35] m68k: show ColdFire CPU/FPU/MMU type
Date: Fri, 25 Nov 2011 13:40:47 +1000
Message-ID: <1322192480-22822-3-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:16478 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1KYDjB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:01 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Update the show_cpuinfo() code to display info about ColdFire cores.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 55f8f50..52e17d1 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -388,6 +388,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 #define LOOP_CYCLES_68030	(8)
 #define LOOP_CYCLES_68040	(3)
 #define LOOP_CYCLES_68060	(1)
+#define LOOP_CYCLES_COLDFIRE	(2)
 
 	if (CPU_IS_020) {
 		cpu = "68020";
@@ -401,6 +402,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	} else if (CPU_IS_060) {
 		cpu = "68060";
 		clockfactor = LOOP_CYCLES_68060;
+	} else if (CPU_IS_COLDFIRE) {
+		cpu = "ColdFire";
+		clockfactor = LOOP_CYCLES_COLDFIRE;
 	} else {
 		cpu = "680x0";
 		clockfactor = 0;
@@ -419,6 +423,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		fpu = "68060";
 	else if (m68k_fputype & FPU_SUNFPA)
 		fpu = "Sun FPA";
+	else if (m68k_fputype & FPU_COLDFIRE)
+		fpu = "ColdFire";
 	else
 		fpu = "none";
 #endif
@@ -435,6 +441,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		mmu = "Sun-3";
 	else if (m68k_mmutype & MMU_APOLLO)
 		mmu = "Apollo";
+	else if (m68k_mmutype & MMU_COLDFIRE)
+		mmu = "ColdFire";
 	else
 		mmu = "unknown";
 
-- 
1.7.0.4
