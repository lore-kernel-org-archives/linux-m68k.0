From: Gideon Israel Dsouza <gidisrael@gmail.com>
Subject: [PATCH 1/2] compiler-gcc.h: Added a new macro to wrap gcc attribute
Date: Fri, 27 Jan 2017 23:45:00 +0530
Message-ID: <1485540901-1988-2-git-send-email-gidisrael__17749.8092795306$1485541299$gmane$org@gmail.com>
References: <1485540901-1988-1-git-send-email-gidisrael@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1485540901-1988-1-git-send-email-gidisrael@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, gerg@linux-m68k.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, paul.gortmaker@windriver.com
Cc: Gideon Israel Dsouza <gidisrael@gmail.com>

This is resend, I've corrected the mistakes from the last patch.

Added __mode(x) into compiler-gcc.h as part of a cleanup task I've
taken up, to replace gcc specific attributes with macros.

Last accepted patch I sent into linux-next for crypto: d8c34b949d8c:
crypto: Replaced gcc specific attributes with macros from compiler.h

The last commit of this task that went through you: 52f5684c8e1ec
kernel: use macros from compiler.h instead of __attribute__((...))

The next patch is for cleaning up the m68k subsystem and it requires
a new macro to wrap __attribute__ ((mode (...)))

Signed-off-by: Gideon Israel Dsouza <gidisrael@gmail.com>
---
 include/linux/compiler-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 0444b13..980fb35 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -121,6 +121,7 @@
 #define __attribute_const__	__attribute__((__const__))
 #define __maybe_unused		__attribute__((unused))
 #define __always_unused		__attribute__((unused))
+#define __mode(x)               __attribute__((mode(x)))
 
 /* gcc version specific checks */
 
-- 
2.7.4
