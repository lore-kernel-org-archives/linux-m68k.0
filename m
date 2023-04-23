Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D5C6FD18
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 21:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjDWV0W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 17:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDWV0T (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 17:26:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B521BD
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 14:26:17 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b73203e0aso23666059b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682285177; x=1684877177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjSH/oa/f26QyoMFFSLnfHA0OG+Z0AfDkfPg21Pt7tI=;
        b=JD6fvmJ8/j76JCEmg5KaUM/bYskWHxPWEVJrc3cxP+LiNELyjd6+VtwBT+2LH6Hw3m
         gZoCWjJb0ELxAUDgEwEZ6dwGnsigz1AUTfDhgrmWxo69E2d31cu4p0ZlkbLlOPdExAUC
         O9tDLOqAxWeoLPGyoYIWkfqoueiGhduRUlzjMC6VxsoUjEzgsRFLyjb6erwlYf9lGdhd
         Jvwbhfqzif1yS+ULuB/NCrXy7PkYZ2BFdDbqZ2x+P1ZmZvfgY/mlKVJ/q8kRa7MEMNKw
         0Jz8pIUiaqMl9IJH/RBfii2YE7VxH1EvJDFvywnCObfxNgnFPcQkmdieIps7lH7Vp2JC
         zHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682285177; x=1684877177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjSH/oa/f26QyoMFFSLnfHA0OG+Z0AfDkfPg21Pt7tI=;
        b=RCopKUAWFy+nuNtfQDSU5ygwUcTe1jazF76WXOLZ6V9CguOyztSvsgTrAQf1Wtn2R9
         nS6UO3dPb4CUiT0KFMY16QvoKTvc5D77kF6rrcK5V4pQPBqN58ug8SdbydL8K6V5NKY0
         U5qJO8cETDEnS2BfKfId7JNEByMLPSjcHGu745v5ipKP8qkmfEBKeQuKwm7Jw3vSIEW/
         QjP5Sc4jRwS4e5XdxuNejr302KMmbjkcbmbwDSigdrvlYAFqhUqT65ZrYB/x4ze/YYZt
         MdwZQo74/lX0q+GvW+pd6hxL/Fta57rgnB3AuyOh+zPNfMM2hh8Hr7OQabKjB441UQ4C
         tTxQ==
X-Gm-Message-State: AC+VfDxwS/nyMEWt2S7Zi+mlLELZGRgXwxtusgWimlyf9zlQUp6RK4xN
        zArNItAwDWhGqoC6YFFm8zM=
X-Google-Smtp-Source: ACHHUZ7jYbBWo4B3sJpfLsthPff903ZM5zFLUWlNpf/cD3kqW5qyZLwoXwsJMWwRgCvvDXQVpMJEFw==
X-Received: by 2002:a17:902:e889:b0:1a9:7ad8:9757 with SMTP id w9-20020a170902e88900b001a97ad89757mr675586plg.27.1682285177005;
        Sun, 23 Apr 2023 14:26:17 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7d4f:891d:86e0:1e1c? ([2001:df0:0:200c:7d4f:891d:86e0:1e1c])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902e90500b00199203a4fa3sm5413978pld.203.2023.04.23.14.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 14:26:16 -0700 (PDT)
Message-ID: <b96512f3-71bf-0e3c-90ba-6ac0138aa09b@gmail.com>
Date:   Mon, 24 Apr 2023 09:26:12 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: core dump analysis, was Re: stack smashing detected
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <f8a79839-ab95-be2d-65fa-5cc99ec9f308@gmail.com>
 <535b4775-696e-2524-8dfe-2943c3f7750a@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <535b4775-696e-2524-8dfe-2943c3f7750a@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 23/04/23 19:46, Finn Thain wrote:
> On Wed, 19 Apr 2023, Michael Schmitz wrote:
>
>>> I wonder what we'd see if we patched the kernel to log every user data
>>> write fault caused by a MOVEM instruction. I'll try to code that up.
>> If these instructions did always cause stack corruption on 030, I think
>> we would have noticed long ago?
>>
> I think it probably was noticed long ago, in the form of rare userland
> crashes on 68030. But it was probably never reported because the actual
> culprit is too distant from the symptoms.
>
> But I take your point -- signal delivery seems to be crucial. Would it be
> difficult to skip signal delivery following a bus error? Perhaps there's
> no need to try that experiment, as we know what would happen.
Shouldn't be too hard, see my other mail.
> I will take a look at your modified test program and try to use the output
> to figure out the stack gymnastics.
>
> IIUC, there are two RTEs following the page fault. The first one runs the
> signal handler, the second one resumes the MOVEM that faulted. Maybe we'll
> have to intercept the latter (at do_sigreturn() perhaps?) and examine that
> exception frame.

There's no second RTE as far as I can see - upon return from buserr_c, 
the asm buserr handler jumps to ret_from_exception. Seeing as the bus 
error was taken from user space, ret_from_exception proceeds to 
resume_userspace, and seeing the task info flags field non-zero, jumps 
to exit_work where with signal pending, a jump to do_signal_return is 
taken and the signal handler is set up (frame setup to return through 
the sigreturn trampoline, pc set to hander etc). No rte anywhere on that 
path. After setting up for the signal handler, we return to 
resume_userspace and no further signals pending, hit RESTORE_ALL which 
restores registes from the pt_regs struct on the kernel stack, and has 
the rte instruction at the end. We had earlier set usp to the signal 
frame and pc to the signal handler, so that is now run after resuming 
user mode after the rte instruction.

Exiting from the signal handler, sys_sigreturn runs and cleans up the 
user stack, then returns to the instruction at the pc from the saved 
exception frame that got us into kernel mode in the first instance. This 
is the moment the moveml instruction resumes.

There should be no difference between ret_from_exception (after buserr) 
jumping to RESTORE_ALL directly (with exception frame still on the 
kernel stack from the bus error exception) and doing so after the detour 
through signal hander setup, signal handler and sys_sigreturn cleanup. 
If the exception frame on the stack was any different from what it ought 
to be, rte would fail and raise a format error exception.

If the frame was different from that needed to complete the bus error 
exception, f.e. one from a trap exception, we'd fail to resume that 
moveml instruction and do something else instead. Hmmm - that's an 
interesting fault mode... might explain why a3 wasn't saved as it ought 
to have been? Can we 'poison' the user stack area that will be used for 
register save upon rec() entry with some other patterns to prove that 
moveml sometimes does not complete after the bus error?

Cheers,

     Michael




