From: <gerg@snapgear.com>
Subject: [PATCH 17/36] m68k: ColdFire with MMU does not support separate address spaces
Date: Tue, 25 Oct 2011 17:19:09 +1000
Message-ID: <1319527168-11166-18-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25211 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762Ab1JYHVK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:10 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire V4e implementation with an MMU does not support separate
addresses spaces, or the instructions that are used to access them.
Use the same code for segment get/set as the non-MMU mode.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/segment.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
index ee95921..bb339ca 100644
--- a/arch/m68k/include/asm/segment.h
+++ b/arch/m68k/include/asm/segment.h
@@ -31,7 +31,7 @@ typedef struct {
 
 static inline mm_segment_t get_fs(void)
 {
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 	mm_segment_t _v;
 	__asm__ ("movec %/dfc,%0":"=r" (_v.seg):);
 
@@ -49,7 +49,7 @@ static inline mm_segment_t get_ds(void)
 
 static inline void set_fs(mm_segment_t val)
 {
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
 			      "movec %0,%/dfc\n\t"
 			      : /* no outputs */ : "r" (val.seg) : "memory");
-- 
1.7.0.4
