From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Thu, 07 Apr 2011 10:22:03 +0200
Message-ID: <m34o6acvys.fsf@linux-m68k.org>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
	<AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
	<BANLkTin1z7CMVdApJWtCQLyhVv-ZKAtT8A@mail.gmail.com>
	<4D9D35AF.3000009@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59429 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751992Ab1DGIWJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Apr 2011 04:22:09 -0400
In-Reply-To: <4D9D35AF.3000009@snapgear.com> (Greg Ungerer's message of "Thu,
	7 Apr 2011 13:55:27 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

Greg Ungerer <gerg@snapgear.com> writes:

> That does seem odd. One way or another strcpy is defined in
> arch/m68k/include/asm/string.h. I would expect no real calls to
> strcpy() after that. (And for me on my hand built gcc-4.5.1 I
> don't end up with any).

Did you compile with -Os?

> At a guess the section for __GNUC__ > 4 must end up still trying
> to use a real strcpy (presumably the __builtom_strcpy call) on
> some versions of gcc.
>
> #if __GNUC__ >= 4
> #define strcpy(d, s)    (__builtin_constant_p(s) &&     \
>                          __builtin_strlen(s) <= 32 ?    \
>                          __builtin_strcpy(d, s) :       \
>                          __kernel_strcpy(d, s))
> #else
> #define strcpy(d, s)    __kernel_strcpy(d, s)
> #endif
>
> Is there any reason we don't just drop the __GNUC__ >= 4 bit
> and always just use __kernel_strcpy()?  After all kernel_strcpy
> is a pretty tight optimized loop for m68k anyway.

The compiler can generate libcalls to strcpy any time while optimizing
any other standard C function, and those libcalls won't see the macros,
of course.  The only way to stop the compiler from doing that is to
disable all builtin functions (just -fno-builtin-strcpy is not enough),
but that would disable a lot of useful opimisations.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
