Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6717C56B7C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559468; cv=none; b=G9QGUXgZwkHZSHxswPj5STdqRfau4vAYSxrL5y1RtlPWkR2UoMWhRhioEvH2McFPXUJLdoxFxmmmVWRu/TgWXRObv6cfR/fHObD6J2hOB1p1tDhizswhJNhPI/TKe9pUBYuXgfIxgyjvBaprzVGKoI84hFTHhW65JL+yxzNg89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559468; c=relaxed/simple;
	bh=98FzUt5rjgfXuj0kq0BZGzwYdxPQMB2+CjPnOOGA4cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0p6dQCkNwFInAQplo1m4ihWdel+5kNwZiWKDMlvWlq581aO80EohqlpI/SE8GQUvoFa+iorcpqG6rAVebSdWpu7EmurtT09AEIAYADl+UYHGnPkhpyM5eP4IWCPBwFRPvWKiT7wDI2sEHjH2JsiHyq1pNHgTm0KLY6BpQyHB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=b7FTYbtQ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="b7FTYbtQ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E2E31C0004;
	Fri, 28 Jun 2024 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719559463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbQoS/OcvJlXrl5R2AyCpMc/YyKW0c2dWjj15GxiM8A=;
	b=b7FTYbtQb/lZGAPoCFSkYLDT06YA4dKtIPv9ILZ0saB/FtAA9ka0Xee56Vw85OvOUO8QNA
	otMNSq7lta/n8Z05tRP75SvCxbyYvCEM16PsXk5VzsWIy830iGMGdKzKQ1hUVWabV+fPF1
	08nKct7UdGNO7eGUG4uFfBB/976J2Z9UNCI/TBlarEv3aahmU2wQQ/U6cpLgpqza9B9Mog
	Ruq8QpsMJTo6CKafr99P7nMqrlnQICUqIMjuenStZS2I2SU6cL0UOtkWW/b/4RJ3QkP01u
	b0M3mlJtBVAc2Didjjp2yzxCA17FxdLRM2zuOOD2l1TUBHaONimcbSzyEPwgSA==
Message-ID: <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
Date: Fri, 28 Jun 2024 09:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,

On 28/06/2024 01:58, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 28.06.2024 um 00:36 schrieb Jean-Michel Hautbois:
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
>>         return ret == -ENOENT ? 0 : ret;
>>  }
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
>>  static int load_elf_binary(struct linux_binprm *bprm)
>>  {
>>         struct file *interpreter = NULL; /* to shut gcc up */
>> @@ -1299,6 +1356,9 @@ static int load_elf_binary(struct linux_binprm 
>> *bprm)
>>
>>         finalize_exec(bprm);
>>         START_THREAD(elf_ex, regs, elf_entry, bprm->p);
>> +       if (current->pid == 1) {  // Check if this is the init process
>> +            dump_memory_map(current);
>> +    }
>>         retval = 0;
>>  out:
>>         return retval;
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
> 
> You are again using bash as init process, so the process of interest 
> (/bin/ls) is a child of init and does not get logged here.
> 
> But we are getting some mapping information at last. No shared libraries 
> mapped as yet, but that's the same in Greg's dump.
> 
> Comparing with what I get from cat /proc/1/maps on a 030 system., the 
> rwxp section at 0x700b4000 is the process heap, and the rwp section at 
> 0xbfe7a000 is the process stack.
> 
> I forgot to take into account that libraries are loaded only the binary 
> starts executing. Can you print the same map dump in the exit syscall 
> code path? That ought to show all loaded libraries at that point.

Thanks for your suggestion !
I changed it a bit, and I added a call in do_exit() as suggested. When
executing ls I get:

bash-5.2# ls -l
load_elf_binary: Dump memory for ls (31):
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]

do_exit: Dump memory for ls (31):
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
mmap: 60030000-60032000 rw-p 60030000 00:00 0
mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
mmap: 60160000-6016e000 rw-p 60160000 00:00 0
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
mmap: 700ca000-700ec000 rwxp 700ca000 00:00 0 [heap]
mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]

When I call it a second time, I get:

bash-5.2# ls -l
load_elf_binary: Dump memory for ls (33):
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
do_exit: Dump memory for ls (33):
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
mmap: 60030000-60032000 rw-p 60030000 00:00 0
mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
mmap: 60160000-6016e000 rw-p 60160000 00:00 0
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]

The first call generates the "ls" output, not the second one.
The helper looks like:
diff --git a/mm/mmap.c b/mm/mmap.c
index 83b4682ec85c..14d861e9cba2 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -76,6 +76,87 @@ int mmap_rnd_compat_bits __read_mostly = 
CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
  static bool ignore_rlimit_data;
  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);

+int dump_memory_map(struct task_struct *task)
+{
+    struct mm_struct *mm = task->mm;
+    struct vm_area_struct *vma;
+    struct file *file;
+    struct path *path;
+    char *buf;
+    char *pathname;
+
+       if (!mm) {
+               return -ENOMEM;
+       }
+
+       MA_STATE(mas, &mm->mm_mt, 0, -1);
+    // Acquire the read lock for mmap_lock
+    down_read(&mm->mmap_lock);
+       mas_lock(&mas);
+       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas, 
ULONG_MAX)) {
+               char perms[5] = "---p"; // Default permissions
+               // Set permissions based on vm_flags
+               if (vma->vm_flags & VM_READ) perms[0] = 'r';
+               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
+               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
+               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
+
+               if (vma->vm_file) { // If there's an associated file
+                       buf = (char *)__get_free_page(GFP_KERNEL);
+                       if (!buf) {
+                               continue; // Handle memory allocation 
failure
+                       }
+
+                       file = vma->vm_file;
+                       path = &file->f_path;
+                       pathname = d_path(path, buf, PAGE_SIZE);
+                       if (IS_ERR(pathname)) {
+                               pathname = NULL;
+                       }
+
+                       // Print memory area information with file path
+                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu %s\n",
+                               vma->vm_start, vma->vm_end,
+                               perms,
+                               vma->vm_pgoff << PAGE_SHIFT,
+                               MAJOR(file_inode(file)->i_rdev),
+                               MINOR(file_inode(file)->i_rdev),
+                               file_inode(file)->i_ino,
+                               pathname ? pathname : "");
+
+                       free_page((unsigned long)buf);
+               } else {
+                       char *special_area_name = NULL;
+
+                       // Check for heap
+                       if (vma->vm_end > mm->start_brk && vma->vm_start 
< mm->brk) {
+                               special_area_name = "[heap]";
+                       }
+                       // Check for stack
+                       else if (vma->vm_start <= mm->start_stack && 
vma->vm_end >= mm->start_stack) {
+                               special_area_name = "[stack]";
+                       }
+                       // Check for vdso
+                       else if (vma->vm_flags & VM_EXEC && 
vma->vm_flags & VM_READ && !vma->vm_file) {
+                               special_area_name = "[vdso]";
+                       }
+
+                       // Print memory area information without file path
+                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
+                               vma->vm_start, vma->vm_end,
+                               perms,
+                               vma->vm_pgoff << PAGE_SHIFT,
+                               special_area_name ? special_area_name : 
"    ");
+               }
+       }
+       mas_unlock(&mas);
+    // Release the read lock for mmap_lock
+    up_read(&mm->mmap_lock);
+
+    return 0;
+}
+EXPORT_SYMBOL(dump_memory_map);


Thanks,
JM
