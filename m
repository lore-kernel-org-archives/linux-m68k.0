Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1D1F76BE
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Dec 2024 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733253027; cv=none; b=IYtClT2Umjl2sMxSfgz5i0K2w7tG0FPmSjYG6JC4KHA0Vdk5cPToPB9+yDuBQIP+HkrNsDl65gn7oI9b98j4O1c/ma44mdB6qFrMYAzIOnq27+mIWb/T3N6u+yr+4fA4UHiXR6U4fvlFrHdytOEon9jEI83HBLFjwA9Ngn681yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733253027; c=relaxed/simple;
	bh=equwymxagylTfOKiMukh6cgxz/x44zH9uK9iEFLU9rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz5AeDvFSO1ZzCuOcNJL8zw4+OsVHyBvMyQ6EtPb/3JxSHl+0iH3gScmD281Pz4rq2yWCo4fxB52xgiLvp77UnNJPXRAIrcHIP1v7miHlcO5IuHFe5FE9aw7jVS1gfH9XT1O+VFt65cV4/Wae+dU239Xx0nI2innSF7mZmNeXyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=bVUvrE8s; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="bVUvrE8s"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86BB6FF803;
	Tue,  3 Dec 2024 19:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1733253023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJ141NfXLLsQBayhvUmDGESh4xTXpdSDAsmwypM8tp8=;
	b=bVUvrE8sNyeaKUQxMs3EQwd7lDUEjCSDwyMRyC8xa/EWV1oXgcFnokk5MZ9LdsY9pyCxED
	EXHeFoyo8pJ7MzRrGlJH+m+RxQPD9qS145/4JDCid90n0Ja0UCPHO3cEto7ZYyXztw/Py1
	LUIb3sTIulF3zhhoOtcQxBz49qq/+0hnzVKysf+roGrLvkgSCmRLjQ2MwD7yncXKY2zzZE
	f47DMn/68IKuZ9WgQOneYydI3tHqfX/sbMAYScqZM7nwTaqRFx/bJSCIMah6M6Xp2hpmKi
	lFEB7NOXzOwUoR/rMPWm0Mxw3MoAizA0xoZXlf5H3lLZvxIWD+ruue9eh7TIzw==
Message-ID: <b20a80d4-2539-4771-897e-f8339a09545b@yoseli.org>
Date: Tue, 3 Dec 2024 20:10:21 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arch: m68k: Add STACKTRACE support
To: Michael Schmitz <schmitzmic@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rostedt@goodmis.org
References: <20241203-add-m68k-tracing-support-v2-0-77302097a9f4@yoseli.org>
 <20241203-add-m68k-tracing-support-v2-2-77302097a9f4@yoseli.org>
 <eb313fe1-f586-4613-acb6-63b12859da71@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <eb313fe1-f586-4613-acb6-63b12859da71@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,

On 03/12/2024 19:21, Michael Schmitz wrote:
> Jean-Michel,
> 
> good work on adding

Thanks ^_^

> On 4/12/24 06:21, Jean-Michel Hautbois wrote:
>> In order to use tracing, implement a basic arch_stack_walk() based on
>> the one in PowerPC.
>> Tested on a M54418 coldfire.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> ---
>>   arch/m68k/Kconfig             |  6 ++++
>>   arch/m68k/kernel/Makefile     |  1 +
>>   arch/m68k/kernel/stacktrace.c | 70 +++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   3 files changed, 77 insertions(+)
>>
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 
>> 793ab1e2762609725bbf793f6dffecfa3ecfff0f..6ba3238ba2c68acaf5974396739e629b09eee3ca 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -40,6 +40,8 @@ config M68K
>>       select UACCESS_MEMCPY if !MMU
>>       select ZONE_DMA
>>       select TRACE_IRQFLAGS_SUPPORT
>> +    select ARCH_STACKWALK
>> +    select ARCH_WANT_FRAME_POINTERS
> 
> How much does that add to kernel size? It's only needed for debugging so 
> some folks may prefer to save a little on code size (not to mention the 
> extra frame pointer save on each call) ...

