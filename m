From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 3/5] m68knommu: move EXPORT of kernel_thread to function definition
Date: Fri, 8 Apr 2011 22:17:00 +1000
Message-ID: <1302265022-6614-4-git-send-email-gerg@uclinux.org>
References: <1302265022-6614-1-git-send-email-gerg@uclinux.org>
 <1302265022-6614-2-git-send-email-gerg@uclinux.org>
 <1302265022-6614-3-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54174 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756166Ab1DHM2D (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Apr 2011 08:28:03 -0400
In-Reply-To: <1302265022-6614-3-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

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
