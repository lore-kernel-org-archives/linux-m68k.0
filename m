Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BDA35
	for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Mar 2024 01:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710896449; cv=none; b=H0ShnhfXB7wxjWZe1G5S4m2/rsL7CmTjybNS95XEgOx+PAO7qrbCbjub6nGAHlUW39UzdtXkqueiUluDw8U/egbdho1tOuk04+fDhKGHe1yrh8x1JHsnlAk9fjOS+T7yi8jHjmh8oYZ9ErxnrbdWqykIUYrZWPO3ruFuTGhdp2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710896449; c=relaxed/simple;
	bh=Xgs5ICn5DzrPjv3M9lwL9i0IjyroG+vsMOi0W80P5JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlLqtAAXdNHTmY+9njEia9I4ayxzFcYCJFX57aEQ9jUpw0J7Yr6m3oxtCfDqQa+eUWGynxIpouhZ7xnNOnRnm95R64guhGx7kUFtKa1dPWq2UnJDjrsJ04ZrEkEfLkSjQvUyaScEuL+P3CtzNTD+nMFLUAxrJ3KaZp58AIhw5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3jwv6oP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3jwv6oP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso5331280b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Mar 2024 18:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710896447; x=1711501247; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aa2MpJmIPtTsaYKJ5zV7Pimwvw60Y2MW/67ph+TYo/c=;
        b=a3jwv6oPCaXEtC3h2MWYytcDSN6p+S5aJJYgmiFnowxOgY6eN6WMfQmrZCoqKVr92z
         8kz4KoNdJSvgnseWGw6plWMmG0MU3R5k0b5GOcEhcAE/EpioH4sZqdG4YFz7hBU1Km5g
         WIvSGgegqcFF4o9EPu2Ckkzu9Fvm2GhgwwDvQuenCYpNcLEAEVQrLDev4dUb5crXd5zW
         +2fcyQrIGBZSKK7IGFeHakf+LNRxZ6FCm0Lagi9qbFEB+o2CZTGQqyZ0r0r6+1dOPE8/
         qkP7TR68BjFNXRx7bMf7SXT/hbrqq/ykI2AqLLP7BWWhXEczWhUXc+y6vqskR74h6OSt
         EVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710896447; x=1711501247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa2MpJmIPtTsaYKJ5zV7Pimwvw60Y2MW/67ph+TYo/c=;
        b=IpNp/D6dck/gt6NgBxROIuCrDs9zplszuWpj2ZVvPTs04ekMQSuWU37d0HsukQTY/5
         MmErAxUbIaYkqFyRkQvkInSwkxt2Gz6V6zBMM87St0jhDiF8EkXBmxiFJi2lqyANa5W7
         DpdQB2S6+7c2YAvRvWjnoZuUoeQV1uvgVvyM20SS7MqOC1z9nigliDgOTehQt4e8d1jk
         KGWQBpqvaHrzrZ9kRGj3nUuOPn2v7pMTW8F2XSIX8q6WVZnHGM4ZIL/i0A06U2w4G7CM
         Qaa3qU1OuxTyRhAhV/V2YAB7o2phTye0/RE39FuaA4R37zGH6lE130+S3iLduaYov/+W
         oJwg==
X-Forwarded-Encrypted: i=1; AJvYcCWU7dtKCZOEURDs7FYQVe8HGsOAPAJ/T2k2FvagyNxbRyHZQgmRHeX0cPVAXobjiNUmTT+dIl29kMs+/RjJiNrispf53Pggl8bAdAgB3jEQ
X-Gm-Message-State: AOJu0YxqPVNcjqGw+bHM8pNqaa6+FHX+g8sRbpjLhTaG6j5truk3BTI7
	yifJ7ZJOQuKOtfzQxalkd/4cTjhtr39NlKaN8SAd4SPJH19R2Sy4
X-Google-Smtp-Source: AGHT+IGxHCyf+jGX/IqLJBwk56Wbo0wR4+AbsNVtNpFIJxv8q0DEWXM7qmvUsibLZYXqCkR1Vn3STg==
X-Received: by 2002:a05:6a20:d389:b0:1a3:69d6:d053 with SMTP id iq9-20020a056a20d38900b001a369d6d053mr848885pzb.43.1710896447064;
        Tue, 19 Mar 2024 18:00:47 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id x8-20020a63fe48000000b005dc36279d6dsm9811541pgj.73.2024.03.19.18.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:00:46 -0700 (PDT)
Message-ID: <43780105-d19a-4bf8-9db5-b0c47ac032bc@gmail.com>
Date: Wed, 20 Mar 2024 14:00:44 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
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
 <284ada62-c1bd-2321-ae18-27a315c56c33@gmail.com>
 <627480db-d871-8226-9028-e768512b1917@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <627480db-d871-8226-9028-e768512b1917@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 18/03/24 22:31, Finn Thain wrote:
