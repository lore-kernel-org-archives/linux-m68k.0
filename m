Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5521A19
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Mar 2024 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710743064; cv=none; b=Df8vcN/P6QW0E50ZB89tUWzBSY8CGDuGV32GbIIZaX+6GFy1oOxqOk+Vf2uZdp5/P1vhfR/RnvaXMWqQe6aXOPGWcmvJovbhx9byCgIUOw9kOGWUHfwsn0Ff2lA61GcvVAqWQutqCdu2AOFwcme+HbEmGDktcVeT2uOA3rmYwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710743064; c=relaxed/simple;
	bh=AzQjcOIBOI62hWX+oJDgCT09J6wWb19j2ufUpOnSa4I=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=u5IFhd+NsBG59GIORjvewc1CrTWp+nmFg2b1BEt+BEGfSP0GyYviZgrA6FkiX4JaCbAJTswANBmSb+5/YZosJio2ANKBnQn1iAN4O0XNWmRIsuQsgYFU/9rBJAsWjq81xWjMq93UAu4teLO7UrmAi3/Uu9S8V/ER6k7z45DrYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6nvknkM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6nvknkM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso3213499b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Mar 2024 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710743061; x=1711347861; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6W0C8X/DWcmkX5QKPatAlPOJNuuyUoRJV8NkaxxfQY=;
        b=I6nvknkMEg5utMFTOrSsBJInxtfS0jGfPoNo2D6hftCAp33YFqIAdpUymxf4NaLymQ
         XkaHuKBsKT0M9FRHw+Fgi1uz7UijqWYqt+1Lm6cx8a8WCTPTqGjvGjDRWvb41RUplXgv
         TB9lC1oxZCdcMowzA8YLGgvqqSvu8XVNFcAUNQC1uOPnONNSJ/bYb6pKYHZT6lLwJErW
         97puCOQ8yyyDog17YZIj1mXiPv5XrXUwukLN3s8taLX7eoEZVGqK1ocJG10EsxnU302c
         MsEhqv8EdalxkeJvdw/PMUhJRNQJJnsZ7EeWYlsMGR2SELKnMKPK9iHOqGqrcd5gA1M0
         QtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710743061; x=1711347861;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i6W0C8X/DWcmkX5QKPatAlPOJNuuyUoRJV8NkaxxfQY=;
        b=Y2p0Jt/5WWjoeQj43nHBKDYeyISwHotS6ve7PJbMW3Axi7BaNi9Z/nq7ZJk/6AjfqK
         OUoa+igJhsO9tggkZdxk+G3CvDtKLNm8D0kRFz38ynNP4pSj4MXmGxRB5YB2usGaFuGf
         ygCZ/poDncd3B3BKJWR2UZkhTlC6vByTZl/4f8ltoUiBbkD9EVSHNU8ISiwvIuOryMnv
         ZJ/oDbjXWdkbgufiB2IgZOIuq9bRnW8rIaFvBOh+0MvEq/Ih6vJxnWQfbBByzLDGfGs8
         7pn7CtSH+x5y//c2voyLuAFKZKUI5SlDb1DvVE4li8oNPu8wbOT6Tp5ukssRSvloqhLp
         65MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfGUR4QHDqnC0YYAtM+igYYhCQcFMj5Mt8/Z3SdVtH/bL1jndKUqtYDw7KsQwdcas9Jw4VNdywVYfOHd1bHZm9qET2L8X8m3JO64In9yQ8
X-Gm-Message-State: AOJu0YwytVeWGnkbpOFXMSNhRxUSElnyPc+lFE+++FQSS2WpHZ97d6bd
	jOhJ6KDdhRMsbyuwGSaYX5eAOKSWDPtWkX3gSqAxOzpToGxKGHgCtlPAK8DL
X-Google-Smtp-Source: AGHT+IHlyao9hdMbSmsgAPSIbehG+zJh98GTbPkKoc8A1pC8oSjsOUSU/THsh92hGQCjHGh5n8ZmMA==
X-Received: by 2002:a05:6a00:1814:b0:6e5:43b5:953b with SMTP id y20-20020a056a00181400b006e543b5953bmr10060179pfa.14.1710743060978;
        Sun, 17 Mar 2024 23:24:20 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id bz15-20020a056a02060f00b005d5445349edsm5414031pgb.19.2024.03.17.23.24.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Mar 2024 23:24:20 -0700 (PDT)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
 <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
 <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
 <7d28d5ee-176a-49de-a93c-76e03913cd8a@gmail.com>
 <45c98c27-6839-7e11-9cde-c9a1805234f5@gmail.com>
 <614a23eb-6220-8fe2-a641-bd00baba6f9d@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <284ada62-c1bd-2321-ae18-27a315c56c33@gmail.com>
