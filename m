Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18338C77B73
	for <linux-m68k@archiver.kernel.org>; Thu,  4 May 2023 21:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjEDVGt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 May 2023 17:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjEDVGe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 4 May 2023 17:06:34 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D832D11610
        for <linux-m68k@lists.linux-m68k.org>; Thu,  4 May 2023 14:06:09 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51b33c72686so626998a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 May 2023 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683234369; x=1685826369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1M2uEvC+G/8YxNFg2lTN37dQgI4DOWqSkPOhxZadHAc=;
        b=PhsPfDRRkAq7XVQTgfzZCy7/8hl0jnK3pNV7BwTIBtkOU4epM9KT+USf17zzCmEls7
         mnIdrNBSUs370o/wt8ACvMMhsVm/WTrTmVf4qYT73l8t/PSsTAkAehXYukfKpC5B/2sU
         d8aUeAUTwWkF+rT/qTCyImZ9i8fvgrGa0N/XAPSxwIijRfJsIuNQmVpENJ50RBfzPvaA
         sFi+GQkClVWlsXiLzGiI1ptIezxEK9oInGih35OLQ7zDTQJpSfyUabNTWX7zKkbanwto
         QD4oXV2NqTY/wQa4X1UhtOJqAhuG9ppIPmzs8qKQn+updFmd/oekTKeCXRjfudUBteeB
         9b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234369; x=1685826369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1M2uEvC+G/8YxNFg2lTN37dQgI4DOWqSkPOhxZadHAc=;
        b=WWjLej5nLPJnpoboWEQifXyFA2VRMeXXOAvn11/TphhDS3NSOL0IPvaOh0IEMLht9n
         h3Go/rD3Ve8doXSIUwJxooV+DFC5VUHvAbgJvALU0jxx/9Z50sQxU9jgJOfP2FCXAuC1
         IMaSZ14WFMNCVK9rvUb1RAJdGtWTQZTmXsIHlfh0pTORWsTCPDd6O1QEn6FJiI5hvqnv
         JSAd7ayGeZ01yvKPXr8QjO3Y8KWZmZBBPyiqyrYqumzXolmHDvyTc2jaK/QS4zJpBrrl
         phHMH8vwWkqtmmibSb73TB5g/j7qkkNjvBX7nhDX1jX862iin1Eu8mM4Ntbu00Exe4nt
         PV4A==
X-Gm-Message-State: AC+VfDxKQxkoRMX/n8WG8Oew96ArOZEgoS5JuSGVc4d/LyBPtuR8Tvtd
        s1M7HYVd9g17pQve9v59EqE=
X-Google-Smtp-Source: ACHHUZ52EoifqloF2KP3dOdLybLkv4xT60Zu0uJqK9s/46jD4ndKIqUKf9AfpOYVWpUWK8NI7EAKNA==
X-Received: by 2002:a17:902:7689:b0:1a7:c058:a167 with SMTP id m9-20020a170902768900b001a7c058a167mr4182847pll.25.1683234368908;
        Thu, 04 May 2023 14:06:08 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:1820:e1d9:a5d0:ec8b? ([2001:df0:0:200c:1820:e1d9:a5d0:ec8b])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b001ab1d23bf5dsm3638003pll.258.2023.05.04.14.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 14:06:08 -0700 (PDT)
Message-ID: <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com>
Date:   Fri, 5 May 2023 09:06:03 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery
 following an address error
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
 <f4280683-9044-3858-3262-16080e584c96@gmail.com>
 <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
 <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 3/05/23 20:02, Finn Thain wrote:

> On Wed, 3 May 2023, Michael Schmitz wrote:
>
>>> I haven't yet tried to write code to demonstrate the theoretical
>>> address error issue but I can attempt that if need be. However, such
>>> code would be moot if this patch is going to be required anyway, just
>>> to fix the bus error case...
>> No, seeing the coprocessor conditional branch case we want this patch
>> even if we decide to handle data faults differently.
>>
>> That is, unless Andreas can come up with a reason why calculated branch
>> target adresses cannot be used with these coprocessor branch
>> instructions?
> Moreover, can Andreas or Geert come up with a better way to fix the actual
> bus error bug (nevermind the theoretical address error bug) than this same
> patch (which just happens to work for both)?

In terms of fixing the bus error bug, I think we'll need to fix this 
regression first (only first patch of yours applied):