Oh yeah, I have such a fast (ah ah) cpu that I forget others may not.
I have not measure the size it adds.

> 
> Cheers,
> 
>      Michael
> 
> 
>>   config CPU_BIG_ENDIAN
>>       def_bool y
>> @@ -106,6 +108,10 @@ config BOOTINFO_PROC
>>         Say Y to export the bootinfo used to boot the kernel in a
>>         "bootinfo" file in procfs.  This is useful with kexec.
>> +config STACKTRACE_SUPPORT
>> +    bool
>> +    default y
>> +
> Any reason why you can't place the two 'select' statements in this 
> conditional?

Absolutely not, I will add those here and condition the stacktrace to 
coldfire (or even M5441x ?) ?

>>   menu "Platform setup"
>>   source "arch/m68k/Kconfig.cpu"
>> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
>> index 
>> 6c732ed3998b714a4842ee29c977550a61979779..cb02bcfe04c6b265fa97db9237395a262e649989 100644
>> --- a/arch/m68k/kernel/Makefile
>> +++ b/arch/m68k/kernel/Makefile
>> @@ -23,3 +23,4 @@ obj-$(CONFIG_UBOOT)        += uboot.o
>>   obj-$(CONFIG_EARLY_PRINTK)    += early_printk.o
>> +obj-y    += stacktrace.o
>> diff --git a/arch/m68k/kernel/stacktrace.c b/arch/m68k/kernel/ 
>> stacktrace.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..4c2fb6b0cf675ee5a3a21393a50603fea98a1b03
>> --- /dev/null
>> +++ b/arch/m68k/kernel/stacktrace.c
>> @@ -0,0 +1,70 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Stack trace utility functions etc.
>> + *
>> + * Copyright 2024 Jean-Michel Hautbois, Yoseli SAS.
>> + */
>> +
>> +#include <asm/current.h>
>> +#include <asm/ptrace.h>
>> +#include <linux/sched.h>
>> +#include <linux/sched/task_stack.h>
>> +#include <linux/stacktrace.h>
>> +
>> +static inline unsigned long current_stack_frame(void)
>> +{
>> +    unsigned long sp;
>> +
>> +    asm volatile("movl %%fp, %0" : "=r"(sp));
>> +    return sp;
>> +}
>> +
>> +static inline int validate_sp(unsigned long sp, struct task_struct 
>> *task)
>> +{
>> +    unsigned long stack_start, stack_end;
>> +
>> +    if (task == current)
>> +        stack_start = (unsigned long)task_stack_page(task);
>> +    else
>> +        stack_start = (unsigned long)task->thread.esp0;
>> +
>> +    stack_end = stack_start + THREAD_SIZE;
>> +
>> +    if (sp < stack_start || sp >= stack_end)
>> +        return 0;
>> +
>> +    return 1;
>> +}
>> +
>> +void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn 
>> consume_entry, void *cookie,
>> +                       struct task_struct *task, struct pt_regs *regs)
>> +{
>> +    unsigned long sp;
>> +
>> +    if (regs && !consume_entry(cookie, regs->pc))
>> +        return;
>> +
>> +    if (regs)
>> +        sp = (unsigned long) regs;
>> +    else if (task == current)
>> +        sp = current_stack_frame();
>> +    else
>> +        sp = task->thread.ksp;
>> +
>> +    for (;;) {
>> +        unsigned long *stack = (unsigned long *) sp;
>> +        unsigned long newsp, ip;
>> +
>> +        if (!validate_sp(sp, task))
>> +            return;
>> +
>> +        newsp = stack[0];
>> +        ip = stack[1];
>> +
>> +        if (!consume_entry(cookie, ip))
>> +            return;
>> +
>> +        sp = newsp;
>> +    }
>> +}
>>

