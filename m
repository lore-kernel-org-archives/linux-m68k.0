Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BF157A5B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430614; cv=none; b=f0lyv9BHkRWBUYZss+4ABNU0E2dqTJqSEy9OHbcGbstmLIoNpATNj7OBhzxu2eUUqB1zGKOD4Chsu7Vkpbt/mrgNiL5LRB6DU0vQua8DrsGs5a0MRIidOVnRrJ3rTlj+SQyatSbqob59gPVjxn2kDtN5q16eKfCRNUobmfnTsvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430614; c=relaxed/simple;
	bh=5HYDmWWTHNo9kYOTDUtxh88uXzWCHHFuMyPQPvKJXG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYNwoqVPSsmqvHxyEDyXQZnJGkSHy7u4T+yPjOzcQXeYvnl8e8YSK71wltCC2rycG0P0LIgxG4D3SfbEUjy8GhQYZrx3rbBT+akFgRgqMPt7u+8RpLAQ6y9aOpzjd7VxzMjhD/+yQ4sIyc3G2gY+2wfIkjIlWDcsTfxZlEb79Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ/agE6I; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ/agE6I"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f6da06ba24so52352895ad.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719430612; x=1720035412; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vI/G2M6/DnhclQ23YmF7z6fxJkOQgUE5s0q5OISdr3c=;
        b=nJ/agE6I28nhS5NVwErKIY/rNZALBg2Ahtywe8g4fqI9Vgf9DA5A4NbS04oesfiMQs
         hozr1NSfiSDY+spvdTTI1QzvwtV2MLTwzit83SqbyzJlihrsG8+xpJuDNF5Vbu6STcST
         Fn2RO+ZptOij/ZdlHNg9/9LTGxrRDprdZqykXu7F8mbW4zMRrpX41A92IQFD4fe5wNnf
         9hhGQKOsAYyjDT0yY+S/tEY7wGk2eGVtaqrXNd7AdZSXoBtqmHH8Qvcv1Xtyxhwwld8N
         2uf9VfXWCUWZk7dnw8crppP9V+j5l28xRhlaWm2/KWTez6LUXMkpwVUC7OFeVLlavn7i
         i84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430612; x=1720035412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vI/G2M6/DnhclQ23YmF7z6fxJkOQgUE5s0q5OISdr3c=;
        b=CbQgwgV9zhz5HfrVDgel6PMK1mPCzTJvEJ19SlOiNbVFnMWkbC1NubWIHebCRb9J5x
         IXLQKubUiA+uSbSCFCjJusOrBLrBsohUpHPvWawCeNaWWM/Pzy5EdvZJ8oeID5lTpzij
         U0+dusT5naS/Mn/RS5iT9F6D7IaRt9zyRTSM8QJRWnXHFvCSvYVIH++9k82E4E0Leob1
         llDqEkT5lxSh+y2QWLcANnSaIaZyIKayS0p0xUQCfkDEFvEoDywTqHTUyAt/EFEMCka7
         L9ugX7eZpLjOli3lAar84LOqfazYmZUH2BfrB5Kl3fYVGRZZgxjApvVZ1NlTo55Goy68
         7DhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJvmrszkOn0Spz0DZ9hcK+KjGhGnSnupIHf9x30l+chz7CDeF0BmNxkf4ICw/ETHe7dkS/LlArs3DCJ5D/VRNE7Fqyo4e/L8z0HGB0V6kD
X-Gm-Message-State: AOJu0Yw4U7ct9VQigMr4Mkp9JNoqRmKBUbhfnrf2BPwYe6kbifzOkTuG
	QMJivGydoy10OOgvWZrvGa7SVyKZ6NJHRR1GpwAjM+H6/6oTWF6V
