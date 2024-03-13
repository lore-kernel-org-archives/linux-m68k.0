Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B030BA2D
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Mar 2024 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710304784; cv=none; b=cPVBEAu3z2KDK3fAGEW4cMrwD9MmPBXLbC4XgOWQ7b7Cs98sPv+Svrj7tBQ2urSV/utPjqMQfoy3NZLSlayJQ1QUfPG5rXW2Yor9rd+09VO4RhcDqlKL/quIMUo+0/+v5GVDwd4AxfwrKNox+0d6+5CyS0ORV5ygPwlPCqXXcnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710304784; c=relaxed/simple;
	bh=w8VmH4uh1fxi81VLXW949AYeswuo6kuPhLIi0ffTFMk=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YwzWIqlOg56T5o8eRGExZqRqQVNusEwWp/gVl9ZPVUCYiDCcHLWE7f9hZXi0INF6ZZPNd3JIcgucUkwrl337z3ywZqTmXSdssFjxg4xFGU4sN6MYTtD882ddOs8gyHDLDqLTW3sg/rBWi47O5/yT2apsQyIrbOCoPGQc/mlNM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2MCs3dz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2MCs3dz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so417924b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710304781; x=1710909581; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmH0B4h7rPr5PQDJd2mDl3gUui4bRUC6DFamjSOIw0w=;
        b=J2MCs3dzh5pDCWGqhN6nro7x0MmgOoo6ElAVAbP7plUk6JfAckDrOgxdpT9BdhEpEi
         KADAMjQXIUxnKhSvVUfulqshFZgPJvklgAMsWiyuEw8FXX6OYL3ULAqStazf9XXuSvSG
         JAlmBOrS9IfnpzHoCATuWKvZmsQNy1d1XcrARjdBLpKIvbt1bCVsfhcqDZ1p0cMFa60c
         /8htnhCnXetOxHDUKuYigYF1xmxeA7S/yh3PWFmuNyHppeLRS7oXxrLXy7L2Wb/dmMw1
         vG+VpdW0QtI1fjXr+X6oK5SKZt607xZqAl1bGnymyaFD5fWLxy+ZWnhEsdiDQRwydYuH
         R33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710304781; x=1710909581;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmH0B4h7rPr5PQDJd2mDl3gUui4bRUC6DFamjSOIw0w=;
        b=RU/+EzWf9J+SDO5jClQZCyvpvc2/IifMVNrnjDMpVNXVg7xTHhKruFrR15g/OoN1tJ
         DrqYAyS4dgdEDd3AbH+1s1uvL7rkMoNj6CM5U6gqqOEhQ8WC2t0DMewIwGoeUt6ly26l
         g3goHPEzPbpKCoP+NjwySNnKFQhJQzGGE3VaupgWMALYSgeAMhoASxuL+T57bZ1+DV7I
         5trc7g+3Oe1YaQ06z+N46Jfas84dtVaOlzgccijSmR/kpoBbeH2J9ukemP2/90a/IDPo
         5cnrngHTh6o5e65NNZZlq65mjAj4JIO7pwqkqlu0UnXF9GFBJojC33gMkEYwMMmNWs2w
         3LXg==
X-Forwarded-Encrypted: i=1; AJvYcCXgRMcIIaTIzKXSYcnzeCnUify6eSqzp1SHrif7QqQCv5y/EdvVyGOR7k7Mty5IDwsbgCujGEKI1oqB3zSckqQ0BlcwUzSs7XG1L7xDjQQe
X-Gm-Message-State: AOJu0YwudxeHkU8hhMRyMAcfCPKw91xcCM/czzb7MoiAhLY4bKVS2+oZ
	C5a3gIlen+zudyG3y1yZcsxgs40z3mLyhTAMmFbvF1lWA/0VLxzqbZuTF/Ya
X-Google-Smtp-Source: AGHT+IF9o/lRzuEZFJ4chYgbTlWul4Nmo6rfBxFO2o8MpvCgDob38nCPi5njZrKo+Kd3t8yUk18WAw==
X-Received: by 2002:a05:6a20:9184:b0:1a3:32e5:f38a with SMTP id v4-20020a056a20918400b001a332e5f38amr682679pzd.45.1710304780662;
        Tue, 12 Mar 2024 21:39:40 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id lo7-20020a170903434700b001dc01efaec2sm7609269plb.168.2024.03.12.21.39.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 21:39:40 -0700 (PDT)
