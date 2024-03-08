Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FA15B03A
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709928854; cv=none; b=nO7GtGgZxYQLOdSf6aRQD5SGMgPfwDsoz1CQ72HPVRLj765leRgJAqzyDe5dDQQeJAha1zFUjMfnpdT2etoqgomkz3PZUHfP7X4vHLVkEL0uILUUgiUq4gX7YjtUrv2gwlsPlv8ObYZlO5Cj+whCDtwL9QGc9AmJinhRWpn2O3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709928854; c=relaxed/simple;
	bh=2+MG2KEBbmr3jbhYuCW6KthEoW0sRRssKP0l2NpPsf4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=b7zBpCorA82rcVteJb4U0OREUrPcAuROioeA1YsBWFzrszpPeERRkObYvfyWg+jaefg1KjScnJ8bWm835YCmB21rE6LjhhtxuFbWIEcVAxTe/bsl1uW/+YVYXLplsZSSIXEwZHr2eBLwJpgSRDJWwUpraUnwcbIisZXcIPk1t6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE/SR1lM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE/SR1lM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e64647af39so2402491b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Mar 2024 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709928851; x=1710533651; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLrtx1dz1U7+ifSdJTjEfZJW4qLusEmRzqZgb1/g0Lw=;
        b=iE/SR1lMW2dtMmeH+vwKknsBY80PYKgTrwlSLM1b8RRGqh5AYxU4cCBUk95WB+bkKc
         XboHvJVT0Pe9SSaZGA7sampMK8JW4FXT7HYRV8qqPr3S6rG0vp4Av93hCfOHGekOFDnb
         8ejrvsz8aGzPcYa5rUxHR5/TyR3mGJxPRVF4hLo7Dkow4tQw+cO1hihaUAf44nCexJ4j
         DiaYXMkbDDLV4XKCNdQkLNRo9xDHWpBIaG+UksEtHDzHETsLM4sYReS1TO1uuANAKPDR
         zRDDVy8229/XbuhtRg5UcezCodIWweMskKTGBoggktsCWeQeMDuL7/8fdnkgP+Y7pzNL
         OsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709928851; x=1710533651;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLrtx1dz1U7+ifSdJTjEfZJW4qLusEmRzqZgb1/g0Lw=;
        b=FmysQwwrlRLdhL10sT8Sn6iwZkQCkVb7x7l9DudHsMY7I0cRGpcNirQWU7RvWDqG8p
         m1JiOlspB2MnMv1aajJ1VCn8+jBfKlHKsAjZYJuGdDByIvdWB4xqDqPtdPaZNGuJ/FsT
         zWD9cuFrGWZAgKrGlimPSqTRR2BtSnVrdMHDn7yX/uX6qwIz9d11/J3B4rVxiJyISLS2
         4700hWDdHnlNDP2DfBD+BvMD4LmjPs5J/bjRVvEkhCQDGC9xdrUQllHukel54r/dE6nS
         Smvc/oHpqYVxH2SttFJT6cKFI705lEEHjnN0mcZrXGI/Bt8B03YkdM2ZoJV8fUeayQrh
         zcCg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZTt8sLJI1xZQHhbaoGYIzdoDqhUWxL7jEbO4UG2fNBqP+tw+TD737vST54n9TzNauE1Um2m9FUKSdEe4djDycPrXiOVG3z9Ya0L2ayM6
X-Gm-Message-State: AOJu0YwoJPgOGj07WIWZ6sokLEHnl/4TA4ioZQYhzRUFNyqGZVnPcoyT
	xU8CF5SOXwyS4Vh5AljcFO8g4oqzo0EO8RrF9XZ3s/1/8w06Hb1hWFI92GRj
X-Google-Smtp-Source: AGHT+IGwBybjlGOmGJbZadAdaBT23uy5f32qe0gGfk3R+tdUsqdOrhFTGSPcpF+QofMaUj3lxFBxMw==
X-Received: by 2002:a05:6a00:3d04:b0:6e6:65fe:df3e with SMTP id lo4-20020a056a003d0400b006e665fedf3emr121810pfb.8.1709928849417;
        Fri, 08 Mar 2024 12:14:09 -0800 (PST)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id y11-20020a056a00038b00b006e6529c7d75sm94365pfs.3.2024.03.08.12.14.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2024 12:14:08 -0800 (PST)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
