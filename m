From: gerg@uclinux.org
Subject: [PATCH 4/4] m68k: fix crufty 68000 and 68360  intro comments
Date: Thu, 21 Aug 2014 23:24:16 +1000
Message-ID: <1408627456-26718-4-git-send-email-gerg@uclinux.org>
References: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas05p.mx.bigpond.com ([61.9.189.149]:18687 "EHLO
	nschwmtas05p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755308AbaHUNYR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Aug 2014 09:24:17 -0400
In-Reply-To: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Quite a few of the non-mmu specific support files have a pathname in the
title comments of the file. These files have moved around a bit over the
years, and most are no longer accurate. Remove the pathname and fix the
comments to include at least a short description of the files contents.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/68000/entry.S    | 2 +-
 arch/m68k/68360/Makefile   | 2 +-
 arch/m68k/68360/config.c   | 2 +-
 arch/m68k/68360/entry.S    | 2 +-
 arch/m68k/68360/head-ram.S | 5 ++---
 arch/m68k/68360/head-rom.S | 5 ++---
 arch/m68k/68360/ints.c     | 2 +-
 7 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 23ac054..259b366 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -1,5 +1,5 @@
 /*
- *  linux/arch/m68knommu/platform/68328/entry.S
+ *  entry.S -- non-mmu 68000 interrupt and exception entry points
  *
  *  Copyright (C) 1991, 1992  Linus Torvalds
  *
diff --git a/arch/m68k/68360/Makefile b/arch/m68k/68360/Makefile
index f6f4343..591ce42 100644
--- a/arch/m68k/68360/Makefile
+++ b/arch/m68k/68360/Makefile
@@ -1,5 +1,5 @@
 #
-# Makefile for arch/m68knommu/platform/68360.
+# Makefile for 68360 machines.
 #
 model-y			  := ram
 model-$(CONFIG_ROMKERNEL) := rom
diff --git a/arch/m68k/68360/config.c b/arch/m68k/68360/config.c
index d493ac4..17ec416 100644
--- a/arch/m68k/68360/config.c
+++ b/arch/m68k/68360/config.c
@@ -1,5 +1,5 @@
 /*
- *  linux/arch/m68knommu/platform/68360/config.c
+ *  config.c - non-mmu 68360 platform initialization code
  *
  *  Copyright (c) 2000 Michael Leslie <mleslie@lineo.com>
  *  Copyright (C) 1993 Hamish Macdonald
diff --git a/arch/m68k/68360/entry.S b/arch/m68k/68360/entry.S
index 447c33e..22eb302 100644
--- a/arch/m68k/68360/entry.S
+++ b/arch/m68k/68360/entry.S
@@ -1,5 +1,5 @@
 /*
- *  linux/arch/m68knommu/platform/68360/entry.S
+ *  entry.S - non-mmu 68360 interrupt and exceptions entry points
  *
  *  Copyright (C) 1991, 1992  Linus Torvalds
  *  Copyright (C) 2001 SED Systems, a Division of Calian Ltd.
diff --git a/arch/m68k/68360/head-ram.S b/arch/m68k/68360/head-ram.S
index acd2131..62bc56f 100644
--- a/arch/m68k/68360/head-ram.S
+++ b/arch/m68k/68360/head-ram.S
@@ -1,6 +1,5 @@
-/* arch/m68knommu/platform/68360/head-ram.S
- *
- * Startup code for Motorola 68360
+/*
+ * head-ram.S - startup code for Motorola 68360
  *
  * Copyright 2001 (C) SED Systems, a Division of Calian Ltd.
  * Based on: arch/m68knommu/platform/68328/pilot/crt0_rom.S
diff --git a/arch/m68k/68360/head-rom.S b/arch/m68k/68360/head-rom.S
index dfc756d..b3a7e40 100644
--- a/arch/m68k/68360/head-rom.S
+++ b/arch/m68k/68360/head-rom.S
@@ -1,6 +1,5 @@
-/* arch/m68knommu/platform/68360/head-rom.S
- *
- * Startup code for Motorola 68360
+/*
+ * head-rom.S - startup code for Motorola 68360
  *
  * Copyright (C) SED Systems, a Division of Calian Ltd.
  * Based on: arch/m68knommu/platform/68328/pilot/crt0_rom.S
diff --git a/arch/m68k/68360/ints.c b/arch/m68k/68360/ints.c
index 8cd4269..2360fc0 100644
--- a/arch/m68k/68360/ints.c
+++ b/arch/m68k/68360/ints.c
@@ -1,5 +1,5 @@
 /*
- * linux/arch/$(ARCH)/platform/$(PLATFORM)/ints.c
+ * ints.c - first level interrupt handlers
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
-- 
1.9.1