Date: Mon, 18 Mar 2024 19:24:15 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <614a23eb-6220-8fe2-a641-bd00baba6f9d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 15.03.2024 um 20:24 schrieb Finn Thain:
>
> On Fri, 15 Mar 2024, Michael Schmitz wrote:
>
>>
>> No luck with whatever I tried around signals, cache maintenance and mm.
>>
>> The 'BUG: Bad rss-counter state' message suggests we're freeing the same
>> page ranges twice, sometimes in many cases. I cannot quite see how
>> preempting the kernel on interupt return would cause this. Signal
>> forcing process exit but process exiting before signal is received due
>> to preemption? But skipping preemption when a signal is pending did not
>> change anything in my tests...
>>
>> Running out of ideas here, sorry.
>>
>
> FWIW, I found that the failure mode (with CONFIG_PREEMPT) changed
> significantly after I disabled hard irqs in do_IRQ() using the patch I
> sent on the 8th. In three stress-ng test runs, I got a soft lockup, a WARN
> from set_fc() and some CONFIG_DEBUG_LIST failures...

Yes, I do see that with your patch, too. I still see the old 'table 
already free' bug, though.

As far as I can see, the set_fc warning is from access_error040 and is 
part of the access error exception that is taken in interrupt context.

The question is basically - why is __free_one_page() called from 
interrupt context? Did that also happen before Geert's preemption patch?

preempt_schedule_irq() is currently called in both the interrupt and 
exception return code path. Maybe it should only be called on exception 
(i.e. syscall) return?

Cheers,

	Michael

