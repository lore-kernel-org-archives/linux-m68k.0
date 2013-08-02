From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour)
 does not boot)
Date: Fri, 2 Aug 2013 15:01:25 +0200
Message-ID: <CAMuHMdXq1Cz9K9qcVqx=C6sbrDJ4JpWT7c6G+JhY+Z4SdYdnKg@mail.gmail.com>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
	<CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
	<Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org>
	<5192331E.9010009@debian.org>
	<Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org>
	<20130514144112.GH11842@chumley.earth.sol>
	<Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
	<Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
	<CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
	<0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:58353 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752279Ab3HBNB0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Aug 2013 09:01:26 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so644953pab.7
        for <linux-m68k@vger.kernel.org>; Fri, 02 Aug 2013 06:01:25 -0700 (PDT)
In-Reply-To: <0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Mikael Pettersson <mikpe@it.uu.se>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Fri, Aug 2, 2013 at 11:08 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>> [    0.160000] WARNING: at /root/linux-3.10.1/init/main.c:698
>>> do_one_initcall+0x12e/0x13a()
>>> [    0.160000] initcall param_sysfs_init+0x0/0x1a4 returned with di=
sabled
>>> interrupts
>>>
>>> This seems to happen for several initcalls. Geert et al,
>>> can you have a look at them, they=E2=80=99re scary =E2=98=BA
>>
>>
>> It only happens on multi-platform kernels, because of the following
>> definition
>> of ALLOWINT:
>>
>> #if defined(MACH_ATARI_ONLY)
>>         /* block out HSYNC =3D ipl 2 on the atari */
>> #define ALLOWINT        (~0x500)
>> #else
>>         /* portable version */
>> #define ALLOWINT        (~0x700)
>> #endif /* machine compilation types */
>>
>> On an Atari-only kernel, flags is either 0x00c02204 or 0x00c02214.
>> Hence "flags & ~ALLOWINT" is "flags & 0x500" is always zero.
>>
>> On a multi-platform kernel, flags is one of 0x00c02004, 0x00c02014,
>> 0x00c02204, or 0x00c02214.
>> Hence "flags & ~ALLOWINT" is "flags & 0x700" is sometimes non-zero,
>> triggering the warning.
>>
>> Anyone who sees a solution that doesn't involve adding a variable to=
 hold
>> ALLOWINT?
>>
>> We're already having a check for Q40 in arch_local_irq_enable()
>> (in multi-platfom kernels only).
>
>
> Didn't we have that sorted out earlier? I seem to recall this has sur=
faced
> before.

You mean commit 94674cd5299e825cb31979c3b9a4c1a3e6074839
("m68k: Correct the Atari ALLOWINT definition")? That was a related but
slightly different problem.

> What is the cause of the problem exactly - the hsync handler changing=
 the
> IPL to block out further interrupts, whenever it is called for the fi=
rst
> time after interrupts are enabled? We could stop doing that on
> multi-platform kernels (taking all hsync interrupts will be a perform=
ance
> hit but not stop the system from working).

AFAICS, it's indeed the hsync handler blocking further interrupts on
multi-platform kernels.

On multi-platform kernels, enabling interrupts enables all 7 levels
(interrupt enable/disable is either all-or-nothing in Linux, there are
no priorities).
When the hblank interrupt comes in, its handler (falcon_hblhandler())
disables level 2 interrupts again, to prevent more interrupts coming in=
,
which would slow down the system.
However, this causes arch_irqs_disabled_flags() to think interrupts are
completely disabled, causing the warnings in the logs.

We could ignore IPL2 when running on Atari (untested whitespace-damaged
patch):

--- a/arch/m68k/include/asm/irqflags.h
+++ b/arch/m68k/include/asm/irqflags.h
@@ -67,7 +67,11 @@ static inline void arch_local_irq_restore(unsigned l=
ong flags

 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-       return (flags & ~ALLOWINT) !=3D 0;
+       if (MACH_IS_ATARI) {
+               /* Ignore HSYNC =3D ipl 2 on Atari */
+               return (flags & ~(ALLOWINT | 0x200)) !=3D 0;
+       } else
+           return (flags & ~ALLOWINT) !=3D 0;
 }

 static inline bool arch_irqs_disabled(void)

or just ignore all priorities on all platforms, and consider interrupts=
 disabled
iff all priorities are disabled:

--- a/arch/m68k/include/asm/irqflags.h
+++ b/arch/m68k/include/asm/irqflags.h
@@ -67,7 +67,7 @@ static inline void arch_local_irq_restore(unsigned lo=
ng flags

 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-       return (flags & ~ALLOWINT) !=3D 0;
+       return (flags & ~ALLOWINT) !=3D ~ALLOWINT;
 }

 static inline bool arch_irqs_disabled(void)

The former is safer but slower, the second is faster but will miss case=
s
where some interrupt priorities are disabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
