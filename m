Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4542C1A2
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Mar 2024 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710754275; cv=none; b=LnWTl2Av4cBPLtyYRXnDUpCRnFJYR4oRi4iVHbE4No5UpkeTKqJ2iT3VCN+QUJroD/JE76t3ey2zofFrIxsmhNCGjlU/fz7MF+rWQ45ZU4GLMDgze/lsMw1pZNXSZlj3nK0VhHj2HdpyS+WldpciHu56f4klQbYp67Y86gB3dPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710754275; c=relaxed/simple;
	bh=8SzEY0Z+J+q7mAdORAfnT6slZb4hLpTLqVB0HztXDN8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fw0bVsavTfN1yuXSlaAU6xb3Qy12jqvaTTQBooO5g0EffmBlemVA2a4ZGn8Dv8EJMbic81eeYGJPY+rA1YA88bpxu8dQ2mASY3KnpRXFSmVaszCbd6KHqht80yMcFNyASzHJ5FWTnsqeYvBHQpDI1YoI9Q57E3f0+5JJJ/Gxg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IyUMNw+r; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IyUMNw+r"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 56B11180008C;
	Mon, 18 Mar 2024 05:31:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 18 Mar 2024 05:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1710754270; x=1710840670; bh=HmeQ0hU6kW+Mh2MDu3N32SbSyy4N
	D6XDBhyFDWBP/EM=; b=IyUMNw+r0liT6F5dIC3SEHeBO0uQ4XX/3LfHsg/xApM3
	Oiqx5pV0Cn/DG06GcO5i1dzYrXhGgSBKC66yd2hka11eSLr9JLwI7hHpYh3cuGVh
	ap3b+BtGK4Z8owdfwFsshUaRds/xMQKx9EUNZA8140Evms+K1gJJ+i0MlwuQjgwJ
	332tQge8O3zrflgUT9cf1BRhoIALKdQitcxHWH849YJkBPP1sQat4DKIciAFzAXL
	3ZKgrgrGE9zkXu3MzAVnX80JWKHYeVmC1SCDVghTWxVkIqeO0GUtqT/JSxgOle4+
	VlfwHAd1EzBqE2oymx0MsNddCYC2kKCwlo36aSoKZA==
X-ME-Sender: <xms:3gn4Zfmm1uSLtQue1TOxeeUbLIVwPK1uAk_-BL0NbaeLhMMASZq6eQ>
    <xme:3gn4ZS3q6mx5SrsjpZ4TWqUrJUmjMe6BzdNBrF5FM-cTtOx3OhWwZ-haEnZmelKVV
    657NBc-MnzlxzY3dpk>
X-ME-Received: <xmr:3gn4ZVp7Rk1gMv3tl9MVAejO-uUC8iNEDEN8sObB1lat9G7RymNCxsUihwnFA34mq_iFbl6-mrCRTvyS0PWdJoVmBxuo5E4cQko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkeejgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:3gn4ZXnNsEH6b_FOmWXE_O0ogTVmSw7906KXJLPZkUL4XZ013mCugA>
    <xmx:3gn4Zd32sWZlWHSUaAcbiCiNao6fslWg6jB1CgJhUl_ED_UqXUQELg>
    <xmx:3gn4ZWtGM1hzjcCySvLUndjLDynYEF1ngYQSqSDwwMHTPNARXvrvdQ>
    <xmx:3gn4ZRWvWsaHA7PMhoMLFwLpSDlEhiJ4N4l2l8lgGlAni128Z_8FQg>
    <xmx:3gn4ZYQraZJe2BW9kcSLf4O4NgQraypoxRreLh8SoEf-T3suEootDVH-C2k>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Mar 2024 05:31:06 -0400 (EDT)
Date: Mon, 18 Mar 2024 20:31:52 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <284ada62-c1bd-2321-ae18-27a315c56c33@gmail.com>
Message-ID: <627480db-d871-8226-9028-e768512b1917@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org> <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org> <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com> <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org> <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com> <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com> <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com> <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com> <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org> <7d28d5ee-176a-49de-a93c-76e03913cd8a@gmail.com>
 <45c98c27-6839-7e11-9cde-c9a1805234f5@gmail.com> <614a23eb-6220-8fe2-a641-bd00baba6f9d@linux-m68k.org> <284ada62-c1bd-2321-ae18-27a315c56c33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Michael Schmitz wrote:

