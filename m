Return-Path: <SRS0=X0A7=CS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF42EC43461
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 02:18:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F63920936
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 02:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgIICSv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 22:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgIICSu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 8 Sep 2020 22:18:50 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 584F32080C;
        Wed,  9 Sep 2020 02:18:47 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     hch@lst.de, geert@linux-m68k.org, arnd@arndb.de,
        Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: switch to using asm-generic/uaccess.h
Date:   Wed,  9 Sep 2020 12:18:31 +1000
Message-Id: <20200909021831.1881990-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Switch to using the asm-generic/uaccess functions for non-MMU builds.
Remove all the m68knommu local specific uaccess defines and macros.

There is nothing so special about the m68knommu targets that they cannot
use all of the asm-generic uaccess support. Using the asm-generic
uaccess definitions also resolves some of the existing problems with
missing __user annotations in the m68knommu specific functions.

The elimination of all of the contents of uaccess_no.h means we can fold
the uaccess_mm.h back into uaccess.h - and just have the single file
now.

The resulting generated code ends up being slightly smaller (by a few
hundred bytes) due to the compilers ability to better optimize load
and stores without forcing its hand with asm statements.

Specifically trivial cases like this contrived example:

    get_user(x, ptr);
    x++;
    put_user(x, ptr);

end up now being optimized to a single instruction on m68k. More
generally the compiler can avoid using a temporary register in many
cases as well.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig                             |   1 +
 .../include/asm/{uaccess_mm.h => uaccess.h}   |   7 +
 arch/m68k/include/asm/uaccess_no.h            | 160 ------------------
 3 files changed, 8 insertions(+), 160 deletions(-)
 rename arch/m68k/include/asm/{uaccess_mm.h => uaccess.h} (98%)
 delete mode 100644 arch/m68k/include/asm/uaccess_no.h

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6f2f38d05772..aefffebc0afa 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -24,6 +24,7 @@ config M68K
 	select GENERIC_IOMAP
 	select GENERIC_STRNCPY_FROM_USER if MMU
 	select GENERIC_STRNLEN_USER if MMU
+	select UACCESS_MEMCPY if !MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/m68k/include/asm/uaccess_mm.h b/arch/m68k/include/asm/uaccess.h
similarity index 98%
rename from arch/m68k/include/asm/uaccess_mm.h
rename to arch/m68k/include/asm/uaccess.h
index 9ae9f8d05925..f98208ccbbcd 100644
--- a/arch/m68k/include/asm/uaccess_mm.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -2,12 +2,15 @@
 #ifndef __M68K_UACCESS_H
 #define __M68K_UACCESS_H
 
