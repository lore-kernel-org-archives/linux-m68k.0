Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7695C60E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709709280; cv=none; b=ePv1DXsF8WAPjuCv28P70bXZyvzkwLh3MYun5j32kBzpemk2kc3BMPYQBw9E9FnMszj8E+cYLHzlbw+rCPhivDppby/FQIYJgJJja7PIeISSSN7LPcM4TCRqLjGUYbTSGaUV+Agk68AWpJIeKtaOJgNKlTQ+E0GbAh3kmdUbfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709709280; c=relaxed/simple;
	bh=0dugv3L7/U6QUvD/cmeHo14+MNLD3CtzravOnPtJzxE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mnV1U9JshLhYKv9kFVwDjrvJpt94ZncuYWvwDagrBxj8cRdNZsrFlLLDYti5dbua+eNohEitbf+MV8Zp62p6Gu+T4zwlMGHpfVMa9pqAF/a9SwNpO+xYaRoyH2nXHpTNL2UJpocc9d23OzU/RghdvVKH75EFSnq4KPAHpivWEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrWLttBj; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrWLttBj"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a17274193eso358045eaf.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Mar 2024 23:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709709277; x=1710314077; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egjdP6X9OsYcpIW4enB4pzTmF/xtZRmdQ/31I79Y8CQ=;
        b=NrWLttBjFP24UA8cjl7lxXd0wICkSI+0TugMVq8noh2gdZcQ4XpQAWffka/uumDwLw
         cZnDC/lUxqD7QX/iyETTADHur0Vss6a6b6NoDjb/IoWPXFnTL0puFk5I5JYiVaOXfn0w
         eu34pDNpUS0YX485ccKpSQ053npbHq2w5U3X+JqPq6IQsVEiD1reJXsMVteBUndXujzB
         +yjL5hZauzUhyTv5X/I3mAm9jmLwJbb/opDEodUHF8LpwGyCkQ3GH/Lwq0Jo48iH7G1O
         XbJi8SohpSgjX72CyrhJjNLUOH8UaXAE9+f3mo/3lnWLVlyDXlz3FtmvjjnivzqeUwMJ
         shRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709709277; x=1710314077;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egjdP6X9OsYcpIW4enB4pzTmF/xtZRmdQ/31I79Y8CQ=;
        b=NIe+mM6VArHho/25dYR+8DZRK7q+GCCoUVaHceHtFP31KOvmtmDUH4qGNCLmx1f7ji
         hMArb2GtWAgKPCaMtVA6pm9UPbKlue06C7Po/SZ4s7BpoiM6q64oVtyMl2LZBDpXQCea
         68Pna57MnchG62W+WoYphccFfBJUHGhHY3d/SXT65aEV0BQi0V4DWBNCqb2ktdFbvinl
         a4e2v4v5dwuomoIP6EThhBRiz7w0HkFo4f4xrK+/lrO+Sg9m08Eus4yVa83p2CclZoJp
         zkZRKPBA2RoHxXlgv3Q1G/NfuRuUafFO/2/aSFU14VBwxzkusLeZU+mw6yH7+bmgs+v7
         BSHg==
X-Gm-Message-State: AOJu0YyEjpvne/iHXVmwsCuHrF/cNxy3EurqlFt8aw6H+fBJqE7Lh/OF
	3XU/RUAq5o0i0dE0GVSkXikDGTCZeZyiqkrRDodoCoJ+HL9bc5lCqRf8yYCU
X-Google-Smtp-Source: AGHT+IHr6iICXfYhR4E8I+1Zzju1o6jAm3mMjb7sp+8SAVr3DTziwehaiGUmC7KAU+Te/XiNNXaFpQ==
X-Received: by 2002:a05:6358:89a:b0:17b:f637:7bc with SMTP id m26-20020a056358089a00b0017bf63707bcmr4975448rwj.10.1709709276899;
        Tue, 05 Mar 2024 23:14:36 -0800 (PST)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id 3-20020a631543000000b005dcbb699abfsm10257647pgv.34.2024.03.05.23.14.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Mar 2024 23:14:36 -0800 (PST)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
