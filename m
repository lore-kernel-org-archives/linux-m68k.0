From: <gerg@snapgear.com>
Subject: [PATCH 27/35] m68k: use non-MMU entry.S code when compiling for ColdFire CPU
Date: Fri, 25 Nov 2011 13:41:12 +1000
Message-ID: <1322192480-22822-28-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53476 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752796Ab1KYDjk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:40 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

No matter whether we are configured for non-MMU or MMU enabled if we are
compiling for ColdFire CPU we always use the entry_no.S code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/entry.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 081cf96..b8daf64 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -1,4 +1,4 @@
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 #include "entry_mm.S"
 #else
 #include "entry_no.S"
-- 
1.7.0.4
