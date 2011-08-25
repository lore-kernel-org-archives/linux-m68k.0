From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Autovector exceptions on Atari ST
Date: Thu, 25 Aug 2011 21:38:11 +1000
Message-ID: <4E563423.8090003@snapgear.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>	<4DE88763.4030705@snapgear.com>	<BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>	<BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>	<9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>	<20110807205739.GA4527@matze-K8NF4G-SATA2>	<CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>	<CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com>	<7aefed5bdc7af1311db846ae00fb1359.squirrel@www.physik.tu-berlin.de>	<48FE2225-A299-45D5-AC6B-07F0102CAAFD@gmail.com> <CAMuHMdWOD_CC7RC5ByJB9k9qGueMS+c2CQZn-Tr+nPsrM+-+-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:32570 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753342Ab1HYLip convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Aug 2011 07:38:45 -0400
In-Reply-To: <CAMuHMdWOD_CC7RC5ByJB9k9qGueMS+c2CQZn-Tr+nPsrM+-+-w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Juran <jjuran@gmail.com>, Matthias Reis <matthias.reis@physik.tu-berlin.de>, linux-m68k@vger.kernel.org

On 25/08/11 18:13, Geert Uytterhoeven wrote:
> On Thu, Aug 25, 2011 at 03:51, Joshua Juran<jjuran@gmail.com>  wrote:
>> On Aug 24, 2011, at 12:47 PM, Matthias Reis wrote:
>>
>>>> On Sun, Aug 7, 2011 at 23:09, Geert Uytterhoeven<geert@linux-m68k.=
org>
>>>> wrote:
>>>>
>>>> MFP interrupts are not autovector interrupts, but user vector inte=
rrupts.
>>>>
>>>> Sorry, I forgot about this: it may be a stack frame format issue,
>>>> which causes the kernel to
>>>> incorrectly identify the interrupt number.
>>>>
>>>> user_inthandler() in arch/m68k/kernel/entry_mm.S looks at the
>>>> PT_OFF_FORMATVEC
>>>> field in the stack frame to identify the interrupt source. I don't
>>>> know from memory
>>>> if the plain 68000 stores it there. For autovector interrupts, it
>>>> doesn't, that's why
>>>> I created inidividual auto*_inthandler() functions that put an har=
dcoded
>>>> number
>>>> on the stack instead of looking at the stack frame.
>>>
>>> thanks for your kind reply. As far as I understand the 68000 manual
>>> (http://www.freescale.com/files/archives/doc/ref_manual/M68000PRM.p=
df,
>>> section b.2), the CPU does not store the vector number on the excep=
tion
>>> stack. This is also what I've seen in the debugger: some seemingly =
bogus
>>> irq number is passed to m68k_handle_int. Any suggestions how to sol=
ve
>>> this? I guess it is not a good idea to write an individual
>>> user*_inthandler for each of the 255-64=3D191 possible user interru=
pts.
>>
>> It's not out of the question. =C3=A1Although you wouldn't write 192 =
little
>> functions by hand -- just have stubs that push the vector number or =
offset
>> onto the stack and branch to another function, and generate the stub=
 code at
>> runtime.
>
> And you only have to do it for the user interrupts you actually need/=
use.

That is pretty much what the code for the 68328 does.

   arch/m68k/platform/68328/entry.S

It has 8 handlers for the 8 real interrupts it can handle.

Regards
Greg


> I.e. m68k_setup_user_interrupt() could allocate the needed memory and=
 fill
> it with the generated interrupt handlers.
> For Atari that's doable, for VME it would still generate all 192 of t=
hem.
> Alternatively, let m68k_irq_startup() handle it when it's called the
> first time for
> that specific interrupt.
