From: sfking@fdwdc.com
Subject: [RFC 08/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:58 -0700
Message-ID: <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34403 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758942AbZIGFrG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:06 -0400
In-Reply-To: <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/m68k_ksyms.c                      |   21 ++++---------------
 arch/m68k/kernel/{m68k_ksyms.c => m68k_ksyms_mm.c} |    0 
 .../m68k_ksyms.c => m68k/kernel/m68k_ksyms_no.c}   |    0 
 3 files changed, 5 insertions(+), 16 deletions(-)
 copy arch/m68k/kernel/{m68k_ksyms.c => m68k_ksyms_mm.c} (100%)
 copy arch/{m68knommu/kernel/m68k_ksyms.c => m68k/kernel/m68k_ksyms_no.c} (100%)

diff --git a/arch/m68k/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms.c
index d900e77..4752c28 100644
--- a/arch/m68k/kernel/m68k_ksyms.c
+++ b/arch/m68k/kernel/m68k_ksyms.c
@@ -1,16 +1,5 @@
-#include <linux/module.h>
-
-asmlinkage long long __ashldi3 (long long, int);
-asmlinkage long long __ashrdi3 (long long, int);
-asmlinkage long long __lshrdi3 (long long, int);
-asmlinkage long long __muldi3 (long long, long long);
-
-/* The following are special because they're not called
-   explicitly (the C compiler generates them).  Fortunately,
-   their interface isn't gonna change any time soon now, so
-   it's OK to leave it out of version control.  */
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__muldi3);
-
+#ifdef CONFIG_MMU
+#include "m68k_ksyms_mm.c"
+#else
+#include "m68k_ksyms_no.c"
+#endif
diff --git a/arch/m68k/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms_mm.c
similarity index 100%
copy from arch/m68k/kernel/m68k_ksyms.c
copy to arch/m68k/kernel/m68k_ksyms_mm.c
diff --git a/arch/m68knommu/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms_no.c
similarity index 100%
copy from arch/m68knommu/kernel/m68k_ksyms.c
copy to arch/m68k/kernel/m68k_ksyms_no.c
-- 
1.5.6.5

