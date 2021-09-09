Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB06C433F5
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 09:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF39161179
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 09:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhIIJlh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Sep 2021 05:41:37 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59479 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhIIJlh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Sep 2021 05:41:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id AFD243200923;
        Thu,  9 Sep 2021 05:40:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 09 Sep 2021 05:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+JA8Rg
        PCCDoNltxPPq6k9pEJqQx6h2rLzauycFZccbE=; b=ur1sCM3i4afZyAZma2blHS
        /nkULHl5keeakFn+HuIPz4B1CW/YSNKCjiFX94OfBfKOkTO1oP9jWopX3lRvCkqk
        Fk85JpShBIrwpErk5/iV75jYbdKHIuzwfkBkNVCYcCIBwbWCoo+710MQE54oEMEU
        YHClCRoEMFtpszyDC5Z6drpY1hnK2A74b5RiFmAFgjaxmXoK3Ds3ACX5bsLYIwTt
        CtefRjLVx/T6eVdVCmoamGnOPEWFTW65SggkDHZJRGgw1ZLmpF6lXFZ50n4P6zQo
        3UYHtIB9M8/S8eUvk1zleNPCPZdpCeyyTkl/lVXuVTDGKS6FQN5UgmaP8sReWBHA
        ==
X-ME-Sender: <xms:i9Y5YYc6BcfjuakM97EGKlZ5fo-Oa0pJAU5tNot2DiPuRjA2IxJ9ng>
    <xme:i9Y5YaNROb5aJbn2ulyBQ2syJtgeD9hPnMRE23x5eLOqh_dV8v2QkOQwC7Isxz0yk
    _Z91IpBtJGhp_1VifM>
X-ME-Received: <xmr:i9Y5YZiMZBGfRSorvor7wFpnhJNhRXorhyC2AaIqt5wz-b1KepjNP_sLzKcf9f5HAlb4GgteX1Tr_YwOmjXRtdS7Ja1dxnv5UH8n6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:i9Y5Yd_YI2_3W2JobJkPRDREidKbx8QWsxl9mmN3TpmiyRPRoGCfTg>
    <xmx:i9Y5YUt18xLAq75YzjocSDIGIFQ9oI4NPtHrzkNnB8VrrOdq8Uo2OA>
    <xmx:i9Y5YUHvFHlBc30P8un051zchoyUupv54GSr675YYP5eVLMDHGDI3g>
    <xmx:i9Y5Yd71apheP3GWX_T3zr5cnPDFRC_RCa99-3AEXjQlrRJuehthPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 05:40:25 -0400 (EDT)
Date:   Thu, 9 Sep 2021 19:40:17 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
Message-ID: <1386e769-cdb1-afcb-c8a0-c66f05ca6ee@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <20210815074236.GA23777@lst.de> <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de> <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org> <20210816075155.GA29187@lst.de>
 <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 8 Sep 2021, Michael Schmitz wrote:

> On 08/09/21 11:50, Finn Thain wrote:
> > On Tue, 7 Sep 2021, Michael Schmitz wrote:
> > 
> > > > Does anyone know what causes this?
> > > 
> > > Our practice to run interrupt handlers at the IPL of the current 
> > > interrupt under service, instead of disabling local interrupts for 
> > > the duration of the handler?
> > > 
> > 
> > Lock contention will happen anyway.
> > 
> > If using spin_trylock() outside of "atomic" context was a bug 
> > (really?) then it can't be used here.
> 
> add_interrupt_randomness() relies on interrupts being disabled in 
> __handle_irq_event_percpu(), so this check assumes atomic context.
> 

But __handle_irq_event_percpu() also assumes that local interrupts have 
been disabled. There is a WARN_ONCE to that effect.

> Our definition of irqs_disabled() invalidates that assumption.
> 
> > Perhaps add_interrupt_randomness() should use the lock in irq mode, 
> > like the rest of drivers/char/random.c does.
> 
> That might deadlock on SMP when a task reading from the random pool 
> holding the lock executes on the same CPU as the interrupt.
> 

That does not make sense to me. add_interrupt_randomness() effectively 
does acquire the lock in irq mode on SMP ports yet it doesn't deadlock.

> In the UP case, the spinlock is optimized away, 

Yes and spin_trylock() always succeeds. Hence CONFIG_SPINLOCK_DEBUG 
asserts that the lock is never contended. 

One thing that bothered me when I raised this issue was the apparent false 
positive from CONFIG_SPINLOCK_DEBUG. But after sleeping on it, it makes 
more sense to me.

(Perhaps the difficulty here is !SMP && !PREEMPT_COUNT. If PREEMPT_COUNT 
was available on m68k then spin_trylock() might be expected to test 
preempt_count, and the problem would not arise.)

BTW, the problem went away when I changed to irq mode locking to avoid any 
lock contention, like so:

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 605969ed0f96..4e73c87cbdb8 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1248,6 +1248,7 @@ void add_interrupt_randomness(int irq, int irq_flags)
 	struct fast_pool	*fast_pool = this_cpu_ptr(&irq_randomness);
 	struct pt_regs		*regs = get_irq_regs();
 	unsigned long		now = jiffies;
+	unsigned long		flags;
 	cycles_t		cycles = random_get_entropy();
 	__u32			c_high, j_high;
 	__u64			ip;
@@ -1281,12 +1282,12 @@ void add_interrupt_randomness(int irq, int irq_flags)
 		return;
 
 	r = &input_pool;
-	if (!spin_trylock(&r->lock))
+	if (!spin_trylock_irqsave(&r->lock, flags))
 		return;
 
 	fast_pool->last = now;
 	__mix_pool_bytes(r, &fast_pool->pool, sizeof(fast_pool->pool));
-	spin_unlock(&r->lock);
+	spin_unlock_irqrestore(&r->lock, flags);
 
 	fast_pool->count = 0;
 
