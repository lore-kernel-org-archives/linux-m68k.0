Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B7647
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Jun 2024 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717812930; cv=none; b=ihBSv1Bbzgm1tDJMQuGmYEf9O+Y3/GApWfuhr/0RCgxY3sspO1w7NFXL/z9itK3fi2yA7Dby5of+U9VJylyTZrPev9fqo9et/EKvuXYygcEXCO9f8CmDR+yz/51jZRmwjdVdl8uRsVLMZQjmLGAvcxLrA1oRLc0s21y3fnbx6LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717812930; c=relaxed/simple;
	bh=LWXx82KKAFVSTj8YVNwafI1wbEvH+zCqrvdP/l1TjEg=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bMp8a0tyPeuAvC4rwpXBiBdm7LFvAk6RxPRCP3E+lFkOpHIlxuX93Ze7vmxf+Jux9FyMyxppDCz+46P85AAfDPPeaAtCZ8hS2zb8CaHuZ/ouC5mz89w5uGGb+lSyq2XzmWqw+8bl+8GLW6HaUb25e8z1s4fMb2u6OrDGxVAHXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPR7PNC3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPR7PNC3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f6da06ba24so10146855ad.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Jun 2024 19:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717812928; x=1718417728; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB3v+WVwsW//ctUJePDHSrK3br+jFc2EGz7RfMYRX1M=;
        b=SPR7PNC3q2aOB8J1Jv0oWADxbDCOs7cqXMbQTTvip66Rt0UVJV+t7GWfjDp8S7NZYn
         zbYp92RUMgLUGyh7YsmxHyhicfbEBAa14WC4j1Ne/XFlRI0b6pM6AHAlEDnJTPXcWoFj
         xfz/D8GMrtnxMX96ZoekkmAH+mfg/C37XwRquwFg1+CXw+fqRPzcP9FjHJsp2xNT9h+H
         MEgcIiWGfM2K8jMWDRr41uBRvHgcKQKZifBa7pCmeyQk64pKaYtqLLFUBd4uek3+Nzl7
         CMdyZqzETVNQdJ5eIg83OPRHbXks6y5NHOqA2FubAKWOHBvMXwjkNxPwNdPv9oH20c6E
         hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717812928; x=1718417728;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eB3v+WVwsW//ctUJePDHSrK3br+jFc2EGz7RfMYRX1M=;
        b=MJt6NIhM6mOcq5jHqEnYoFczGQxgT8mJp2LenfCrGCjR7XbALcs0NpIVWqRluc9n91
         XjNUR+cVMrLhiupVdEG27tSeQQPN0aNd0tOFIOjBGf1GGDeIyVkIfoRXYk14QWSsh48e
         ceAZmclFNYT7JgkB9kBDEOoZmywXNFkCSeiFAUkTos09egAQX7eYXfVwmyHq+idvKh+E
         p67dTzMMoQGCL3cZvXsIcrgz7gQ/Zmv8gFCMz7LqajbJKWr+2o3+5kyRCX96eGssPSJR
         NozrAfezKpJJw+OhCuPrjS21DApyRS6ae5smjsJwCVPLLLRA+NgztnulzxMpNLpb58Mf
         6IeA==
X-Forwarded-Encrypted: i=1; AJvYcCVtfrBmGvW8/D/DuO1ABHLA0yib+DS9gXJ3wIbFGakiG6EV0ddXsie/915unkp8SZKS8WdfCSNp1+/ETlqAJfbQ72vYFgcXs4f0+stqUD0v
X-Gm-Message-State: AOJu0YzgyOufIE0QLEsUsEoGuRAMoJeL4o8HAmoVs137ewwchPAJ5xWy
	QopG4FG19AaxzWozMYAYXTXqCPJN5DzQ83SiVzhyPyIMEUn89ZSs
X-Google-Smtp-Source: AGHT+IG3h4Jogf2ph4yczUdg0clFPxYD6Vwq0O1UzSB6WqhSmcYu0x0UzycN34oTYTqZQmteWvlBcg==
X-Received: by 2002:a17:902:ce8f:b0:1f6:3720:ce56 with SMTP id d9443c01a7336-1f6d02e0cb5mr51705725ad.27.1717812928145;
        Fri, 07 Jun 2024 19:15:28 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd819673sm41219575ad.297.2024.06.07.19.15.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2024 19:15:27 -0700 (PDT)
Subject: Re: m54418: ELF execution issues
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Greg Ungerer <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
 <82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
 <85e2ecc5-d334-4c83-8209-19e0c1c71812@kernel.org>
 <49a0c20c-586a-4762-b80a-ddc59cc511ed@yoseli.org>
Cc: geert@linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2f52ce9a-2083-7e4d-21e1-204e13d3e8e3@gmail.com>
Date: Sat, 8 Jun 2024 14:15:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <49a0c20c-586a-4762-b80a-ddc59cc511ed@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jean-Michel,

