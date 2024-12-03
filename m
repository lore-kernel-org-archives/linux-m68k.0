Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303C1FC0E0
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Dec 2024 18:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250086; cv=none; b=SItZrj023w851fAHE1y8dosu9NsriGbIqH2pP2yh85RcDQGzBvkMOu6RK3iZPosLopl4AUxkugictfynT3vHfje+tc1ILjr+6jWUQhvJPnOx+0XDQnQkQ+O1RCX4aRUduwFvrvLyk2kfRlITrVt1M7Tee0eW//+Cu+EklsBV+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250086; c=relaxed/simple;
	bh=zS4qtpdn7aiktftVenb232RqgB+OjbB2dPrk2l7SAws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shDTynEoBd+VGwUVWKl81dlKN+yahUXdqy86SaImnougZC4dZe21H7CReKOYp6UHc5vptJ5m7gkRoFtxIiEbv/9WdsrOmqppghBEHp4KVrd1pFRsbdbCZrerca+U/vhHqc/PBtxbuM1EipU4mnDcFS8Ie+QX3dQ53HOfzMs2cgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv3rA+/s; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv3rA+/s"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fbc1ca1046so5417757a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Dec 2024 10:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733250084; x=1733854884; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KOOtRiVxPLw8heRpNXCI9X3oBVHzt9oZL/WipJD0qEs=;
        b=Cv3rA+/sO38XBkEZGFgAetw/UL6gTLoXjMp2goGpmo7BnG8F/fwWF5iaPX67r+DItC
         Ki5gEToIKTtn9+OClxi45qh4YLR7SdN4iMUdc3VH2Q/i04Tan9t1bwlfz3Y7n/GO+12s
         7WINxeGaDr7PCesREysEwR9l5I/UoS1nX+VmFXwOPZd0SkK56oqZL5ie2jg8YMVD+vnc
         CcBYPu40RfyLXdoiDrktvmwgcCAQ9g6osI9ar1AKsHtUf1Pbbu4bUJCZ/FNp6giLLvTR
         8nAwKUu0JrQqU+ePgeHfMf5TeObAAFc01walx1yo07e1OwxZd5T+IlYsT6CMOoCnv3nt
         sEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250084; x=1733854884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOOtRiVxPLw8heRpNXCI9X3oBVHzt9oZL/WipJD0qEs=;
        b=l+6G6kKd+WtYeLhTlpOGgpu8u072RN6M34gwSaPkScDMzwKV/rh6sunaaiISjq0fOH
         ajE/LoCA+ixTH0v8e/f8LbQHgHr3+mWrXhzX5F6JfJnbo1/NwbowjaK0CPqZadhAbxRk
         iAcOKHygugbHgM7sYSY+uqXHbaXXdN8NGRR0Vzy6sYGeEvbV/xD1Sm5+gfnShSKGXB8Q
         oFX2lw6rsJ8kgyWntPkqR9FDnh6masJskahRxsHTSU75rSMrWUmHnB4CztBpMolbxzQ9
         4JnYFqxEanwVLssp1QviFltRZEdwy3eTBlcDFUr5N4WuwIwGzRGxmZcHz7mEdRSt71nR
         vHjA==
X-Gm-Message-State: AOJu0Yzaae48ZpXo26svhV49CNyJ65hESZtDS9ydXm1OoeJwiXO5jCk0
	LqHZZQjbixpioLAFClI0UcMDWG+QqjH17Ym+5iJx41NYZQn6fRJL
X-Gm-Gg: ASbGnctA7MSBoC4bNke5jWhYV3evhHaN/Lt59ATaEmlYmfIeau9BGrO8+NHlSWmDxwJ
	oj9ACZsrGB01uumipVinCzQdqTeLAedooQ4JYvgPltcdj8v23bBCudXPn9Qs45b5rol4jpt7N4g
	vW4TRfiC7mZ/wUz68mbWGCEmdkC2tbN/4FwDTLzc4YLvPCJ2JJMqcWvQbx7HEHOPnxXqnAsUb4g
	tfeC5jd2u0z/+sAK3/VgPCW6n5JDIq6/i2pqatpcXbRdZKNQ+oDxtxsd/u4TcKuXF/JhB1IskzN
	4cf8of7Xlg+Aj8+6xfX1NFy3PUbzUR52JsjrYPHmpTVYfFJMocJwWkyxX2Ztm9wC
