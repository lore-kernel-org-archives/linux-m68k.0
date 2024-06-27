Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D751D69E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jun 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499987; cv=none; b=fj2Fy+I/cFy6h7IkdcMwgOF1sgP8zVIvh/vUF+Zqx2zoZ+8AuHez2qcmEZC/VcjkUhMFVhwMsdeY2f6geiXvqnxmp3RaAxdqPBEnAUCAeT1NGun0kz4Ao15mzyzrhjnmS3sOn/GqemtdyHx7gczvLMEw1p33XDtk/wGZiyB1XD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499987; c=relaxed/simple;
	bh=yCSzu9Y83g7g7wytgjRPU60W0ERKO7HiO9pbsW7MPIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNHFxbGoOFI0U7OrF/JAjwDt4xWILkTqLMRVscVFiIaPq+s35UMOKav5+Fg1/yozvmuLI3bo967lRqTQWonHA3/HgsfSzMgvKV9FDiFbtijTF815Cy2PSHsGRXlJlTkNRAwt2KhEYogtQqqePOaJYOuehrkVJ5/aCGYLPrrGBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=M9BU1fLF; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="M9BU1fLF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD249FF807;
	Thu, 27 Jun 2024 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719499976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0DSdjI1S1iryY/Wf73bAF9dlHD7agT6/iiv8Mic/1k=;
	b=M9BU1fLF6BFGdO3waxVPDRLkMyCnaWlWgqxLYpzT0VQjFVqA16cbnqrYwS1zaufMI6Pzh9
	wEMQCq7m4MNUCyOAP8czALAb9kJfMm8gWRxo/XZS/OLlZTNZ6hOIhzC9H/gZHcnzy1nsxr
	fTLukIYVVTVo9KVyPRuL0c/LthPtc5qiNftF6gbe1ua2Ds4P/kwv13GwNhZbtaW1pYyY7W
	RkR7BNAHJhlLglc4ytLyUeGB6QOqlv7oo0XkuWhRGfY31l0/OUpzRiPXjQwp9qCprMktj8
	FrxZTdBClH7x/NUM7qJopBxX0K4Ogf/xYAqfaE5lE4HknO/fO+bBsCyfvpuHpg==
Message-ID: <b8ec3913-f524-40da-bc85-f9ad1a659aa8@yoseli.org>
Date: Thu, 27 Jun 2024 16:52:55 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Greg Ungerer <gerg@linux-m68k.org>, Michael Schmitz
 <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <ebfb2bb7-8bb8-4fe0-8780-dc9343fbf477@linux-m68k.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <ebfb2bb7-8bb8-4fe0-8780-dc9343fbf477@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Greg,

