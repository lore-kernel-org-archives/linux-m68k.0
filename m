Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921110958
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Jun 2024 06:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717829891; cv=none; b=ZZ6RV7yf6t2qXqC85Vcwh4vKLA6pTdye4I0RhhStvAETKg3jUat0Wy5mAi8KRTKNcKSugBx7hf4QoQX2es7kSHS45gJbJY52GEVy7lubxh2QUsspYw1RMdF+RkljMqRGf8J4+WHfWHEL/5DA9M/DvkdciNoXmt9k82LPNRe6AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717829891; c=relaxed/simple;
	bh=fmbNYc4Y6G2s8PwxsJEtaJbdgSp3sv9X1F4PI8wjloA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJUd1JhPKlWemc3drch6MEySxGkq+s2qgQeP3NLkcPM9HnOu9W5jiGkhJxX5zIcJMDITeBGKsa2T3w0Y4yXQUflYKqfc0vDrj4BycG89ZiXI8b8J2SmCkD9inDy1F2Y+uZ+LHNstnfD4VLUQVJBPscYDdIKyxDtHF9/U2kapY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=l3QHMrT8; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="l3QHMrT8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DC81E0005;
	Sat,  8 Jun 2024 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1717829880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQfuSnskVT1ibvn/ajoLX8Z/engtj2QPWLHkD4lvmDo=;
	b=l3QHMrT82AYVT00OvFtoohQJeDb+BBWyoz/nUSTWjs4iC93/jz1xoDAiIoN3SFIdoqyfDc
	imTjSOROfhR1AxVwEKV/OQG8ASRwIw0+3ab8r+5PE/AR03IiHfEwHNu70Z59uxcBm0FqIY
	AR3HEJ1SqxuaiHavMVPVMLKiZbWW9eg4xTHZNyj3PxZ0t3WYY7DxKevCJBrt7bbqb2+Mhx
	8eEr6zM3Xzeh0LrbTQqRRUi4HzlH0DbpBu+TE8acDzGRkECm9ek6T2jJCnfREFBjqd2ZyH
	5c2fJRoCQlZUwIrG1gEzVLLaQ9wo9gLaTu4QNXqyrB1/A2rYtrXLU4yhkJ8kPA==
Message-ID: <f5670c87-ac63-4005-893b-0d22eeee2f83@yoseli.org>
Date: Sat, 8 Jun 2024 08:58:00 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m54418: ELF execution issues
To: Michael Schmitz <schmitzmic@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
 <82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
 <85e2ecc5-d334-4c83-8209-19e0c1c71812@kernel.org>
 <49a0c20c-586a-4762-b80a-ddc59cc511ed@yoseli.org>
 <2f52ce9a-2083-7e4d-21e1-204e13d3e8e3@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <2f52ce9a-2083-7e4d-21e1-204e13d3e8e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,

On 08/06/2024 04:15, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 07.06.2024 um 17:27 schrieb Jean-Michel Hautbois:
>> Hi Greg !
>>
>> On 06/06/2024 16:33, Greg Ungerer wrote:
>>> Hi Jean-Michel,
>>>
>>> On 3/6/24 20:54, Jean-Michel Hautbois wrote:
>>>> Hi there !
>>>>
>>>> I managed to get really far in my boot process, as I can now try to
>>>> execute bash. I had to change the elf.h file because if I don't do
>>>> that, it is not working.
>>>>
>>>> Here is the diff (on v6.9.1):
>>>> diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
>>>> index 2def06a99b08..38acb928fa81 100644
>>>> --- a/arch/m68k/include/asm/elf.h
>>>> +++ b/arch/m68k/include/asm/elf.h
>>>> @@ -78,8 +78,10 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
>>>>      the loader.  We need to make sure that it is out of the way of
>>>> the program
>>>>      that it will "exec", and that there is sufficient room for the
>>>> brk.  */
>>>>
>>>> -#ifndef CONFIG_SUN3
>>>> +#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
>>>>   #define ELF_ET_DYN_BASE         0xD0000000UL
>>>> +#elif defined(CONFIG_COLDFIRE)
>>>> +#define ELF_ET_DYN_BASE                (TASK_UNMAPPED_BASE +
>>>> 0x10000000)
>>>
>>> Thats interesting. How did you determine this value to use?
>>
>> Let's be honest :-) I used the one found in the NXP kernel I have as a
>> reference (2.6 based). I finally found this is the root cause but I
>> don't know exactly why this value is used.
> 
> What does that kernel use for TASK_SIZE?
> 
> TASK_SIZE, TASK_UNMAPPED_BASE and ELF_ET_DYN_BASE all appear related 
> according to rules that I haven't found spelled out anywhere.

