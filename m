From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/3] m68k: fix file path comment
Date: Fri, 22 Jul 2016 10:40:08 +1000
Message-ID: <1469148009-25426-3-git-send-email-gerg@linux-m68k.org>
References: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:64847
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753253AbcGVAsj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Jul 2016 20:48:39 -0400
In-Reply-To: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Remove the wrong full path name of this file.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/flat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index a97c479..00c392b0 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -1,5 +1,5 @@
 /*
- * include/asm-m68knommu/flat.h -- uClinux flat-format executables
+ * flat.h -- uClinux flat-format executables
  */
 
 #ifndef __M68KNOMMU_FLAT_H__
-- 
1.9.1
