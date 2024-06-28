Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48574558B9
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560898; cv=none; b=USUIN3QTLe5IorgwjssReCqRoIOeYc5bq+ts87jCjSLchJxlRac6XydVTZZgAV6dHouJMtK2UvK3XotODjjLzOF8yACrDB3fWV0pSyzpA19CbHGqotujXIhNQJyZVvpY5myUi6bNyTWucaTiEEo3ebr9e/s/MUsojE7RsVrNpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560898; c=relaxed/simple;
	bh=h55pVxkrrD2NkPc8HIM7vKpp3OhLE6qJd4E4CULSv0U=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nyxCZqx0vY57sKWKVdSz98/u2WPMNelYF4jq1CkjGd8+aCv4kV2T4LsZ1p8PuFJod/bSwiWP80tgorrLW1Dq5DO1SyckiYWpCSjs3d2Sysf3Jelc1D/F3PcFSpgeCdcf1GlJ7e/qC9ro5fSC2N9qWoozUtr51+9LutSCtt2j2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGctgvH5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGctgvH5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70683d96d0eso235993b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719560897; x=1720165697; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrdAJ7prahjV7cmIUKRAXYNpyINLeUIz8pA2BKKDXXg=;
        b=kGctgvH5xk3WGpC/wMq6Y+cxsIJ3roVNDX1LbD+H4Jp9EaH/MvdpoRJ7XYKp+NYyX+
         9bW379JGT2ZNz5X8AipgQwbipPJmKJbMqktC78JNi9IYW/IdUhc6MruSrJAgoq+Hv+B2
         86J+FDYPye0J9X2eUxPz88I8HNNNgBkkd5EQ50TLsrejMYs1VtmgNn9MlmoeeDADKSO7
         6Ss/PGxALNjVaeMJuufS1h5FvELKtpZkPnpwF4aGXrha7dIGeOnvRQTJiXvHB5Iig+b/
         cBQ6VrkAavneLcTAtiq+IwL1txIT3z12XnPXfqdLh/L6yF0WcYxpEDizREca0+dzoG51
         pzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560897; x=1720165697;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrdAJ7prahjV7cmIUKRAXYNpyINLeUIz8pA2BKKDXXg=;
        b=T3W0DTSteKaYkriKH/DkZzE6Xm0drNsoFXcQT10FwpNb+q5HsVq9hAKtXGaBQQnkuX
         YIxThzFcy6jf6b9LkxVm8Mg+iXOUG6YnMqXs1Xzg7Jh9l7v9V1BqqcOsWJVo8s3R/POF
         hjJ458I3zk5cYZnPsZIq6Z5zmf0dK2Si5I47b3ZDCJOAwppV8tc3amYGWfhYYNJUfpCI
         7gcwtQ12+I0hgITVumIwaSbwoZHAbKWUj0P5eAOgoBihu1MTJPMPh2Xs6WOH1TZYFSJM
         QrF5JGRUtpxh0Y8YjlNWGMsCFaCZCKiJL8jZ7EVIVzqjG8A1o1XgnZxXyWmETQ4Wjmtn
         JxsA==
X-Forwarded-Encrypted: i=1; AJvYcCUdHJGZUTgeUL/otQ56G4nweuS75VV8OMe8iEm6Fejv5wpTcTfzNut//cJWwbQ+8lDFTHIEgvNAAm+Jy9b6gLSX4Exf4hoY7Z+tuTruOKIC
X-Gm-Message-State: AOJu0YzELhIS+fUUQMjJ1IJ+ZQy+FXfdyJDRIqYrhWHfeXTo5ysJFP+K
	cYUIAe4YWILcqpxhb0Ge1kecvT0QjYvYb6GtOj+JjwOh9dLlmwzl
X-Google-Smtp-Source: AGHT+IHPbTtLLEsOZODqYZYiT8DLFMT1ORaglShUyUxLJUAyBFfObtVuj7Tta5pTqrRu4jknc++ryw==
X-Received: by 2002:a05:6a00:22cc:b0:705:ddbf:5c05 with SMTP id d2e1a72fcca58-7066e52a7cbmr19881378b3a.11.1719560896543;
        Fri, 28 Jun 2024 00:48:16 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a91335sm926859b3a.213.2024.06.28.00.48.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:48:16 -0700 (PDT)
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
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
Date: Fri, 28 Jun 2024 19:48:08 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jean-Michel,

