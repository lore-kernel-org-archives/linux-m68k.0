From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Thu, 7 Apr 2011 21:26:39 +1000
Message-ID: <4D9D9F6F.4000800@snapgear.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>	<AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>	<BANLkTin1z7CMVdApJWtCQLyhVv-ZKAtT8A@mail.gmail.com>	<4D9D35AF.3000009@snapgear.com> <m34o6acvys.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:36490 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633Ab1DGLem (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Apr 2011 07:34:42 -0400
In-Reply-To: <m34o6acvys.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

Hi Andreas,

On 07/04/11 18:22, Andreas Schwab wrote:
> Greg Ungerer<gerg@snapgear.com>  writes:
>
>> That does seem odd. One way or another strcpy is defined in
>> arch/m68k/include/asm/string.h. I would expect no real calls to
>> strcpy() after that. (And for me on my hand built gcc-4.5.1 I
>> don't end up with any).
>
> Did you compile with -Os?

No, -O2. Here is a typical gcc line:

m68k-linux-gcc -Wp,-MD,kernel/.printk.o.d  -nostdinc -isystem 
/usr/local/lib/gcc/m68k-linux/4.5.1/include 
-I/home/gerg/new-wave.merge/linux-2.6.x/arch/m68k/include -Iinclude 
-include include/generated/autoconf.h -D__KERNEL__ -Wall -Wundef 
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common 
-Werror-implicit-function-declaration -Wno-format-security 
-fno-delete-null-pointer-checks -O2 -pipe -fno-strength-reduce 
-ffixed-a2 -Wframe-larger-than=1024 -fno-stack-protector 
-fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign 
-fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(printk)" 
-D"KBUILD_MODNAME=KBUILD_STR(printk)" -c -o kernel/printk.o kernel/printk.c

This is vanilla 2.6.39-rc2...


>> At a guess the section for __GNUC__>  4 must end up still trying
>> to use a real strcpy (presumably the __builtom_strcpy call) on
>> some versions of gcc.
>>
>> #if __GNUC__>= 4
>> #define strcpy(d, s)    (__builtin_constant_p(s)&&      \
>>                           __builtin_strlen(s)<= 32 ?    \
>>                           __builtin_strcpy(d, s) :       \
>>                           __kernel_strcpy(d, s))
>> #else
>> #define strcpy(d, s)    __kernel_strcpy(d, s)
>> #endif
>>
>> Is there any reason we don't just drop the __GNUC__>= 4 bit
>> and always just use __kernel_strcpy()?  After all kernel_strcpy
>> is a pretty tight optimized loop for m68k anyway.
>
> The compiler can generate libcalls to strcpy any time while optimizing
> any other standard C function, and those libcalls won't see the macros,
> of course.  The only way to stop the compiler from doing that is to
> disable all builtin functions (just -fno-builtin-strcpy is not enough),
> but that would disable a lot of useful opimisations.

Yes, ok. It is just that I hadn't seen gcc emit calls to strcpy
on my m68knommu builds (at least not in recent years since we
removed the local strcpy).

Regards
Greg

------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
