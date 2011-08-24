From: "Matthias Reis" <matthias.reis@physik.tu-berlin.de>
Subject: Re: Autovector exceptions on Atari ST
Date: Wed, 24 Aug 2011 21:47:37 +0200
Message-ID: <7aefed5bdc7af1311db846ae00fb1359.squirrel@www.physik.tu-berlin.de>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2>
    <4DE88763.4030705@snapgear.com>
    <BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com>
    <BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com>
    <9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de>
    <20110807205739.GA4527@matze-K8NF4G-SATA2>
    <CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com>
    <CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:54868 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751194Ab1HXTro (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 24 Aug 2011 15:47:44 -0400
In-Reply-To: <CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthias Reis <matthias.reis@physik.tu-berlin.de>, linux-m68k@vger.kernel.org

> On Sun, Aug 7, 2011 at 23:09, Geert Uytterhoeven <geert@linux-m68k.org>
> wrote:
>
> MFP interrupts are not autovector interrupts, but user vector interrupts.
>
> Sorry, I forgot about this: it may be a stack frame format issue,
> which causes the kernel to
> incorrectly identify the interrupt number.
>
> user_inthandler() in arch/m68k/kernel/entry_mm.S looks at the
> PT_OFF_FORMATVEC
> field in the stack frame to identify the interrupt source. I don't
> know from memory
> if the plain 68000 stores it there. For autovector interrupts, it
> doesn't, that's why
> I created inidividual auto*_inthandler() functions that put an hardcoded
> number
> on the stack instead of looking at the stack frame.
>

Hi Geert,

thanks for your kind reply. As far as I understand the 68000 manual
(http://www.freescale.com/files/archives/doc/ref_manual/M68000PRM.pdf,
section b.2), the CPU does not store the vector number on the exception
stack. This is also what I've seen in the debugger: some seemingly bogus
irq number is passed to m68k_handle_int. Any suggestions how to solve
this? I guess it is not a good idea to write an individual
user*_inthandler for each of the 255-64=191 possible user interrupts.

Best regards,
Matthias
