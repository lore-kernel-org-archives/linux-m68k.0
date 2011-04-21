From: <gerg@snapgear.com>
Subject: [PATCH 3/5] m68knommu: move EXPORT of kernel_thread to function definition
Date: Thu, 21 Apr 2011 10:48:08 +1000
Message-ID: <1303346890-28249-4-git-send-email-gerg@snapgear.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
 <1303346890-28249-2-git-send-email-gerg@snapgear.com>
 <1303346890-28249-3-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:19432 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab1DUAur (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:50:47 -0400
In-Reply-To: <1303346890-28249-3-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The EXPORT_SYMBOL(kernel_thread) belongs at the definition of that function,
not in some other random code file. So move it there.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c |    4 ----
 arch/m68k/kernel/process_no.c    |    1 +
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index daed932..11effaa 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -16,10 +16,6 @@
 #include <asm/checksum.h>
 #include <asm/current.h>
 
-/* platform dependent support */
-
-EXPORT_SYMBOL(kernel_thread);
-
 /*
  * libgcc functions - functions that are used internally by the
  * compiler...  (prototypes are not correct though, but that
diff --git a/arch/m68k/kernel/process_no.c b/arch/m68k/kernel/process_no.c
index eedadc2..9b86ad1 100644
--- a/arch/m68k/kernel/process_no.c
+++ b/arch/m68k/kernel/process_no.c
@@ -151,6 +151,7 @@ int kernel_thread(int (*fn)(void *), void * arg, unsigned long flags)
 	set_fs(fs);
 	return retval;
 }
+EXPORT_SYMBOL(kernel_thread);
 
 void flush_thread(void)
 {
-- 
1.7.0.4
