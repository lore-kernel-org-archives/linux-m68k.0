From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: [PATCH] Fix m68k's asm/swab.h for ColdFire
Date: Fri, 02 Oct 2009 13:15:32 +0400
Message-ID: <4AC5C4B4.4010004@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030709080208080302030800"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:42468 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753493AbZJBJPh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Oct 2009 05:15:37 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------030709080208080302030800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is a resubmit of the last portion of this patch 
(http://marc.info/?l=linux-m68k&m=123324772614580&w=2) that didn't make 
it into the sources.

Merging of uClinux and Linux headers brought in the code from the 
uClinux version, but the condition in the #elif was set wrong.

This patch fixes the #elif condition.

Thanks,

--
Maxim K.
CodeSourcery

--------------030709080208080302030800
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0004-Fix-m68k-s-asm-swab.h-for-ColdFire.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0004-Fix-m68k-s-asm-swab.h-for-ColdFire.patch"

>From c57261c33b9dbe953830698c1c0dcdbbf71cb28d Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Fri, 2 Oct 2009 12:32:18 +0400
Subject: [PATCH 4/5] Fix m68k's asm/swab.h for ColdFire

The following patch makes asm/swab.h compatible with ColdFire ISA_B CPUs.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/swab.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/swab.h b/arch/m68k/include/asm/swab.h
index 5b754aa..b7b37a4 100644
--- a/arch/m68k/include/asm/swab.h
+++ b/arch/m68k/include/asm/swab.h
@@ -14,7 +14,7 @@ static inline __attribute_const__ __u32 __arch_swab32(__u32 val)
 }
 
 #define __arch_swab32 __arch_swab32
-#elif !defined(__uClinux__)
+#elif !defined(__mcoldfire__)
 
 static inline __attribute_const__ __u32 __arch_swab32(__u32 val)
 {
-- 
1.6.4


--------------030709080208080302030800--
