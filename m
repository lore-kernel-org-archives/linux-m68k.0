From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Autovector exceptions on Atari ST
Date: Thu, 25 Aug 2011 10:13:06 +0200
Message-ID: <CAMuHMdWOD_CC7RC5ByJB9k9qGueMS+c2CQZn-Tr+nPsrM+-+-w@mail.gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
	<4DE88763.4030705@snapgear.com>
	<BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
	<BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
	<9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
	<20110807205739.GA4527@matze-K8NF4G-SATA2>
	<CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>
	<CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com>
	<7aefed5bdc7af1311db846ae00fb1359.squirrel@www.physik.tu-berlin.de>
	<48FE2225-A299-45D5-AC6B-07F0102CAAFD@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:55520 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749Ab1HYINJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Aug 2011 04:13:09 -0400
Received: by gya6 with SMTP id 6so1541918gya.19
        for <linux-m68k@vger.kernel.org>; Thu, 25 Aug 2011 01:13:08 -0700 (PDT)
In-Reply-To: <48FE2225-A299-45D5-AC6B-07F0102CAAFD@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Matthias Reis <matthias.reis@physik.tu-berlin.de>, linux-m68k@vger.kernel.org

On Thu, Aug 25, 2011 at 03:51, Joshua Juran <jjuran@gmail.com> wrote:
> On Aug 24, 2011, at 12:47 PM, Matthias Reis wrote:
>
>>> On Sun, Aug 7, 2011 at 23:09, Geert Uytterhoeven <geert@linux-m68k.=
org>
>>> wrote:
>>>
>>> MFP interrupts are not autovector interrupts, but user vector inter=
rupts.
>>>
>>> Sorry, I forgot about this: it may be a stack frame format issue,
>>> which causes the kernel to
>>> incorrectly identify the interrupt number.
>>>
>>> user_inthandler() in arch/m68k/kernel/entry_mm.S looks at the
>>> PT_OFF_FORMATVEC
>>> field in the stack frame to identify the interrupt source. I don't
>>> know from memory
>>> if the plain 68000 stores it there. For autovector interrupts, it
>>> doesn't, that's why
>>> I created inidividual auto*_inthandler() functions that put an hard=
coded
>>> number
>>> on the stack instead of looking at the stack frame.
>>
>> thanks for your kind reply. As far as I understand the 68000 manual
>> (http://www.freescale.com/files/archives/doc/ref_manual/M68000PRM.pd=
f,
>> section b.2), the CPU does not store the vector number on the except=
ion
>> stack. This is also what I've seen in the debugger: some seemingly b=
ogus
>> irq number is passed to m68k_handle_int. Any suggestions how to solv=
e
>> this? I guess it is not a good idea to write an individual
>> user*_inthandler for each of the 255-64=3D191 possible user interrup=
ts.
>
> It's not out of the question. =C2=A0Although you wouldn't write 192 l=
ittle
> functions by hand -- just have stubs that push the vector number or o=
ffset
> onto the stack and branch to another function, and generate the stub =
code at
> runtime.

And you only have to do it for the user interrupts you actually need/us=
e.
I.e. m68k_setup_user_interrupt() could allocate the needed memory and f=
ill
it with the generated interrupt handlers.
=46or Atari that's doable, for VME it would still generate all 192 of t=
hem.
Alternatively, let m68k_irq_startup() handle it when it's called the
first time for
that specific interrupt.

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
