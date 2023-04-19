Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F313DC77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Apr 2023 08:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjDSIPV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Apr 2023 04:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjDSIPT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Apr 2023 04:15:19 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADFB100
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 01:15:14 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso2203702b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681892113; x=1684484113;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEXlnuKMEWyr0k+270nS0yFZmLfwHVVuci42Nra0MaU=;
        b=O7x5oaY1jsjUMuUr/CA0XZ0AL2IDyr9/fO4CV2gU8XGppHTpdhRu3APmpHyTg32BTQ
         FxBcBYJbZqTyzA0hLSut+DrV+zpentv6+0e+FrvgQtoG5d83hl3k78Tq7pGGO94u0jwm
         C5JzNo59KdofswFzlwpQXZ8NljHT5AAzUDas0GxW8FS3lc6rPpdcSTciJsa2ENLyX+vS
         DKsMWvIqoVDEAh89GlWzUBA0uvKBXnVFUV2y7VfOGUfZKwAWbFfUBTPQxTqqKo08TNux
         NhtjgT0xC270fNjR+EhPKr5NgqlO8P9uAQU4s/f5jdG+sBY6SOTa4aOXjI5DP8umS1F5
         rpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892113; x=1684484113;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEXlnuKMEWyr0k+270nS0yFZmLfwHVVuci42Nra0MaU=;
        b=CnPFWD+RfKVynv6AFzeQg31gSFI/JZZ2lnSizKAP9NyK8JrBIZs0gFyETFd4p+7TFn
         0DUDmkrIBavnZqR5rwCWpZlQ6JGDiQAk07bkeqNt3tRYWwsNEtBeqe04G06V5nPDoT0H
         zNmoJQX5ivPH1v4enjrkbF+ExCP2u9JwdOCj5hXHizZtqxc/leFJRFVbOliB0xQ+ptTU
         d+4Q9DBKhuuPZKXdr7AJ8WCf8Z1ajSL/IHNZBfexBdElmayu3j0bOUwlFlCeblmp8FZh
         MnFDwLTcGa3OVQiD0hxfAtqb0EnUdMkvuuB0qYZx4K99qEYOX4cTiQCYwea0hGEakoYL
         A4Hw==
X-Gm-Message-State: AAQBX9duQ/bGYRi3S9N1pry/q15GP0FRFL7Exzh0vIuPer+Q3aWTotaj
        Ehp7OFWe+99GwcYBjpLQvMfKms27aS8=
X-Google-Smtp-Source: AKy350aTrzykLoIj0dIpcrx6POb3SpPIBDvbjo8fgD7cGN/rjs7IEVeuo3hLZbaoxDbD0394lhRUvA==
X-Received: by 2002:a17:903:32d2:b0:1a6:bbf4:ed79 with SMTP id i18-20020a17090332d200b001a6bbf4ed79mr5694951plr.20.1681892113205;
        Wed, 19 Apr 2023 01:15:13 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id x3-20020a1709027c0300b0019e88453492sm10855591pll.4.2023.04.19.01.15.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Apr 2023 01:15:12 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <3292e840-0ecd-1f03-5d7f-462347e161c9@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f8a79839-ab95-be2d-65fa-5cc99ec9f308@gmail.com>
Date:   Wed, 19 Apr 2023 20:15:07 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <3292e840-0ecd-1f03-5d7f-462347e161c9@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 19.04.2023 um 13:50 schrieb Finn Thain:
>>>> I would have expected to see a different signal trampoline (for
>>>> sys_rt_sigreturn) ...
>>>
>>> Well, this seems to be the trampoline from setup_frame() and not
>>> setup_rt_frame().
>>
>> According to the manpages I've seen, glibc ought to pick rt signals if
>> the kernel supports those (which I suppose it does).
>>
>
> It's got to be the trampoline from setup_frame() because dash did this:
>
>         act.sa_flags = 0;
>         sigfillset(&act.sa_mask);
>         sigaction(signo, &act, 0);

Ah - dash explicitly requests the old format. Make sense then.
>
> and the kernel did this:
>
>         /* set up the stack frame */
>         if (ksig->ka.sa.sa_flags & SA_SIGINFO)
>                 err = setup_rt_frame(ksig, oldset, regs);
>         else
>                 err = setup_frame(ksig, oldset, regs);
>
>>>
>>>> But anyway:
>>>>
>>>> The saved pc is 0xc00e81b6 which does match the backtrace above.
>>>> Vector offset 80 matches trap 0 which suggests 0xc00e81b6 should be
>>>> the instruction after a trap 0 instruction. d0 is 1055 which is not a
>>>> signal number I recognize.
>>>>
>>>
>>> I don't know what d0 represents here. But &frame->sig == 0x11 is
>>> correct (SIGCHLD).
>>
>> Correct - that all works out. But d0 holds the syscall number when we
>> enter the kernel via trap 0, and that one is odd.
>>
>
> Well, you showed subsequently that the kernel was probably entered via a
> page fault and not the get_thread_area trap. Would that explain the d0
> value?