Am 07.06.2024 um 17:27 schrieb Jean-Michel Hautbois:
> Hi Greg !
>
> On 06/06/2024 16:33, Greg Ungerer wrote:
>> Hi Jean-Michel,
>>
>> On 3/6/24 20:54, Jean-Michel Hautbois wrote:
>>> Hi there !
>>>
>>> I managed to get really far in my boot process, as I can now try to
>>> execute bash. I had to change the elf.h file because if I don't do
>>> that, it is not working.
>>>
>>> Here is the diff (on v6.9.1):
>>> diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
>>> index 2def06a99b08..38acb928fa81 100644
>>> --- a/arch/m68k/include/asm/elf.h
>>> +++ b/arch/m68k/include/asm/elf.h
>>> @@ -78,8 +78,10 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
>>>      the loader.  We need to make sure that it is out of the way of
>>> the program
>>>      that it will "exec", and that there is sufficient room for the
>>> brk.  */
>>>
>>> -#ifndef CONFIG_SUN3
>>> +#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
>>>   #define ELF_ET_DYN_BASE         0xD0000000UL
>>> +#elif defined(CONFIG_COLDFIRE)
>>> +#define ELF_ET_DYN_BASE                (TASK_UNMAPPED_BASE +
>>> 0x10000000)
>>
>> Thats interesting. How did you determine this value to use?
>
> Let's be honest :-) I used the one found in the NXP kernel I have as a
> reference (2.6 based). I finally found this is the root cause but I
> don't know exactly why this value is used.

What does that kernel use for TASK_SIZE?

TASK_SIZE, TASK_UNMAPPED_BASE and ELF_ET_DYN_BASE all appear related 
according to rules that I haven't found spelled out anywhere.

Cheers,

	Michael


