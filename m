From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: memcpy on 68000
Date: Thu, 28 Jul 2011 17:49:02 +1000
Message-ID: <4E31146E.3060007@snapgear.com>
References: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:62482 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754880Ab1G1HtW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Jul 2011 03:49:22 -0400
In-Reply-To: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org

Hi Matthias,

On 07/24/2011 11:50 PM, Matthias Reis wrote:
> I recently did some work to compile a kernel for MMU less Atari STs.
> However, I 'm having a problem with the memcpy code as it is compiled by
> gcc. When copying from odd addresses, gcc produces memcpy code that tries
> to access odd addresses with move.w, which is not possible on the 68000
> and therefore produces address error exceptions. Below you can find the
> debug output from the hatari emulator and the memcpy version I'm using (I
> hope it's the most recent one). Any help would be appreciated.

That looks to be the memcpy.c from linux-3.0, yes?

Looking at the memcpy.c code for m68knommu before merging
and cleanup I can see that it used to do this:

   const char *c_from = from;
   char *c_to = to;
   while (n-- > 0)
     *c_to++ = *c_from++;
   return((void *) to);

for the the M68000 case. (Actually it did that for all
non-ColdFire cases). Which obviously would always work,
but is not particularly efficient.

So, yes, the current code is broken for M68000. It doesn't
check alignment of the source ("from") address.

Heres a first attempt at a fix for this. This is only compile
tested, not run tested... Basically we check that if after
16bit aligning the destination if the source is unaligned
then we resort to a byte wise copy.

Need to check if CPU32 needs this or not too. ColdFire doesn't.


diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
index 0648893..10ca051 100644
--- a/arch/m68k/lib/memcpy.c
+++ b/arch/m68k/lib/memcpy.c
@@ -22,6 +22,15 @@ void *memcpy(void *to, const void *from, size_t n)
                 from = cfrom;
                 n--;
         }
+#if defined(CONFIG_M68000)
+       if ((long)from & 1) {
+               char *cto = to;
+               const char *cfrom = from;
+               for (; n; n--)
+                       *cto++ = *cfrom++;
+               return xto;
+       }
+#endif
         if (n > 2 && (long)to & 2) {
                 short *sto = to;
                 const short *sfrom = from;


Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