> On Mon, 18 Mar 2024, Michael Schmitz wrote:
>
>> Am 15.03.2024 um 20:24 schrieb Finn Thain:
>>> On Fri, 15 Mar 2024, Michael Schmitz wrote:
>>>
>>>> No luck with whatever I tried around signals, cache maintenance and
>>>> mm.
>>>>
>>>> The 'BUG: Bad rss-counter state' message suggests we're freeing the
>>>> same page ranges twice, sometimes in many cases. I cannot quite see
>>>> how preempting the kernel on interupt return would cause this. Signal
>>>> forcing process exit but process exiting before signal is received
>>>> due to preemption? But skipping preemption when a signal is pending
>>>> did not change anything in my tests...
>>>>
>>>> Running out of ideas here, sorry.
>>>>
>>> FWIW, I found that the failure mode (with CONFIG_PREEMPT) changed
>>> significantly after I disabled hard irqs in do_IRQ() using the patch I
>>> sent on the 8th. In three stress-ng test runs, I got a soft lockup, a
>>> WARN from set_fc() and some CONFIG_DEBUG_LIST failures...
>> Yes, I do see that with your patch, too. I still see the old 'table
>> already free' bug, though.
>>
>> As far as I can see, the set_fc warning is from access_error040 and is
>> part of the access error exception that is taken in interrupt context.
>>
>> The question is basically - why is __free_one_page() called from
>> interrupt context? Did that also happen before Geert's preemption patch?
It's actually not called in hardirq context here, so that might be OK.
>>
> I did see that set_fc() warning during the mmap stress testing I did a few
> years ago. The example below comes from 5.18.0-rc7-mac-00006-g210e04ff7681
> but a lot has changed since then and it may not be relevant. I stopped
> doing those tests when Al Viro fixed the bug I was chasing. When I get
> time I shall fire up a Quadra and try again with v6.8.

That may not be necessary - this warning is not followed by a kernel bus 
error oops, so I suspect this was due to a legitimate page fault taken 
in softirq context, caused by memory pressure.

Unless kernel rules state we must not take page faults during softirq 
handling?

Cheers,

     Michael

> stress-ng: info:  [116] dispatching hogs: 1 mmap
> [ 1673.480000] ------------[ cut here ]------------
> [ 1673.480000] WARNING: CPU: 0 PID: 159 at ./arch/m68k/include/asm/processor.h:91 buserr_c+0x59a/0x99a
> [ 1673.480000] Modules linked in:
> [ 1673.480000] CPU: 0 PID: 159 Comm:  Not tainted 5.18.0-rc7-mac-00006-g210e04ff7681 #2
> [ 1673.480000] Stack from 00a13dec:
> [ 1673.480000]         00a13dec 0046b224 0046b224 00000000 00a13e08 003d7e16 0046b224 00a13e1c
> [ 1673.480000]         0001c1b4 00000000 00a13e94 b6db6eaa 00a13e48 0001c240 00461323 0000005b
> [ 1673.480000]         0000678c 00000009 00000000 00000000 00000505 b6db6db6 db6db6db 00a13e88
> [ 1673.480000]         0000678c 00461323 0000005b 00000009 00000000 00000000 00989680 00000004
> [ 1673.480000]         003d6a82 0000000c 003dbb98 00a1f780 004b0c0c 000496dc 00077359 00a13f0c
> [ 1673.480000]         00002bcc 00a13e94 00010000 00000000 00989680 00000004 003d6a82 b6db6db6
> [ 1673.480000] Call Trace: [<003d7e16>] dump_stack+0x10/0x16
> [ 1673.480000]  [<0001c1b4>] __warn+0xc6/0xe8
> [ 1673.480000]  [<0001c240>] warn_slowpath_fmt+0x6a/0x76
> [ 1673.480000]  [<0000678c>] buserr_c+0x59a/0x99a
> [ 1673.480000]  [<0000678c>] buserr_c+0x59a/0x99a
> [ 1673.480000]  [<003d6a82>] _printk+0x0/0x16
> [ 1673.480000]  [<003dbb98>] down_read+0x0/0xdc
> [ 1673.480000]  [<000496dc>] __irq_wake_thread+0x0/0x44
> [ 1673.480000]  [<00077359>] ___bpf_prog_run+0x18b/0x20e4
> [ 1673.480000]  [<00002bcc>] buserr+0x20/0x28
> [ 1673.480000]  [<00010000>] LP1CONT1+0x4a/0x7c
> [ 1673.480000]  [<003d6a82>] _printk+0x0/0x16
> [ 1673.480000]  [<00050005>] dma_coherent_ok+0x1d/0xb8
> [ 1673.480000]  [<00012704>] tblpre+0x594/0x700
> [ 1673.480000]  [<0001c1d6>] warn_slowpath_fmt+0x0/0x76
> [ 1673.480000]  [<00040e08>] account_system_time+0x74/0xca
> [ 1673.480000]  [<0004113e>] account_process_tick+0x30/0xb0
> [ 1673.480000]  [<00010000>] LP1CONT1+0x4a/0x7c
> [ 1673.480000]  [<00053a6e>] update_process_times+0x36/0xae
> [ 1673.480000]  [<00060bdc>] legacy_timer_tick+0x64/0x6c
> [ 1673.480000]  [<00008fa4>] via_timer_handler+0x1e/0x24
> [ 1673.480000]  [<00049756>] __handle_irq_event_percpu+0x36/0xd8
> [ 1673.480000]  [<00002600>] name_to_dev_t+0x1a4/0x3f8
> [ 1673.480000]  [<003d9d40>] yield_to+0x88/0x8c
> [ 1673.480000]  [<0004980c>] handle_irq_event_percpu+0x14/0x52
> [ 1673.480000]  [<0004986c>] handle_irq_event+0x22/0x36
> [ 1673.480000]  [<0004cf1a>] handle_simple_irq+0x4e/0x7c
> [ 1673.480000]  [<00048f3e>] generic_handle_irq+0x3c/0x4a
> [ 1673.480000]  [<00008e3c>] via1_irq+0x7e/0x96
> [ 1673.480000]
> [ 1673.480000] ---[ end trace 0000000000000000 ]---
