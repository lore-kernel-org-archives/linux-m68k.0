From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/16] m68k/UAPI: Move Apollo model definitions to <asm/bootinfo-apollo.h>
Date: Wed, 16 Oct 2013 14:31:28 +0200
Message-ID: <1381926693-6392-12-git-send-email-geert__49693.0500180044$1381926890$gmane$org@linux-m68k.org>
References: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, David Howells <dhowells@redhat.com>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Howells <dhowells@redhat.com>
---
 arch/m68k/include/asm/apollohw.h             |   11 ++---------
 arch/m68k/include/uapi/asm/bootinfo-apollo.h |   12 ++++++++++++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/apollohw.h b/arch/m68k/include/asm/apollohw.h
index 6c19e0c22411..87fc899d32ee 100644
--- a/arch/m68k/include/asm/apollohw.h
+++ b/arch/m68k/include/asm/apollohw.h
@@ -5,18 +5,11 @@
 
 #include <linux/types.h>
 
-/*
-   apollo models
-*/
+#include <asm/bootinfo-apollo.h>
+
 
 extern u_long apollo_model;
 
-#define APOLLO_UNKNOWN (0)
-#define APOLLO_DN3000 (1)
-#define APOLLO_DN3010 (2)
-#define APOLLO_DN3500 (3)
-#define APOLLO_DN4000 (4)
-#define APOLLO_DN4500 (5)
 
 /*
    see scn2681 data sheet for more info.
diff --git a/arch/m68k/include/uapi/asm/bootinfo-apollo.h b/arch/m68k/include/uapi/asm/bootinfo-apollo.h
index 3a2051e822b0..69923697e131 100644
--- a/arch/m68k/include/uapi/asm/bootinfo-apollo.h
+++ b/arch/m68k/include/uapi/asm/bootinfo-apollo.h
@@ -13,4 +13,16 @@
 #define BI_APOLLO_MODEL		0x8000	/* model (u_long) */
 
 
+    /*
+     *  Apollo models (BI_APOLLO_MODEL)
+     */
+
+#define APOLLO_UNKNOWN		0
+#define APOLLO_DN3000		1
+#define APOLLO_DN3010		2
+#define APOLLO_DN3500		3
+#define APOLLO_DN4000		4
+#define APOLLO_DN4500		5
+
+
 #endif /* _UAPI_ASM_M68K_BOOTINFO_APOLLO_H */
-- 
1.7.9.5
