Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC78485
	for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719632522; cv=none; b=ewJItjhQz0E1LFcQo38W4i9zv0YOyVzfJE4kdzX9m5AInRXZX2gsQseB0dy7FuyeEf/akyjapM5wB73loIm/u/cLIKb8fx+MWSFRAiVNxcCbWQNIDtoh1xAd8n6tEtH5Yx2wUQ+FSR5Yxh3RULBxzn6yBiOCHUNw52aree8AcpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719632522; c=relaxed/simple;
	bh=KGPDpVXYnCtb1u9fw8Ejxk/V/4WIHEnuKfEHlmInsLo=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mWMGPRQrrlUfVRNxfA7eur2OWuG9POYXkXrJZRhOoclstcqY14ys+zPrgHQmVJRyMRFajaDOUbFIkVOjLk86q/4xDkFiFQhJuBzPpd6jzcaOorRLpGmsP/ih0ktBq8MyYwjMR1LYXxiygHw8yhpNkuHXEBuz2zXzWlzB87eZ3yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gxdz/Bbp; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gxdz/Bbp"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ba33b08550so596674eaf.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 20:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719632519; x=1720237319; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBLSANnlMJVSSdpHwO7eKO9moXDMiFwLdQyag1HDNp4=;
        b=Gxdz/BbpavQByytpBr2PDh1sgwAIVKkiDPfDC0gGhY1b7fnWCRv18hMEavBqK8DHTd
         soh9OB1VucBBXMGMm+0DcuEpHD5A9FT8FcaDFcZ0ldhdf/36UBOtXu3YAl/5RX4kZ/Ob
         Zcx4EyzRW+xXkyrTFG1nY38R3C0Pj8jyMRePGyD09ds7AzBQFGgBlMG0HT9ssJ21Ysio
         UubLOdzU0VngLv0Qjhst+yPs8yJlGDeJNFyJclZIXnSj787EX90mbnnFik3H37han0Ah
         ONc3PpPQXvqm983IlQQ7kavu8/h60Rs9rVBIqTOSZtoIB2gM3A4v59G+sRe71XPSAuEy
         23QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719632519; x=1720237319;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBLSANnlMJVSSdpHwO7eKO9moXDMiFwLdQyag1HDNp4=;
        b=aNoznS4Pr/xou9uyvk94KqshNCwGJbbnMhTaMetDHVwsXpKo8Ij89dKcGDYDZZHkPH
         Ngz/yYuOh+mLJ+wtBM20tul9lIvndmiO9fX+PxHCI936a8Pb29aexrA8M09a5UkEPe3e
         +dB7iCuDZX/wgh4cDt37451wTledki5S0M0OnTOXB+YJab1lNIPynqvuwAbm36mwHxRS
         kJwTC2yyay8O5mXQsb6K1+4nxp3HSxo83U0Jy5B6HtDRtmo/ueKOEJsuLoeVb5DoG+K2
         SjMv25TWBvT4HCmn3VV1/zyHHuIzoUDql5CGOk3oZKLRWsqX9vqSK7aR0VhdYtQ5uCwr
         IH6w==
X-Forwarded-Encrypted: i=1; AJvYcCUfTd2V5dzJUHSxNiZoPMAWEQnueEUEhnyAIZR337r6llO3SHrPfPX3ZCWFvY24XyQQuXK5Mo5WAl3Ug+a+eB8eqJ/RWpR/TeO6O8TVDtTA
X-Gm-Message-State: AOJu0YwAtbnNvye6FIpQjLRJ0SZZ/rnZBGGvR0JxCYfJZEIutSBOjDPj
	pemI7zLABefBiyiv3f7NN+KZqT2dTWu488SLDPZpzV2reryi7GGa
X-Google-Smtp-Source: AGHT+IHopYJuR1eIbvKyZyMp4Pcz7PLjz7OJmzdAbGSrM508Owph07yiysxV1DgPe+KdYHvAIxsoaA==
X-Received: by 2002:a05:6358:7254:b0:1a2:dfc3:4200 with SMTP id e5c5f4694b2df-1a6acf79842mr13830855d.24.1719632519293;
        Fri, 28 Jun 2024 20:41:59 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e776esm2401923a91.50.2024.06.28.20.41.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2024 20:41:58 -0700 (PDT)
Subject: Re: m68k 54418 fails to execute user space
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
 <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
Date: Sat, 29 Jun 2024 15:41:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jean-Michel,

