From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Thu, 7 Apr 2011 13:55:27 +1000
Message-ID: <4D9D35AF.3000009@snapgear.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>	<AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com> <BANLkTin1z7CMVdApJWtCQLyhVv-ZKAtT8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:65409 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab1DGECK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Apr 2011 00:02:10 -0400
In-Reply-To: <BANLkTin1z7CMVdApJWtCQLyhVv-ZKAtT8A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org


Hi Geert,

On 07/04/11 05:36, Geert Uytterhoeven wrote:
> On Wed, Mar 30, 2011 at 20:41, Geert Uytterhoeven<geert@linux-m68k.org>  wrote:
>> Hi Greg,
>>
>> On Wed, Mar 30, 2011 at 09:58, Greg Ungerer<gerg@uclinux.org>  wrote:
>>> The following set of patches cleans up and merges individual files in
>>> the arch/m68k/lib directory. Mostly strait forward stuff,
>>>
>>> I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
>>> targets.
>
>> Anyway, I did a thorough review, so consider it
>> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> Upon actually trying it, I get:
>
> arch/m68k/kernel/setup_mm.c:488: undefined reference to `strcpy'
> arch/m68k/q40/config.c:149: undefined reference to `strcpy'
> arch/m68k/atari/config.c:582: undefined reference to `strcpy'
> arch/m68k/atari/config.c:588: undefined reference to `strcpy'
> arch/m68k/atari/config.c:604: undefined reference to `strcpy'
> arch/m68k/mac/built-in.o:arch/m68k/mac/config.c:916: more undefined
> references to `strcpy' follow
>
> Some of these are sprintf() or strcat() calls, "optimized" into strcpy() by gcc
> (4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)). Should have thought about
> that, cfr. commit f9b07897c6288d7e5fc1fd004fccb0c5f1a0e570
> ("m68k: Uninline strchr()").
> But not all of them: some are real strcpy() calls. Why are they the
> inline version?

That does seem odd. One way or another strcpy is defined in
arch/m68k/include/asm/string.h. I would expect no real calls to
strcpy() after that. (And for me on my hand built gcc-4.5.1 I
don't end up with any).

At a guess the section for __GNUC__ > 4 must end up still trying
to use a real strcpy (presumably the __builtom_strcpy call) on
some versions of gcc.

#if __GNUC__ >= 4
#define strcpy(d, s)    (__builtin_constant_p(s) &&     \
                          __builtin_strlen(s) <= 32 ?    \
                          __builtin_strcpy(d, s) :       \
                          __kernel_strcpy(d, s))
#else
#define strcpy(d, s)    __kernel_strcpy(d, s)
#endif

Is there any reason we don't just drop the __GNUC__ >= 4 bit
and always just use __kernel_strcpy()?  After all kernel_strcpy
is a pretty tight optimized loop for m68k anyway.


> Reverting 7a2dc626ba38595bf04c663d834c394e7c0aa1f7 ("m68k: remove no
> longer used arch/m68k/lib/string.c") fixes this.
>
> So we need to keep at least the out-of-line strcpy().

Interestingly we haven't had a real strcpy defined on m68knommu
for quite a long time.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
