Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAA8C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 03:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F69760F4C
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 03:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238385AbhIMD3V (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Sep 2021 23:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238440AbhIMD3U (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Sep 2021 23:29:20 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F344DC061574
        for <linux-m68k@vger.kernel.org>; Sun, 12 Sep 2021 20:28:05 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso5461747pjq.4
        for <linux-m68k@vger.kernel.org>; Sun, 12 Sep 2021 20:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=93pdQanBaogdPRhzvGzCOrJH6boIKq5bGiBPqIVzMxc=;
        b=SM5zvo6PV8K7UtBFY/nYXVPyhbSSbNFkL87f1S8z8NYBCGIRttFGhz/CkxRJtWU9AJ
         q2/IOVwH8jwMIitECvdaPw7No6SdrVKgWe3WFKnq6B47a2BaoSlxamPG9N8Y1EIgta5W
         ntmw+Pm0RRvLC3AbQuUOMCJjKW+9OomDaNLfzn8tMvuOOSyPhmrNTfHeN+iMLmZiHGx/
         y/8L2Ew+4dq7+y0OEoQ12O2ILwkR2kj2V6HSkxAb8jLZ1ixK3bWUaGkNSAtChTmsysXn
         bfbRYNMslOebmYhFYkcZUxdVSasgkQ//8Qfyfr0JZgGFb4QHVPU6JbXo0BiczCctMCQw
         mdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=93pdQanBaogdPRhzvGzCOrJH6boIKq5bGiBPqIVzMxc=;
        b=OuBw5X4FBAqrO/PVuiBzsdPqmhic+08VXuIxAHWr6T84oKY2bMhb+BMlgwB/E0xgqZ
         TU1NcDAtZTtvkX5DFjRjWN9DE5aB0jSPLSlVJYFnxSAPLc9272AK3ouLqtKH2rSs+LBV
         OfXOKXwEkdh+YXHCaK4UEch2ECJCLiEVOWoiWHfJQzNJ53qHMuQpKn39lHXhrrumWN1c
         w3zDlmWvzP6bZAu5Y/mVEjO41byN8cWERxEpzGVPRy31/T7DnurKeGjGGCkpPhsUx7ho
         bPfHrV/P1Fx+WWL1cQYxAfSrmWXS+45QH+aZrRnwdXMURFjaBGqUpKHCpLRwcZbSxO2l
         4ZTg==
X-Gm-Message-State: AOAM533rB1Y2vOkg9r2pAmRyqJQG9MKHhkBiaJ7WOi/GUnMD5x/MIwzh
        1VjjLkKQ3HHoDdH0U6Iam7VJyUn3+ms=
X-Google-Smtp-Source: ABdhPJyx9PR8VswNI662ZmFcHBD++HWy3uZUxXG/FqABpQXUNidiiajiqn5pM2SSzJvREu8SLLdstA==
X-Received: by 2002:a17:902:b704:b0:13a:2bd9:3534 with SMTP id d4-20020a170902b70400b0013a2bd93534mr8723574pls.24.1631503684932;
        Sun, 12 Sep 2021 20:28:04 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id cm5sm4884502pjb.24.2021.09.12.20.28.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 20:28:04 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com>
 <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org>
 <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com>
 <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com>
 <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
 <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
 <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
 <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
Date:   Mon, 13 Sep 2021 15:26:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/09/21 13:27, Finn Thain wrote:
> On Sun, 12 Sep 2021, Finn Thain wrote:
>
>> ... I've now done as you did, that is,
>>
>> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
>> index 9ab4f550342e..b46d8a57f4da 100644
>> --- a/arch/m68k/kernel/irq.c
>> +++ b/arch/m68k/kernel/irq.c
>> @@ -20,10 +20,13 @@
>>  asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>>  {
>>  	struct pt_regs *oldregs = set_irq_regs(regs);
>> +	unsigned long flags;
>>
>> +	local_irq_save(flags);
>>  	irq_enter();
>>  	generic_handle_irq(irq);
>>  	irq_exit();
>> +	local_irq_restore(flags);
>>
>>  	set_irq_regs(oldregs);
>>  }
>>
>> There may be a better way to achieve that. If the final IPL can be found
>> in regs then it doesn't need to be saved again.
>>
>> I haven't looked for a possible entropy pool improvement from correct
>> locking in random.c -- it would not surprise me if there was one.
>>
>> But none of this explains the panics I saw so I went looking for potential
>> race conditions in the irq_enter_rcu() and irq_exit_rcu() code. I haven't
>> found the bug yet.
>>
>
> Turns out that the panic bug was not affected by that patch...
>
> running --mmap -1 --mmap-odirect --mmap-bytes 100% -t 60 --timestamp --no-rand-seed --times
> stress-ng: 17:06:09.62 info:  [1241] setting to a 60 second run per stressor
> stress-ng: 17:06:09.62 info:  [1241] dispatching hogs: 1 mmap
> [  807.270000] Kernel panic - not syncing: Aiee, killing interrupt handler!
> [  807.270000] CPU: 0 PID: 1243 Comm: stress-ng Not tainted 5.14.0-multi-00002-g69f953866c7e #2
> [  807.270000] Stack from 00bcbde4:
> [  807.270000]         00bcbde4 00488d85 00488d85 000c0000 00bcbe00 003f3708 00488d85 00bcbe20
> [  807.270000]         003f270e 000c0000 418004fc 00bca000 009f8a80 00bca000 00a06fc0 00bcbe5c
> [  807.270000]         000317f6 0048098b 00000009 418004fc 00bca000 00000000 07408000 00000009
> [  807.270000]         00000008 00bcbf38 00a06fc0 00000006 00000000 00000001 00bcbe6c 000319ac
> [  807.270000]         00000009 01438a20 00bcbeb8 0003acf0 00000009 0000000f 0000000e c043c000
> [  807.270000]         00000000 07408000 00000003 00bcbf98 efb2c944 efb2b8a8 00039afa 00bca000
> [  807.270000] Call Trace: [<000c0000>] insert_vmap_area.constprop.91+0xbc/0x15a
> [  807.270000]  [<003f3708>] dump_stack+0x10/0x16
> [  807.270000]  [<003f270e>] panic+0xba/0x2bc
> [  807.270000]  [<000c0000>] insert_vmap_area.constprop.91+0xbc/0x15a
> [  807.270000]  [<000317f6>] do_exit+0x87e/0x9d6
> [  807.270000]  [<000319ac>] do_group_exit+0x28/0xb6
> [  807.270000]  [<0003acf0>] get_signal+0x126/0x720
> [  807.270000]  [<00039afa>] send_signal+0xde/0x16e
> [  807.270000]  [<00004f70>] do_notify_resume+0x38/0x61c
> [  807.270000]  [<0003abaa>] force_sig_fault_to_task+0x36/0x3a
> [  807.270000]  [<0003abc6>] force_sig_fault+0x18/0x1c
> [  807.270000]  [<000074f4>] send_fault_sig+0x44/0xc6
> [  807.270000]  [<00006a62>] buserr_c+0x2c8/0x6a2
> [  807.270000]  [<00002cfc>] do_signal_return+0x10/0x1a
> [  807.270000]  [<0018800e>] ext4_htree_fill_tree+0x7c/0x32a
> [  807.270000]  [<0010800a>] d_absolute_path+0x18/0x6a
> [  807.270000]
> [  807.270000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---
>
> On the Quadra 630, the panic almost completely disappeared when I enabled
> the relevant CONFIG_DEBUG_* options. After about 7 hours of stress testing
> I got this:
>
> [23982.680000] list_add corruption. next->prev should be prev (00b51e98), but was 00bb22d8. (next=00b75cd0).

I chased a similar list corruption bug (shadow LRU list corrupt in 
mm/workingset.c:shadow_lru_isolate()) in 4.10. I believe that was 
related to an out of bounds memory access - maybe get_reg() from 
drivers/char/random.c but it might have been something else.

That bug had disappeared in 4.12, haven't seen it ever since.


> [23982.690000] kernel BUG at lib/list_debug.c:25!
> [23982.700000] *** TRAP #7 ***   FORMAT=0
> [23982.710000] Current process id is 15489
> [23982.720000] BAD KERNEL TRAP: 00000000
> [23982.740000] Modules linked in:
> [23982.750000] PC: [<00261e62>] __list_add_valid+0x62/0xc0
> [23982.760000] SR: 2000  SP: e2fb938b  a2: 00bcba80
> [23982.770000] d0: 00000022    d1: 00000002    d2: 008c4e40    d3: 00b7a9c0
> [23982.780000] d4: 00b51e98    d5: 000da3c0    a0: 00067f00    a1: 00b51d2c
> [23982.790000] Process stress-ng (pid: 15489, task=35ee07ca)
> [23982.800000] Frame format=0
> [23982.810000] Stack from 00b51e80:
> [23982.810000]         004cbab9 004ea3a1 00000019 004ea34f 00b51e98 00bb22d8 00b75cd0 008c4e38
> [23982.810000]         00b51ecc 000da3f2 008c4e40 00b51e98 00b75cd0 00b51e5c 000f5d40 00b75cd0
> [23982.810000]         00b7a9c0 00bb22d0 00b7a9c0 00b51f04 000dc346 00b51e5c 008c4e38 00b7a9c0
> [23982.810000]         c4c97000 00000000 c4c96000 00102073 00b14960 c4c97000 00b51e5c 00b75c94
> [23982.810000]         00000001 00b51f24 000d5628 00b51e5c 00b75c94 00102070 00000000 00b75c94
> [23982.810000]         00b75c94 00b51f3c 000d5728 00b14960 00b75c94 c4c97000 00000000 00b51f78
> [23982.830000] Call Trace: [<000da3f2>] anon_vma_chain_link+0x32/0x80
> [23982.840000]  [<000f5d40>] kmem_cache_alloc+0x0/0x200
> [23982.850000]  [<000dc346>] anon_vma_clone+0xc6/0x180
> [23982.860000]  [<00102073>] cdev_get+0x33/0x80
> [23982.870000]  [<000d5628>] __split_vma+0x68/0x140
> [23982.880000]  [<00102070>] cdev_get+0x30/0x80
> [23982.890000]  [<000d5728>] split_vma+0x28/0x40
> [23982.900000]  [<000d83ba>] mprotect_fixup+0x13a/0x200
> [23982.910000]  [<00102070>] cdev_get+0x30/0x80
> [23982.920000]  [<000d8280>] mprotect_fixup+0x0/0x200
> [23982.930000]  [<000d85b2>] sys_mprotect+0x132/0x1c0
> [23982.940000]  [<00102070>] cdev_get+0x30/0x80
> [23982.950000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [23982.960000]  [<000071df>] flush_icache_range+0x1f/0x40
> [23982.970000]  [<00002ca4>] syscall+0x8/0xc
> [23982.980000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [23982.990000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [23983.000000]  [<00002000>] _start+0x0/0x40
> [23983.010000]  [<0018800e>] ext4_ext_remove_space+0x20e/0x1540
> [23983.030000]
> [23983.040000] Code: 4879 004e a3a1 4879 004c bab9 4e93 4e47 <b089> 6704 b088 661c 2f08 2f2e 000c 2f00 4879 004e a404 47f9 0043 d16c 4e93 4878
> [23983.060000] Disabling lock debugging due to kernel taint
>
> I am still unable to reproduce this in Aranym or QEMU. (Though I did find
> a QEMU bug in the attempt.)
>
> I suppose list pointer corruption could have resulted in the above panic
> had it gone undetected. So it's tempting to blame the panic on bad DRAM --

Yes, such list corruption may well cause a kernel panic. I'd expect bad 
DRAM to manifest other ways before a corrupted linked list causes a 
kernel panic though. Filesystem corruption, for instance.

> especially if this anon_vma_chain struct always gets placed at the same
> physical address (?)

Does it? I think this would be part of the per-process VMA data, not 
something like page tables ...

Incidentally - have you ever checked whether Al Viro's signal handling 
fixes have an impact on these bugs?

Cheers,

	Michael


