Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE805C433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Sep 2021 00:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C75CE60FE3
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Sep 2021 00:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbhILAwr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 11 Sep 2021 20:52:47 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37071 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229947AbhILAwr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 11 Sep 2021 20:52:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id F27A93200583;
        Sat, 11 Sep 2021 20:51:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 11 Sep 2021 20:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pDo863
        zDlGQK/7AGteslrBC9WZ9qHLXyZCaOCJpWZgg=; b=N1diOH5GhCi7UxgzF5eiAx
        ZtkifyVhhUkfolyj3yrrkIzRuMik00G7HkMnroYufI26lJgiECX1rKfL/oHQ7brP
        7X7ow3FQNNsRUwe3Bm8uZcU7sL4qoB2WkOb/0ekXqssOAUlL0vWU0vbRgaubUqfV
        eyy8/oabK3dqJCxYQ+7oCiY3/C6QAqk+SMi3baMbE2+/V/GrvyGvGz97crN/YmvT
        5yFRQMx9vbSJgnQ9oNaSfcPA0Hi0DvzHuZxtW35N6HhtMwVVZqzwNNJW6i/RaEMw
        wvdsEfhplcMbTMUofkPk9bjEERJdJuVyF8TE6bAyfil43sx911XjJZTRISALiYjw
        ==
X-ME-Sender: <xms:FE89YfLnM_UIDRR0iPM5gYahBB2fQyxUKf2Wz716XlMtIx4a4UHyng>
    <xme:FE89YTJKiwCCX7_cee47jvLtPm3rxIgJNSmMett7OO4-3Y4ZI45qwjshuAR4aaMny
    pel1Tu8aU_u-swr1jw>
X-ME-Received: <xmr:FE89YXvbbxlCq72RJGAZbYKysg3Cvhs_w9U9RlLjs6sJSD358sv86Lo4acbCm49Lrj7jRxV_1AhHUfdTVinTFfs9rgIw-TFatda1Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:FE89YYZhGJjDLaUj01ooaUHTg1IAiXHmBThfoGgKZxvBiK9v9giz7g>
    <xmx:FE89YWauywGmLn-vXwPUtCCXnGLeTvguME_8gwut0D40Nx6TGC5L2Q>
    <xmx:FE89YcCBV329jcoyPMF_f7wis6Thh4iTKqCYlH07LZ1ARve3TOgMsA>
    <xmx:FE89YU3RB8wY43CdQrbs7OrPPD_Ir9EXhpKlnHpSh6NCw4PgbWWfOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Sep 2021 20:51:29 -0400 (EDT)
Date:   Sun, 12 Sep 2021 10:51:21 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
Message-ID: <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org> <20210816075155.GA29187@lst.de> <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org> <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com> <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org> <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 10 Sep 2021, Michael Schmitz wrote:

> On 10/09/21 10:51, Finn Thain wrote:
> > On Wed, 8 Sep 2021, Michael Schmitz wrote:
> > 
> > > 
> > > In a related case, I've managed to swap my 'resume_userspace' format 
> > > error for a nice 'illegal instruction' format error apparently 
> > > caused by an invalid function pointer in 
> > > __handle_irq_event_percpu(), just by disabling all interrupts upon 
> > > entering the auto_inthandler and user_inthandler exception handlers. 
> > > This bug is quite readily reproduced by running your 
> > > kernel_coverage.sh script in a loop (panics on the first stress test 
> > > on the second pass):
> > > 
> > > Stress run 2
> > > Logging to stress-ng-20210908-0838.log
> > > ./kernel-coverage.sh: line 272: lcov: command not found
> > > running --fork 1 --fork-vm -t 60 --timestamp --no-rand-seed --times
> > > stress-ng: 08:40:08.70 info:  [1914] setting to a 60 second run per
> > > stressor
> > > stress-ng: 08:40:08.82 info:  [1914] dispatching hogs: 1 fork
> > > packet_write_wait: Connection to 10.1.1.4 port 22: Broken pipe
> > > 
> > > Why disabling interrupts during interrupt processing would make 
> > > matters worse doesn't make any sense to me...
> > > 
> > 
> > Are you able to reproduce that with a stock mainline build?
> 
> I still need to try that. The kernel panic went away when adding 
> additional local_irq_save()/local_irq_restore() in do_IRQ(),

I eventually realized that the code using percpu variables inside 
add_interrupt_randomness() outside of the spinlock may also need irqs 
disabled. So I've now done as you did, that is,

diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
index 9ab4f550342e..b46d8a57f4da 100644
--- a/arch/m68k/kernel/irq.c
+++ b/arch/m68k/kernel/irq.c
@@ -20,10 +20,13 @@
 asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
 {
 	struct pt_regs *oldregs = set_irq_regs(regs);
+	unsigned long flags;
 
+	local_irq_save(flags);
 	irq_enter();
 	generic_handle_irq(irq);
 	irq_exit();
+	local_irq_restore(flags);
 
 	set_irq_regs(oldregs);
 }

There may be a better way to achieve that. If the final IPL can be found 
in regs then it doesn't need to be saved again.

I haven't looked for a possible entropy pool improvement from correct 
locking in random.c -- it would not surprise me if there was one.

But none of this explains the panics I saw so I went looking for potential 
race conditions in the irq_enter_rcu() and irq_exit_rcu() code. I haven't 
found the bug yet.

However, I did notice that preempt_count_add() and preempt_count_sub() and 
the associated macros in linux/preempt.h produce very inefficient code in 
the interrupt fast path. Here's one example (there are others).

000323de <irq_enter_rcu>:
   323de:       4e56 0000       linkw %fp,#0
   323e2:       200f            movel %sp,%d0
   323e4:       0280 ffff e000  andil #-8192,%d0
   323ea:       2040            moveal %d0,%a0
   323ec:       2028 000c       movel %a0@(12),%d0
   323f0:       0680 0001 0000  addil #65536,%d0
   323f6:       2140 000c       movel %d0,%a0@(12)
   323fa:       082a 0001 000f  btst #1,%a2@(15)
   32400:       670c            beqs 3240e <irq_enter_rcu+0x30>
   32402:       2028 000c       movel %a0@(12),%d0
   32406:       2028 000c       movel %a0@(12),%d0
   3240a:       2028 000c       movel %a0@(12),%d0
   3240e:       4e5e            unlk %fp
   32410:       4e75            rts