On 27/06/2024 16:46, Greg Ungerer wrote:
> Hi JM,
> 
> On 27/6/24 22:36, Jean-Michel Hautbois wrote:
>> Michael,
>>
>> On 26/06/2024 21:36, Michael Schmitz wrote:
>>> Jean-Michel,
>>>
>>> On 27/06/24 01:28, Jean-Michel Hautbois wrote:
>>>> Hi Michael,
>>>>
>>>> On 26/06/2024 03:56, Michael Schmitz wrote:
>>>>> Jean-Michel,
>>>>>
>>>>> On 24/06/24 20:56, Jean-Michel Hautbois wrote:
>>>>>>
>>>>>> When I printk the do_page_fault first debug, I get for the first 
>>>>>> call to ls:
>>>>>> bash-5.2# ls
>>>>>> [   14.700000] do page fault:
>>>>>> [   14.700000] regs->sr=0x0, regs->pc=0x70069ee6, 
>>>>>> address=0x70069ee6, 0, (ptrval)
>>>>>
>>>>> Page not present, read fault. Please disable obfuscation of kernel 
>>>>> pointer addresses by printk. Maybe also disable address space 
>>>>> randomization while debugging this.
>>>>>
>>>>>> This call works almost fine (I still have the assert failed: 
>>>>>> folio->private != NULL issue).
>>>>>>
>>>>>> And when I call it a second time, I get:
>>>>>> bash-5.2# ls
>>>>>> [   19.820000] do page fault:
>>>>>> [   19.820000] regs->sr=0x0, regs->pc=0x6011d65a, 
>>>>>> address=0x700e2004, 2, (ptrval)
>>>>>
>>>>> Page not present, write fault.
>>>>>
>>>>> It would be helpful if you could get a dump of /proc/1/maps before 
>>>>> the execve() syscall in your helloworld init replacement. That 
>>>>> might confirm all these addresses are legit (assuming mappings 
>>>>> survive across execve(), that is), and what they correspond to.
>>>>>
>>>>>>
>>>>>> The address corresponds to the defined zone ELF_ET_DYN_BASE as I 
>>>>>> set it to 0x70000000.
>>>>>>
>>>>>> regs->pc is not the same as the address. It might be unrelevant, 
>>>>>> but any help is appreciated to understand the process behind :-).
>>>>>>
>>>>>> I keep digging, and I am in the asm part which fears me a bit !
>>>>>
>>>>> I don't see that you'd need to look at any asm code here.
>>>>
>>>> I add a small test in do_page_fault, and in case of an error, it 
>>>> panics. The result follows:
>>>
>>> Please take a look at the comments at the start of 
>>> arch/m68k/mm/fault.c:do_page_fault(). The meaning of the bits in 
>>> error_code are explained there.
>>>
>>> error_code != 0 is just one possible case out of the four that are 
>>> handled by do_page_fault(). It does not signify 'no error' - if there 
>>> hadn't been a page fault, do_page_fault() would not have been called.
>>>
>>> You just forced a panic each time a write fault and/or a protection 
>>> fault happens. Write faults are absolutely expected to happen when 
>>> loading a library - ld.so needs to perform relocation after loading a 
>>> dynamic library, and that means writes to the GOT in the library's 
>>> data segment (PIC assumed).
>>>
>>>
>>>>  ./scripts/decode_stacktrace.sh vmlinux < /tmp/trace.log
>>>> [    3.857000] Run /bin/bash as init process
>>>> [    3.858000]   with arguments:
>>>> [    3.861000]     /bin/bash
>>>> [    3.862000]   with environment:
>>>> [    3.863000]     HOME=/
>>>> [    3.864000]     TERM=linux
>>>> [    4.242000] do page fault:
>>>> [    4.242000] regs->sr=0x2000, regs->pc=0x41366924, 
>>>> address=0x700b3364, 2, 41fb0000
>>>> [    4.242000] Kernel panic - not syncing: page fault error
>>>> [    4.242000] CPU: 0 PID: 1 Comm: bash Not tainted 
>>>> 6.10.0-rc5-g927da6cf01fe-dirty #25
>>>> [    4.242000] Stack from 4186dda8:
>>>> [    4.242000]         4186dda8 41423aa4 41423aa4 700b3300 00000001 
>>>> 00000000 4136ee10 41423aa4
>>>> [    4.242000]         41366d7a 700b3364 700b3364 00000000 0000000d 
>>>> 4186de60 41fb0000 41d51a60
>>>> [    4.242000]         41005696 41416a90 41416a4d 00002000 41366924 
>>>> 700b3364 00000002 41fb0000
>>>> [    4.242000]         0000000a 700b3364 00000000 0000000d 00000012 
>>>> 41d51a00 4186de60 41d51a60
>>>> [    4.242000]         41fb81c0 41d51a60 410052fe 4100529a 4186de60 
>>>> 700b3364 00000002 00000000
>>>> [    4.242000]         700bc414 00000003 00008000 700ac000 41003660 
>>>> 4186de60 00000000 00000000
>>>> [    4.242000] Call Trace: dump_stack (lib/dump_stack.c:124)
>>>> [    4.242000] panic (kernel/panic.c:266 kernel/panic.c:368)
>>>> [    4.242000] do_page_fault (arch/m68k/mm/fault.c:88 (discriminator 
>>>> 1))
>>>> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
>>>> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:725 
>>>> arch/m68k/kernel/traps.c:775)
>>>> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:748 
>>>> arch/m68k/kernel/traps.c:775)
>>>> [    4.242000] buserr (arch/m68k/kernel/entry.S:116)
>>>> [    4.242000] ma_slots (lib/maple_tree.c:759)
>>>> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
>>>> [    4.242000] elf_load (fs/binfmt_elf.c:125 (discriminator 1) 
>>>> fs/binfmt_elf.c:421 (discriminator 1))
>>>> [    4.242000] load_elf_binary (fs/binfmt_elf.c:1132)
>>>> [    4.242000] memset (arch/m68k/lib/memset.c:11)
>>>> [    4.242000] load_misc_binary (fs/binfmt_misc.c:97 
>>>> fs/binfmt_misc.c:146 fs/binfmt_misc.c:213)
>>>> [    4.242000] memset (arch/m68k/lib/memset.c:11)
>>>> [    4.242000] bprm_execve (fs/exec.c:1797 fs/exec.c:1839 
>>>> fs/exec.c:1891 fs/exec.c:1867)
>>>> [    4.242000] copy_strings_kernel (fs/exec.c:669)
>>>> [    4.242000] count_strings_kernel (fs/exec.c:473)
>>>> [    4.242000] kernel_execve (fs/exec.c:2058)
>>>> [    4.242000] __dynamic_pr_debug (lib/dynamic_debug.c:865)
>>>> [    4.242000] run_init_process (init/main.c:1389)
>>>> [    4.242000] _printk (kernel/printk/printk.c:2365)
>>>> [    4.242000] kernel_init (init/main.c:1508)
>>>> [    4.242000] kernel_init (init/main.c:1459)
>>>> [    4.242000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
>>>> [    4.242000]
>>>> [    4.242000] ---[ end Kernel panic - not syncing: page fault error 
>>>> ]---
>>>>
>>>> Looks like a memory mapping failure, but why ?
>>>> My JTAG at this point dumps a list of 0s at 0x41fb0000 and my SDRAM 
>>>> starts at 0x40000000 and ends at 0x50000000 (256MB).
>>> 0x41fb0000 seems to be init's page directory. The fault address is in 
>>> the range where I'd expect dynamic libraries to reside.
>>>>
>>>> It looks like a TLB write miss which is obscure to me :-).
>>>>
>>>> I tried to use the /proc but as expected it is not alive after 
>>>> mounting it.
>>>
>>> The memory map ought to be accessible through sysrq - an alternative 
>>> would be to modify the ELF binfmt handler and dump the map once ld.so 
>>> has finished with relocations.
>>
>> I added a dump in the binfmt_elf file:
>> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
>> index a43897b03ce9..395f556f3a90 100644
>> --- a/fs/binfmt_elf.c
>> +++ b/fs/binfmt_elf.c
>> @@ -816,6 +816,63 @@ static int parse_elf_properties(struct file *f, 
>> const struct elf_phdr *phdr,
>>          return ret == -ENOENT ? 0 : ret;
>>   }
>>
>> +static int dump_memory_map(struct task_struct *task)
>> +{
>> +    struct mm_struct *mm = task->mm;
>> +    struct vm_area_struct *vma;
>> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
>> +    struct file *file;
>> +    struct path *path;
>> +    char *buf;
>> +    char *pathname;
>> +
>> +    // Acquire the read lock for mmap_lock
>> +    down_read(&mm->mmap_lock);
>> +       mas_lock(&mas);
>> +    for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas, 
>> ULONG_MAX)) {
>> +        if (vma->vm_file) {
>> +            buf = (char *)__get_free_page(GFP_KERNEL);
>> +            if (!buf) {
>> +                continue; // Handle memory allocation failure
>> +            }
>> +
>> +            file = vma->vm_file;
>> +            path = &file->f_path;
>> +            pathname = d_path(path, buf, PAGE_SIZE);
>> +            if (IS_ERR(pathname)) {
>> +                pathname = NULL;
>> +            }
>> +
>> +            pr_info("%lx-%lx %c%c%c%c %08lx %02x:%02x %lu %s\n",
>> +                vma->vm_start, vma->vm_end,
>> +                vma->vm_flags & VM_READ ? 'r' : '-',
>> +                vma->vm_flags & VM_WRITE ? 'w' : '-',
>> +                vma->vm_flags & VM_EXEC ? 'x' : '-',
>> +                vma->vm_flags & VM_MAYSHARE ? 's' : 'p',
>> +                vma->vm_pgoff << PAGE_SHIFT,
>> +                MAJOR(file->f_inode->i_rdev),
>> +                MINOR(file->f_inode->i_rdev),
>> +                file->f_inode->i_ino,
>> +                pathname ? pathname : "");
>> +
>> +            free_page((unsigned long)buf);
>> +        } else {
>> +            pr_info("%lx-%lx %c%c%c%c %08lx 00:00 0\n",
>> +                vma->vm_start, vma->vm_end,
>> +                vma->vm_flags & VM_READ ? 'r' : '-',
>> +                vma->vm_flags & VM_WRITE ? 'w' : '-',
>> +                vma->vm_flags & VM_EXEC ? 'x' : '-',
>> +                vma->vm_flags & VM_MAYSHARE ? 's' : 'p',
>> +                vma->vm_pgoff << PAGE_SHIFT);
>> +        }
>> +    }
>> +       mas_unlock(&mas);
>> +    // Release the read lock for mmap_lock
>> +    up_read(&mm->mmap_lock);
>> +
>> +    return 0;
>> +}
>> +
>>   static int load_elf_binary(struct linux_binprm *bprm)
>>   {
>>          struct file *interpreter = NULL; /* to shut gcc up */
>> @@ -1299,6 +1356,9 @@ static int load_elf_binary(struct linux_binprm 
>> *bprm)
>>
>>          finalize_exec(bprm);
>>          START_THREAD(elf_ex, regs, elf_entry, bprm->p);
>> +       if (current->pid == 1) {  // Check if this is the init process
>> +            dump_memory_map(current);
>> +    }
>>          retval = 0;
>>   out:
>>          return retval;
>>
>> I think it is quick and dirty, but seems to do the trick.
>> I then get in my console:
>> [    4.265000] 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> [    4.266000] 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>> [    4.267000] 70000000-700ac000 r-xp 00000000 00:00 27 /bin/bash
>> [    4.268000] 700ac000-700b4000 rw-p 000ac000 00:00 27 /bin/bash
>> [    4.269000] 700b4000-700be000 rwxp 700b4000 00:00 0
>> [    4.270000] bfe7a000-bfe9c000 rw-p bffde000 00:00 0
>>
>> But nothing rings a bell at this level for me...
>> Thanks !
> 
> Here is the same dump trace generated on my newly resurrected M5475EVB 
> for comparison:
> 
> [snip]
> Freeing unused kernel image (initmem) memory: 80K
> This architecture does not have kernel memory protection.
> Run /sbin/init as init process
> Run /etc/init as init process
> Run /bin/init as init process
> process '/bin/init' started with executable stack

I don't have this message, I suppose it is related to uClibc vs libc ?

> 60000000-60008000 r-xp 00000000 00:00 550544 /lib/ld-uClibc-0.9.33.2.so
> 60008000-6000c000 rw-p 00006000 00:00 550544 /lib/ld-uClibc-0.9.33.2.so
> 80000000-80004000 r-xp 00000000 00:00 1882624 /bin/init
> 80004000-80008000 rw-p 00002000 00:00 1882624 /bin/init

You init is at 0x8000000 and not 0x7000000... Interesting. Even if I 
don't think it has a big impact...

> bfc9a000-bfcbc000 rwxp bffde000 00:00 0
> Welcome to
> ...
> 
> Execution otherwise continues as normal to a shell after this.
> 
> Regards
> Greg
> 
> 
