From: sfking@fdwdc.com
Subject: [RFC 05/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:55 -0700
Message-ID: <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking__32996.3519624018$1252302442$gmane$org@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34389 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758858AbZIGFrE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:04 -0400
In-Reply-To: <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/Makefile                          |   18 +++---------------
 arch/m68k/kernel/{Makefile => Makefile_mm}         |    0 
 .../kernel/Makefile => m68k/kernel/Makefile_no}    |    0 
 3 files changed, 3 insertions(+), 15 deletions(-)
 copy arch/m68k/kernel/{Makefile => Makefile_mm} (100%)
 copy arch/{m68knommu/kernel/Makefile => m68k/kernel/Makefile_no} (100%)

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 55d5d6b..c482ebc 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -1,17 +1,5 @@
-#
-# Makefile for the linux kernel.
-#
-
-ifndef CONFIG_SUN3
-  extra-y := head.o
+ifdef CONFIG_MMU
+include arch/m68k/kernel/Makefile_mm
 else
-  extra-y := sun3-head.o
+include arch/m68k/kernel/Makefile_no
 endif
-extra-y	+= vmlinux.lds
-
-obj-y	:= entry.o process.o traps.o ints.o signal.o ptrace.o module.o \
-	   sys_m68k.o time.o setup.o m68k_ksyms.o devres.o
-
-devres-y = ../../../kernel/irq/devres.o
-
-obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile_mm
similarity index 100%
copy from arch/m68k/kernel/Makefile
copy to arch/m68k/kernel/Makefile_mm
diff --git a/arch/m68knommu/kernel/Makefile b/arch/m68k/kernel/Makefile_no
similarity index 100%
copy from arch/m68knommu/kernel/Makefile
copy to arch/m68k/kernel/Makefile_no
-- 
1.5.6.5