> [16472.250000] Unable to handle kernel access at virtual address 409fa84e
> [16472.300000] Oops: 00000000
> [16472.340000] Modules linked in: ne 8390p
> [16472.400000] PC: [<00003b1a>] setup_frame+0x6e/0x1f8
> [16472.440000] SR: 2204  SP: dadced50  a2: 006020d0
> [16472.490000] d0: 00000000    d1: 00000000    d2: 00000000 d3: 00000000
> [16472.520000] d4: 00c85f6c    d5: 00003918    a0: c043dec8 a1: 006020d0
> [16472.550000] Process stress-ng (pid: 3239, task=362f381a)
> [16472.590000] Frame format=A ssw=0709 isc=0032 isb=0280 
> daddr=c043decc dobuf=0000000e
> [16472.640000] Stack from 00c85da8:
> [16472.640000]         00c85f6c 00000000 00000ca3 00000000 80088568 
> 8008c4d4 00c85fcc 0000381c
> [16472.640000]         effff6fc 00c85fa4 00c85dcc 00c85e84 000c8536 
> 00c85e90 00000001 00000001
> [16472.640000]         000c84fe 00c85e84 00c85e6e 00c85e84 000bae1e 
> 00c85e90 00000001 00000001
> [16472.640000]         00c85f00 005ba83c 00c85e6e 00c85e6e 00680484 
> 005ba7f8 00536b70 00982700
> [16472.640000]         0001ecb4 0080ac20 00c85f80 0001f2b0 00c85ea8 
> 0000000e 00536b70 000ce0bc
> [16472.640000]         0080ac20 00536b70 0001ecb4 0000000e 00981a34 
> 006023ce 00536b70 0001ecb4
> [16472.900000] Call Trace: [<0000381c>] test_ti_thread_flag+0x0/0x24
> [16472.940000]  [<000c8536>] free_pages_and_swap_cache+0x38/0x40
> [16472.970000]  [<000c84fe>] free_pages_and_swap_cache+0x0/0x40
> [16473.010000]  [<000bae1e>] tlb_flush_mmu+0x80/0x96
> [16473.060000]  [<0001ecb4>] __sigqueue_free+0x34/0x3a
> [16473.100000]  [<0001f2b0>] next_signal+0x0/0x54
> [16473.150000]  [<000ce0bc>] kmem_cache_free+0x4a/0x56
> [16473.190000]  [<0001ecb4>] __sigqueue_free+0x34/0x3a
> [16473.250000]  [<0001ecb4>] __sigqueue_free+0x34/0x3a
> [16473.300000]  [<0001f0e4>] recalc_sigpending+0x6/0x1e
> [16473.350000]  [<0001f388>] dequeue_signal+0x84/0x130
> [16473.390000]  [<00021402>] do_signal_stop+0x0/0x154
> [16473.430000]  [<002db200>] mt_destroy_walk+0x14e/0x160
> [16473.480000]  [<00021a06>] get_signal+0x3d8/0x4f6
> [16473.530000]  [<00021b06>] get_signal+0x4d8/0x4f6
> [16473.580000]  [<0000381c>] test_ti_thread_flag+0x0/0x24
> [16473.620000]  [<00004536>] do_notify_resume+0x3b2/0x480
> [16473.670000]  [<00002000>] _start+0x0/0x8
> [16473.720000]  [<00002bfa>] do_IRQ+0x26/0x32
> [16473.750000]  [<00002af4>] auto_irqhandler_fixup+0x4/0xc
> [16473.800000]  [<00002204>] do_one_initcall+0xa8/0x188
> [16473.850000]  [<002db0b2>] mt_destroy_walk+0x0/0x160
> [16473.900000]  [<00002aa0>] do_signal_return+0x10/0x1a
> [16473.940000]  [<00002a26>] syscall+0x8/0xc
> [16473.980000]  [<00002000>] _start+0x0/0x8
> [16474.010000]
> [16474.070000] Code: 6002 4280 4281 2401 0eab 6800 0004 8480 <302c> 
> 0032 0280 0000 0fff 2601 0eab 0800 0008 8483 761c d68b 0eab 3800 000c 8481
> [16474.210000] Disabling lock debugging due to kernel taint

objdump -d of setup_frame:

