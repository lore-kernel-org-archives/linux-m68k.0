From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Autovector exceptions on Atari ST
Date: Tue, 23 Aug 2011 20:22:43 +0200
Message-ID: <CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
	<4DE88763.4030705@snapgear.com>
	<BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
	<BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
	<9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
	<20110807205739.GA4527@matze-K8NF4G-SATA2>
	<CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:46974 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755548Ab1HWSWo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 14:22:44 -0400
Received: by yie30 with SMTP id 30so297909yie.19
        for <linux-m68k@vger.kernel.org>; Tue, 23 Aug 2011 11:22:43 -0700 (PDT)
In-Reply-To: <CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Aug 7, 2011 at 23:09, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Sun, Aug 7, 2011 at 22:57, Matthias Reis
> <matthias.reis@physik.tu-berlin.de> wrote:
>> I wanted to tell you that my Atari ST kernel now boots up until cali=
brate_delay loop, which hangs in an infinite loop ... I have read that =
this indicates normally that the timer interrupt is not working. I ther=
efore checked if atari_sched_init is called and found that it is invoke=
d by time_init which is ok. However, the interrupt handler timer_interr=
upt is never called subsequently (I can check that by setting a corresp=
onding breakpoint in the emulator). This means probably that MFP autove=
ctor exceptions (the timer interrupt is handled by the MFP chip) are no=
t registered properly.

MFP interrupts are not autovector interrupts, but user vector interrupt=
s.

>> I have applied most of the patches from Geert's uamiga-untested bran=
ch, especially the one regarding the 68000 autovectors (http://git.kern=
el.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dcommit;h=3D21e03a=
7a7c60b2646bd7edd740cc964091bf8ca0). Comparing the amiga_init_IRQ and t=
he atari_init_IRQ functions, I can see that the Amiga code registers th=
e autovectors with request_irq. Do I need to do something similar in at=
ari_init_IRQ and write a special handler for the MFP autovector (I thin=
k it is level 6)? If yes, how would such a handler look like?
>
> W.r.t. interrupts, the only difference between MMU and NOMMU should b=
e
> the location of the exception vectors, as the 68000 doesn't have the
> VBR.

Sorry, I forgot about this: it may be a stack frame format issue,
which causes the kernel to
incorrectly identify the interrupt number.

user_inthandler() in arch/m68k/kernel/entry_mm.S looks at the PT_OFF_FO=
RMATVEC
field in the stack frame to identify the interrupt source. I don't
know from memory
if the plain 68000 stores it there. For autovector interrupts, it
doesn't, that's why
I created inidividual auto*_inthandler() functions that put an hardcode=
d number
on the stack instead of looking at the stack frame.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
