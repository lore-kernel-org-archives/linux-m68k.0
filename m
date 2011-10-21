From: <gerg@snapgear.com>
Subject: [PATCH] m68k: use of 64 div instruction is chip specific
Date: Fri, 21 Oct 2011 17:08:05 +1000
Message-ID: <1319180885-11145-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37546 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586Ab1JUHOb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:14:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The use of the 64 div instruction should not be based on whether we
are running MMU enabled or not. It is chip specific. The original
68000 family and the ColdFire CPU family do not support it, the
other 680x0 CPU varients do. So make the conditional check based on
that, not CONFIG_MMU.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/div64.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/div64.h
index edb6614..7265e40 100644
--- a/arch/m68k/include/asm/div64.h
+++ b/arch/m68k/include/asm/div64.h
@@ -1,7 +1,9 @@
 #ifndef _M68K_DIV64_H
 #define _M68K_DIV64_H
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+#include <asm-generic/div64.h>
+#else
 
 #include <linux/types.h>
 
@@ -27,8 +29,6 @@
 	__rem;							\
 })
 
-#else
-#include <asm-generic/div64.h>
-#endif /* CONFIG_MMU */
+#endif /* CONFIG_M68000 || CONFIG_COLDFIRE */
 
 #endif /* _M68K_DIV64_H */
-- 
1.7.0.4