+#ifdef CONFIG_MMU
+
 /*
  * User space memory access functions
  */
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include <asm/segment.h>
+#include <asm/extable.h>
 
 /* We let the MMU do all checking */
 static inline int access_ok(const void __user *addr,
@@ -387,4 +390,8 @@ unsigned long __clear_user(void __user *to, unsigned long n);
 
 #define clear_user	__clear_user
 
+#else /* !CONFIG_MMU */
+#include <asm-generic/uaccess.h>
+#endif
+
 #endif /* _M68K_UACCESS_H */
diff --git a/arch/m68k/include/asm/uaccess_no.h b/arch/m68k/include/asm/uaccess_no.h
deleted file mode 100644
index dcfb69361408..000000000000
--- a/arch/m68k/include/asm/uaccess_no.h
+++ /dev/null
@@ -1,160 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __M68KNOMMU_UACCESS_H
-#define __M68KNOMMU_UACCESS_H
-
-/*
- * User space memory access functions
- */
-#include <linux/string.h>
-
-#include <asm/segment.h>
-
-#define access_ok(addr,size)	_access_ok((unsigned long)(addr),(size))
-
-/*
- * It is not enough to just have access_ok check for a real RAM address.
- * This would disallow the case of code/ro-data running XIP in flash/rom.
- * Ideally we would check the possible flash ranges too, but that is
- * currently not so easy.
- */
-static inline int _access_ok(unsigned long addr, unsigned long size)
-{
-	return 1;
-}
-
-/*
- * These are the main single-value transfer routines.  They automatically
- * use the right size if we just have the right pointer type.
- */
-
-#define put_user(x, ptr)				\
-({							\
-    int __pu_err = 0;					\
-    typeof(*(ptr)) __pu_val = (x);			\
-    switch (sizeof (*(ptr))) {				\
-    case 1:						\
-	__put_user_asm(__pu_err, __pu_val, ptr, b);	\
-	break;						\
-    case 2:						\
-	__put_user_asm(__pu_err, __pu_val, ptr, w);	\
-	break;						\
-    case 4:						\
-	__put_user_asm(__pu_err, __pu_val, ptr, l);	\
-	break;						\
-    case 8:						\
-	memcpy((void __force *)ptr, &__pu_val, sizeof(*(ptr))); \
-	break;						\
-    default:						\
-	__pu_err = __put_user_bad();			\
-	break;						\
-    }							\
-    __pu_err;						\
-})
-#define __put_user(x, ptr) put_user(x, ptr)
-
-extern int __put_user_bad(void);
-
-/*
- * Tell gcc we read from memory instead of writing: this is because
- * we do not write to any memory gcc knows about, so there are no
- * aliasing issues.
- */
-
-#define __ptr(x) ((unsigned long __user *)(x))
-
-#define __put_user_asm(err,x,ptr,bwl)				\
-	__asm__ ("move" #bwl " %0,%1"				\
-		: /* no outputs */						\
-		:"d" (x),"m" (*__ptr(ptr)) : "memory")
-
-#define get_user(x, ptr)					\
-({								\
-    int __gu_err = 0;						\
-    switch (sizeof(*(ptr))) {					\
-    case 1:							\
-	__get_user_asm(__gu_err, x, ptr, b, "=d");		\
-	break;							\
-    case 2:							\
-	__get_user_asm(__gu_err, x, ptr, w, "=r");		\
-	break;							\
-    case 4:							\
-	__get_user_asm(__gu_err, x, ptr, l, "=r");		\
-	break;							\
-    case 8: {							\
-	union {							\
-	    u64 l;						\
-	    __typeof__(*(ptr)) t;				\
-	} __gu_val;						\
-	memcpy(&__gu_val.l, (const void __force *)ptr, sizeof(__gu_val.l)); \
-	(x) = __gu_val.t;					\
-	break;							\
-    }								\
-    default:							\
-	__gu_err = __get_user_bad();				\
-	break;							\
-    }								\
-    __gu_err;							\
-})
-#define __get_user(x, ptr) get_user(x, ptr)
-
-extern int __get_user_bad(void);
-
-#define __get_user_asm(err,x,ptr,bwl,reg)			\
-	__asm__ ("move" #bwl " %1,%0"				\
-		 : "=d" (x)					\
-		 : "m" (*__ptr(ptr)))
-
-static inline unsigned long
-raw_copy_from_user(void *to, const void __user *from, unsigned long n)
-{
-	memcpy(to, (__force const void *)from, n);
-	return 0;
-}
-
-static inline unsigned long
-raw_copy_to_user(void __user *to, const void *from, unsigned long n)
-{
-	memcpy((__force void *)to, from, n);
-	return 0;
-}
-#define INLINE_COPY_FROM_USER
-#define INLINE_COPY_TO_USER
-
-/*
- * Copy a null terminated string from userspace.
- */
-
-static inline long
-strncpy_from_user(char *dst, const char *src, long count)
-{
-	char *tmp;
-	strncpy(dst, src, count);
-	for (tmp = dst; *tmp && count > 0; tmp++, count--)
-		;
-	return(tmp - dst); /* DAVIDM should we count a NUL ?  check getname */
-}
-
-/*
- * Return the size of a string (including the ending 0)
- *
- * Return 0 on exception, a value greater than N if too long
- */
-static inline long strnlen_user(const char *src, long n)
-{
-	return(strlen(src) + 1); /* DAVIDM make safer */
-}
-
-/*
- * Zero Userspace
- */
-
-static inline unsigned long
-__clear_user(void *to, unsigned long n)
-{
-	memset(to, 0, n);
-	return 0;
-}
-
-#define	clear_user(to,n)	__clear_user(to,n)
-
-#endif /* _M68KNOMMU_UACCESS_H */
-- 
2.25.1

