From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour)
 does not boot)
Date: Sat, 03 Aug 2013 05:26:57 +1200
Message-ID: <51FBEBE1.1020507@gmail.com>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de> <CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com> <Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org> <5192331E.9010009@debian.org> <Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org> <20130514144112.GH11842@chumley.earth.sol> <Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org> <Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org> <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com> <0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de> <CAMuHMdXq1Cz9K9qcVqx=C6sbrDJ4JpWT7c6G+JhY+Z4SdYdnKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:64688 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab3HBR1K (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Aug 2013 13:27:10 -0400
Received: by mail-pa0-f52.google.com with SMTP id kq13so890076pab.39
        for <linux-m68k@vger.kernel.org>; Fri, 02 Aug 2013 10:27:10 -0700 (PDT)
In-Reply-To: <CAMuHMdXq1Cz9K9qcVqx=C6sbrDJ4JpWT7c6G+JhY+Z4SdYdnKg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Mikael Pettersson <mikpe@it.uu.se>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert,
>>
>> Didn't we have that sorted out earlier? I seem to recall this has surfaced
>> before.
> You mean commit 94674cd5299e825cb31979c3b9a4c1a3e6074839
> ("m68k: Correct the Atari ALLOWINT definition")? That was a related but
> slightly different problem.

That's proably what I recalled, yes.
>> What is the cause of the problem exactly - the hsync handler changing the
>> IPL to block out further interrupts, whenever it is called for the first
>> time after interrupts are enabled? We could stop doing that on
>> multi-platform kernels (taking all hsync interrupts will be a performance
>> hit but not stop the system from working).
> AFAICS, it's indeed the hsync handler blocking further interrupts on
> multi-platform kernels.

So we could stop blocking further interrupts in multi platform kernels. 
How much of a performance hit will this be on say a stock Falcon or TT?

>
> We could ignore IPL2 when running on Atari (untested whitespace-damaged
> patch):
>
> --- a/arch/m68k/include/asm/irqflags.h
> +++ b/arch/m68k/include/asm/irqflags.h
> @@ -67,7 +67,11 @@ static inline void arch_local_irq_restore(unsigned long flags
>
>   static inline bool arch_irqs_disabled_flags(unsigned long flags)
>   {
> -       return (flags & ~ALLOWINT) != 0;
> +       if (MACH_IS_ATARI) {
> +               /* Ignore HSYNC = ipl 2 on Atari */
> +               return (flags & ~(ALLOWINT | 0x200)) != 0;
> +       } else
> +           return (flags & ~ALLOWINT) != 0;
>   }
>
>   static inline bool arch_irqs_disabled(void)
>
> or just ignore all priorities on all platforms, and consider interrupts disabled
> iff all priorities are disabled:
>
> --- a/arch/m68k/include/asm/irqflags.h
> +++ b/arch/m68k/include/asm/irqflags.h
> @@ -67,7 +67,7 @@ static inline void arch_local_irq_restore(unsigned long flags
>
>   static inline bool arch_irqs_disabled_flags(unsigned long flags)
>   {
> -       return (flags & ~ALLOWINT) != 0;
> +       return (flags & ~ALLOWINT) != ~ALLOWINT;
>   }
>
>   static inline bool arch_irqs_disabled(void)
>
> The former is safer but slower, the second is faster but will miss cases
> where some interrupt priorities are disabled.
The safer but slower option (we can still use the fast version of it on 
single platform kernels). We should test the faster at any rate to see 
whether there are really cases where we miss disabled interrupts.

I'll revive my Falcon already ...

Cheers,

     Michael
