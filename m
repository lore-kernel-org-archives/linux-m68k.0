From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] m68k{nommu}: fixups after the header move
Date: Tue, 20 Jan 2009 17:50:51 -0800
Message-ID: <1232502651.9701.0.camel@brick>
References: <200901210058.n0L0wjdf005545@localhost.localdomain>
	 <1232502275.5653.2.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1232502275.5653.2.camel@brick>
Sender: linux-kbuild-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: torvalds@linux-foundation.org, arnd@arndb.de, gerg@uclinux.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, sam@ravnborg.org, uclinux-dev@uclinux.org, zippel@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

swab.h seems to have been missed during the header merge.
Add conditionals similar to byteorder.h and remove the
now unnecessary byteorder_no/mm.h

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
 arch/m68k/include/asm/byteorder.h    |   11 ++++++-----
 arch/m68k/include/asm/byteorder_mm.h |    6 ------
 arch/m68k/include/asm/byteorder_no.h |    6 ------
 arch/m68k/include/asm/swab.h         |    5 +++++
 4 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/include/asm/byteorder.h b/arch/m68k/include/asm/byteorder.h
index f20502a..31b260a 100644
--- a/arch/m68k/include/asm/byteorder.h
+++ b/arch/m68k/include/asm/byteorder.h
@@ -1,5 +1,6 @@
-#ifdef __uClinux__
-#include "byteorder_no.h"
-#else
-#include "byteorder_mm.h"
-#endif
+#ifndef _M68K_BYTEORDER_H
+#define _M68K_BYTEORDER_H
+
+#include <linux/byteorder/big_endian.h>
+
+#endif /* _M68K_BYTEORDER_H */
diff --git a/arch/m68k/include/asm/byteorder_mm.h b/arch/m68k/include/asm/byteorder_mm.h
deleted file mode 100644
index 31b260a..0000000
--- a/arch/m68k/include/asm/byteorder_mm.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _M68K_BYTEORDER_H
-#define _M68K_BYTEORDER_H
-
-#include <linux/byteorder/big_endian.h>
-
-#endif /* _M68K_BYTEORDER_H */
diff --git a/arch/m68k/include/asm/byteorder_no.h b/arch/m68k/include/asm/byteorder_no.h
deleted file mode 100644
index 9c6c76a..0000000
--- a/arch/m68k/include/asm/byteorder_no.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _M68KNOMMU_BYTEORDER_H
-#define _M68KNOMMU_BYTEORDER_H
-
-#include <linux/byteorder/big_endian.h>
-
-#endif /* _M68KNOMMU_BYTEORDER_H */
diff --git a/arch/m68k/include/asm/swab.h b/arch/m68k/include/asm/swab.h
index e69de29..7d7dde1 100644
--- a/arch/m68k/include/asm/swab.h
+++ b/arch/m68k/include/asm/swab.h
@@ -0,0 +1,5 @@
+#ifdef __uClinux__
+#include "swab_no.h"
+#else
+#include "swab_mm.h"
+#endif
-- 
1.6.1.249.g455e5



