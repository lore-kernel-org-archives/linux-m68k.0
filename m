From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: make syscall_trace_enter/leave exist for non-MMU
 classic m68k types
Date: Fri, 08 Jun 2012 19:13:48 +1000
Message-ID: <4FD1C24C.5030108@westnet.com.au>
References: <1339133314-13265-1-git-send-email-gerg@snapgear.com> <CAMuHMdVvdqRsOSJj6bzZCiGfH-aMX=DKs6eh4assHRq21Jitow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail02.westnet.com.au ([203.10.1.243]:28086 "EHLO
	outbound-mail02.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754969Ab2FHJNx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 05:13:53 -0400
In-Reply-To: <CAMuHMdVvdqRsOSJj6bzZCiGfH-aMX=DKs6eh4assHRq21Jitow@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 06/08/2012 05:16 PM, Geert Uytterhoeven wrote:
> On Fri, Jun 8, 2012 at 7:28 AM,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The assembler entry code calls directly to the syscall_trace_enter() and
>> syscall_trace_leave() functions. But currently they are conditionaly
>> compiled out for the non-MMU classic m68k CPU types (so 68328 for example),
>> resulting in a link error:
>>
>>       LD      vmlinux
>>     arch/m68k/platform/68328/built-in.o: In function `do_trace':
>>     (.text+0x1c): undefined reference to `syscall_trace_enter'
>>     arch/m68k/platform/68328/built-in.o: In function `do_trace':
>>     (.text+0x4c): undefined reference to `syscall_trace_leave'
>>
>> Change the conditional check that includes these functions to be true for
>> the !defined(CONFIG_MMU) case as well.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> Hmm, should add syscall_trace support to M68KCLASSIC/MMU...

That would be nice :-)

Regards
Greg



> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