X-Google-Smtp-Source: AGHT+IH1xfWsizP1u/LF/LRYJ+Hz2nxFK2DspdsxBhKhc+S50pRHcv38dpzLh2Sr00Q1fRHoaXmpIg==
X-Received: by 2002:a05:6a20:918d:b0:1e0:d6ef:521a with SMTP id adf61e73a8af0-1e1653a7c14mr5073785637.1.1733250084216;
        Tue, 03 Dec 2024 10:21:24 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:1063:266d:3cf0:ce5b? ([2001:df0:0:200c:1063:266d:3cf0:ce5b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c388f0bsm10006665a12.54.2024.12.03.10.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 10:21:23 -0800 (PST)
Message-ID: <eb313fe1-f586-4613-acb6-63b12859da71@gmail.com>
Date: Wed, 4 Dec 2024 07:21:46 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arch: m68k: Add STACKTRACE support
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rostedt@goodmis.org
References: <20241203-add-m68k-tracing-support-v2-0-77302097a9f4@yoseli.org>
 <20241203-add-m68k-tracing-support-v2-2-77302097a9f4@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20241203-add-m68k-tracing-support-v2-2-77302097a9f4@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jean-Michel,

good work on adding

On 4/12/24 06:21, Jean-Michel Hautbois wrote:
> In order to use tracing, implement a basic arch_stack_walk() based on
> the one in PowerPC.
> Tested on a M54418 coldfire.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>   arch/m68k/Kconfig             |  6 ++++
>   arch/m68k/kernel/Makefile     |  1 +
>   arch/m68k/kernel/stacktrace.c | 70 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 77 insertions(+)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 793ab1e2762609725bbf793f6dffecfa3ecfff0f..6ba3238ba2c68acaf5974396739e629b09eee3ca 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -40,6 +40,8 @@ config M68K
>   	select UACCESS_MEMCPY if !MMU
>   	select ZONE_DMA
>   	select TRACE_IRQFLAGS_SUPPORT
> +	select ARCH_STACKWALK
> +	select ARCH_WANT_FRAME_POINTERS

How much does that add to kernel size? It's only needed for debugging so 
some folks may prefer to save a little on code size (not to mention the 
extra frame pointer save on each call) ...

Cheers,

     Michael


>   
>   config CPU_BIG_ENDIAN
>   	def_bool y
> @@ -106,6 +108,10 @@ config BOOTINFO_PROC
>   	  Say Y to export the bootinfo used to boot the kernel in a
>   	  "bootinfo" file in procfs.  This is useful with kexec.
>   
> +config STACKTRACE_SUPPORT
> +	bool
> +	default y
> +
Any reason why you can't place the two 'select' statements in this 
conditional?
>   menu "Platform setup"
>   
>   source "arch/m68k/Kconfig.cpu"
> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
> index 6c732ed3998b714a4842ee29c977550a61979779..cb02bcfe04c6b265fa97db9237395a262e649989 100644
> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -23,3 +23,4 @@ obj-$(CONFIG_UBOOT)		+= uboot.o
>   
>   obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
>   
> +obj-y	+= stacktrace.o
> diff --git a/arch/m68k/kernel/stacktrace.c b/arch/m68k/kernel/stacktrace.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4c2fb6b0cf675ee5a3a21393a50603fea98a1b03
> --- /dev/null
> +++ b/arch/m68k/kernel/stacktrace.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Stack trace utility functions etc.
> + *
> + * Copyright 2024 Jean-Michel Hautbois, Yoseli SAS.
> + */
> +
> +#include <asm/current.h>
> +#include <asm/ptrace.h>
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/stacktrace.h>
> +
> +static inline unsigned long current_stack_frame(void)
> +{
> +	unsigned long sp;
> +
> +	asm volatile("movl %%fp, %0" : "=r"(sp));
> +	return sp;
> +}
> +
> +static inline int validate_sp(unsigned long sp, struct task_struct *task)
> +{
> +	unsigned long stack_start, stack_end;
> +
> +	if (task == current)
> +		stack_start = (unsigned long)task_stack_page(task);
> +	else
> +		stack_start = (unsigned long)task->thread.esp0;
> +
> +	stack_end = stack_start + THREAD_SIZE;
> +
> +	if (sp < stack_start || sp >= stack_end)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
> +					   struct task_struct *task, struct pt_regs *regs)
> +{
> +	unsigned long sp;
> +
> +	if (regs && !consume_entry(cookie, regs->pc))
> +		return;
> +
> +	if (regs)
> +		sp = (unsigned long) regs;
> +	else if (task == current)
> +		sp = current_stack_frame();
> +	else
> +		sp = task->thread.ksp;
> +
> +	for (;;) {
> +		unsigned long *stack = (unsigned long *) sp;
> +		unsigned long newsp, ip;
> +
> +		if (!validate_sp(sp, task))
> +			return;
> +
> +		newsp = stack[0];
> +		ip = stack[1];
> +
> +		if (!consume_entry(cookie, ip))
> +			return;
> +
> +		sp = newsp;
> +	}
> +}
>