Subject: Preemption (was: Re: spinlock recursion when running q800 emulation
 in qemu)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
 <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <66e2c2c2-4d23-33d4-0963-6868a746f2ad@gmail.com>
Date: Wed, 13 Mar 2024 17:39:32 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

Am 13.03.2024 um 13:16 schrieb Michael Schmitz:
> Hi Geert,
>
> On 12/03/24 20:59, Geert Uytterhoeven wrote:
>> On Tue, Mar 12, 2024 at 1:51 AM Michael Schmitz <schmitzmic@gmail.com>
>> wrote:
>>> On 11/03/24 21:35, Finn Thain wrote:
>>>> I think spin_lock() reduces to preempt_disable() on UP.
>>>> In include/linux/spinlock_api_up.h it says,
>>>>
>>>> /*
>>>>    * In the UP-nondebug case there's no real locking going on, so the
>>>>    * only thing we have to do is to keep the preempt counts and irq
>>>>    * flags straight, to suppress compiler warnings of unused lock
>>>>    * variables, and to add the proper checker annotations:
>>>>    */
>>> That's only true in the debug case - there, preempt_disable() is used
>>> inside the spin loop. But m68k is one of the last CONFIG_PREEMPT_NONE
>>> archs AFAIR, and preempt_disable() reduces to barrier() on those.
>> M68k does have experimental preempt support. I have been running
>> that for the last 5 months. Works fine most of the time, except for
>> the one BUG[1] that happens every 10 boots or so.
>>
>> [1]
>> https://lore.kernel.org/all/CAMuHMdUQ72KOPw5vxNfhjoTR-SsaELeKneBmyQPYEWa_o5OZZA@mail.gmail.com
>>
>
> NB: the Kconfig hunk no longer applies, it now should look like this:
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 4b3e93cac723..0c4b5180df1d 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -10,7 +10,6 @@ config M68K
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>         select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> -       select ARCH_NO_PREEMPT if !COLDFIRE
>         select ARCH_USE_MEMTEST if MMU_MOTOROLA
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>
> (HAS_DMA -> M68K_NONCOHERENT_DMA)
>
> Runs fine on ARAnyM with a bit of VM stress testing using
> PREEMPT_VOLUNTARY. After a bit of looping (init=/sbin/reboot), fails
> spectacularly with not finding any root filesystem to mount when using
> full preempt.
>
> Trying to boot a full system, I see the 'table already freed' panic on
> the first go.
>
> Running a stack-ng stack-fill stressor triggered the panic, too. I'll
> see how reliable that is.

That's actually pretty reliable - running stress-ng --stack 2 
--stack-fill two or three times gets me a panic (on a fast Intel system).

Running full preemption on the PowerBook instance, the older one of my 
disk images boots OK (sysvinit based), the newer one (systemd IIRC) 
cheerfully throws endless Oops of this kind:

