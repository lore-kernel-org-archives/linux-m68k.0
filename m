From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [git pull] m68k updates for 2.6.34
Date: Wed, 03 Mar 2010 17:08:42 +0300
Message-ID: <4B8E6D6A.6050108@codesourcery.com>
References: <alpine.DEB.2.00.1002272207450.9843@ayla.of.borg>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050206020508050702090808"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:39488 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754293Ab0CCOIr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 3 Mar 2010 09:08:47 -0500
In-Reply-To: <alpine.DEB.2.00.1002272207450.9843@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

This is a multi-part message in MIME format.
--------------050206020508050702090808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

<CC trimmed>

On 2/28/10 12:13 AM, Geert Uytterhoeven wrote:
> 	Hi Linus,
>
> Please pull to receive the m68k updates for 2.6.34.
>
> The parts that impact m68knommu have been acked by Greg.
> The pmac_zilog parts have been acked by BenH.
>
> Thanks!
...
>        m68k: Define sigcontext ABI of ColdFire

I only now have noticed that an old version of this patch was merged in. 
  The latest version was posted here 
(http://marc.info/?l=linux-m68k&m=126571455916199&w=2) and included a 
fix for the libSegFault to not overflow sc_fpstate field [I got the math 
wrong the first time round].

The attached patch fixes this problem.

Thanks,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724

--------------050206020508050702090808
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Fix-struct-sigcontext-for-ColdFire.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Fix-struct-sigcontext-for-ColdFire.patch"

>From de4c0f12fd2fd3e8436218dfb5edba3b3d570ee0 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Wed, 3 Mar 2010 16:53:45 +0300
Subject: [PATCH] Fix `struct sigcontext' for ColdFire

LibSegFault uses piggybacks sc_fpstate field of the `struct sigcontext'
and this patch avoids LibSegFault overflowing this field.  Also this
removes an unnecessary divergence from classic m68k.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/sigcontext.h |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/sigcontext.h b/arch/m68k/include/asm/sigcontext.h
index 1320eaa..a29dd74 100644
--- a/arch/m68k/include/asm/sigcontext.h
+++ b/arch/m68k/include/asm/sigcontext.h
@@ -17,13 +17,11 @@ struct sigcontext {
 #ifndef __uClinux__
 # ifdef __mcoldfire__
 	unsigned long  sc_fpregs[2][2];	/* room for two fp registers */
-	unsigned long  sc_fpcntl[3];
-	unsigned char  sc_fpstate[16+6*8];
 # else
 	unsigned long  sc_fpregs[2*3];  /* room for two fp registers */
+# endif
 	unsigned long  sc_fpcntl[3];
 	unsigned char  sc_fpstate[216];
-# endif
 #endif
 };
 
-- 
1.6.6.1


--------------050206020508050702090808--