> Am 15.03.2024 um 20:24 schrieb Finn Thain:
> >
> > On Fri, 15 Mar 2024, Michael Schmitz wrote:
> >
> >>
> >> No luck with whatever I tried around signals, cache maintenance and 
> >> mm.
> >>
> >> The 'BUG: Bad rss-counter state' message suggests we're freeing the 
> >> same page ranges twice, sometimes in many cases. I cannot quite see 
> >> how preempting the kernel on interupt return would cause this. Signal 
> >> forcing process exit but process exiting before signal is received 
> >> due to preemption? But skipping preemption when a signal is pending 
> >> did not change anything in my tests...
> >>
> >> Running out of ideas here, sorry.
> >>
> >
> > FWIW, I found that the failure mode (with CONFIG_PREEMPT) changed 
> > significantly after I disabled hard irqs in do_IRQ() using the patch I 
> > sent on the 8th. In three stress-ng test runs, I got a soft lockup, a 
> > WARN from set_fc() and some CONFIG_DEBUG_LIST failures...
> 
> Yes, I do see that with your patch, too. I still see the old 'table 
> already free' bug, though.
> 
> As far as I can see, the set_fc warning is from access_error040 and is 
> part of the access error exception that is taken in interrupt context.
> 
> The question is basically - why is __free_one_page() called from 
> interrupt context? Did that also happen before Geert's preemption patch?
> 

I did see that set_fc() warning during the mmap stress testing I did a few 
years ago. The example below comes from 5.18.0-rc7-mac-00006-g210e04ff7681 
but a lot has changed since then and it may not be relevant. I stopped 
doing those tests when Al Viro fixed the bug I was chasing. When I get 
time I shall fire up a Quadra and try again with v6.8.

stress-ng: info:  [116] dispatching hogs: 1 mmap
[ 1673.480000] ------------[ cut here ]------------
[ 1673.480000] WARNING: CPU: 0 PID: 159 at ./arch/m68k/include/asm/processor.h:91 buserr_c+0x59a/0x99a
[ 1673.480000] Modules linked in:
[ 1673.480000] CPU: 0 PID: 159 Comm:  Not tainted 5.18.0-rc7-mac-00006-g210e04ff7681 #2
[ 1673.480000] Stack from 00a13dec:
[ 1673.480000]         00a13dec 0046b224 0046b224 00000000 00a13e08 003d7e16 0046b224 00a13e1c
[ 1673.480000]         0001c1b4 00000000 00a13e94 b6db6eaa 00a13e48 0001c240 00461323 0000005b
[ 1673.480000]         0000678c 00000009 00000000 00000000 00000505 b6db6db6 db6db6db 00a13e88
[ 1673.480000]         0000678c 00461323 0000005b 00000009 00000000 00000000 00989680 00000004
[ 1673.480000]         003d6a82 0000000c 003dbb98 00a1f780 004b0c0c 000496dc 00077359 00a13f0c
[ 1673.480000]         00002bcc 00a13e94 00010000 00000000 00989680 00000004 003d6a82 b6db6db6
[ 1673.480000] Call Trace: [<003d7e16>] dump_stack+0x10/0x16
[ 1673.480000]  [<0001c1b4>] __warn+0xc6/0xe8
[ 1673.480000]  [<0001c240>] warn_slowpath_fmt+0x6a/0x76
[ 1673.480000]  [<0000678c>] buserr_c+0x59a/0x99a
[ 1673.480000]  [<0000678c>] buserr_c+0x59a/0x99a
[ 1673.480000]  [<003d6a82>] _printk+0x0/0x16
[ 1673.480000]  [<003dbb98>] down_read+0x0/0xdc
[ 1673.480000]  [<000496dc>] __irq_wake_thread+0x0/0x44
[ 1673.480000]  [<00077359>] ___bpf_prog_run+0x18b/0x20e4
[ 1673.480000]  [<00002bcc>] buserr+0x20/0x28
[ 1673.480000]  [<00010000>] LP1CONT1+0x4a/0x7c
[ 1673.480000]  [<003d6a82>] _printk+0x0/0x16
[ 1673.480000]  [<00050005>] dma_coherent_ok+0x1d/0xb8
[ 1673.480000]  [<00012704>] tblpre+0x594/0x700
[ 1673.480000]  [<0001c1d6>] warn_slowpath_fmt+0x0/0x76
[ 1673.480000]  [<00040e08>] account_system_time+0x74/0xca
[ 1673.480000]  [<0004113e>] account_process_tick+0x30/0xb0
[ 1673.480000]  [<00010000>] LP1CONT1+0x4a/0x7c
[ 1673.480000]  [<00053a6e>] update_process_times+0x36/0xae
[ 1673.480000]  [<00060bdc>] legacy_timer_tick+0x64/0x6c
[ 1673.480000]  [<00008fa4>] via_timer_handler+0x1e/0x24
[ 1673.480000]  [<00049756>] __handle_irq_event_percpu+0x36/0xd8
[ 1673.480000]  [<00002600>] name_to_dev_t+0x1a4/0x3f8
[ 1673.480000]  [<003d9d40>] yield_to+0x88/0x8c
[ 1673.480000]  [<0004980c>] handle_irq_event_percpu+0x14/0x52
[ 1673.480000]  [<0004986c>] handle_irq_event+0x22/0x36
[ 1673.480000]  [<0004cf1a>] handle_simple_irq+0x4e/0x7c
[ 1673.480000]  [<00048f3e>] generic_handle_irq+0x3c/0x4a
[ 1673.480000]  [<00008e3c>] via1_irq+0x7e/0x96
[ 1673.480000]
[ 1673.480000] ---[ end trace 0000000000000000 ]---