> Unable to handle kernel NULL pointer dereference at virtual address b90995fb
> Oops: 00000000
> Modules linked in:
> PC: [<000de1d6>] del_page_from_free_list+0x16/0x46
> SR: 2700  SP: 3e9c0737  a2: 00f34610
> d0: 00000000    d1: 0054491c    d2: 0000000b    d3: 00000000
> d4: 0000000f    d5: 00000000    a0: 0054491c    a1: 00495dd0
> Process vol_id (pid: 1198, task=54e40596)
> Frame format=7 eff addr=00000104 ssw=0405 faddr=00000104
> wb 1 stat/addr/data: 0000 00000000 00000000
> wb 2 stat/addr/data: 0000 00000000 00000000
> wb 3 stat/addr/data: 0085 00000104 00495dd0
> push data: 00000000 00000000 00000000 00000000
> Stack from 0482fbc4:
>         0076343c 000df4ce 0054491c 00495d78 00000000 00000000 00000801 00000000
>         00000000 00002000 0076343c 00495d78 000df8de 0482e000 0482fd06 0000001e
>         0054491c 00544920 00000000 00495f84 00002700 00000058 00000058 00495d78
>         000dfb70 00495d78 00000000 00000000 00000801 0076343c 00763464 00152c40
>         00000000 00112cc0 00000000 00000000 000b493c 0482fd06 000df974 01023764
>         0032d0e8 00dd7400 00f1fe58 00000049 64560000 00010000 0000f000 00000a00
> Call Trace: [<000df4ce>] __rmqueue_pcplist+0x198/0x316
>  [<00002000>] _start+0x0/0x8
>  [<000df8de>] zone_watermark_fast.isra.112+0x0/0x96
>  [<00002700>] resume_userspace+0xa/0x16
>  [<000dfb70>] get_page_from_freelist+0x1fc/0x632
>  [<00152c40>] ext4_ext_convert_to_initialized+0x50c/0x534
>  [<00112cc0>] simple_transaction_get+0x52/0x98
>  [<000b493c>] filemap_add_folio+0x0/0x9e
>  [<000df974>] get_page_from_freelist+0x0/0x632
>  [<0032d0e8>] xa_load+0x0/0x76
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<0000f000>] NEVEN+0xd8/0xec
>  [<000df7d2>] prepare_alloc_pages.isra.110+0x70/0x84
>  [<000e0f4e>] __alloc_pages+0xa8/0x6b2
>  [<00152c40>] ext4_ext_convert_to_initialized+0x50c/0x534
>  [<00112cc0>] simple_transaction_get+0x52/0x98
>  [<000b493c>] filemap_add_folio+0x0/0x9e
>  [<0032d0e8>] xa_load+0x0/0x76
>  [<00004ec2>] buserr_c+0x10c/0x3e6
>  [<00001000>] kernel_pg_dir+0x0/0x1000
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<0032cf2a>] xas_load+0x1e/0x60
>  [<0032cf0c>] xas_load+0x0/0x60
>  [<0032d150>] xa_load+0x68/0x76
>  [<000e1a46>] __folio_alloc+0x1c/0x2a
>  [<00152cc0>] ext4_ext_index_trans_blocks+0x0/0x3a
>  [<000bace0>] page_cache_ra_unbounded+0xb0/0x140
>  [<00112cc0>] simple_transaction_get+0x52/0x98
>  [<00010fff>] X_OPERR+0x3/0x40
>  [<000b4c24>] filemap_get_pages+0x24a/0x4e0
>  [<00008000>] nvram_proc_read+0x4c/0x31a
>  [<001000f0>] fiemap_prep+0x6c/0xc2
>  [<000f0000>] vfs_writev+0x2c/0x16e
>  [<001c0000>] bio_may_exceed_limits.isra.35+0x8/0x54
>  [<000b4f66>] filemap_read+0xac/0x30c
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00001000>] kernel_pg_dir+0x0/0x1000
>  [<00008000>] nvram_proc_read+0x4c/0x31a
>  [<00008000>] nvram_proc_read+0x4c/0x31a
>  [<00001000>] kernel_pg_dir+0x0/0x1000
>  [<00007000>] atari_tt_hwclk+0x16c/0x2fc
>  [<00003000>] arch_ptrace+0xa6/0x24a
>  [<00001000>] kernel_pg_dir+0x0/0x1000
>  [<001b5716>] blkdev_read_iter+0x118/0x138
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00008000>] nvram_proc_read+0x4c/0x31a
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<000f0a68>] vfs_read+0xcc/0x128
>  [<00008000>] nvram_proc_read+0x4c/0x31a
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<000f0dfc>] ksys_read+0x4a/0x86
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<0000fff6>] TWOMAIN+0x70/0x80
>  [<000f0e4a>] sys_read+0x12/0x18
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<0000269a>] syscall+0x8/0xc
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<00010000>] TWOMAIN+0x7a/0x80
>  [<0000c00c>] ATANTBL+0x114/0x800
>
> Code: 202f 0010 2668 0004 2268 0008 2749 0004 <228b> 217c 0000 0100 0004 217c 0000 0122 0008 0068 0080 001a 42a8 0014 2200 e589
> Disabling lock debugging due to kernel taint
> note: vol_id[1198] exited with irqs disabled
> note: vol_id[1198] exited with preempt_count 3

(killed ARAnyM after 26 of those).

Booted OK on the next boot, produced a 'table already free' panic after 
three or four runs of the stack-fill stress test.

Cheers,

	Michael


>
> Cheers,
>
>     Michael
>
>
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
>> geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a
>> hacker. But
>> when I'm talking to journalists I just say "programmer" or something
>> like that.
>>                                  -- Linus Torvalds
