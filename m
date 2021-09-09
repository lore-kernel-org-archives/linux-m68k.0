Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CDDC433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 23:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F7260C40
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 23:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhIIXce (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Sep 2021 19:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhIIXce (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Sep 2021 19:32:34 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AF4C061574
        for <linux-m68k@vger.kernel.org>; Thu,  9 Sep 2021 16:31:24 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w19so300858oik.10
        for <linux-m68k@vger.kernel.org>; Thu, 09 Sep 2021 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=fQ7ns4xiPWqwM+//iV10oszHgAxC16sUUi6IYu0KP7c=;
        b=gm9j6IFiEtUOQ0RJ1oYCJhrq2/AIvFJfSlomCXywP+JTiNwuiTWpPfrL/SNokusWP5
         mw+cUgofcAR7iK0dsP52ZB1Yc7X7AWpFvmGHD5uwPoKg6tG+AJpFeA5eJfugza71ijTi
         7938nn6M3TbiYMRvPqgSE3edKzbnO/6HG1jILzk3bSDsrVb8bOpwSWReeNDYDTI27XUo
         0b82DcZBanZaWgVtyyl+7hrsi4rf3HOokkaMAVttyiizs017whvOLIqAcZLOH7s0JGKr
         rz5tiCA1UFeq2PNBwK+JzlzKehMGHzpVtLb8B9umZjd8Z6PDUGVnzgzty1Jw1vhSJrFF
         g7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=fQ7ns4xiPWqwM+//iV10oszHgAxC16sUUi6IYu0KP7c=;
        b=eNjpX+fJryStC1xgCbdHmnHTbruPXN62aZdu4+49jMOHF/l6t9dZMkLH2JhuSpd9MA
         jb7bjupGvPejgFbyaQk+4VcBkWNrud+N9OV/S6W0LwFKEeHxXyx/fNRapoi0Ll3pBJ+V
         CMkriWfDdW4CXWIbIMHbcJDsB74lQ1RlUMJcsPvKo6RBEHQaMLf2L083XO4rULlkS97Z
         Zctiv6ch8laeEJrdAXDelHyNdsUpVmKbsKH9LBww53pdUmGpHh2YbI+Tv3HD/RO35VZx
         d4v0WFwj0aIbJNuZECGJw9eeuHJi+islPKksyHMVB7X3Qmhn01u92SNNIOZA8hFsqODE
         c9BA==
X-Gm-Message-State: AOAM533sD0RjyHKorj3OlOUOXGfj94KRi0rJlKSpI7wteQyOOnL93xez
        pobJ6w40oHx/DwArh3cPCQm/ukP73ZI=
X-Google-Smtp-Source: ABdhPJyt5NOu/dIinomQ5CIiwCmhZvBte3alZVfEhZU6du/oH3Iho1BIiJoKZo5sICCsAG4S64wmyQ==
X-Received: by 2002:a17:90a:4f46:: with SMTP id w6mr6158897pjl.9.1631230272074;
        Thu, 09 Sep 2021 16:31:12 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id f8sm3262273pju.30.2021.09.09.16.31.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Sep 2021 16:31:11 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org>
 <20210816075155.GA29187@lst.de>
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
 <1386e769-cdb1-afcb-c8a0-c66f05ca6ee@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
Message-ID: <f590f2d3-d0cd-4496-c248-82ed5ac12f24@gmail.com>
Date:   Fri, 10 Sep 2021 11:29:30 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1386e769-cdb1-afcb-c8a0-c66f05ca6ee@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 09/09/21 21:40, Finn Thain wrote:
> On Wed, 8 Sep 2021, Michael Schmitz wrote:
>
>> On 08/09/21 11:50, Finn Thain wrote:
>>> On Tue, 7 Sep 2021, Michael Schmitz wrote:
>>>
>>>>> Does anyone know what causes this?
>>>>
>>>> Our practice to run interrupt handlers at the IPL of the current
>>>> interrupt under service, instead of disabling local interrupts for
>>>> the duration of the handler?
>>>>
>>>
>>> Lock contention will happen anyway.
>>>
>>> If using spin_trylock() outside of "atomic" context was a bug
>>> (really?) then it can't be used here.
>>
>> add_interrupt_randomness() relies on interrupts being disabled in
>> __handle_irq_event_percpu(), so this check assumes atomic context.
>>
>
> But __handle_irq_event_percpu() also assumes that local interrupts have
> been disabled. There is a WARN_ONCE to that effect.

Yes, but that WARN_ON depends on irqs_disabled() returning true if and 
only if interrupts are fully disabled, i.e. the IPL is 7. Our 
implementation of irqs_disabled() returns true if the IPL is > 0 (in 
general) or < 2 (Atari).

>
>> Our definition of irqs_disabled() invalidates that assumption.
>>
>>> Perhaps add_interrupt_randomness() should use the lock in irq mode,
>>> like the rest of drivers/char/random.c does.
>>
>> That might deadlock on SMP when a task reading from the random pool
>> holding the lock executes on the same CPU as the interrupt.
>>
>
> That does not make sense to me. add_interrupt_randomness() effectively
> does acquire the lock in irq mode on SMP ports yet it doesn't deadlock.

It uses spin_trylock() while interrupts are disabled, so someone must 
have worried about deadlocks there.

>> In the UP case, the spinlock is optimized away,
>
> Yes and spin_trylock() always succeeds. Hence CONFIG_SPINLOCK_DEBUG
> asserts that the lock is never contended.

That assertion fails here (IMO because we allow interrupts in code that 
assumes they have been disabled, and tries unsuccessfully to assert 
that), but that's OK in this case, as the code protected by the lock 
isn't called if locking fails.

>
> One thing that bothered me when I raised this issue was the apparent false
> positive from CONFIG_SPINLOCK_DEBUG. But after sleeping on it, it makes
> more sense to me.
>
> (Perhaps the difficulty here is !SMP && !PREEMPT_COUNT. If PREEMPT_COUNT
> was available on m68k then spin_trylock() might be expected to test
> preempt_count, and the problem would not arise.)
>
> BTW, the problem went away when I changed to irq mode locking to avoid any
> lock contention, like so:
>
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 605969ed0f96..4e73c87cbdb8 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -1248,6 +1248,7 @@ void add_interrupt_randomness(int irq, int irq_flags)
>  	struct fast_pool	*fast_pool = this_cpu_ptr(&irq_randomness);
>  	struct pt_regs		*regs = get_irq_regs();
>  	unsigned long		now = jiffies;
> +	unsigned long		flags;
>  	cycles_t		cycles = random_get_entropy();
>  	__u32			c_high, j_high;
>  	__u64			ip;
> @@ -1281,12 +1282,12 @@ void add_interrupt_randomness(int irq, int irq_flags)
>  		return;
>
>  	r = &input_pool;
> -	if (!spin_trylock(&r->lock))
> +	if (!spin_trylock_irqsave(&r->lock, flags))
>  		return;
>
>  	fast_pool->last = now;
>  	__mix_pool_bytes(r, &fast_pool->pool, sizeof(fast_pool->pool));
> -	spin_unlock(&r->lock);
> +	spin_unlock_irqrestore(&r->lock, flags);
>
>  	fast_pool->count = 0;
>

You add a redundant interrupt disable/enable for SMP or PREEMPT arches. 
That might be justified if it fixes a kernel crash, not merely a 
CONFIG_DEBUG_SPINLOCK warning.

If we can add preempt count checking or actual spinlocks (without adding 
too much overhead everywhere else), that might fix this issue without 
need for a patch to random.c?

(But then, so would fixing irqs_disables(), or running interrupt 
handlers with interrupts disabled...)

Cheers,

	Michael

