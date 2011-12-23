From: <gerg@snapgear.com>
Subject: [PATCH 02/35] m68k: show ColdFire CPU/FPU/MMU type
Date: Fri, 23 Dec 2011 13:15:15 +1000
Message-ID: <1324610148-20666-3-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22240 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756288Ab1LWDOd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:33 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Update the show_cpuinfo() code to display info about ColdFire cores.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
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
