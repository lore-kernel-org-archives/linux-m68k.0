Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0CAC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 01:28:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02D9561057
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 01:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbhIMB3S (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Sep 2021 21:29:18 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:45187 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233133AbhIMB3R (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 12 Sep 2021 21:29:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 65D13320090B;
        Sun, 12 Sep 2021 21:28:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 12 Sep 2021 21:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2DZyZ+
        w6WstEC5OjL7kL4DCramNXzWhieSxddBqZ8yo=; b=kSLQbHlQzWwtDBnTRbwb3u
        DNP8i77R/Vuv2jJ5KUqZFep4bAbj5RX9xrZNvtCOCmqF3ASZVUCy43vZWdSAIClu
        k1nUi46RMjqhnUzyBAQL+W3oPAlXZRAZzLqb3XVeWIGH7im1vV9RbeOcNNydzes1
        DDhFbsN9HE4w3Bn9LN5IaTHmVDTGwIZlqFJU8SYKhVzqfU9TuJeY14y2hMeF90Z+
        s9WGTtVUlcQR5QzUZxv8Jk7c/PKPHvpPpm7diE4x0Wqznpe164AVwcj6YGiUhHTU
        eM2ralyfz0NvLYtvRlV04OdrAPO/uf9V98p8I3MHG6gsadKxnlSW9d4fE8XJpsIg
        ==
X-ME-Sender: <xms:Iak-YXOrG_WnWVfcv1wSOHhDbIQLnviysKUMD3VRqYz65Lm5yqVEOA>
    <xme:Iak-YR9uy0gfMv0YPiexeu_A1LODIqv7v0TnCZAV93ObxB71RNqsFF82-hBpijEjJ
    JsYW3zLgq6NpHui5HQ>
X-ME-Received: <xmr:Iak-YWQVgiECqWDYmsJzpBvFdgIrMu-u5F1i1KfLzEG2gxYc-WtjHO1b0km7usCSVdloNk-XiOcIesgIv6_26XorQwegFze1jKQ0vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Iak-YbtfrtjON9bM-nQt6clLfDtpI0-d_Yh-hCG-chJGfTo4wXL-Cw>
    <xmx:Iak-YfeI6JLH3BSBHp3amajF062zyUyL07NqeeCPqF_QmlT4SOXphw>
    <xmx:Iak-YX3Xqm6eD4dGbtBlNdBHhjuAwr0lIHh9sDYxd0NVmS_Vaj4aEA>
    <xmx:Iqk-Ydql3VZipaq-gERbaI2Q63mqPkC35xhJDGHClLZhwM5NCQ4MRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Sep 2021 21:27:58 -0400 (EDT)
Date:   Mon, 13 Sep 2021 11:27:55 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
Message-ID: <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <20210816075155.GA29187@lst.de> <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com>
 <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org> <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org> <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com> <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 12 Sep 2021, Finn Thain wrote:

> ... I've now done as you did, that is,
> 
> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
> index 9ab4f550342e..b46d8a57f4da 100644
> --- a/arch/m68k/kernel/irq.c
> +++ b/arch/m68k/kernel/irq.c
> @@ -20,10 +20,13 @@
>  asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>  {
>  	struct pt_regs *oldregs = set_irq_regs(regs);
> +	unsigned long flags;
>  
> +	local_irq_save(flags);
>  	irq_enter();
>  	generic_handle_irq(irq);
>  	irq_exit();
> +	local_irq_restore(flags);
>  
>  	set_irq_regs(oldregs);
>  }
> 
> There may be a better way to achieve that. If the final IPL can be found 
> in regs then it doesn't need to be saved again.
> 
> I haven't looked for a possible entropy pool improvement from correct 
> locking in random.c -- it would not surprise me if there was one.
> 
> But none of this explains the panics I saw so I went looking for potential 
> race conditions in the irq_enter_rcu() and irq_exit_rcu() code. I haven't 
> found the bug yet.
> 

Turns out that the panic bug was not affected by that patch...

running --mmap -1 --mmap-odirect --mmap-bytes 100% -t 60 --timestamp --no-rand-seed --times
stress-ng: 17:06:09.62 info:  [1241] setting to a 60 second run per stressor
stress-ng: 17:06:09.62 info:  [1241] dispatching hogs: 1 mmap
[  807.270000] Kernel panic - not syncing: Aiee, killing interrupt handler!
[  807.270000] CPU: 0 PID: 1243 Comm: stress-ng Not tainted 5.14.0-multi-00002-g69f953866c7e #2
[  807.270000] Stack from 00bcbde4:
[  807.270000]         00bcbde4 00488d85 00488d85 000c0000 00bcbe00 003f3708 00488d85 00bcbe20
[  807.270000]         003f270e 000c0000 418004fc 00bca000 009f8a80 00bca000 00a06fc0 00bcbe5c
[  807.270000]         000317f6 0048098b 00000009 418004fc 00bca000 00000000 07408000 00000009
[  807.270000]         00000008 00bcbf38 00a06fc0 00000006 00000000 00000001 00bcbe6c 000319ac
[  807.270000]         00000009 01438a20 00bcbeb8 0003acf0 00000009 0000000f 0000000e c043c000
[  807.270000]         00000000 07408000 00000003 00bcbf98 efb2c944 efb2b8a8 00039afa 00bca000
[  807.270000] Call Trace: [<000c0000>] insert_vmap_area.constprop.91+0xbc/0x15a
[  807.270000]  [<003f3708>] dump_stack+0x10/0x16
[  807.270000]  [<003f270e>] panic+0xba/0x2bc
[  807.270000]  [<000c0000>] insert_vmap_area.constprop.91+0xbc/0x15a
[  807.270000]  [<000317f6>] do_exit+0x87e/0x9d6
[  807.270000]  [<000319ac>] do_group_exit+0x28/0xb6
[  807.270000]  [<0003acf0>] get_signal+0x126/0x720
[  807.270000]  [<00039afa>] send_signal+0xde/0x16e
[  807.270000]  [<00004f70>] do_notify_resume+0x38/0x61c
[  807.270000]  [<0003abaa>] force_sig_fault_to_task+0x36/0x3a
[  807.270000]  [<0003abc6>] force_sig_fault+0x18/0x1c
[  807.270000]  [<000074f4>] send_fault_sig+0x44/0xc6
[  807.270000]  [<00006a62>] buserr_c+0x2c8/0x6a2
[  807.270000]  [<00002cfc>] do_signal_return+0x10/0x1a
[  807.270000]  [<0018800e>] ext4_htree_fill_tree+0x7c/0x32a
[  807.270000]  [<0010800a>] d_absolute_path+0x18/0x6a
[  807.270000] 
[  807.270000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---

On the Quadra 630, the panic almost completely disappeared when I enabled 
the relevant CONFIG_DEBUG_* options. After about 7 hours of stress testing 
I got this:

[23982.680000] list_add corruption. next->prev should be prev (00b51e98), but was 00bb22d8. (next=00b75cd0).
[23982.690000] kernel BUG at lib/list_debug.c:25!
[23982.700000] *** TRAP #7 ***   FORMAT=0
[23982.710000] Current process id is 15489
[23982.720000] BAD KERNEL TRAP: 00000000
[23982.740000] Modules linked in:
[23982.750000] PC: [<00261e62>] __list_add_valid+0x62/0xc0
[23982.760000] SR: 2000  SP: e2fb938b  a2: 00bcba80
[23982.770000] d0: 00000022    d1: 00000002    d2: 008c4e40    d3: 00b7a9c0
[23982.780000] d4: 00b51e98    d5: 000da3c0    a0: 00067f00    a1: 00b51d2c
[23982.790000] Process stress-ng (pid: 15489, task=35ee07ca)
[23982.800000] Frame format=0 
[23982.810000] Stack from 00b51e80:
[23982.810000]         004cbab9 004ea3a1 00000019 004ea34f 00b51e98 00bb22d8 00b75cd0 008c4e38
[23982.810000]         00b51ecc 000da3f2 008c4e40 00b51e98 00b75cd0 00b51e5c 000f5d40 00b75cd0
[23982.810000]         00b7a9c0 00bb22d0 00b7a9c0 00b51f04 000dc346 00b51e5c 008c4e38 00b7a9c0
[23982.810000]         c4c97000 00000000 c4c96000 00102073 00b14960 c4c97000 00b51e5c 00b75c94
[23982.810000]         00000001 00b51f24 000d5628 00b51e5c 00b75c94 00102070 00000000 00b75c94
[23982.810000]         00b75c94 00b51f3c 000d5728 00b14960 00b75c94 c4c97000 00000000 00b51f78
[23982.830000] Call Trace: [<000da3f2>] anon_vma_chain_link+0x32/0x80
[23982.840000]  [<000f5d40>] kmem_cache_alloc+0x0/0x200
[23982.850000]  [<000dc346>] anon_vma_clone+0xc6/0x180
[23982.860000]  [<00102073>] cdev_get+0x33/0x80
[23982.870000]  [<000d5628>] __split_vma+0x68/0x140
[23982.880000]  [<00102070>] cdev_get+0x30/0x80
[23982.890000]  [<000d5728>] split_vma+0x28/0x40
[23982.900000]  [<000d83ba>] mprotect_fixup+0x13a/0x200
[23982.910000]  [<00102070>] cdev_get+0x30/0x80
[23982.920000]  [<000d8280>] mprotect_fixup+0x0/0x200
[23982.930000]  [<000d85b2>] sys_mprotect+0x132/0x1c0
[23982.940000]  [<00102070>] cdev_get+0x30/0x80
[23982.950000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[23982.960000]  [<000071df>] flush_icache_range+0x1f/0x40
[23982.970000]  [<00002ca4>] syscall+0x8/0xc
[23982.980000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[23982.990000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[23983.000000]  [<00002000>] _start+0x0/0x40
[23983.010000]  [<0018800e>] ext4_ext_remove_space+0x20e/0x1540
[23983.030000] 
[23983.040000] Code: 4879 004e a3a1 4879 004c bab9 4e93 4e47 <b089> 6704 b088 661c 2f08 2f2e 000c 2f00 4879 004e a404 47f9 0043 d16c 4e93 4878
[23983.060000] Disabling lock debugging due to kernel taint

I am still unable to reproduce this in Aranym or QEMU. (Though I did find 
a QEMU bug in the attempt.)

I suppose list pointer corruption could have resulted in the above panic 
had it gone undetected. So it's tempting to blame the panic on bad DRAM -- 
especially if this anon_vma_chain struct always gets placed at the same 
physical address (?)
