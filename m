From: <gerg@snapgear.com>
Subject: [PATCH 2/5] m68knommu: move EXPORT of local checksumming functions to definitions
Date: Thu, 21 Apr 2011 10:48:07 +1000
Message-ID: <1303346890-28249-3-git-send-email-gerg@snapgear.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
 <1303346890-28249-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:19446 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab1DUAvE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:51:04 -0400
In-Reply-To: <1303346890-28249-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The EXPORT_SYMBOL() of the local lib checksum functions belongs with
the definitions, not in some other random code file. So move then there.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c |    5 -----
 arch/m68k/lib/checksum_no.c      |    3 +++
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index ab747e4..daed932 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -18,13 +18,8 @@
 
 /* platform dependent support */
 
-EXPORT_SYMBOL(ip_fast_csum);
-
 EXPORT_SYMBOL(kernel_thread);
 
-/* Networking helper routines. */
-EXPORT_SYMBOL(csum_partial_copy_nocheck);
-
 /*
  * libgcc functions - functions that are used internally by the
  * compiler...  (prototypes are not correct though, but that
diff --git a/arch/m68k/lib/checksum_no.c b/arch/m68k/lib/checksum_no.c
index eccf25d..e4c6354 100644
--- a/arch/m68k/lib/checksum_no.c
+++ b/arch/m68k/lib/checksum_no.c
@@ -101,6 +101,7 @@ __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
 	return (__force __sum16)~do_csum(iph,ihl*4);
 }
+EXPORT_SYMBOL(ip_fast_csum);
 #endif
 
 /*
@@ -140,6 +141,7 @@ csum_partial_copy_from_user(const void __user *src, void *dst,
 	memcpy(dst, (__force const void *)src, len);
 	return csum_partial(dst, len, sum);
 }
+EXPORT_SYMBOL(csum_partial_copy_from_user);
 
 /*
  * copy from ds while checksumming, otherwise like csum_partial
@@ -151,3 +153,4 @@ csum_partial_copy_nocheck(const void *src, void *dst, int len, __wsum sum)
 	memcpy(dst, src, len);
 	return csum_partial(dst, len, sum);
 }
+EXPORT_SYMBOL(csum_partial_copy_nocheck);
-- 
1.7.0.4
