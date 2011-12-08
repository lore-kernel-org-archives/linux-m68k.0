From: <gerg@snapgear.com>
Subject: [PATCH] m68k: consolidate the vmlinux.lds linker scripts
Date: Thu, 8 Dec 2011 16:34:01 +1000
Message-ID: <1323326041-16077-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25048 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab1LHGeB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Dec 2011 01:34:01 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The merge of m68knommu left the linker scripts a little disorganized.
Some consistent naming and squashing two of scripts that just include
others can simplify things a lot.

So merge the two simple including scripts, and rename the nommu script
to be consistent with the existing m68k linker scripts.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 .../kernel/{vmlinux.lds_no.S => vmlinux-nommu.lds} |    0
 arch/m68k/kernel/vmlinux.lds.S                     |   13 +++++++++++--
 arch/m68k/kernel/vmlinux.lds_mm.S                  |   10 ----------
 3 files changed, 11 insertions(+), 12 deletions(-)
 rename arch/m68k/kernel/{vmlinux.lds_no.S => vmlinux-nommu.lds} (100%)
 delete mode 100644 arch/m68k/kernel/vmlinux.lds_mm.S

diff --git a/arch/m68k/kernel/vmlinux.lds_no.S b/arch/m68k/kernel/vmlinux-nommu.lds
similarity index 100%
rename from arch/m68k/kernel/vmlinux.lds_no.S
rename to arch/m68k/kernel/vmlinux-nommu.lds
diff --git a/arch/m68k/kernel/vmlinux.lds.S b/arch/m68k/kernel/vmlinux.lds.S
index 030dabf..3d99a04 100644
--- a/arch/m68k/kernel/vmlinux.lds.S
+++ b/arch/m68k/kernel/vmlinux.lds.S
@@ -1,5 +1,14 @@
 #ifdef CONFIG_MMU
-#include "vmlinux.lds_mm.S"
+PHDRS
+{
+  text PT_LOAD FILEHDR PHDRS FLAGS (7);
+  data PT_LOAD FLAGS (7);
+}
+#ifdef CONFIG_SUN3
+#include "vmlinux-sun3.lds"
 #else
-#include "vmlinux.lds_no.S"
+#include "vmlinux-std.lds"
+#endif
+#else
+#include "vmlinux-nommu.lds"
 #endif
diff --git a/arch/m68k/kernel/vmlinux.lds_mm.S b/arch/m68k/kernel/vmlinux.lds_mm.S
deleted file mode 100644
index 99ba315..0000000
--- a/arch/m68k/kernel/vmlinux.lds_mm.S
+++ /dev/null
@@ -1,10 +0,0 @@
-PHDRS
-{
-  text PT_LOAD FILEHDR PHDRS FLAGS (7);
-  data PT_LOAD FLAGS (7);
-}
-#ifdef CONFIG_SUN3
-#include "vmlinux-sun3.lds"
-#else
-#include "vmlinux-std.lds"
-#endif
-- 
1.7.0.4
