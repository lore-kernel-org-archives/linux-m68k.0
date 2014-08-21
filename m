From: gerg@uclinux.org
Subject: [PATCH 3/4] m68k: remove the unused arch/m68k/platform directory
Date: Thu, 21 Aug 2014 23:24:15 +1000
Message-ID: <1408627456-26718-3-git-send-email-gerg@uclinux.org>
References: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas02p.mx.bigpond.com ([61.9.189.140]:34872 "EHLO
	nschwmtas02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755306AbaHUNYR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Aug 2014 09:24:17 -0400
In-Reply-To: <1408627456-26718-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-mmu platform/machine directories have been move up one level.
We no longer need arch/m68k/platform, or its Makefile, so remove them.
---
 arch/m68k/platform/Makefile | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 arch/m68k/platform/Makefile

diff --git a/arch/m68k/platform/Makefile b/arch/m68k/platform/Makefile
deleted file mode 100644
index fc932bf..0000000
--- a/arch/m68k/platform/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-#
-# Makefile for the arch/m68knommu/platform.
-#
-- 
1.9.1
