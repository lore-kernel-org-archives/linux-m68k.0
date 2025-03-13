Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749DE1DB154
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741890719; cv=none; b=GvKP+lQL1m/UkA6RL1oWJ5zYCxOj7uWy2x1/0AdQwWLFSQyV1HUIAqP7e1YjLiS+cvXSdeC0CSKqsEuV7MpvcvPlnoAngXBP8CjD15b4rsDAXU0gtu0NsrwYcrhxllnrBE4UC0dtPLLe38zCYfBPzdB4bvvlAJb7asl6ObH2nl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741890719; c=relaxed/simple;
	bh=QDNrUCuuo1sh+JvAhQusOn9G4cRba+JaGJFfamPNlFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GaMHjcENNa+xQOjMIiXNqXvLScSujFSw2PBP+AAb12aj80qTlAZfh4HcbBtv7aqFMMxURDN40XWYZIngswnX+Z3tp2kGjPOC5YMdUtQXXVJW6bgkDpUDZ7n3g0Q862eEeTKBEmnc1lRxiN7bGjQ6MeRfLtRTtEEzcvHw3vScxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8WBVonH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8WBVonH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22548a28d0cso39445965ad.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741890717; x=1742495517; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvioiASfLNo7ypfSRCMauM2m9J3yZYec7min/CjZqEI=;
        b=l8WBVonHQYnUHyrmThjU4OnvYWUOFR4a6QrlPg2nAAnInGDWelcmiVy/DIAe6O4c4n
         8RMWpK9oJTfx8iVh7lh4h2hoYivGODewA3oFGVLtyH3YfltSWcwKmoryDGXvZ80MCYjW
         u2TGndknUbRb01xtM4iujCIbVkgK/Q1nqO8/knt2DctyJJd+S2O2QDREVg7qdOaLRfGA
         6PaSnCEvPOP2OJoqjTTc0zRJfewKmPPznnGIdil7ahVSRi2jQC0vX6rAD8YwuPT2d8ig
         /Ea8APQCytNPqkS94ni7U4MXLPxkgJdgNyNaaNUHfcN0EsDymcnMd5UGaK9P5t4YNfoL
         JcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890717; x=1742495517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvioiASfLNo7ypfSRCMauM2m9J3yZYec7min/CjZqEI=;
        b=K9G7OT6HpX0dPkrsdhjyY+VyTPvGdnPRj8xBaTfrlCOe19l5t1AWJg6ftrHR7g/TUn
         P+oEc9sD0I2uK8XWpuiU/3QCXLhtWCn2yIN7o930vqyNvt+xH408wJ/iW3oJ7RaJB2E2
         6qkBTSZZ/C5CkHHzeZ/cFXhR/L54PY34YyfAgbY1Kg0imDnm2Ne9ThP3KoW77tTQ7gnP
         nhKuNKppQUXC22cPpN7Cifbhikeg7EYbvkOojkPJE0vYe5+ZcVB5KOx6hE0mp4yoTHV1
         M6EpPCL8oPYxeINiYsspbko8ZpsgCEkGjSHPMNYmxEVhn6tx7FLHFTlkcBkmL/Ka4iKb
         W35Q==
X-Gm-Message-State: AOJu0Yymh3B4dzyFbuUczhkyznVXU4jCc/T6aNkTXIO4a4a/j5ZPj2XZ
	lG0LBUmGETnZzTL07+b1RyYyptpBK2fs1EJ6Q60oJTHa64kUOOy/
X-Gm-Gg: ASbGncsWCjbcWO4WrKJOl1DFrVfuMy1Db9iuKZ1Bu0vYDav18PFdJwT32uCxxhkrY3d
	JeOZOQug9V3qtnVZIhla7QNvL5NaMFUhIkqbJaHvXf1NlSG0USa4KLA3DYlpi/kpTVbwzPcqu/y
	tI7qV5RO9D5NSjelP4k64N53npIVMIOO5ucXHs5p4EgzdEH/qjTcvTZWqMZ/pNoL8MOdoSjkUmu
	NO2+ElkNoTb2f+BOuSZGztTR5/2m8aXjWKYZ/Hmi6iail/icdH0bs9rx9uOLA01VsYn0YuYH5eX
	KhKVYYEvfP8Mh3XdlUWW5kzie9CBY5r0WYM6LxltPoryA1CN3eWk6cwkWDHjVQrg6cKhSTdLXoR
	w5WQH0u1f9N2KCGR/APhc0UAntPt0nEDosrkhRDU6UduXFC4oT7iAypZzHFI=