This commit explains how it has been changed on x86 a few years ago [1].
Most of the architectures define ELF_ET_DYN_BASE as 2/3rd of TASK_SIZE.
On the coldfire, TASK_SIZE is 0xC0000000. 2/3rd of it would be 0x80000000.

Still on coldfire, TASK_UNMAPPED_BASE is 0x60000000.

But for now, I can't tell exactly why using 0x70000000 is the chosen 
solution of the old NXP BSP.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9b1bbf6ea9b2b596ba271bec23b93c48181ad896

JM

> Cheers,
> 
>      Michael
> 
> 
>>
>>>
>>>
>>>>   #else
>>>>   #define ELF_ET_DYN_BASE         0x0D800000UL
>>>>   #endif
>>>>
>>>> Without the patch:
>>>> [    3.020000] Freeing unused kernel image (initmem) memory: 96K
>>>> [    3.030000] This architecture does not have kernel memory 
>>>> protection.
>>>> [    3.030000] Run /bin/bash as init process
>>>> [    3.320000] Kernel panic - not syncing: Requested init /bin/bash
>>>> failed (error -12).
>>>> [    3.320000] CPU: 0 PID: 1 Comm: bash Not tainted
>>>> 6.9.2stmark2-001-00013-gcf0217bae3ae #285
>>>> [    3.320000] Stack from 41845f70:
>>>> [    3.320000]         41845f70 413bccd1 413bccd1 00000001 413f2700
>>>> 41008a68 413151f2 413bccd1
>>>> [    3.320000]         4130e630 41845fb0 413f2700 00000003 00000001
>>>> 4130eeda 00000000 00000000
>>>> [    3.320000]         41315a2e 413b303d 4febbf1e fffffff4 4131598e
>>>> 410033f4 00000000 00000000
>>>> [    3.320000]         00000000 00000000 00000000 00000000 00000000
>>>> 00000000 00000000 00000000
>>>> [    3.320000]         00000000 00000000 00002000 00000000
>>>> [    3.320000] Call Trace: arch_local_irq_disable
>>>> (./arch/m68k/include/asm/irqflags.h:20)
>>>> [    3.320000] dump_stack (lib/dump_stack.c:124)
>>>> [    3.320000] panic (kernel/panic.c:267 kernel/panic.c:369)
>>>> [    3.320000] _printk (kernel/printk/printk.c:2368)
>>>> [    3.320000] kernel_init (init/main.c:1500)
>>>> [    3.320000] kernel_init (init/main.c:1436)
>>>> [    3.320000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
>>>> [    3.320000]
>>>> [    3.320000] ---[ end Kernel panic - not syncing: Requested init
>>>> /bin/bash failed (error -12). ]---
>>>>
>>>> With the patch, the /bin/bash file is executed, but then any command
>>>> will fail with a segfault:
>>>>
>>>> [    3.000000] Freeing unused kernel image (initmem) memory: 96K
>>>> [    3.010000] This architecture does not have kernel memory 
>>>> protection.
>>>> [    3.020000] Run /bin/bash as init process
>>>> bash: cannot set terminal process group (-1): Inappropriate ioctl for
>>>> device
>>>> bash: no job control in this shell
>>>> bash-5.2# ls
>>>> bin      home     linuxrc  opt      run      tmp
>>>> dev      lib      media        7.250000] Unable to handle kernel NULL
>>>> pointer dereference at virtual address 00000000
>>>> [    7.250000] Oops: 00000000
>>>> [    7.250000] PC: 0x0
>>>> [    7.250000] SR: 2000  SP: (ptrval)  a2: 41c58000
>>>> [    7.250000] d0: 00000028    d1: 00000003    d2: 6017a000    d3:
>>>> 414d9419
>>>> [    7.250000] d4: 41b5c800    d5: 4fed3730    a0: 00000000    a1:
>>>> 413227a0
>>>> [    7.250000] Process ls (pid: 27, task=(ptrval))
>>>> [    7.250000] Frame format=4 eff addr=41055826 pc=420516cc
>>>> [    7.250000] Stack from 41b85dfc:
>>>> [    7.250000]         4fed3730 41b85f1e 4106e3ac 4fed3730 00000000
>>>> ffffffff fffffffe 41b85ea2
>>>> [    7.250000]         6017e000 00000001 412fbafc 4106dfe4 412fbafc
>>>> 4fed3730 00000001 41b85ea2
>>>> [    7.250000]         41b90600 6017e000 41b90600 41b6c340 6017dfff
>>>> 41b84000 41b6c36c 00000000
>>>> [    7.250000]         00000000 00000000 00000000 41b85f60 4106e5ea
>>>> 41b85f1e 41b5c800 6017a000
>>>> [    7.250000]         6017e000 41b85ea2 41b6c36c 41b85efa 41b85f1e
>>>> 4102a3e8 41b6c344 41b5c4c0
>>>> [    7.250000]         41b6c340 41b50000 00000100 00000003 41073130
>>>> 41b85f1e 41b85efa 41b5c4c0
>>>> [    7.250000] Call Trace: unmap_page_range (mm/memory.c:1482
>>>> mm/memory.c:1563 mm/memory.c:1605 mm/memory.c:1722 mm/memory.c:1751
>>>> mm/memory.c:1772 mm/memory.c:1793)
>>>> [    7.250000] mas_find (lib/maple_tree.c:6061)
>>>> [    7.250000] unmap_page_range (mm/memory.c:1782)
>>>> [    7.250000] mas_find (lib/maple_tree.c:6061)
>>>> [    7.250000] unmap_vmas (mm/memory.c:1839 mm/memory.c:1883)
>>>> [    7.250000] up_read (kernel/locking/rwsem.c:1620)
>>>> [    7.250000] exit_mmap (./include/linux/mmap_lock.h:173
>>>> mm/mmap.c:3268)
>>>> [    7.250000] arch_local_irq_enable
>>>> (./arch/m68k/include/asm/irqflags.h:35)
>>>> [    7.250000] arch_local_irq_disable
>>>> (./arch/m68k/include/asm/irqflags.h:20)
>>>> [    7.250000] __mmput (kernel/fork.c:1348)
>>>> [    7.250000] do_exit (./arch/m68k/include/asm/thread_info.h:46
>>>> kernel/exit.c:570 kernel/exit.c:865)
>>>> [    7.250000] sys_exit_group (kernel/exit.c:1038 kernel/exit.c:1036)
>>>> [    7.250000] do_group_exit (kernel/exit.c:1008)
>>>> [    7.250000] pid_child_should_wake (kernel/exit.c:1503)
>>>> [    7.250000] system_call (arch/m68k/coldfire/entry.S:80)
>>>> [    7.250000]
>>>> [ 7.250000] Code: ffff ffff ffff ffff ffff ffff ffff ffff Bad PC value.
>>>> m68k-buildroot-linux-gnu-objdump: '/tmp/tmp.vO4KvxtnKV.o': No such file
>>>>
>>>> Code starting with the faulting instruction
>>>> ===========================================
>>>> [    7.250000] Disabling lock debugging due to kernel taint
>>>> [    7.250000] note: ls[27] exited with irqs disabled
>>>>
>>>> Is there a compiler to use ? I built one with buildroot, but maybe is
>>>> there a gcc version somewhere to use for the Coldfire 54418 ? Could
>>>> it be related ?
>>>
>>> I would expect you could use any modern version of gcc targeted for
>>> m68k-linux.
>>> For the past few years to generate code for 5475 based platform I use
>>> a gcc-8.3.0
>>> toolchain.
>>>
>>> I have never had any of the 5441x based devices, so I couldn't say for
>>> sure on that.
>>
>> Well I found the root cause here too. But again, I don't know exactly 
>> why:
>> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
>> index 12c9297ed4a7..c2a48592c258 100644
>> --- a/mm/page-writeback.c
>> +++ b/mm/page-writeback.c
>> @@ -2857,7 +2857,9 @@ bool folio_mark_dirty(struct folio *folio)
>>                  */
>>                 if (folio_test_reclaim(folio))
>>                         folio_clear_reclaim(folio);
>> -               return mapping->a_ops->dirty_folio(mapping, folio);
>> +               if (mapping->a_ops->dirty_folio)
>> +                       return mapping->a_ops->dirty_folio(mapping, 
>> folio);
>> +               return noop_dirty_folio(mapping, folio);
>>         }
>>
>>         return noop_dirty_folio(mapping, folio);
>>
>> I intend to propose a few patches as RFC in order to know more and have
>> the correct solution (I suspect this is not the good one :-p).
>>
>> Now, this is working correctly, with the toolchain I built. I have a few
>> issues like in NFC (I had to modify the vf610_nfc driver for it to take
>> the driver_data) or the FEC (this is not buildable for M5441x while it
>> should be AFAIK).
>>
>> I will try to send a few patches shortly.
>>
>> Thanks,
>> JM