Am 28.06.2024 um 23:25 schrieb Jean-Michel Hautbois:
>>
>> No heap in this second call. Can you print mm->start_brk and mm->brk
>> please?
>>
>> The process memory layout is a little unusual (I would have expected
>> the binary to be mapped before the dynamic libraries, not after). Is
>> that expected on Coldfire, Greg?
>>
>
> I did the test, and called ls twice to see what differs:
> bash-5.2# ls -l > /dev/null
> load_elf_binary: Dump memory for ls (31):
> mmap: start_brk: 700ca000, brk: 700ca000
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
> do_exit: Dump memory for ls (31):
> mmap: start_brk: 700ca000, brk: 700ec000

ls managed to allocate heap space OK ...

> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
> mmap: 60030000-60032000 rw-p 60030000 00:00 0
> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
> mmap: 700ca000-700ec000 rwxp 700ca000 00:00 0 [heap]
> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
> bash-5.2# ls -l > /dev/null
> load_elf_binary: Dump memory for ls (33):
> mmap: start_brk: 700ca000, brk: 700ca000
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
> do_exit: Dump memory for ls (33):
> mmap: start_brk: 700ca000, brk: 700ca000

No heap space allocated here. I would have expected that to cause an 
error message from libc ...

Can you print a brief meminfo summary such as found in fs/proc/meminfo.c 
(total, free, available, buffer and cached for starters)?

Cheers,

	Michael


> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
> mmap: 60030000-60032000 rw-p 60030000 00:00 0
> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
> mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
>
> The second time, there seems to be no heap...
>
> JM
>
>> Cheers,
>>
>>      Michael
>>
>>
>>> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>>>
>>> The first call generates the "ls" output, not the second one.
>>> The helper looks like:
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 83b4682ec85c..14d861e9cba2 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>>> @@ -76,6 +76,87 @@ int mmap_rnd_compat_bits __read_mostly =
>>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
>>>  static bool ignore_rlimit_data;
>>>  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>>>
>>> +int dump_memory_map(struct task_struct *task)
>>> +{
>>> +    struct mm_struct *mm = task->mm;
>>> +    struct vm_area_struct *vma;
>>> +    struct file *file;
>>> +    struct path *path;
>>> +    char *buf;
>>> +    char *pathname;
>>> +
>>> +       if (!mm) {
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
>>> +    // Acquire the read lock for mmap_lock
>>> +    down_read(&mm->mmap_lock);
>>> +       mas_lock(&mas);
>>> +       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
>>> ULONG_MAX)) {
>>> +               char perms[5] = "---p"; // Default permissions
>>> +               // Set permissions based on vm_flags
>>> +               if (vma->vm_flags & VM_READ) perms[0] = 'r';
>>> +               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
>>> +               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
>>> +               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
>>> +
>>> +               if (vma->vm_file) { // If there's an associated file
>>> +                       buf = (char *)__get_free_page(GFP_KERNEL);
>>> +                       if (!buf) {
>>> +                               continue; // Handle memory allocation
>>> failure
>>> +                       }
>>> +
>>> +                       file = vma->vm_file;
>>> +                       path = &file->f_path;
>>> +                       pathname = d_path(path, buf, PAGE_SIZE);
>>> +                       if (IS_ERR(pathname)) {
>>> +                               pathname = NULL;
>>> +                       }
>>> +
>>> +                       // Print memory area information with file path
>>> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu
>>> %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               MAJOR(file_inode(file)->i_rdev),
>>> +                               MINOR(file_inode(file)->i_rdev),
>>> +                               file_inode(file)->i_ino,
>>> +                               pathname ? pathname : "");
>>> +
>>> +                       free_page((unsigned long)buf);
>>> +               } else {
>>> +                       char *special_area_name = NULL;
>>> +
>>> +                       // Check for heap
>>> +                       if (vma->vm_end > mm->start_brk && vma->vm_start
>>> < mm->brk) {
>>> +                               special_area_name = "[heap]";
>>> +                       }
>>> +                       // Check for stack
>>> +                       else if (vma->vm_start <= mm->start_stack &&
>>> vma->vm_end >= mm->start_stack) {
>>> +                               special_area_name = "[stack]";
>>> +                       }
>>> +                       // Check for vdso
>>> +                       else if (vma->vm_flags & VM_EXEC &&
>>> vma->vm_flags & VM_READ && !vma->vm_file) {
>>> +                               special_area_name = "[vdso]";
>>> +                       }
>>> +
>>> +                       // Print memory area information without file
>>> path
>>> +                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               special_area_name ? special_area_name :
>>> "    ");
>>> +               }
>>> +       }
>>> +       mas_unlock(&mas);
>>> +    // Release the read lock for mmap_lock
>>> +    up_read(&mm->mmap_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(dump_memory_map);
>>>
>>>
>>> Thanks,
>>> JM