Date: Sat, 9 Mar 2024 09:14:03 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 08.03.2024 um 22:33 schrieb Finn Thain:
> On Fri, 8 Mar 2024, I wrote:
>
>> On Fri, 8 Mar 2024, Michael Schmitz wrote:
>>
>>>
>>>> IMHO, Gueunter would do better to instrument the spinlock tests on the
>>>> assumption that the locking in arch/m68k really is correct.
>>>
>>> I've come to agree - maybe logging any run queue locks taken by the init
>>> task with IRQs enabled might help?
>>>
>>
>> If I understood how the spinlock test algorithm worked, I'd be adding
>> sanity checks to it to test the assumptions underlying that algorithm.
>>
>> I would not be surprised if it uses logic that sees irqs_disabled() and
>> then assumes that all hard irqs are disabled, or something similar.

That is quite likely, given our past experience with core code 
assumptions about interrupts.

>> I don't think I'd be adding printk() because the BUG is intermittent and
>> printk() messes with timing.
>>
>
> Another way to tackle this is first find a reliable reproducer, then raise
> the IPL before before dispatching hard interrupts.
>
> The patch below was a forgotten experiment that I tried 3 years ago to
> deal with a similar failure. At the time I was using stress-ng to
> investigate a different issue, but maybe a workload like that could be a
> reproducer.
>
> ---
>
> After enabling CONFIG_DEBUG_SPINLOCK, I see the following failure on m68k.
>
> [ 4089.070000] BUG: spinlock trylock failure on UP on CPU#0, stress-ng/1341
> [ 4089.070000]  lock: 0x53d4a0, .magic: dead4ead, .owner: stress-ng/1341, .owner_cpu: 0
> [ 4089.070000] CPU: 0 PID: 1341 Comm: stress-ng Not tainted 5.14.0-multi-debug #2
> [ 4089.070000] Stack from 00a7dcc8:
> [ 4089.070000]         00a7dcc8 004da40f 004da40f 00000000 00a7dce4 0043e88e 004da40f 00a7dd10
> [ 4089.070000]         0006316c 004d240e 0053d4a0 dead4ead 00956bba 0000053d 00000000 0053d4a0
> [ 4089.070000]         00a7ddd8 0055e6ac 00a7dd28 000632b2 0053d4a0 004d2488 0005c81b 0053d458
> [ 4089.070000]         00a7dd34 0044780e 0053d4a0 00a7dd58 002b8694 0053d4a0 00000001 0000007f
> [ 4089.070000]         00860000 00000011 00528138 00528198 00a7dd7c 00069f6a 0000000d 00014200
> [ 4089.070000]         00528138 00a7dd78 00a7def0 00528138 00014200 00a7dd98 00069ff0 00528138
> [ 4089.070000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
> [ 4089.070000]  [<0006316c>] spin_dump+0x6c/0xc0
> [ 4089.070000]  [<000632b2>] do_raw_spin_trylock+0x32/0x80
> [ 4089.070000]  [<0005c81b>] init_dl_bandwidth+0x1b/0x80
> [ 4089.070000]  [<0044780e>] _raw_spin_trylock+0xe/0x40
> [ 4089.070000]  [<002b8694>] add_interrupt_randomness+0x154/0x1c0
> [ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
> [ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
> [ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
> [ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
> [ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
> [ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
> [ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
> [ 4089.070000]  [<00002da8>] user_irqvec_fixup+0xc/0x14
> [ 4089.070000]  [<0005c81a>] init_dl_bandwidth+0x1a/0x80
> [ 4089.070000]  [<000d51c0>] find_vma+0x0/0x80
> [ 4089.070000]  [<00444500>] down_read+0x0/0x200
> [ 4089.070000]  [<002b86b0>] add_interrupt_randomness+0x170/0x1c0
> [ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
> [ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
> [ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
> [ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
> [ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
> [ 4089.070000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
> [ 4089.070000]  [<0000653c>] buserr_c+0x17c/0x600
> [ 4089.070000]  [<00002ba8>] buserr+0x20/0x28
> [ 4089.070000]  [<0008800d>] get_next_modinfo+0xcd/0x100
>
> The problem seems to be that add_interrupt_randomness() was re-entered,
> leading to a contended input_pool.lock and "spinlock trylock failure".

We already knew that add_interrupt_randomness() can be reentered, though 
there are now checks in place that avoid taking input_pool.lock in 
hardirq context. But these checks have been added less than three years 
ago.

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

I notice legacy_timer_tick() states it must be called with interrupts 
disabled. We do not explicitly do that in via_timer_handler(), but rely 
on the IPL remaining high. Maybe adding local_irq_save(flags) / 
local_irq_restore(flags) around the legacy_timer_tick() call would help 
debug this?

Cheers,

	Michael
