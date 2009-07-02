From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: Interrupt issue on m68k platform and some fix
Date: Thu, 02 Jul 2009 16:58:51 +0800
Message-ID: <4A4C76CB.4000208@freescale.com>
References: <4A4C3267.2040705@freescale.com> <m3hbxvtruk.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:64081 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740AbZGBI61 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2009 04:58:27 -0400
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n628wDVx028479
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 01:58:14 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id n628wBCW005761
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 03:58:12 -0500 (CDT)
In-Reply-To: <m3hbxvtruk.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>

>
> No, it isn't.  It is equivalent to
> *(long *)((char *)&current_thread_info()->preempt_count + 1) += 1
> which is of course completely bogus.
Sorry, I think I paste the redundant character for the codes (no '*'
char at front or end of addql and subql instruction)
I paste it again:

ENTRY(inthandler)
SAVE_ALL_INT
GET_CURRENT(%d0)
addql #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
/* put exception # in d0 */
movel %sp@(PT_VECTOR),%d0
swap %d0 /* extract bits 25:18 */
lsrl #2,%d0
andl #0x0ff,%d0

movel %sp,%sp@-
movel %d0,%sp@- /* put vector # on stack */
auto_irqhandler_fixup = . + 2
jbsr process_int /* process the IRQ */
addql #8,%sp /* pop parameters off stack */
ret_from_interrupt:

subql #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
jeq ret_from_last_interrupt
2: RESTORE_ALL

ALIGN
ret_from_last_interrupt:
moveb %sp@(PT_SR),%d0
andl #(~ALLOWINT>>8)&0xff,%d0
jne 2b

/* check if we need to do software interrupts */
tstl irq_stat+CPUSTAT_SOFTIRQ_PENDING
jeq .Lret_from_exception
pea ret_from_exception
jra do_softirq

For code "addql #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)",
My understanding is that
%curptr@(TASK_INFO+TINFO_PREEMPT) is the address of
current_thread_info()->preempt_count, and
%curptr@(TASK_INFO+TINFO_PREEMPT+1) point to the second byte of
preempt_count field (preempt_count field is 4 bytes).

So this code sets value 1 to the second byte of preempt_count field.

HARDIRQ_OFFSET equals (1 << HARDIRQ_SHIT) , and HARDIRQ_SHIFT value is
16, so I think this code equals
current_thread_info()->preempt_count += HARDIRQ_OFFSET

Am I wrong?

Regards,
Lanttor




------------------------------------------------------------------------
*From:* Andreas Schwab <schwab@linux-m68k.org>
*Sent:* 07/02/2009 4:24:35 PM +0800
*To:* Lanttor <lanttor.guo@freescale.com>
*CC:* linux-m68k@vger.kernel.org, uClinux development list
<uclinux-dev@uclinux.org>
*Subject:* Interrupt issue on m68k platform and some fix

> Lanttor <lanttor.guo@freescale.com> writes:
>
>   
>> My understanding of "*addql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*"
>> is that its meaning is equal to
>> "current_thread_info()->preempt_count += HARDIRQ_OFFSET",
>>     
>
> No, it isn't.  It is equivalent to
> *(long *)((char *)&current_thread_info()->preempt_count + 1) += 1
> which is of course completely bogus.
>
> Andreas.
>
>   