X-Google-Smtp-Source: AGHT+IEqqy57kS3qvrLUYreixvBasmDit4yuFEV2ZRcy6tF0cDi2+wYviqf2XQB1DqkIJSI0UB8Jdg==
X-Received: by 2002:a17:902:c401:b0:1fa:2277:f56c with SMTP id d9443c01a7336-1fa23fbeb3fmr123243985ad.41.1719430611908;
        Wed, 26 Jun 2024 12:36:51 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:59f2:64c2:bfe2:faa2? ([2001:df0:0:200c:59f2:64c2:bfe2:faa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c6d47sm103475385ad.178.2024.06.26.12.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 12:36:51 -0700 (PDT)
Message-ID: <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
Date: Thu, 27 Jun 2024 07:36:58 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jean-Michel,

On 27/06/24 01:28, Jean-Michel Hautbois wrote:
> Hi Michael,
>
> On 26/06/2024 03:56, Michael Schmitz wrote:
>> Jean-Michel,
>>
>> On 24/06/24 20:56, Jean-Michel Hautbois wrote:
>>>
>>> When I printk the do_page_fault first debug, I get for the first 
>>> call to ls:
>>> bash-5.2# ls
>>> [   14.700000] do page fault:
>>> [   14.700000] regs->sr=0x0, regs->pc=0x70069ee6, 
>>> address=0x70069ee6, 0, (ptrval)
>>
>> Page not present, read fault. Please disable obfuscation of kernel 
>> pointer addresses by printk. Maybe also disable address space 
>> randomization while debugging this.
>>
>>> This call works almost fine (I still have the assert failed: 
>>> folio->private != NULL issue).
>>>
>>> And when I call it a second time, I get:
>>> bash-5.2# ls
>>> [   19.820000] do page fault:
>>> [   19.820000] regs->sr=0x0, regs->pc=0x6011d65a, 
>>> address=0x700e2004, 2, (ptrval)
>>
>> Page not present, write fault.
>>
>> It would be helpful if you could get a dump of /proc/1/maps before 
>> the execve() syscall in your helloworld init replacement. That might 
>> confirm all these addresses are legit (assuming mappings survive 
>> across execve(), that is), and what they correspond to.
>>
>>>
>>> The address corresponds to the defined zone ELF_ET_DYN_BASE as I set 
>>> it to 0x70000000.
>>>
>>> regs->pc is not the same as the address. It might be unrelevant, but 
>>> any help is appreciated to understand the process behind :-).
>>>
>>> I keep digging, and I am in the asm part which fears me a bit !
>>
>> I don't see that you'd need to look at any asm code here.
>
> I add a small test in do_page_fault, and in case of an error, it 
> panics. The result follows:

Please take a look at the comments at the start of 
arch/m68k/mm/fault.c:do_page_fault(). The meaning of the bits in 
error_code are explained there.

error_code != 0 is just one possible case out of the four that are 
handled by do_page_fault(). It does not signify 'no error' - if there 
hadn't been a page fault, do_page_fault() would not have been called.

You just forced a panic each time a write fault and/or a protection 
fault happens. Write faults are absolutely expected to happen when 
loading a library - ld.so needs to perform relocation after loading a 
dynamic library, and that means writes to the GOT in the library's data 
segment (PIC assumed).


>  ./scripts/decode_stacktrace.sh vmlinux < /tmp/trace.log
> [    3.857000] Run /bin/bash as init process
> [    3.858000]   with arguments:
> [    3.861000]     /bin/bash
> [    3.862000]   with environment:
> [    3.863000]     HOME=/
> [    3.864000]     TERM=linux
> [    4.242000] do page fault:
> [    4.242000] regs->sr=0x2000, regs->pc=0x41366924, 
> address=0x700b3364, 2, 41fb0000
> [    4.242000] Kernel panic - not syncing: page fault error
> [    4.242000] CPU: 0 PID: 1 Comm: bash Not tainted 
> 6.10.0-rc5-g927da6cf01fe-dirty #25
> [    4.242000] Stack from 4186dda8:
> [    4.242000]         4186dda8 41423aa4 41423aa4 700b3300 00000001 
> 00000000 4136ee10 41423aa4
> [    4.242000]         41366d7a 700b3364 700b3364 00000000 0000000d 
> 4186de60 41fb0000 41d51a60
> [    4.242000]         41005696 41416a90 41416a4d 00002000 41366924 
> 700b3364 00000002 41fb0000
> [    4.242000]         0000000a 700b3364 00000000 0000000d 00000012 
> 41d51a00 4186de60 41d51a60
> [    4.242000]         41fb81c0 41d51a60 410052fe 4100529a 4186de60 
> 700b3364 00000002 00000000
> [    4.242000]         700bc414 00000003 00008000 700ac000 41003660 
> 4186de60 00000000 00000000
> [    4.242000] Call Trace: dump_stack (lib/dump_stack.c:124)
> [    4.242000] panic (kernel/panic.c:266 kernel/panic.c:368)
> [    4.242000] do_page_fault (arch/m68k/mm/fault.c:88 (discriminator 1))
> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:725 
> arch/m68k/kernel/traps.c:775)
> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:748 
> arch/m68k/kernel/traps.c:775)
> [    4.242000] buserr (arch/m68k/kernel/entry.S:116)
> [    4.242000] ma_slots (lib/maple_tree.c:759)
> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
> [    4.242000] elf_load (fs/binfmt_elf.c:125 (discriminator 1) 
> fs/binfmt_elf.c:421 (discriminator 1))
> [    4.242000] load_elf_binary (fs/binfmt_elf.c:1132)
> [    4.242000] memset (arch/m68k/lib/memset.c:11)
> [    4.242000] load_misc_binary (fs/binfmt_misc.c:97 
> fs/binfmt_misc.c:146 fs/binfmt_misc.c:213)
> [    4.242000] memset (arch/m68k/lib/memset.c:11)
> [    4.242000] bprm_execve (fs/exec.c:1797 fs/exec.c:1839 
> fs/exec.c:1891 fs/exec.c:1867)
> [    4.242000] copy_strings_kernel (fs/exec.c:669)
> [    4.242000] count_strings_kernel (fs/exec.c:473)
> [    4.242000] kernel_execve (fs/exec.c:2058)
> [    4.242000] __dynamic_pr_debug (lib/dynamic_debug.c:865)
> [    4.242000] run_init_process (init/main.c:1389)
> [    4.242000] _printk (kernel/printk/printk.c:2365)
> [    4.242000] kernel_init (init/main.c:1508)
> [    4.242000] kernel_init (init/main.c:1459)
> [    4.242000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
> [    4.242000]
> [    4.242000] ---[ end Kernel panic - not syncing: page fault error ]---
>
> Looks like a memory mapping failure, but why ?
> My JTAG at this point dumps a list of 0s at 0x41fb0000 and my SDRAM 
> starts at 0x40000000 and ends at 0x50000000 (256MB).
0x41fb0000 seems to be init's page directory. The fault address is in 
the range where I'd expect dynamic libraries to reside.
>
> It looks like a TLB write miss which is obscure to me :-).
>
> I tried to use the /proc but as expected it is not alive after 
> mounting it.

The memory map ought to be accessible through sysrq - an alternative 
would be to modify the ELF binfmt handler and dump the map once ld.so 
has finished with relocations.

Cheers,

     Michael


> Thanks,
> JM
>
>
>> Cheers,
>>
>>      Michael
>>
>>>
>>> Thanks !
>>> JM
