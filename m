From: <gerg@snapgear.com>
Subject: [PATCH 26/36] m68k: use non-MMU entry.S code when compiling for ColdFire CPU
Date: Tue, 25 Oct 2011 17:19:18 +1000
Message-ID: <1319527168-11166-27-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25224 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832Ab1JYHVP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:15 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

No matter whether we are configured for non-MMU or MMU enabled if we are
compiling for ColdFire CPU we always use the entry_no.S code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
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
