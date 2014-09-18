From: gerg@uclinux.org
Subject: [PATCH] m68knommu: add missing ioport_map() and ioport_unmap()
Date: Thu, 18 Sep 2014 15:43:44 +1000
Message-ID: <1411019024-16162-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas01p.mx.bigpond.com ([61.9.189.137]:18327 "EHLO
	nschwmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751427AbaIRFnq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 18 Sep 2014 01:43:46 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add the missing ioport_map() and ioport_unmap() functions for the
non-MMU platforms.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/io_no.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 52f7e84..be4b5a8 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -179,6 +179,15 @@ static inline void *ioremap_fullcache(unsigned long physaddr, unsigned long size
  */
 #define xlate_dev_kmem_ptr(p)	p
 
+static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
+{
+	return (void __iomem *) port;
+}
+
+static inline void ioport_unmap(void __iomem *p)
+{
+}
+
 #endif /* __KERNEL__ */
 
 #endif /* _M68KNOMMU_IO_H */
-- 
1.9.1
