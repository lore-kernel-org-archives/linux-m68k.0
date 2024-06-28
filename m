Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84C481D7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719573961; cv=none; b=oSRywuS1/icVyiwOYJznkRynU0I2BNhFk5nN8VL3J1Q+47yWRJJeYTCiWgLqvQGLMWoQ6Duy1PzRGa9/fz+GrOI2c2bf0dLezZ2xR7qxMoqN7r+bah8qz/2bIW7j1WCzdtJaIWhttFypee9atQ215vg/48J507qDah+lwfFozco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719573961; c=relaxed/simple;
	bh=N2m8HEzR2WuW/Vk0X0ngwpijoZg1QtBJ8KSHXDL5rH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktfVolt9VdkS0Z8TPdluNw2KQ9SvGlLxKPTM6lYOE8nGbVavEL96ElkyfHzLaZmTm5iHm2RzhHEomSt8snQhnKEhBt1ZOd2Wu6FKhlThz94vAu9H5nUhWUcFw2HMDqD7CvHHVZ4A5b4SKMhrNZmMnn0cgGLJi+zlUYd2ivJK+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=PhFD2fUc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="PhFD2fUc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43CD140004;
	Fri, 28 Jun 2024 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719573951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iqJ08SggB53jKfGs2QMVg/DCP9nv5GfPEjqHT0TupKE=;
	b=PhFD2fUccf+XzcYtAjoXhiNiPDqOTKgUJtBMdE71GU2IXCXYN1YyrBazRyLOM5V6cVUQcV
	bC86Gq62IrX/j3GLfjsEBdioA4CCDdizn3ou8yqK2swTsi6SU+qEqe3yvXDa+/dYNrRzVS
	vJYhKcbizxNaYZ+Xj/I4TGpA79B7iWUZse9e5MoCS+IbT91ixW9Ucf7efMqom0xDaiPTxK
	hk6lJxjp7wUv2KsaCXB40XLn5oHz8qTwqU4inX+ZxRXr68UqP5ezz63stYEU5JmJgcMo+c
	R+bDpRgSOAk1k4AjXLNys60fQRPACgYRDANOU7Kea/8T4qB02ZNvsZEFH+HXYQ==
Message-ID: <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
Date: Fri, 28 Jun 2024 13:25:49 +0200
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
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Michael,

On 28/06/2024 09:48, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 28.06.2024 um 19:24 schrieb Jean-Michel Hautbois:
>>> I forgot to take into account that libraries are loaded only the
>>> binary starts executing. Can you print the same map dump in the exit
>>> syscall code path? That ought to show all loaded libraries at that 
>>> point.
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
> No heap in this second call. Can you print mm->start_brk and mm->brk 
> please?
> 
> The process memory layout is a little unusual (I would have expected the 
> binary to be mapped before the dynamic libraries, not after). Is that 
> expected on Coldfire, Greg?
> 

I did the test, and called ls twice to see what differs:
bash-5.2# ls -l > /dev/null
load_elf_binary: Dump memory for ls (31):
mmap: start_brk: 700ca000, brk: 700ca000
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
do_exit: Dump memory for ls (31):
mmap: start_brk: 700ca000, brk: 700ec000
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
mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
bash-5.2# ls -l > /dev/null
load_elf_binary: Dump memory for ls (33):
mmap: start_brk: 700ca000, brk: 700ca000
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
do_exit: Dump memory for ls (33):
mmap: start_brk: 700ca000, brk: 700ca000
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
mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]

The second time, there seems to be no heap...

JM

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
>> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu 
>> %s\n",
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
>> +                       // Print memory area information without file 
>> path
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
