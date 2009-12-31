From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] M68K: Simplify param.h by using <asm-generic/param.h>
Date: Thu, 31 Dec 2009 15:35:44 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0912311534590.6952@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux M68K mailing list <linux-m68k@lists.linux-m68k.org>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/arch/m68k/include/asm/param.h b/arch/m68k/include/asm/param.h
index 85c41b7..36265cc 100644
--- a/arch/m68k/include/asm/param.h
+++ b/arch/m68k/include/asm/param.h
@@ -1,26 +1,12 @@
 #ifndef _M68K_PARAM_H
 #define _M68K_PARAM_H

-#ifdef __KERNEL__
-# define HZ		CONFIG_HZ	/* Internal kernel timer frequency */
-# define USER_HZ	100		/* .. some user interfaces are in "ticks" */
-# define CLOCKS_PER_SEC	(USER_HZ)	/* like times() */
-#endif
-
-#ifndef HZ
-#define HZ 100
-#endif
-
 #ifdef __uClinux__
 #define EXEC_PAGESIZE	4096
 #else
 #define EXEC_PAGESIZE	8192
 #endif

-#ifndef NOGROUP
-#define NOGROUP		(-1)
-#endif
-
-#define MAXHOSTNAMELEN	64	/* max length of hostname */
+#include <asm-generic/param.h>

 #endif /* _M68K_PARAM_H */

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