Am 28.06.2024 um 19:24 schrieb Jean-Michel Hautbois:
>> I forgot to take into account that libraries are loaded only the
>> binary starts executing. Can you print the same map dump in the exit
>> syscall code path? That ought to show all loaded libraries at that point.
>
> Thanks for your suggestion !
> I changed it a bit, and I added a call in do_exit() as suggested. When
> executing ls I get:
>
> bash-5.2# ls -l
> load_elf_binary: Dump memory for ls (31):
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>
> do_exit: Dump memory for ls (31):
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
> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>
> When I call it a second time, I get:
>
> bash-5.2# ls -l
> load_elf_binary: Dump memory for ls (33):
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
> do_exit: Dump memory for ls (33):
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

No heap in this second call. Can you print mm->start_brk and mm->brk please?

The process memory layout is a little unusual (I would have expected the 
binary to be mapped before the dynamic libraries, not after). Is that 
expected on Coldfire, Greg?

Cheers,

	Michael


> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>
> The first call generates the "ls" output, not the second one.
> The helper looks like:
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 83b4682ec85c..14d861e9cba2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -76,6 +76,87 @@ int mmap_rnd_compat_bits __read_mostly =
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
>  static bool ignore_rlimit_data;
>  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>
> +int dump_memory_map(struct task_struct *task)
> +{
> +    struct mm_struct *mm = task->mm;
> +    struct vm_area_struct *vma;
> +    struct file *file;
> +    struct path *path;
> +    char *buf;
> +    char *pathname;
> +
> +       if (!mm) {
> +               return -ENOMEM;
> +       }
> +
> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
> +    // Acquire the read lock for mmap_lock
> +    down_read(&mm->mmap_lock);
> +       mas_lock(&mas);
> +       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
> ULONG_MAX)) {
> +               char perms[5] = "---p"; // Default permissions
> +               // Set permissions based on vm_flags
> +               if (vma->vm_flags & VM_READ) perms[0] = 'r';
> +               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
> +               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
> +               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
> +
> +               if (vma->vm_file) { // If there's an associated file
> +                       buf = (char *)__get_free_page(GFP_KERNEL);
> +                       if (!buf) {
> +                               continue; // Handle memory allocation
> failure
> +                       }
> +
> +                       file = vma->vm_file;
> +                       path = &file->f_path;
> +                       pathname = d_path(path, buf, PAGE_SIZE);
> +                       if (IS_ERR(pathname)) {
> +                               pathname = NULL;
> +                       }
> +
> +                       // Print memory area information with file path
> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu %s\n",
> +                               vma->vm_start, vma->vm_end,
> +                               perms,
> +                               vma->vm_pgoff << PAGE_SHIFT,
> +                               MAJOR(file_inode(file)->i_rdev),
> +                               MINOR(file_inode(file)->i_rdev),
> +                               file_inode(file)->i_ino,
> +                               pathname ? pathname : "");
> +
> +                       free_page((unsigned long)buf);
> +               } else {
> +                       char *special_area_name = NULL;
> +
> +                       // Check for heap
> +                       if (vma->vm_end > mm->start_brk && vma->vm_start
> < mm->brk) {
> +                               special_area_name = "[heap]";
> +                       }
> +                       // Check for stack
> +                       else if (vma->vm_start <= mm->start_stack &&
> vma->vm_end >= mm->start_stack) {
> +                               special_area_name = "[stack]";
> +                       }
> +                       // Check for vdso
> +                       else if (vma->vm_flags & VM_EXEC &&
> vma->vm_flags & VM_READ && !vma->vm_file) {
> +                               special_area_name = "[vdso]";
> +                       }
> +
> +                       // Print memory area information without file path
> +                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
> +                               vma->vm_start, vma->vm_end,
> +                               perms,
> +                               vma->vm_pgoff << PAGE_SHIFT,
> +                               special_area_name ? special_area_name :
> "    ");
> +               }
> +       }
> +       mas_unlock(&mas);
> +    // Release the read lock for mmap_lock
> +    up_read(&mm->mmap_lock);
> +
> +    return 0;
> +}
> +EXPORT_SYMBOL(dump_memory_map);
>
>
> Thanks,
> JM