That d0 was from the dash under gdb run. But I got my signal delivery 
mixed up - d0 is only expected to hold the syscall number when we issue 
a syscall. That would be in the child process, not the parent which we 
debug.

d0 is just whatever the parent had in its register when it started 
do_signal_return after exception or syscall. On return after syscall, d0 
holds the task info flags, maybe that's what we see here.

>> See above - I think what's stored there is the extra frame content for a
>> format b bus error frame. But that extra frame is incomplete at best
>> (should be 22 longwords, only a4 are seen). Probably overwritten by the
>> stack frame from __GI___wait4_time64.
>>
>
> Maybe the exception frame leaked onto the user stack via setup_frame()?

Yes, for exception frames larger than four words the excess is copied 
after the end of the sigcontext block.

>
>> Let's parse what's left:
>> <=
>>>>> 0xefffefe4:     0xc0028780        <= internal registers (6x)
>>>>> 0xefffefe0:     0x3c344bfb        <=
>>>>> 0xefffefdc:     0x000af353        <=
>>>>> 0xefffefd8:     0x3c340170        <= internal reg; version no.
>>>>> 0xefffefd4:     0x00000000        <= data input buffer
>>>>> 0xefffefd0:     0xc00e417c        <= internal registers (2x)
>>>>> 0xefffefcc:     0xc00e417e        <= stage b address
>>>>> 0xefffefc8:     0xc00e4180        <= internal registers (4x)
>>>>> 0xefffefc4:     0x48e73c34        <=
>>>>> 0xefffefc0:     0x00000000        <= data output buffer
>>>>> 0xefffefbc:     0xefffeff8        <= internal registers (2x)
>>>>> 0xefffefb8:     0xefffeffc        <= data fault address
>>>>> 0xefffefb4:     0x4bfb0170        <= ins stage c, stage b
>>>>> 0xefffefb0:     0x0eee0709        <= internal register; ssw
>>
>> The fault address is the location on the stack where a2 is saved. That
>> does match the data output buffer contents BTW. fc, fb, rc, rb bits
>> clear means the fault didn't occur in stage b or c instructions. ssw bit
>> 8 set indicates a data fault - the data cycle should be rerun on rte. rm
>> and rw bits clear tell us it's a write fault. If the moveml instruction
>> copies registers to the stack in descending order, the fault address
>> makes sense - the stack pointer just crossed a page boundary.
>>
>
> Well spotted!
>
>>>
>>> Bottom line is, the corrupted %a3 register would have been saved by
>>> the MOVEM instruction at 0xc00e4178, which turns out to be the PC in
>>> the signal frame. So it certainly looks like the kernel was the
>>> culprit here.
>>
>> I think the moveml instruction did cause a bus error, and on return from
>> that exception the signal got delivered.
>>
>
> Maybe the signal frame was partially overwritten by the resumed MOVEM?

That's possible - the saved usp in the signal frame is that of the first 
register saved to the stack (before the page fault).

> I wonder what we'd see if we patched the kernel to log every user data
> write fault caused by a MOVEM instruction. I'll try to code that up.

If these instructions did always cause stack corruption on 030, I think 
we would have noticed long ago?

>
>> On entering the buserror handler, only a1 and a2 are saved, but the
>> comment in entry.h states that a3-a6 and d6, d7 are preserved by C code.
>> After buserr_c returns, a3 should be restored to what it was when taking
>> the bus error. All registers restored before rte, the moveml instruction
>> ought to be able to resume normally.
>>
>> Unless that register use constraint has changed, I don't see how a3
>> could have changed midway during return from the bus error exception.
>> But maybe a disassembly of buserr_c from your kernel could confirm that?
>>
>
> I disassembled the relevant build. AFAICT, buserr_c() saves and restores
> those registers in the right places.
>
> BTW, I've reproduced the failures with kernels built with both GCC 12 and
> GCC 6.

Thanks - that was highly unlikely but had to be checked.

Leaves the possibility that some kernel bug did corrupt the saved a3 
copy in struct switch_stack... but that is not used in bus error 
exceptions. And the only other use of a3 is in ret_from_kernel_thread 
which is called only from copy_thread() ...

Still baffled...

Cheers,

	Michael


