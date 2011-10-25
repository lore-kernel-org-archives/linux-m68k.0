From: <gerg@snapgear.com>
Subject: [PATCH 34/36] m68k: add ColdFire with MMU enabled support to the m68k mem init code
Date: Tue, 25 Oct 2011 17:19:26 +1000
Message-ID: <1319527168-11166-35-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25153 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519Ab1JYHTq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:46 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire has similar setup requirements to the SUN3 code, so we
use that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init_mm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
index 85c5f0e..89f3b20 100644
--- a/arch/m68k/mm/init_mm.c
+++ b/arch/m68k/mm/init_mm.c
@@ -139,7 +139,7 @@ void __init mem_init(void)
 		}
 	}
 
-#ifndef CONFIG_SUN3
+#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
 	/* insert pointer tables allocated so far into the tablelist */
 	init_pointer_table((unsigned long)kernel_pg_dir);
 	for (i = 0; i < PTRS_PER_PGD; i++) {
-- 
1.7.0.4
