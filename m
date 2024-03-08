Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F622F0F
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890325; cv=none; b=FasXONZv5UgTRf9CmQ7iG+xZpg+dpR2JTEAg0OW7SczPKxs4k/09SIQfYOi4wKxtCy0yAGJAke0IumxiPCo7r+VJKRj6Iu0sLQS+Gaj+lVz9N9ZVvitgI6qLqfbUhWSj0QXBSdrDMn84kWhbrblqm4C6Ipen4SE8/GXfUN6vZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890325; c=relaxed/simple;
	bh=xRvI25c7VE1pc0mvFPFUMNM+x7hCwSzpa/K+KdnCMow=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fit9HIcUNbSf+KYY0jT19FeYBjqYughW3EoiygCfnxqKwN6ABAnWHol2Bjsze8/3p6KMfB+sODozLoKYvINRsV62B5nAw2FjhYhpYS1b0GpY6cf7814nzLFdSfPq+7OYq1UIg2+65Q0pb00UnbU5S8Xn4XgRO1ck4ZHHb7tzz14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SV0Nwbgb; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SV0Nwbgb"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id EBE3613800B2;
	Fri,  8 Mar 2024 04:32:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 08 Mar 2024 04:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709890321; x=1709976721; bh=Gtedk7MVfMiYrVhmUJfEF7rd3Xqs
	CYQMyIj1K4bC4aI=; b=SV0NwbgbxCpV5m9iDw80XLYO4hOF+91/24jKfaaI7Krm
	kupcX70YJLsud7NOM665oJa/vtUS35EdbPlpu+xS+JoBAYlGSpDHAu42y7vMyNRj
	FOJol3kxKOJ9+02zeBCKBOBO+6hZ7AsMFY11dFrQVolmhsRpO17KxhetWGxx5qeo
	vH3M+qxALekZPgXbM+c5kQE08ybCjqi7MIPugcpyiiXSHUP227Gn7SxilRPU6zzZ
	ED7eDgvZojRbyFHWyWanI8izXlvniaV4m81FmrHyqaz7vszb+LBE1FE8dA9v4DOm
	yrs8E186tQQIEX8JzsruyDZss6UZmB4tIkcErFDsgw==
X-ME-Sender: <xms:EdvqZSgKGmLf9LJABcm5FfOoMltFLsut8lYAMx3xQtNVt8RsekXGeA>
    <xme:EdvqZTBfDH_HFFdEvpj6ck9DYO3IKeu8J0Q0oxdMxYh5iEzzgtv_t9RNwXzlXzPmX
    1QfhfRgQ0ogFnQmHAg>
X-ME-Received: <xmr:EdvqZaH_aY1fi-XViCbdZZNhMHtgsXyyLC2fs_VkZc11SH3N1uPhs6x3vi2zDZJ_n54SB1YtcgREg7SoUHIjd1ZneGNAImmTvp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieehgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:EdvqZbTpG_2FVcIZjvBRdMp-VgA0QpaWEOr--AratbQ_mOLViS2VgA>
    <xmx:EdvqZfz9DZ97Xw4nZVGUgQYzGlRBAt7j7idlVQ8-3QFyXg-LDyredA>
    <xmx:EdvqZZ4oXHhuKrD-ZAN93nxbnfQhECscjNE8J5HGHlSDe2fRejwDCA>
    <xmx:EdvqZf_DmaeluSrsQsUWyoJ81qV1fnmgXa6p8l-i_2r3niP432_4rw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Mar 2024 04:31:59 -0500 (EST)
Date: Fri, 8 Mar 2024 20:33:04 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
Message-ID: <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, I wrote:

> On Fri, 8 Mar 2024, Michael Schmitz wrote:
> 
> > 
> > > IMHO, Gueunter would do better to instrument the spinlock tests on the 
> > > assumption that the locking in arch/m68k really is correct.
> > 
> > I've come to agree - maybe logging any run queue locks taken by the init 
> > task with IRQs enabled might help?
> > 
> 
> If I understood how the spinlock test algorithm worked, I'd be adding 
> sanity checks to it to test the assumptions underlying that algorithm.
> 
> I would not be surprised if it uses logic that sees irqs_disabled() and 
> then assumes that all hard irqs are disabled, or something similar.
> 
> I don't think I'd be adding printk() because the BUG is intermittent and 
> printk() messes with timing.
> 

Another way to tackle this is first find a reliable reproducer, then raise 
the IPL before before dispatching hard interrupts.

The patch below was a forgotten experiment that I tried 3 years ago to 
deal with a similar failure. At the time I was using stress-ng to 
investigate a different issue, but maybe a workload like that could be a 
reproducer.

---

After enabling CONFIG_DEBUG_SPINLOCK, I see the following failure on m68k.

[ 4089.070000] BUG: spinlock trylock failure on UP on CPU#0, stress-ng/1341
[ 4089.070000]  lock: 0x53d4a0, .magic: dead4ead, .owner: stress-ng/1341, .owner_cpu: 0
[ 4089.070000] CPU: 0 PID: 1341 Comm: stress-ng Not tainted 5.14.0-multi-debug #2
[ 4089.070000] Stack from 00a7dcc8:
[ 4089.070000]         00a7dcc8 004da40f 004da40f 00000000 00a7dce4 0043e88e 004da40f 00a7dd10
[ 4089.070000]         0006316c 004d240e 0053d4a0 dead4ead 00956bba 0000053d 00000000 0053d4a0
[ 4089.070000]         00a7ddd8 0055e6ac 00a7dd28 000632b2 0053d4a0 004d2488 0005c81b 0053d458
[ 4089.070000]         00a7dd34 0044780e 0053d4a0 00a7dd58 002b8694 0053d4a0 00000001 0000007f
[ 4089.070000]         00860000 00000011 00528138 00528198 00a7dd7c 00069f6a 0000000d 00014200
[ 4089.070000]         00528138 00a7dd78 00a7def0 00528138 00014200 00a7dd98 00069ff0 00528138
[ 4089.070000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
[ 4089.070000]  [<0006316c>] spin_dump+0x6c/0xc0
[ 4089.070000]  [<000632b2>] do_raw_spin_trylock+0x32/0x80
[ 4089.070000]  [<0005c81b>] init_dl_bandwidth+0x1b/0x80
[ 4089.070000]  [<0044780e>] _raw_spin_trylock+0xe/0x40
[ 4089.070000]  [<002b8694>] add_interrupt_randomness+0x154/0x1c0
[ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
[ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
[ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
[ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
[ 4089.070000]  [<00002da8>] user_irqvec_fixup+0xc/0x14
[ 4089.070000]  [<0005c81a>] init_dl_bandwidth+0x1a/0x80
[ 4089.070000]  [<000d51c0>] find_vma+0x0/0x80
[ 4089.070000]  [<00444500>] down_read+0x0/0x200
[ 4089.070000]  [<002b86b0>] add_interrupt_randomness+0x170/0x1c0
[ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
[ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
[ 4089.070000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
[ 4089.070000]  [<0000653c>] buserr_c+0x17c/0x600
[ 4089.070000]  [<00002ba8>] buserr+0x20/0x28
[ 4089.070000]  [<0008800d>] get_next_modinfo+0xcd/0x100

The problem seems to be that add_interrupt_randomness() was re-entered,
leading to a contended input_pool.lock and "spinlock trylock failure".

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