> 00003aac <setup_frame>:
>     3aac:       4fef fee4       lea %sp@(-284),%sp
>     3ab0:       48e7 3f1e       moveml %d2-%d7/%a3-%fp,%sp@-
>     3ab4:       282f 0148       movel %sp@(328),%d4
>     3ab8:       2c6f 0150       moveal %sp@(336),%fp
>     3abc:       284e            moveal %fp,%a4
>     3abe:       d9ee 0028       addal %fp@(40),%a4
>     3ac2:       e9ec 0004 0032  bfextu %a4@(50),0,4,%d0
>     3ac8:       2a70 0db0 002f  moveal @(00000000002fa214,%d0:l:4),%a5
>     3ace:       a214
>     3ad0:       2044            moveal %d4,%a0
>     3ad2:       2c28 0034       movel %a0@(52),%d6
>     3ad6:       4a8d            tstl %a5
>     3ad8:       6c06            bges 3ae0 <setup_frame+0x34>
>     3ada:       70f2            moveq #-14,%d0
>     3adc:       6000 01bc       braw 3c9a <dbl_thresh+0x99>
>     3ae0:       486d 0138       pea %a5@(312)
>     3ae4:       2f04            movel %d4,%sp@-
>     3ae6:       4eba fe7c       jsr %pc@(3964 <get_sigframe>)
>     3aea:       2648            moveal %a0,%a3
>     3aec:       508f            addql #8,%sp
>     3aee:       2a3c 0000 3918  movel #14616,%d5         <= 
> &raw_copy_to_user
>     3af4:       4a8d            tstl %a5
>     3af6:       6714            beqs 3b0c <setup_frame+0x60>
>     3af8:       2f0d            movel %a5,%sp@-
>     3afa:       486e 0034       pea %fp@(52)
>     3afe:       4868 0138       pea %a0@(312)
>     3b02:       2245            moveal %d5,%a1
>     3b04:       4e91            jsr %a1@         <= raw_copy_to_user()
>     3b06:       4fef 000c       lea %sp@(12),%sp
>     3b0a:       6002            bras 3b0e <setup_frame+0x62>
>     3b0c:       4280            clrl %d0
>     3b0e:       4281            clrl %d1
>     3b10:       2401            movel %d1,%d2
>     3b12:       0eab 6800 0004  movesl %d6,%a3@(4)
>     3b18:       8480            orl %d0,%d2
>     3b1a:       302c 0032       movew %a4@(50),%d0         <= fault PC
>     3b1e:       0280 0000 0fff  andil #4095,%d0
>     3b24:       2601            movel %d1,%d3
>     3b26:       0eab 0800 0008  movesl %d0,%a3@(8)
>     3b2c:       8483            orl %d3,%d2
>     3b2e:       761c            moveq #28,%d3
>     3b30:       d68b            addl %a3,%d3
>     3b32:       0eab 3800 000c  movesl %d3,%a3@(12)
>     3b38:       8481            orl %d1,%d2
>     3b3a:       4878 0004       pea 4 <CC3_CLRE_I>
>     3b3e:       206f 0150       moveal %sp@(336),%a0
>     3b42:       4868 0004       pea %a0@(4)
Which is this line, as far as I can make out:

> static int setup_frame(struct ksignal *ksig, sigset_t *set,
>                         struct pt_regs *regs)
> {
>         struct sigframe __user *frame;
>         struct pt_regs *tregs = rte_regs(regs);
>         int fsize = frame_extra_sizes(tregs->format);
>         struct sigcontext context;
>         int err = 0, sig = ksig->sig;
>
>         if (fsize < 0) {
>                 pr_debug("setup_frame: Unknown frame format %#x\n",
>                          tregs->format);
>                 return -EFAULT;
>         }
>
>         frame = get_sigframe(ksig, sizeof(*frame) + fsize);
>
>         if (fsize)
>                 err |= copy_to_user (frame + 1, regs + 1, fsize);
>
>         err |= __put_user(sig, &frame->sig);
>
>         err |= __put_user(tregs->vector, &frame->code);            <====
>         err |= __put_user(&frame->sc, &frame->psc);
>
Happened during this stressor:

> running --sigsegv 2 -t 300 --timestamp --no-rand-seed --times
> stress-ng: 09:18:25.65 info:  [3310] setting to a 300 second (5 mins, 
> 0.00 secs) run per stressor
> stress-ng: 09:18:25.80 info:  [3310] dispatching hogs: 2 sigsegv
> Timeout, server hobbes not responding.
I'll try with your second patch applied as well. I hadn't seen any 
regressions with a patch adding 256 bytes of gap indiscriminately 
though, so I'm sure that second patch itself is OK.

Cheers,

     Michael