>
>>
>>
>>>   #else
>>>   #define ELF_ET_DYN_BASE         0x0D800000UL
>>>   #endif
>>>
>>> Without the patch:
>>> [    3.020000] Freeing unused kernel image (initmem) memory: 96K
>>> [    3.030000] This architecture does not have kernel memory protection.
>>> [    3.030000] Run /bin/bash as init process
>>> [    3.320000] Kernel panic - not syncing: Requested init /bin/bash
>>> failed (error -12).
>>> [    3.320000] CPU: 0 PID: 1 Comm: bash Not tainted
>>> 6.9.2stmark2-001-00013-gcf0217bae3ae #285
>>> [    3.320000] Stack from 41845f70:
>>> [    3.320000]         41845f70 413bccd1 413bccd1 00000001 413f2700
>>> 41008a68 413151f2 413bccd1
>>> [    3.320000]         4130e630 41845fb0 413f2700 00000003 00000001
>>> 4130eeda 00000000 00000000
>>> [    3.320000]         41315a2e 413b303d 4febbf1e fffffff4 4131598e
>>> 410033f4 00000000 00000000
>>> [    3.320000]         00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [    3.320000]         00000000 00000000 00002000 00000000
>>> [    3.320000] Call Trace: arch_local_irq_disable
>>> (./arch/m68k/include/asm/irqflags.h:20)
>>> [    3.320000] dump_stack (lib/dump_stack.c:124)
>>> [    3.320000] panic (kernel/panic.c:267 kernel/panic.c:369)
>>> [    3.320000] _printk (kernel/printk/printk.c:2368)
>>> [    3.320000] kernel_init (init/main.c:1500)
>>> [    3.320000] kernel_init (init/main.c:1436)
>>> [    3.320000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
>>> [    3.320000]
>>> [    3.320000] ---[ end Kernel panic - not syncing: Requested init
>>> /bin/bash failed (error -12). ]---
>>>
>>> With the patch, the /bin/bash file is executed, but then any command
>>> will fail with a segfault:
>>>
>>> [    3.000000] Freeing unused kernel image (initmem) memory: 96K
>>> [    3.010000] This architecture does not have kernel memory protection.
>>> [    3.020000] Run /bin/bash as init process
>>> bash: cannot set terminal process group (-1): Inappropriate ioctl for
>>> device
>>> bash: no job control in this shell
>>> bash-5.2# ls
>>> bin      home     linuxrc  opt      run      tmp
>>> dev      lib      media        7.250000] Unable to handle kernel NULL
>>> pointer dereference at virtual address 00000000
>>> [    7.250000] Oops: 00000000
>>> [    7.250000] PC: 0x0
>>> [    7.250000] SR: 2000  SP: (ptrval)  a2: 41c58000
>>> [    7.250000] d0: 00000028    d1: 00000003    d2: 6017a000    d3:
>>> 414d9419
>>> [    7.250000] d4: 41b5c800    d5: 4fed3730    a0: 00000000    a1:
>>> 413227a0
>>> [    7.250000] Process ls (pid: 27, task=(ptrval))
>>> [    7.250000] Frame format=4 eff addr=41055826 pc=420516cc
>>> [    7.250000] Stack from 41b85dfc:
>>> [    7.250000]         4fed3730 41b85f1e 4106e3ac 4fed3730 00000000
>>> ffffffff fffffffe 41b85ea2
>>> [    7.250000]         6017e000 00000001 412fbafc 4106dfe4 412fbafc
>>> 4fed3730 00000001 41b85ea2
>>> [    7.250000]         41b90600 6017e000 41b90600 41b6c340 6017dfff
>>> 41b84000 41b6c36c 00000000
>>> [    7.250000]         00000000 00000000 00000000 41b85f60 4106e5ea
>>> 41b85f1e 41b5c800 6017a000
>>> [    7.250000]         6017e000 41b85ea2 41b6c36c 41b85efa 41b85f1e
>>> 4102a3e8 41b6c344 41b5c4c0
>>> [    7.250000]         41b6c340 41b50000 00000100 00000003 41073130
>>> 41b85f1e 41b85efa 41b5c4c0
>>> [    7.250000] Call Trace: unmap_page_range (mm/memory.c:1482
>>> mm/memory.c:1563 mm/memory.c:1605 mm/memory.c:1722 mm/memory.c:1751
>>> mm/memory.c:1772 mm/memory.c:1793)
>>> [    7.250000] mas_find (lib/maple_tree.c:6061)
>>> [    7.250000] unmap_page_range (mm/memory.c:1782)
>>> [    7.250000] mas_find (lib/maple_tree.c:6061)
>>> [    7.250000] unmap_vmas (mm/memory.c:1839 mm/memory.c:1883)
>>> [    7.250000] up_read (kernel/locking/rwsem.c:1620)
>>> [    7.250000] exit_mmap (./include/linux/mmap_lock.h:173
>>> mm/mmap.c:3268)
>>> [    7.250000] arch_local_irq_enable
>>> (./arch/m68k/include/asm/irqflags.h:35)
>>> [    7.250000] arch_local_irq_disable
>>> (./arch/m68k/include/asm/irqflags.h:20)
>>> [    7.250000] __mmput (kernel/fork.c:1348)
>>> [    7.250000] do_exit (./arch/m68k/include/asm/thread_info.h:46
>>> kernel/exit.c:570 kernel/exit.c:865)
>>> [    7.250000] sys_exit_group (kernel/exit.c:1038 kernel/exit.c:1036)
>>> [    7.250000] do_group_exit (kernel/exit.c:1008)
>>> [    7.250000] pid_child_should_wake (kernel/exit.c:1503)
>>> [    7.250000] system_call (arch/m68k/coldfire/entry.S:80)
>>> [    7.250000]
>>> [ 7.250000] Code: ffff ffff ffff ffff ffff ffff ffff ffff Bad PC value.
>>> m68k-buildroot-linux-gnu-objdump: '/tmp/tmp.vO4KvxtnKV.o': No such file
>>>
>>> Code starting with the faulting instruction
>>> ===========================================
>>> [    7.250000] Disabling lock debugging due to kernel taint
>>> [    7.250000] note: ls[27] exited with irqs disabled
>>>
>>> Is there a compiler to use ? I built one with buildroot, but maybe is
>>> there a gcc version somewhere to use for the Coldfire 54418 ? Could
>>> it be related ?
>>
>> I would expect you could use any modern version of gcc targeted for
>> m68k-linux.
>> For the past few years to generate code for 5475 based platform I use
>> a gcc-8.3.0
>> toolchain.
>>
>> I have never had any of the 5441x based devices, so I couldn't say for
>> sure on that.
>
> Well I found the root cause here too. But again, I don't know exactly why:
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 12c9297ed4a7..c2a48592c258 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2857,7 +2857,9 @@ bool folio_mark_dirty(struct folio *folio)
>                  */
>                 if (folio_test_reclaim(folio))
>                         folio_clear_reclaim(folio);
> -               return mapping->a_ops->dirty_folio(mapping, folio);
> +               if (mapping->a_ops->dirty_folio)
> +                       return mapping->a_ops->dirty_folio(mapping, folio);
> +               return noop_dirty_folio(mapping, folio);
>         }
>
>         return noop_dirty_folio(mapping, folio);
>
> I intend to propose a few patches as RFC in order to know more and have
> the correct solution (I suspect this is not the good one :-p).
>
> Now, this is working correctly, with the toolchain I built. I have a few
> issues like in NFC (I had to modify the vf610_nfc driver for it to take
> the driver_data) or the FEC (this is not buildable for M5441x while it
> should be AFAIK).
>
> I will try to send a few patches shortly.
>
> Thanks,
> JM
