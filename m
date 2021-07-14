Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E5BC12002
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jul 2021 19:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B06AA613C5
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jul 2021 19:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhGNT3F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jul 2021 15:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGNT3E (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Jul 2021 15:29:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F28C06175F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jul 2021 12:26:11 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id o201so2944236pfd.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jul 2021 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WfF7xmrMOKzW8tlC6gGhz7JNdyHefEGJWWJvXQXbiFA=;
        b=GkHbTlg5nuOvvPVXwgcUNMhFKGzwsRztyhH7vGbGNIlunWsOlMLv9Pg9EGmbglkHu+
         Kb2c0rBU7x9C5ycOoC05NNS/qmBtsT/caTTzzJA9MWHEBXevCX1dPhAkOQ43PAOXU7w6
         okdIpYOkAlpC6n5PEh0PAyVj3DsZyE8zPn7Qjrsa+NJC/qGseRNeG0wy26E1dCGGDi1o
         t949przAQtTMfKjj2gfVegXu4u7hGl5R2+mpsuKdmBtXCGw+GpbDCJeqqIyZcdKYIzJM
         EYMCbL2JYqtqEbgVIXf+/xF6ei5K+Q1d1CWVF4bWEdTKcqiPxEeGfDdaF/kRxqsD19Yi
         yfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WfF7xmrMOKzW8tlC6gGhz7JNdyHefEGJWWJvXQXbiFA=;
        b=C/RKhk6IOYxjZX3BVORFuhHAG++bXueCKmwm7NA7Na2XeMiYac42OGgbVHBrAVwC6p
         mAFDAhbEUuNWdDDGn0HngJQor5Mprq5EmUJ/pWvzV025MVkmI/uJ8hvheu1MMq9nF2lu
         d1BCw69L3+t1wmtrm0up502SG/iGwhM9VL85Z81T8FS0wYRKcNcEF6SsnRin9MLztlWV
         T/vQuH/cMXIGUpEo2Bd8+u/5Ydd9Pv/V7yJt55ZdpXKx2A4HMhJnq8nh3HvAe2V7YpgN
         3EdPalHURJQX5xNB3uX6i2QZIWj0Stb128IZMrRLBfFk0+M4DqTE0d2Y8qS2YAr4jQZO
         wM8g==
X-Gm-Message-State: AOAM531IpEiPq2Wzf7qLcJc2yYhNi2xJbguPdCdZx0GShrmyBH+icSfq
        10o4F6Uwi0rE5UhaoKLfoow=
X-Google-Smtp-Source: ABdhPJxf/ETD1n1q37s70pXgb9hi+18lim7Frq2eDqIQFJOvNOK7QMd3H8egA/2NuSIb/lRYf26Hrg==
X-Received: by 2002:a63:f750:: with SMTP id f16mr11270940pgk.292.1626290770549;
        Wed, 14 Jul 2021 12:26:10 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a8c2:f709:adfc:33f? ([2001:df0:0:200c:a8c2:f709:adfc:33f])
        by smtp.gmail.com with ESMTPSA id o1sm2956776pjf.56.2021.07.14.12.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 12:26:09 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
Message-ID: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
Date:   Thu, 15 Jul 2021 07:26:04 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713085419.GA22839@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 13.07.2021 um 20:54 schrieb Christoph Hellwig:
> On Tue, Jul 13, 2021 at 08:16:25PM +1200, Michael Schmitz wrote:
>> I'll try that next. It certainly ran fine when I tried your earlier version
>> which still had the __constant_copy_from_user() (but modified to use
>> __get_user_asm() for the 1, 2 and 4 byte cases). That doesn't prove much
>> though - I may not have hit the exact same memory pressure (not sure how
>> often savelogs runs on that system, and I haven't checked how much the
>> kernel size differs between the two versions).
>>
>> Anyway, I'll try my previous version again, and I'll try with the WARN_ON

That one crashed even harder - again with the same odd repetitive 
pattern around the trap PC, but resulting in a kernel panic this time:

[25187.890000] Data read fault at 0x00000000 in CPU (pc=0x80050d06)
[25187.900000] *** LINE 1010 ***   FORMAT=0
[25187.900000] Current process id is 1409
[25187.900000] BAD KERNEL TRAP: 00000000
[25187.900000] Modules linked in: atari_scsi ne 8390p
[25187.900000] PC: [<0000f85c>] PITBL+0xc8/0x410
[25187.900000] SR: 2608  SP: e17e02dc  a2: 004a28ae
[25187.900000] d0: 00000000    d1: 00000800    d2: 00000000    d3: 00000040
[25187.900000] d4: 00000000    d5: 00049ef6    a0: 0000f858    a1: 003ee318
[25187.900000] Process savelog (pid: 1409, task=59e59dd6)
[25187.900000] Frame format=0
[25187.900000] Stack from 00593d24:
[25187.900000]         00049f6e 00000040 004b0800 00000001 00000040 0000000
0 00049ef6 002c7bb2
[25187.900000]         003ee318 003ec508 00593de8 00593d68 0004a01e 003ee31
8 00593d68 003ee318
[25187.900000]         000279fe 00000000 0004a06e 003ee318 003ee318 0004c47
8 003ee318 003ee318
[25187.900000]         000499b8 000499de 003ee318 00007a82 00000040 0000000
0 0000000c 00803100
[25187.900000]         00049f6e 0000000c 003b489c 00000000 00046a12 0000000
0 00000000 00000001
[25187.900000]         003ec508 00000000 00049802 00593de8 0004a01e 003ec50
8 00593de8 003ec508
[25187.900000] Call Trace: [<00049f6e>] __handle_irq_event_percpu+0x38/0xce
[25187.900000]  [<00049ef6>] __irq_wake_thread+0x0/0x40
[25187.900000]  [<002c7bb2>] printk+0x0/0x18
[25187.900000]  [<0004a01e>] handle_irq_event_percpu+0x1a/0x4c
[25187.900000]  [<000279fe>] warn_slowpath_fmt+0x0/0x62
[25187.900000]  [<0004a06e>] handle_irq_event+0x1e/0x30
[25187.900000]  [<0004c478>] handle_simple_irq+0x48/0x4e
[25187.900000]  [<000499b8>] generic_handle_irq+0x0/0x30
[25187.900000]  [<000499de>] generic_handle_irq+0x26/0x30
[25187.900000]  [<00007a82>] mfp_timer_d_handler+0x24/0x34
[25187.900000]  [<00049f6e>] __handle_irq_event_percpu+0x38/0xce
[25187.900000]  [<00046a12>] msg_print_ext_body+0x0/0x6a
[25187.900000]  [<00049802>] prb_read_valid+0x0/0x1e
[25187.900000]  [<0004a01e>] handle_irq_event_percpu+0x1a/0x4c
[25187.900000]  [<00046640>] info_print_ext_header.constprop.35+0x0/0x8a
[25187.900000]  [<0004a06e>] handle_irq_event+0x1e/0x30
[25187.900000]  [<0004c478>] handle_simple_irq+0x48/0x4e
[25187.900000]  [<000499de>] generic_handle_irq+0x26/0x30
[25187.900000]  [<00002c28>] do_IRQ+0x20/0x32
[25187.900000]  [<00002204>] do_one_initcall+0x90/0x150
[25187.900000]  [<00002b38>] user_irqvec_fixup+0xc/0x14
[25187.900000]  [<00002204>] do_one_initcall+0x90/0x150
[25187.900000]  [<00046a12>] msg_print_ext_body+0x0/0x6a
[25187.900000]  [<00048912>] __printk_safe_exit+0x0/0x10
[25187.900000]  [<000078de>] atari_scc_console_write+0x0/0x4a
[25187.900000]  [<00048912>] __printk_safe_exit+0x0/0x10
[25187.900000]  [<00048902>] __printk_safe_enter+0x0/0x10
[25187.900000]  [<000016e8>] kernel_pg_dir+0x6e8/0x1000
[25187.900000]  [<000484be>] vprintk_emit+0xe8/0xfa
[25187.900000]  [<0000376f>] show_cpuinfo+0x14f/0x19a
[25187.900000]  [<000484e6>] vprintk_default+0x16/0x1c
[25187.900000]  [<002c7bc4>] printk+0x12/0x18
[25187.900000]  [<00005786>] buserr_c+0x26a/0x4a8
[25187.900000]  [<00002934>] buserr+0x20/0x28
[25187.900000]  [<0000f85a>] PITBL+0xc6/0x410
[25187.900000]  [<000279fe>] warn_slowpath_fmt+0x0/0x62
[25187.900000]  [<0000f85a>] PITBL+0xc6/0x410
[25187.900000]  [<0000f31a>] WORK+0x88/0xca
[25187.900000]  [<00049f6e>] __handle_irq_event_percpu+0x38/0xce
[25187.900000]
[25187.900000] Code: 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 <3cb8> 3cb8 
3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8 3cb8


I've got a vague recollection that I've seen weird crashes in the past 
related to temperature extremes (we've had a few unusually cold days in 
our parts just now), so I've gone back to a kernel from the switch stack 
/ refactoring exit tests (which ran the stress tests fine earlier) to 
rule that one out. Looking good so far, so I begin to wonder whether we 
need to introduce get_fc() and use that to restore the original sfc/dfc 
instead of assuming USER_DATA is always correct?

>> removed, but that'll take a few days (did I mention this 030 is clocked at
>> 16 MHz only?).
>
> No problem.
>
>> I suspect it may get called from an interrupt - not sure what interrupt
>> handler would call vm_map_ram(), or if that even is allowed though. Might
>> happen during a softirq, which is covered by in_interrupt as well ...
>
> vm_map_ram isn't allowed to be called from interrupts, just like all the
> vmalloc/vmap code.  But that doesn't mean it might not have crept in
> somewhere.

That's what I recalled, thanks.

Cheers,

	Michael