Cc: linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
Date: Wed, 6 Mar 2024 20:14:31 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guenter,

Am 05.03.2024 um 06:58 schrieb Guenter Roeck:
> Hi,
>
> when running the q800 qemu emulation, am seeing random "spinlock recursion"
> messages every few test runs. Some examples are below. This is not a new
> problem, but it keeps popping up.
>
> Is this a potential problem or just noise ?

Looking at the backtraces some more, I think what happens here is that 
the swapper kernel task is stalled for long enough here that on the next 
scheduler tick, it is still running. With no other tasks scheduled to 
run in the meantime, it may still be the current task.

The stalled swapper task still holds the run queue lock, hence the 
recursion message.

I do not think this is a bug, just a reflection of a slow system with 
nothing much to do.

There does not appear to be any interrupt nesting here. I cannot recall 
the interrupt level assignment on the Q800, in particular as regards 
disk interrupts and whether both VIAs are using the same interrupt 
level. I'd suppose they would, as these chips date back a long time and 
probably cannot place a vector number on the bus as part of the 
interrupt stack frame?

Whether I can hope to see interrupt nesting on my Atari is unclear - 
pretty much anything on that machine is generating interrupts via the 
ST-MFP so it's all at the same level.

Cheers,

	Michael


>
> Thanks,
> Guenter
>
> ---
> BUG: spinlock recursion on CPU#0, swapper/1
>  lock: 0x5875c0, .magic: dead4ead, .owner: swapper/1, .owner_cpu: 0
> CPU: 0 PID: 1 Comm: swapper Not tainted 6.8.0-rc6-mac-00037-g805d849d7c3c #1
> Stack from 00c49e80:
>         00c49e80 0051c8da 0051c8da 005875c0 00000000 003ec2de 0051c8da 00038e26
>         005875c0 004f094b 00c4c010 0003025a 005875c0 00c49ec4 00030272 005875c0
>         00000000 00c49ed4 00031592 00000000 00c15100 0003df46 0004b6b6 00000000
>         00006b1e 00000000 0003dfc0 0000000e 00000000 00000000 00042608 0000000f
>         00000000 005ba9b0 005baa0c 00000000 00000000 0003e050 005ba9b0 00000000
>         005ba9b0 0003e0a6 005ba9b0 005baa0c 00000000 005ba9b0 005baa0c 00040524
> Call Trace: [<003ec2de>] dump_stack+0xc/0x10
>  [<00038e26>] do_raw_spin_lock+0x34/0x58
>  [<0003025a>] raw_spin_rq_lock_nested+0xe/0x14
>  [<00030272>] raw_spin_rq_lock.constprop.0+0x12/0x18
>  [<00031592>] scheduler_tick+0x18/0x62
>  [<0003df46>] __irq_wake_thread+0x0/0x40
>  [<0004b6b6>] update_process_times+0x5e/0x68
>  [<00006b1e>] via_timer_handler+0x1a/0x20
>  [<0003dfc0>] __handle_irq_event_percpu+0x3a/0xba
>  [<00042608>] check_all_holdout_tasks_trace+0x114/0x25a
>  [<0003e050>] handle_irq_event_percpu+0x10/0x3a
>  [<0003e0a6>] handle_irq_event+0x2c/0x4e
>  [<00040524>] handle_simple_irq+0x64/0x68
>  [<003ec3ba>] kernel_init+0x0/0xec
>  [<0003db76>] handle_irq_desc+0x1e/0x28
>  [<000069be>] via1_irq+0x42/0x80
>  [<00046914>] resolve_symbol+0x192/0x27e
>  [<003ec3ba>] kernel_init+0x0/0xec
>  [<0003db76>] handle_irq_desc+0x1e/0x28
>  [<00002798>] do_IRQ+0x20/0x32
>  [<00002698>] auto_irqhandler_fixup+0x4/0xc
>  [<00046914>] resolve_symbol+0x192/0x27e
>  [<00002530>] ret_from_kernel_thread+0x0/0x14
> RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.
>
> ---
> BUG: spinlock recursion on CPU#0, swapper/2
>  lock: 0x5875c0, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
> CPU: 0 PID: 2 Comm: swapper Not tainted 6.8.0-rc7-mac #1
> Stack from 00c81e80:
>         00c81e80 0051c8ce 0051c8ce 005875c0 00000000 003ec30a 0051c8ce 00038e26
>         005875c0 004f093f 00c4c650 0003025a 005875c0 00c81ec4 00030272 005875c0
>         00000000 00c81ed4 00031592 00000000 00c15100 0003df46 0004b6b6 00000000
>         00006b1e 00000000 0003dfc0 0000000e 00000000 00000000 00c42608 00000102
>         00037462 005ba9b0 005baa0c 00000000 00000000 0003e050 005ba9b0 00000000
>         005ba9b0 0003e0a6 005ba9b0 005baa0c 00000000 005ba9b0 005baa0c 00040524
> Call Trace: [<003ec30a>] dump_stack+0xc/0x10
>  [<00038e26>] do_raw_spin_lock+0x34/0x58
>  [<0003025a>] raw_spin_rq_lock_nested+0xe/0x14
>  [<00030272>] raw_spin_rq_lock.constprop.0+0x12/0x18
>  [<00031592>] scheduler_tick+0x18/0x62
>  [<0003df46>] __irq_wake_thread+0x0/0x40
>  [<0004b6b6>] update_process_times+0x5e/0x68
>  [<00006b1e>] via_timer_handler+0x1a/0x20
>  [<0003dfc0>] __handle_irq_event_percpu+0x3a/0xba
>  [<00037462>] __prepare_to_swait+0x0/0x26
>  [<0003e050>] handle_irq_event_percpu+0x10/0x3a
>  [<0003e0a6>] handle_irq_event+0x2c/0x4e
>  [<00040524>] handle_simple_irq+0x64/0x68
>  [<0002c5c0>] kthreadd+0x0/0xf4
>  [<0003db76>] handle_irq_desc+0x1e/0x28
>  [<000069be>] via1_irq+0x42/0x80
>  [<0002c5c0>] kthreadd+0x0/0xf4
>  [<0003db76>] handle_irq_desc+0x1e/0x28
>  [<00002798>] do_IRQ+0x20/0x32
>  [<00002698>] auto_irqhandler_fixup+0x4/0xc
>  [<00037462>] __prepare_to_swait+0x0/0x26
>  [<00002530>] ret_from_kernel_thread+0x0/0x14
> RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.
>
> ---
> BUG: spinlock recursion on CPU#0, swapper/2
>  lock: 0x573580, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
> CPU: 0 PID: 2 Comm: swapper Not tainted 6.6.20-mac #1
> Stack from 0085be80:
>         0085be80 0050972e 0050972e 00573580 00000000 003dc00e 0050972e 000385ce
>         00573580 004dddb2 0084c630 0002fca0 00573580 0085bec4 0002fcb8 00573580
>         00000000 0085bed4 00030f36 00000000 00815100 0003d35e 0004a990 00000000
>         00006b0a 00000000 0003d3d8 0000000e 00000000 00000000 00842608 00000102
>         00036c08 005a69b4 005a6a10 00000000 00000000 0003d468 005a69b4 00000000
>         005a69b4 0003d4be 005a69b4 005a6a10 00000000 005a69b4 005a6a10 0003f9a4
> Call Trace: [<003dc00e>] dump_stack+0xc/0x10
>  [<000385ce>] do_raw_spin_lock+0x34/0x58
>  [<0002fca0>] raw_spin_rq_lock_nested+0xe/0x14
>  [<0002fcb8>] raw_spin_rq_lock.constprop.0+0x12/0x18
>  [<00030f36>] scheduler_tick+0x18/0x62
>  [<0003d35e>] __irq_wake_thread+0x0/0x40
>  [<0004a990>] update_process_times+0x5e/0x66
>  [<00006b0a>] via_timer_handler+0x1a/0x20
>  [<0003d3d8>] __handle_irq_event_percpu+0x3a/0xba
>  [<00036c08>] __prepare_to_swait+0x0/0x26
>  [<0003d468>] handle_irq_event_percpu+0x10/0x3a
>  [<0003d4be>] handle_irq_event+0x2c/0x4e
>  [<0003f9a4>] handle_simple_irq+0x64/0x68
>  [<0002c1c8>] kthreadd+0x0/0xf4
>  [<0003cf8e>] handle_irq_desc+0x1e/0x28
>  [<000069aa>] via1_irq+0x42/0x80
>  [<0002c1c8>] kthreadd+0x0/0xf4
>  [<0003cf8e>] handle_irq_desc+0x1e/0x28
>  [<0000276c>] do_IRQ+0x20/0x32
>  [<0000266c>] auto_irqhandler_fixup+0x4/0xc
>  [<00036c08>] __prepare_to_swait+0x0/0x26
>  [<00002504>] ret_from_kernel_thread+0x0/0x14
> RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.
>
> ---
> BUG: spinlock recursion on CPU#0, swapper/2
>  lock: 0x52b8d0, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
> CPU: 0 PID: 2 Comm: swapper Not tainted 6.1.76-mac #1
> Stack from 0082fe5c:
>         0082fe5c 004ca084 004ca084 00000000 00000000 003ac8d6 004ca084 00038ec6
>         0052b8d0 004a1af1 00810040 0002f7ca 0052b8d0 0082fea0 0002f7e2 0052b8d0
>         00000000 0082fed4 00030abe 0082fecc 00000000 00000000 0000000e 003a44ea
>         00000000 00000000 00810040 0055ecdc 0005b98e 00563214 0003d82e 0004a7f6
>         00000000 00006e9e 00000000 0003d8a8 0000000e 00000000 00000000 00522608
>         0000000f 005272c8 0055ecdc 0055ed38 00000000 00000000 0003d938 0055ecdc
> Call Trace: [<003ac8d6>] dump_stack+0xc/0x10
>  [<00038ec6>] do_raw_spin_lock+0x34/0x58
>  [<0002f7ca>] raw_spin_rq_lock_nested+0xe/0x14
>  [<0002f7e2>] rq_lock.constprop.0+0x12/0x28
>  [<00030abe>] scheduler_tick+0x1c/0x142
>  [<003a44ea>] _printk+0x0/0x18
>  [<0005b98e>] irq_work_tick+0x20/0x26
>  [<0003d82e>] __irq_wake_thread+0x0/0x40
>  [<0004a7f6>] update_process_times+0x5e/0x68
>  [<00006e9e>] via_timer_handler+0x1a/0x20
>  [<0003d8a8>] __handle_irq_event_percpu+0x3a/0xba
>  [<0003d938>] handle_irq_event_percpu+0x10/0x3a
>  [<0003d98e>] handle_irq_event+0x2c/0x4e
>  [<0003fe64>] handle_simple_irq+0x64/0x68
>  [<0002bb10>] kthreadd+0x0/0xec
>  [<0003d3f2>] handle_irq_desc+0x1e/0x28
>  [<00006d3e>] via1_irq+0x42/0x80
>  [<0002bb10>] kthreadd+0x0/0xec
>  [<0003d3f2>] handle_irq_desc+0x1e/0x28
>  [<00002b58>] do_IRQ+0x20/0x32
>  [<00002a58>] auto_irqhandler_fixup+0x4/0xc
>  [<000028f8>] ret_from_kernel_thread+0x0/0x14
> cblist_init_generic: Setting adjustable number of callback queues.
>
>