X-Google-Smtp-Source: AGHT+IG9GdBbgNkdtLuMp2u0NM3LHgg0e7hRVT7B3QoybMrdPZBYyJ6IAS0pxD4PC2ehvue37wCslA==
X-Received: by 2002:a17:903:2405:b0:224:13a4:d61e with SMTP id d9443c01a7336-225dd8eb331mr7227775ad.51.1741890717451;
        Thu, 13 Mar 2025 11:31:57 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:acbe:70b0:48fd:9dc0? ([2001:df0:0:200c:acbe:70b0:48fd:9dc0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711529531sm1673946b3a.2.2025.03.13.11.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 11:31:56 -0700 (PDT)
Message-ID: <ea797cf9-99b7-434a-91e2-41dc1aa4c131@gmail.com>
Date: Fri, 14 Mar 2025 07:31:52 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mike Rapoport <rppt@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org>
 <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 14/03/25 04:51, Geert Uytterhoeven wrote:
> Hi Mike,
>
> On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
>> On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
>>> On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
>>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>>
>>>> The point where the memory is released from memblock to the buddy allocator
>>>> is hidden inside arch-specific mem_init()s and the call to
>>>> memblock_free_all() is needlessly duplicated in every artiste cure and
>>>> after introduction of arch_mm_preinit() hook, mem_init() implementation on
>>>> many architecture only contains the call to memblock_free_all().
>>>>
>>>> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
>>>> relevant architectures to make it more explicit where the free memory is
>>>> released from memblock to the buddy allocator and to reduce code
>>>> duplication in architecture specific code.
>>>>
>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
>>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>>   arch/m68k/mm/init.c          |  2 --
>>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
>> Thanks :)
>>
>> While working on this I was wondering if init_pointer_tables() can be moved
>> from mem_init() to motorola::paging_init(). It seems to me that it can, but
>> I wasn't sure enough so I left it there for now.
> Oh, that would be nice, as it would allow us to get rid of the ugly
> #ifdef, and (in the context of this series) of our own mem_init().
> It looked promising at first, but crashed later (on ARAnyM):
>
> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> devtmpfs: mounted
> Unable to handle kernel access at virtual address (ptrval)
> Oops: 00000000
> Modules linked in:
> PC: [<0001273b>] xdnrm_dn+0xf/0x10
> SR: 2208  SP: (ptrval)  a2: 01030000
> d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
> d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
> Process swapper (pid: 1, task=(ptrval))
> Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01

What's at that address? The 14 MB ST-RAM ought to end at 0xe00000 (which 
would have been left unmapped if FastRAM is in use). MMIO area starts at 
0xff0000 but base addresses there are 0xff8xxx, 0xffaxxx or 0xfffxxx 
from what I've found.

Cheers,

     Michael

> wb 1 stat/addr/data: 0000 00000000 00000000
> wb 2 stat/addr/data: 0000 00000000 00000000
> wb 3 stat/addr/data: 0000 00ffee01 00000000
> push data: 00000000 00000000 00000000 00000000
> Stack from 0102ffb6:
>          00000042 4e9a005f 4bd80042 4e720000 a5240000 00000000 00000000 00000000
>          00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>          00002000 00000000
> Call Trace: [<00002000>] _start+0x0/0x6
>
> Code: ac08 9000 07ec e800 0800 0267 0408 d000 <07ec> ee01 43ff 1808
> ee00 04ff 2108 ae00 07ff 1908 ae00 02ff 2420 5fe9 ee00 02ff
> Disabling lock debugging due to kernel taint
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
