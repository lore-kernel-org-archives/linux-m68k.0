From: Joshua Juran <jjuran@gmail.com>
Subject: Re: Autovector exceptions on Atari ST
Date: Wed, 24 Aug 2011 18:51:29 -0700
Message-ID: <48FE2225-A299-45D5-AC6B-07F0102CAAFD@gmail.com>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2> <4DE88763.4030705@snapgear.com> <BANLkTikVUh4rRsWLRrcAj2R6pu7GQUm-ag@mail.gmail.com> <BANLkTi=Uob6LavtHkbhgL=c=n=6m46x-+g@mail.gmail.com> <9cfdc3da684fa1f7960cd286766f5832.squirrel@www.physik.tu-berlin.de> <20110807205739.GA4527@matze-K8NF4G-SATA2> <CAMuHMdWx+JPgVy+QCFVvM8GCnAVq2AhznE+MG2XD1VDJikmzHw@mail.gmail.com> <CAMuHMdXMd0iuE7FnhSRjFiO7A0TUVRfp-FdJ==RktU+9HspEJQ@mail.gmail.com> <7aefed5bdc7af1311db846ae00fb1359.squirrel@www.physik.tu-berlin.de>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:44184 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab1HYBvj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Aug 2011 21:51:39 -0400
Received: by gwaa12 with SMTP id a12so1351543gwa.19
        for <linux-m68k@vger.kernel.org>; Wed, 24 Aug 2011 18:51:38 -0700 (PDT)
In-Reply-To: <7aefed5bdc7af1311db846ae00fb1359.squirrel@www.physik.tu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

On Aug 24, 2011, at 12:47 PM, Matthias Reis wrote:

>> On Sun, Aug 7, 2011 at 23:09, Geert Uytterhoeven <geert@linux- 
>> m68k.org>
>> wrote:
>>
>> MFP interrupts are not autovector interrupts, but user vector  
>> interrupts.
>>
>> Sorry, I forgot about this: it may be a stack frame format issue,
>> which causes the kernel to
>> incorrectly identify the interrupt number.
>>
>> user_inthandler() in arch/m68k/kernel/entry_mm.S looks at the
>> PT_OFF_FORMATVEC
>> field in the stack frame to identify the interrupt source. I don't
>> know from memory
>> if the plain 68000 stores it there. For autovector interrupts, it
>> doesn't, that's why
>> I created inidividual auto*_inthandler() functions that put an  
>> hardcoded
>> number
>> on the stack instead of looking at the stack frame.
>>
>
> Hi Geert,
>
> thanks for your kind reply. As far as I understand the 68000 manual
> (http://www.freescale.com/files/archives/doc/ref_manual/M68000PRM.pdf,
> section b.2), the CPU does not store the vector number on the  
> exception
> stack. This is also what I've seen in the debugger: some seemingly  
> bogus
> irq number is passed to m68k_handle_int. Any suggestions how to solve
> this? I guess it is not a good idea to write an individual
> user*_inthandler for each of the 255-64=191 possible user interrupts.

It's not out of the question.  Although you wouldn't write 192 little  
functions by hand -- just have stubs that push the vector number or  
offset onto the stack and branch to another function, and generate  
the stub code at runtime.

Josh
