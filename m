From: sfking@fdwdc.com
Subject: [RFC 01/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:51 -0700
Message-ID: <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking__26968.4793697254$1252302437$gmane$org@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34377 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758830AbZIGFrB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:01 -0400
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

replace m68knommu hdr-arch hack with m68knommu SRCARCH.

---
 Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 0d46615..1786c34 100644
--- a/Makefile
+++ b/Makefile
@@ -205,13 +205,13 @@ ifeq ($(ARCH),sh64)
        SRCARCH := sh
 endif
 
-# Where to locate arch specific headers
-hdr-arch  := $(SRCARCH)
-
 ifeq ($(ARCH),m68knommu)
-       hdr-arch  := m68k
+       SRCARCH  := m68k
 endif
 
+# Where to locate arch specific headers
+hdr-arch  := $(SRCARCH)
+
 KCONFIG_CONFIG	?= .config
 
 # SHELL used by kbuild
-- 
1.5.6.5

