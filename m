From: <gerg@snapgear.com>
Subject: [PATCH 15/36] m68k: add TLB flush support for the ColdFire V4e MMU hardware
Date: Tue, 25 Oct 2011 17:19:07 +1000
Message-ID: <1319527168-11166-16-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25210 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559Ab1JYHVK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:10 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire V4e MMU is unlike any of the other m68k MMU hardware.
It needs is own TLB flush support code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/tlbflush.h |   23 +++++++++++++++++------
 1 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index a6b4ed4..965ea35 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -5,10 +5,13 @@
 #ifndef CONFIG_SUN3
 
 #include <asm/current.h>
+#include <asm/mcfmmu.h>
 
 static inline void flush_tlb_kernel_page(void *addr)
 {
-	if (CPU_IS_040_OR_060) {
+	if (CPU_IS_COLDFIRE) {
+		mmu_write(MMUOR, MMUOR_CNL);
+	} else if (CPU_IS_040_OR_060) {
 		mm_segment_t old_fs = get_fs();
 		set_fs(KERNEL_DS);
 		__asm__ __volatile__(".chip 68040\n\t"
@@ -25,12 +28,15 @@ static inline void flush_tlb_kernel_page(void *addr)
  */
 static inline void __flush_tlb(void)
 {
-	if (CPU_IS_040_OR_060)
+	if (CPU_IS_COLDFIRE) {
+		mmu_write(MMUOR, MMUOR_CNL);
+	} else if (CPU_IS_040_OR_060) {
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflushan\n\t"
 				     ".chip 68k");
-	else if (CPU_IS_020_OR_030)
+	} else if (CPU_IS_020_OR_030) {
 		__asm__ __volatile__("pflush #0,#4");
+	}
 }
 
 static inline void __flush_tlb040_one(unsigned long addr)
@@ -43,7 +49,9 @@ static inline void __flush_tlb040_one(unsigned long addr)
 
 static inline void __flush_tlb_one(unsigned long addr)
 {
-	if (CPU_IS_040_OR_060)
+	if (CPU_IS_COLDFIRE)
+		mmu_write(MMUOR, MMUOR_CNL);
+	else if (CPU_IS_040_OR_060)
 		__flush_tlb040_one(addr);
 	else if (CPU_IS_020_OR_030)
 		__asm__ __volatile__("pflush #0,#4,(%0)" : : "a" (addr));
@@ -56,12 +64,15 @@ static inline void __flush_tlb_one(unsigned long addr)
  */
 static inline void flush_tlb_all(void)
 {
-	if (CPU_IS_040_OR_060)
+	if (CPU_IS_COLDFIRE) {
+		mmu_write(MMUOR, MMUOR_CNL);
+	} else if (CPU_IS_040_OR_060) {
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflusha\n\t"
 				     ".chip 68k");
-	else if (CPU_IS_020_OR_030)
+	} else if (CPU_IS_020_OR_030) {
 		__asm__ __volatile__("pflusha");
+	}
 }
 
 static inline void flush_tlb_mm(struct mm_struct *mm)
-- 
1.7.0.4
