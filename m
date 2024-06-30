Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27ED768FD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Jun 2024 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719786924; cv=none; b=M8p9Lq8QdAqNY+rfb+FrdGiTz1jTJQHGyfergVnBRTmG11XsMuagkQhja2y9C/HVm4YWzgNsK7e3BNVWC7qBSQ8K132TTDAtBNVend8IJPp/A0ZSW7Vhv5jxQpV/qjzcMXcKqxaS/eCIJmGogePRgsDRZ/6Y++98HASAOS3clWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719786924; c=relaxed/simple;
	bh=lh0mr1LQ+lY6Qqs7l8AfsU0MXhy/ZgytLvh0ypOBAU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBbMK9W7CpEfxtud6mmq/6JtML7SfGQH2YiymWybVCfvxBto3NJNP8tVs5BJHeDSv8RUpdIToliyYxTnLyM5s/u1yCLM+ZyE861hkKTZZuogjwNVqRzMB71GAYJmyJUDR6f2FHyJ3DphzIuiN1tpPE4C7/7fVvD6/71KoIrr9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3C3160DCA;
	Sun, 30 Jun 2024 22:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC240C2BD10;
	Sun, 30 Jun 2024 22:35:18 +0000 (UTC)
Message-ID: <b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org>
Date: Mon, 1 Jul 2024 08:35:16 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Michael Schmitz <schmitzmic@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael,

On 28/6/24 17:48, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 28.06.2024 um 19:24 schrieb Jean-Michel Hautbois:
>>> I forgot to take into account that libraries are loaded only the
>>> binary starts executing. Can you print the same map dump in the exit
>>> syscall code path? That ought to show all loaded libraries at that point.
>>
>> Thanks for your suggestion !
>> I changed it a bit, and I added a call in do_exit() as suggested. When
>> executing ls I get:
>>
>> bash-5.2# ls -l
>> load_elf_binary: Dump memory for ls (31):
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>>
>> do_exit: Dump memory for ls (31):
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
>> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
>> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
>> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
>> mmap: 60030000-60032000 rw-p 60030000 00:00 0
>> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
>> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
>> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
>> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
>> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
>> mmap: 700ca000-700ec000 rwxp 700ca000 00:00 0 [heap]
>> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>>
>> When I call it a second time, I get:
>>
>> bash-5.2# ls -l
>> load_elf_binary: Dump memory for ls (33):
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>> do_exit: Dump memory for ls (33):
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
>> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
>> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
>> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
>> mmap: 60030000-60032000 rw-p 60030000 00:00 0
>> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
>> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
>> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
>> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
>> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
> 
> No heap in this second call. Can you print mm->start_brk and mm->brk please?
> 
> The process memory layout is a little unusual (I would have expected the binary to be mapped before the dynamic libraries, not after). Is that expected on Coldfire, Greg?

I am not entirely sure of the history behind the layouts. But for the M547x family
I have done most MMU work on this is typical. So like this:

# cat /proc/1/maps
60000000-60008000 r-xp 00000000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
60008000-6000a000 r--p 00006000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
6000a000-6000c000 rw-p 00008000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
6000c000-6000e000 rw-p 00000000 00:00 0
60010000-60014000 r-xp 00000000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
60014000-60016000 r--p 00002000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
60016000-60018000 rw-p 00004000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
60018000-60028000 rw-p 00000000 00:00 0
60028000-60080000 r-xp 00000000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
60080000-60082000 r--p 00056000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
60082000-60084000 rw-p 00058000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
60084000-60086000 rw-p 00000000 00:00 0
80000000-80004000 r-xp 00000000 1f:00 1882624    /bin/init
80004000-80006000 r--p 00002000 1f:00 1882624    /bin/init
80006000-80008000 rw-p 00004000 1f:00 1882624    /bin/init
80008000-8000a000 rwxp 00000000 00:00 0          [heap]
bfdba000-bfddc000 rwxp 00000000 00:00 0          [stack]

The 0x60000000 library addresses are due to mmaping - and that is based on the
definition of TASK_UNMAPPED_BASE for ColdFire, from arch/m68k/include/asm/processor.h

     /* This decides where the kernel will search for a free chunk of vm
      * space during mmap's.
      */
     #ifdef CONFIG_MMU
     #if defined(CONFIG_COLDFIRE)
     #define TASK_UNMAPPED_BASE      0x60000000UL


The application address range of 0x80000000 are baked in at link time:

$ m68k-linux-objdump --headers bin/init

init:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .interp       0000000d  80000114  80000114  00000114  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   1 .hash         00000170  80000124  80000124  00000124  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   2 .gnu.hash     000001b4  80000294  80000294  00000294  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   3 .dynsym       00000350  80000448  80000448  00000448  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   4 .dynstr       00000174  80000798  80000798  00000798  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   5 .rela.dyn     00000018  8000090c  8000090c  0000090c  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   6 .rela.plt     00000240  80000924  80000924  00000924  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   7 .init         00000014  80000b64  80000b64  00000b64  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   8 .plt          00000498  80000b78  80000b78  00000b78  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   9 .text         00001258  80001010  80001010  00001010  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  10 .fini         0000000e  80002268  80002268  00002268  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  11 .rodata       00000257  80002276  80002276  00002276  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  12 .eh_frame     00000004  800024d0  800024d0  000024d0  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  13 .ctors        00000008  80005f30  80005f30  00003f30  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  14 .dtors        00000008  80005f38  80005f38  00003f38  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  15 .dynamic      000000c0  80005f40  80005f40  00003f40  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  16 .got          000000cc  80006000  80006000  00004000  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  17 .data         00000008  800060cc  800060cc  000040cc  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  18 .bss          0000002c  800060d4  800060d4  000040d4  2**2
                   ALLOC


I am not sure why JM's link has applications linked at 0x70000000.
Is that a glibc thing?  My examples above are all based on uClibc.

While we are talking about link addresses, JM, can you tell me what
your kernel is linked at?  For me it is from a base near 0 (well actually
128k offset, but there is some meaning to that address) which matches
the physical DRAM which starts at address 0:

$ m68k-linux-objdump --headers linux/vmlinux

linux/vmlinux:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         002e1800  00020000  00020000  00002000  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 .rodata       0003f398  00302000  00302000  002e4000  2**4
                   CONTENTS, ALLOC, LOAD, DATA
...


I know the 54418 typically has DRAM at a different physical offset
(I think it is 0x40000000?), so wondering if the VM layout was
adjusted in some way to cater for that difference?

Regards
Greg





> Cheers,
> 
>      Michael
> 
> 
>> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>>
>> The first call generates the "ls" output, not the second one.
>> The helper looks like:
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 83b4682ec85c..14d861e9cba2 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -76,6 +76,87 @@ int mmap_rnd_compat_bits __read_mostly =
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
>>  static bool ignore_rlimit_data;
>>  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>>
>> +int dump_memory_map(struct task_struct *task)
>> +{
>> +    struct mm_struct *mm = task->mm;
>> +    struct vm_area_struct *vma;
>> +    struct file *file;
>> +    struct path *path;
>> +    char *buf;
>> +    char *pathname;
>> +
>> +       if (!mm) {
>> +               return -ENOMEM;
>> +       }
>> +
>> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
>> +    // Acquire the read lock for mmap_lock
>> +    down_read(&mm->mmap_lock);
>> +       mas_lock(&mas);
>> +       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
>> ULONG_MAX)) {
>> +               char perms[5] = "---p"; // Default permissions
>> +               // Set permissions based on vm_flags
>> +               if (vma->vm_flags & VM_READ) perms[0] = 'r';
>> +               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
>> +               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
>> +               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
>> +
>> +               if (vma->vm_file) { // If there's an associated file
>> +                       buf = (char *)__get_free_page(GFP_KERNEL);
>> +                       if (!buf) {
>> +                               continue; // Handle memory allocation
>> failure
>> +                       }
>> +
>> +                       file = vma->vm_file;
>> +                       path = &file->f_path;
>> +                       pathname = d_path(path, buf, PAGE_SIZE);
>> +                       if (IS_ERR(pathname)) {
>> +                               pathname = NULL;
>> +                       }
>> +
>> +                       // Print memory area information with file path
>> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu %s\n",
>> +                               vma->vm_start, vma->vm_end,
>> +                               perms,
>> +                               vma->vm_pgoff << PAGE_SHIFT,
>> +                               MAJOR(file_inode(file)->i_rdev),
>> +                               MINOR(file_inode(file)->i_rdev),
>> +                               file_inode(file)->i_ino,
>> +                               pathname ? pathname : "");
>> +
>> +                       free_page((unsigned long)buf);
>> +               } else {
>> +                       char *special_area_name = NULL;
>> +
>> +                       // Check for heap
>> +                       if (vma->vm_end > mm->start_brk && vma->vm_start
>> < mm->brk) {
>> +                               special_area_name = "[heap]";
>> +                       }
>> +                       // Check for stack
>> +                       else if (vma->vm_start <= mm->start_stack &&
>> vma->vm_end >= mm->start_stack) {
>> +                               special_area_name = "[stack]";
>> +                       }
>> +                       // Check for vdso
>> +                       else if (vma->vm_flags & VM_EXEC &&
>> vma->vm_flags & VM_READ && !vma->vm_file) {
>> +                               special_area_name = "[vdso]";
>> +                       }
>> +
>> +                       // Print memory area information without file path
>> +                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
>> +                               vma->vm_start, vma->vm_end,
>> +                               perms,
>> +                               vma->vm_pgoff << PAGE_SHIFT,
>> +                               special_area_name ? special_area_name :
>> "    ");
>> +               }
>> +       }
>> +       mas_unlock(&mas);
>> +    // Release the read lock for mmap_lock
>> +    up_read(&mm->mmap_lock);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(dump_memory_map);
>>
>>
>> Thanks,
>> JM