> # /root/stress-ng -t 60 --zombie -1
> stress-ng: info:  [46] setting to a 60 second run per stressor
> stress-ng: info:  [46] dispatching hogs: 1 zombie
> [   29.670000] ------------[ cut here ]------------
> [   29.670000] WARNING: CPU: 0 PID: 0 at arch/m68k/include/asm/processor.h:92 buserr_c+0x486/0x5ba
> [   29.670000] Modules linked in:
> [   29.670000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-rc7-mac-00234-g138ba0024ff0 #9
> [   29.670000] Stack from 00583c20:
> [   29.670000]         00583c20 0054af2c 0054af2c 00000000 006e0100 00583c40 004980b6 0054af2c
> [   29.670000]         00583c54 00492ff6 00000505 0059ff94 0b46005f 00583c84 0001c73e 0053a3bc
> [   29.670000]         0000005c 000061b6 00000009 00000000 00000000 00000505 00583cc8 00696ef0
> [   29.670000]         008dc490 00583cbc 000061b6 0053a3bc 0000005c 00000009 00000000 00000000
> [   29.670000]         006eee78 00002ff5 00000008 00000001 005b0b4c 006eee74 02d61260 00583d34
> [   29.670000]         000026b4 00583cc8 006eee78 00000000 006eee78 00002ff5 00000008 005b0b4c
> [   29.670000] Call Trace: [<004980b6>] dump_stack+0x10/0x16
> [   29.670000]  [<00492ff6>] __warn+0x90/0xb6
> [   29.670000]  [<0001c73e>] warn_slowpath_fmt+0x10e/0x1a4
> [   29.670000]  [<000061b6>] buserr_c+0x486/0x5ba
> [   29.670000]  [<000061b6>] buserr_c+0x486/0x5ba
> [   29.670000]  [<00002ff5>] __get_wchan+0x4d/0x58
> [   29.670000]  [<000026b4>] buserr+0x20/0x28
> [   29.670000]  [<00002ff5>] __get_wchan+0x4d/0x58
> [   29.670000]  [<000ea558>] __free_one_page+0x2ec/0x532
> [   29.670000]  [<000ea8bc>] free_pcppages_bulk+0x11e/0x18a
> [   29.670000]  [<00002ff5>] __get_wchan+0x4d/0x58
> [   29.670000]  [<00002700>] ret_from_kernel_thread+0xc/0x14
> [   29.670000]  [<000eaa86>] free_unref_page_commit+0x15e/0x314
> [   29.670000]  [<00002ce0>] show_regs+0x48/0xb8
> [   29.670000]  [<00002004>] _start+0x4/0x8
> [   29.670000]  [<000ed452>] free_unref_page+0x12a/0x190
> [   29.670000]  [<00065be4>] rcu_cblist_dequeue+0x0/0x28
> [   29.670000]  [<000ed648>] __free_pages+0xb4/0x10c
> [   29.670000]  [<00018340>] thread_stack_free_rcu+0x3a/0x44
> [   29.670000]  [<0006436c>] rcu_core+0x2c2/0x79e
> [   29.670000]  [<00054fda>] handle_irq_event+0x7a/0x90
> [   29.670000]  [<00064928>] rcu_core_si+0x8/0xc
> [   29.670000]  [<0049952c>] __do_softirq+0xa4/0x1f8
> [   29.670000]  [<00492600>] memmove+0x8c/0xe0
> [   29.670000]  [<00038196>] parse_args+0x0/0x3a6
> [   29.670000]  [<000485f8>] arch_cpu_idle_exit+0x0/0x8
> [   29.670000]  [<000485f0>] arch_cpu_idle_enter+0x0/0x8
> [   29.670000]  [<0001fee6>] irq_exit+0x44/0x4e
> [   29.670000]  [<00002986>] do_IRQ+0x32/0x6c
> [   29.670000]  [<00498cf8>] cpu_idle_poll.isra.0+0x0/0x6e
> [   29.670000]  [<00498d66>] default_idle_call+0x0/0x46
> [   29.670000]  [<00002874>] auto_irqhandler_fixup+0x4/0xc
> [   29.670000]  [<00498cf8>] cpu_idle_poll.isra.0+0x0/0x6e
> [   29.670000]  [<00498d66>] default_idle_call+0x0/0x46
> [   29.670000]  [<00498d88>] default_idle_call+0x22/0x46
> [   29.670000]  [<00048680>] do_idle+0x6a/0xf0
> [   29.670000]  [<00048616>] do_idle+0x0/0xf0
> [   29.670000]  [<00036742>] find_task_by_pid_ns+0x0/0x2a
> [   29.670000]  [<0005cfd4>] __rcu_read_lock+0x0/0x12
> [   29.670000]  [<000489cc>] cpu_startup_entry+0x1a/0x1c
> [   29.670000]  [<00063976>] __rcu_read_unlock+0x0/0x26
> [   29.670000]  [<00498e4a>] kernel_init+0x0/0xfa
> [   29.670000]  [<004897c0>] strcpy+0x0/0x1e
> [   29.670000]  [<0049379c>] _printk+0x0/0x16
> [   29.670000]  [<00489942>] strlen+0x0/0x22
> [   29.670000]  [<0062d2c6>] memblock_alloc_try_nid+0x0/0x82
> [   29.670000]  [<0062139a>] arch_post_acpi_subsys_init+0x0/0x8
> [   29.670000]  [<00621918>] console_on_rootfs+0x0/0x60
> [   29.670000]  [<00620410>] _sinittext+0x410/0xadc
> [   29.670000]
> [   29.670000] ---[ end trace 0000000000000000 ]---
> [   29.670000] Unable to handle kernel access at virtual address 0b46005f
> [   29.670000] Oops: 00000000
> [   29.670000] Modules linked in:
> [   29.670000] PC: [<002951de>] __list_add_valid_or_report+0x1a/0x102
> [   29.670000] SR: 2700  SP: 00583cc8  a2: 00587590
> [   29.670000] d0: 000007e0    d1: 006eee78    d2: 00000000    d3: 006eee78
> [   29.670000] d4: 00002ff5    d5: 00000008    a0: 005b0b4c    a1: 0b46005b
> [   29.670000] Process swapper (pid: 0, task=00587590)
> [   29.670000] Frame format=7 eff addr=0b46005f ssw=0505 faddr=0b46005f
> [   29.670000] wb 1 stat/addr/data: 0000 00000000 00000000
> [   29.670000] wb 2 stat/addr/data: 0000 00000000 00000000
> [   29.670000] wb 3 stat/addr/data: 0000 0b46005f 00000000
> [   29.670000] push data: 00000000 00000000 00000000 00000000
> [   29.670000] Stack from 00583d30:
> [   29.670000]         00000000 00583d6c 000ea558 006eee78 005b0b4c 0b46005b 007a5380 00000000
> [   29.670000]         0000000f 0000000c 00000005 00000001 006eee78 007a5358 005b2090 00583dc8
> [   29.670000]         000ea8bc 006eee74 00002ff5 005b0314 00000000 000000fc 00000000 00000f07
> [   29.670000]         00000003 000001ca 000000e0 00000001 006e307c 007a5358 005b0314 00000011
> [   29.670000]         006eee74 00000039 00002700 005b04fc 00000000 000000aa 00583e08 000eaa86
> [   29.670000]         005b0314 0000004e 007a5358 00000003 00000001 00002ce0 00000000 00000000
> [   29.670000] Call Trace: [<000ea558>] __free_one_page+0x2ec/0x532
> [   29.670000]  [<000ea8bc>] free_pcppages_bulk+0x11e/0x18a
> [   29.670000]  [<00002ff5>] __get_wchan+0x4d/0x58
> [   29.670000]  [<00002700>] ret_from_kernel_thread+0xc/0x14
> [   29.670000]  [<000eaa86>] free_unref_page_commit+0x15e/0x314
> [   29.670000]  [<00002ce0>] show_regs+0x48/0xb8
> [   29.670000]  [<00002004>] _start+0x4/0x8
> [   29.670000]  [<000ed452>] free_unref_page+0x12a/0x190
> [   29.670000]  [<00065be4>] rcu_cblist_dequeue+0x0/0x28
> [   29.670000]  [<000ed648>] __free_pages+0xb4/0x10c
> [   29.670000]  [<00018340>] thread_stack_free_rcu+0x3a/0x44
> [   29.670000]  [<0006436c>] rcu_core+0x2c2/0x79e
> [   29.670000]  [<00054fda>] handle_irq_event+0x7a/0x90
> [   29.670000]  [<00064928>] rcu_core_si+0x8/0xc
> [   29.670000]  [<0049952c>] __do_softirq+0xa4/0x1f8
> [   29.670000]  [<00492600>] memmove+0x8c/0xe0
> [   29.670000]  [<00038196>] parse_args+0x0/0x3a6
> [   29.670000]  [<000485f8>] arch_cpu_idle_exit+0x0/0x8
> [   29.670000]  [<000485f0>] arch_cpu_idle_enter+0x0/0x8
> [   29.670000]  [<0001fee6>] irq_exit+0x44/0x4e
> [   29.670000]  [<00002986>] do_IRQ+0x32/0x6c
> [   29.670000]  [<00498cf8>] cpu_idle_poll.isra.0+0x0/0x6e
> [   29.670000]  [<00498d66>] default_idle_call+0x0/0x46
> [   29.670000]  [<00002874>] auto_irqhandler_fixup+0x4/0xc
> [   29.670000]  [<00498cf8>] cpu_idle_poll.isra.0+0x0/0x6e
> [   29.670000]  [<00498d66>] default_idle_call+0x0/0x46
> [   29.670000]  [<00498d88>] default_idle_call+0x22/0x46
> [   29.670000]  [<00048680>] do_idle+0x6a/0xf0
> [   29.670000]  [<00048616>] do_idle+0x0/0xf0
> [   29.670000]  [<00036742>] find_task_by_pid_ns+0x0/0x2a
> [   29.670000]  [<0005cfd4>] __rcu_read_lock+0x0/0x12
> [   29.670000]  [<000489cc>] cpu_startup_entry+0x1a/0x1c
> [   29.670000]  [<00063976>] __rcu_read_unlock+0x0/0x26
> [   29.670000]  [<00498e4a>] kernel_init+0x0/0xfa
> [   29.670000]  [<004897c0>] strcpy+0x0/0x1e
> [   29.670000]  [<0049379c>] _printk+0x0/0x16
> [   29.670000]  [<00489942>] strlen+0x0/0x22
> [   29.670000]  [<0062d2c6>] memblock_alloc_try_nid+0x0/0x82
> [   29.670000]  [<0062139a>] arch_post_acpi_subsys_init+0x0/0x8
> [   29.670000]  [<00621918>] console_on_rootfs+0x0/0x60
> [   29.670000]  [<00620410>] _sinittext+0x410/0xadc
> [   29.670000]
> [   29.670000] Code: 206e 000c 226e 0010 4a88 6756 4a89 6774 <2029> 0004 b1c0 6600 008e 2410 b3c2 6600 00ae b288 670e 7001 b289 6708 242e fffc
> [   29.670000] Disabling lock debugging due to kernel taint
> [   29.670000] Kernel panic - not syncing: Aiee, killing interrupt handler!
> [   29.670000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---
>
