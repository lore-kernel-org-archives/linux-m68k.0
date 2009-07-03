From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: Interrupt issue on m68k platform and some fix
Date: Fri, 03 Jul 2009 11:18:37 +0800
Message-ID: <4A4D788D.6010007@freescale.com>
References: <4A4C3267.2040705@freescale.com> <m3hbxvtruk.fsf@hase.home>	<4A4C76CB.4000208@freescale.com> <m38wj7tpxk.fsf@hase.home> <20090702202532.DFD1A7BF89@ridcully.hodek.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:57706 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbZGCDSG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2009 23:18:06 -0400
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n633HnTR020575
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 20:17:52 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id n633HmbF024330
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 22:17:48 -0500 (CDT)
In-Reply-To: <20090702202532.DFD1A7BF89@ridcully.hodek.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roman Hodek <roman@hodek.net>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

>
> and 1<<16 == 0x00010000, so correct would be
>
>   addl #0x00010000,%curptr@(TASK_INFO+TINFO_PREEMPT)
>
> And this can be optimized to add 1 to the high word:
>
>   addqw #1,%curptr@(TASK_INFO+TINFO_PREEMPT+2)
I checked the "Coldfire family programmer's Reference" and find that it
indeed does not support addqw and addqb instruction, it only support
addql instruction. And addl instruction can not be used for immediate data.

I guess coldfire instruction are not compatible m68k instruction.

So I need implement the function you mentioned above like this:

        movel   %curptr@(TASK_INFO+TINFO_PREEMPT),%d3
        addil   #0x10000,%d3
        movel   %d3,%curptr@(TASK_INFO+TINFO_PREEMPT)

I test it and it could work.

The other way to replace it is what I mentioned before: use irq_enter()
and irq_exit(), they take the same function.

> Really? The addq instructions are contained in all kind of code, I
> guess...
coldfire instruction are not compatible m68k instruction, so some m68k
kernel assembly code can not be used in coldfire platform directly.

Thanks,

Best Regards,
Lanttor




------------------------------------------------------------------------
*From:* roman@hodek.net (Roman Hodek)
*Sent:* 07/03/2009 4:25:32 AM +0800
*To:* Andreas Schwab <schwab@linux-m68k.org>
*CC:* lanttor.guo@freescale.com, linux-m68k@vger.kernel.org,
uclinux-dev@uclinux.org
*Subject:* Interrupt issue on m68k platform and some fix

>>> So this code sets value 1 to the second byte of preempt_count field.
>>>       
>> No.  Byte would be addqb.
>>     
>
> Yep ;) But that's also not what's intended, I think.
>
> Lanttor says he wants to add HARDIRQ_OFFSET:
>
>   
>> HARDIRQ_OFFSET equals (1 << HARDIRQ_SHIT) , and HARDIRQ_SHIFT value is
>> 16, so I think this code equals
>>     
>
> and 1<<16 == 0x00010000, so correct would be
>
>   addl #0x00010000,%curptr@(TASK_INFO+TINFO_PREEMPT)
>
> And this can be optimized to add 1 to the high word:
>
>   addqw #1,%curptr@(TASK_INFO+TINFO_PREEMPT+2)
>
> As 1 is small enough, you can use an addq statement, and the offset to
> the memory location is 2.
>
> The originally proposed "addlq #1, %curptr@(TASK_INFO+TINFO_PREEMPT+1)"
> is misaligned and would case an exception. And "addlb #1,
> %curptr@(TASK_INFO+TINFO_PREEMPT+1)" wouldn't yield the correct value
> as long if the byte overflows ;)
>
>   
>> addqb instruction is not supported on coldfire platform.
>>     
>
> Really? The addq instructions are contained in all kind of code, I
> guess...
>
> Roman
>
> PS: Hi Andreas! It's quite some years ago, isn't it? ;)
>
>   
