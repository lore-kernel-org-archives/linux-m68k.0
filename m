From: Nathan Sidwell <nathan@codesourcery.com>
Subject: [coldfire] add byte reverse
Date: Thu, 29 Jan 2009 16:42:18 +0000
Message-ID: <4981DC6A.1060507@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040604090709090504040208"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:34325 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753632AbZA2Qsh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Jan 2009 11:48:37 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------040604090709090504040208
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

We've been using this patch for quite some time, because I thought
submission was being handled by someone else.

I see the swab_no.h header file already contains these bits, so it's
not needed there.

nathan
-- 
Nathan Sidwell    ::   http://www.codesourcery.com   ::         CodeSourcery


--------------040604090709090504040208
Content-Type: text/x-patch;
 name="0001-add-m68k-byterev.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-add-m68k-byterev.patch"


Signed-off-by: Nathan Sidwell <nathan@codesourcery.com>
---
 arch/m68k/include/asm/swab_mm.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/swab_mm.h b/arch/m68k/include/asm/swab_mm.h
index 7221e30..a391274 100644
--- a/arch/m68k/include/asm/swab_mm.h
+++ b/arch/m68k/include/asm/swab_mm.h
@@ -6,11 +6,20 @@
 
 #define __SWAB_64_THRU_32__
 
+#if defined (__mcfisaaplus__) || defined (__mcfisac__)
+static inline __attribute_const__ __u32 __arch_swab32(__u32 val)
+{
+	__asm__ ("byterev %0" : "=d" (val) : "0" (val));
+	return val;
+}
+#define __arch_swab32 __arch_swab32
+#elif !defined (__mcoldfire__)
 static inline __attribute_const__ __u32 __arch_swab32(__u32 val)
 {
 	__asm__("rolw #8,%0; swap %0; rolw #8,%0" : "=d" (val) : "0" (val));
 	return val;
 }
 #define __arch_swab32 __arch_swab32
+#endif
 
 #endif /* _M68K_SWAB_H */
-- 
1.5.2.5


--------------040604090709090504040208--
