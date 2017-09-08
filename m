From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/3] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Fri,  8 Sep 2017 17:01:01 +1000
Message-ID: <1504854061-12830-4-git-send-email-gerg@linux-m68k.org>
References: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:28548
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754358AbdIHHKt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Sep 2017 03:10:49 -0400
In-Reply-To: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>

The Freescale ColdFire M5441x system-on-chip parts have full paged MMU
hardware support. So far though we have only allowed them to be
configured for use in non-MMU mode.

All required kernel changes to support operation of the M5441x parts
with MMU enabled have been pushed into the kernel, so now we can allow
it to be configured and used with the MMU enabled.

I don't actually have any M5441x based hardware so I can't do any real
testing on this. The changes up to now were based on Yannick Gicquel
initial patches to support this. Is anybody out there able to test
this properly?  I won't push this any further until we have some
confirmation that it all works as expected.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index d2219f30..4dc51c0 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -283,7 +283,7 @@ config M548x
 
 config M5441x
 	bool "MCF5441x"
-	depends on !MMU
+	select MMU_COLDFIRE if MMU
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_CB
 	help
-- 
1.9.1
