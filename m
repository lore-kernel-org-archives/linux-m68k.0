From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: fix IO write size in nettel pin set
Date: Wed, 24 Aug 2016 15:52:26 +1000
Message-ID: <1472017946-9195-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:55764
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750980AbcHXFwE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 24 Aug 2016 01:52:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The pin write code that supports the UART signals is not using he correct
word write IO access method. It correctly reads the correct 16 bit
registrer, it should also write the new value back with a 16 bit write.
Fix it to use writew().

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/nettel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 2a7a766..926375d 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -92,7 +92,7 @@ static __inline__ unsigned int mcf_getppdata(void)
 
 static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
 {
-	write((readw(MCFSIM_PBDAT) & ~mask) | bits, MCFSIM_PBDAT);
+	writew((readw(MCFSIM_PBDAT) & ~mask) | bits, MCFSIM_PBDAT);
 }
 #endif
 
-- 
1.9.1
