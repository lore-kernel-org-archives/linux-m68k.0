From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Autovector exceptions on Atari ST
Date: Sun, 7 Aug 2011 23:09:25 +0200
Message-ID: <CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
	<4DE88763.4030705@snapgear.com>
	<BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
	<BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
	<9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
	<20110807205739.GA4527@matze-K8NF4G-SATA2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:47596 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755183Ab1HGVJ0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Aug 2011 17:09:26 -0400
Received: by iye16 with SMTP id 16so7678416iye.1
        for <linux-m68k@vger.kernel.org>; Sun, 07 Aug 2011 14:09:25 -0700 (PDT)
In-Reply-To: <20110807205739.GA4527@matze-K8NF4G-SATA2>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Aug 7, 2011 at 22:57, Matthias Reis
<matthias.reis@physik.tu-berlin.de> wrote:
> I wanted to tell you that my Atari ST kernel now boots up until calib=
rate_delay loop, which hangs in an infinite loop ... I have read that t=
his indicates normally that the timer interrupt is not working. I there=
fore checked if atari_sched_init is called and found that it is invoked=
 by time_init which is ok. However, the interrupt handler timer_interru=
pt is never called subsequently (I can check that by setting a correspo=
nding breakpoint in the emulator). This means probably that MFP autovec=
tor exceptions (the timer interrupt is handled by the MFP chip) are not=
 registered properly.
>
> I have applied most of the patches from Geert's uamiga-untested branc=
h, especially the one regarding the 68000 autovectors (http://git.kerne=
l.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dcommit;h=3D21e03a7=
a7c60b2646bd7edd740cc964091bf8ca0). Comparing the amiga_init_IRQ and th=
e atari_init_IRQ functions, I can see that the Amiga code registers the=
 autovectors with request_irq. Do I need to do something similar in ata=
ri_init_IRQ and write a special handler for the MFP autovector (I think=
 it is level 6)? If yes, how would such a handler look like?

W.r.t. interrupts, the only difference between MMU and NOMMU should be
the location of the exception vectors, as the 68000 doesn't have the
VBR.

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
