Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491378C7E
	for <linux-m68k@vger.kernel.org>; Wed,  7 Aug 2024 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723059143; cv=none; b=ArVaoA2L2ocyCGN4jyMpnO9kV1oyKIiD73Y9DUh2xknyy7mUdEwLfX5wXHKfYXtKaSrAkg3+243fSJdz/+6auFDubftcLeK7I5qhE+RNZp49emlj+RO7R63stq2KsdQjljrQbKUktn134zZCztULBvos9zb/6iXNkrTBWaGndv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723059143; c=relaxed/simple;
	bh=90MS2I4WfaGqo1O3asj14kerFGI+77gSiPjWIGxhmiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLh3zr8b+6edzG7/TWvnjY4BPioUjIlEIojHMC46eFFw+5wCi9FYPlMwAMZT1Atyp7c3WAOS7wmXy3ih6UqpvYmOIeKl4s+kDjlcYlkacgvGP6xVTvtuo18poKV1IAIIOWl08etIdLp2ZmiK0B0Emc2iEpGCQPre9wUIGso8hJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkcvXEXE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkcvXEXE"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7104f93a20eso218636b3a.1
        for <linux-m68k@vger.kernel.org>; Wed, 07 Aug 2024 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723059141; x=1723663941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiYJrU7+X4bx+vH+hxHNCP5i+W1ctYmru+pRUx3ejkw=;
        b=EkcvXEXEJjn4rA4mhH8n6FnVoZXvX/g3HSwGbPZ1JArvt0Zi6rYBf16mdWFRbilbDv
         +qPWt66iBpbMf0TZisyEu3bMGMTEsnyI+2rlk5s5fOWHOeHOa81cgrnSRTB1SVV1s9X3
         4ceXf7sNUm+Fg9A+pKr7KlUDz2uRbRzI0poL1LrqKVaqICWARhl4V/tHkDUlXqbhHhga
         hu/kGsCZNy2AE3b/+KMPh+gBYX0SrAzcO9128YHQdPME52uTPGhbLUkOMIwmzc3KLf1J
         rYrf05mqXbEbLdOGOGL/d/pLMUDFJOMerLlvssrr4ngY6kJyLX+jQmR5A9LoOded6i/R
         uk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723059141; x=1723663941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiYJrU7+X4bx+vH+hxHNCP5i+W1ctYmru+pRUx3ejkw=;
        b=X7lpL1Bl0WB/vHiRoosNKhwCCreM3kMgg7Ny7phfwK32YyJS8SDTClW/+oT4kNZUZC
         mGHQbyBitsCzX88iuQtM4H+OQycGmy09vRDIQl9B/lt1m5BXZXJtmoiCxLoxLu99gjth
         XOid58FOAnF0+UXhRI5bumJRlmOxGfgLxwhOpAACMwf0HbW0GiuBPal313LSv3dGYTIB
         hNCjf5thMjPMo7skmbd3qTZ9BOklkyu5ssMs7g94HHYnFKueBAXJzaNtmCsif+Vrdfdm
         vCyl64QKpA0S8VnqtsA+G2HQLsjN8wT3WXtVTKt/9yid/yERh1KlYyOho7N2C+O2JE7v
         l74w==
X-Gm-Message-State: AOJu0YxPtQgpiE0AHgO4zhOpH9lVBUWBPvO3IA3hdx3TOZxZpQz6y4f1
	1jeYnKxBVqtyjpfOkCtdIbz4gtdbq9joWrwR4Maf8KMiRZSY3zJyUnCSTw==
X-Google-Smtp-Source: AGHT+IHksdiQ+cIG/Bf0q+i+tpV4+1S2xDiGlV5COHVyLEfgeS71AYxBXOXkTDS5/fXjkrAVGEWkeg==
X-Received: by 2002:a05:6a20:564f:b0:1c6:fa87:774b with SMTP id adf61e73a8af0-1c6fa87794amr170574637.39.1723059140810;
        Wed, 07 Aug 2024 12:32:20 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:6141:468:b3ab:b10c? ([2001:df0:0:200c:6141:468:b3ab:b10c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20062bbe526sm69134685ad.145.2024.08.07.12.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 12:32:20 -0700 (PDT)
Message-ID: <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
Date: Thu, 8 Aug 2024 07:32:34 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

thanks for (inadvertently) proving this bug in __clear_user() does exist!

I'm afraid I've lost track of where we're at with this patch series. 
Does it need more work, or more bug reports such as the one below? The 
previous bug reports might be considered somewhat contrived but this 
one's from 'real' user space code, and none too complex at that?

Cheers,

     Michael

On 7/08/24 20:14, Finn Thain wrote:
> On Mon, 29 Apr 2024, Michael Schmitz wrote:
>
>> As mentioned by Finn Thain in his patch to improve put_user
>> exception handling on 040, a similar problem exists on 030
>> processors.
>>
>> A moves instruction that crosses a page boundary from a
>> mapped page into an unmapped one will cause a mid-instruction
>> bus error exception (frame format b), with the PC pointing
>> (usually) two instructions past the faulting movesl instruction.
>>
>> Our exception handling in __generic_copy_to_user only covers
>> the instruction immediately following the faulting one. As
>> a result, fixup_exception in send_fault_sig does not detect
>> this case, and cause send_fault_sig to oops.
>>
>> Extend the exception table to cover one additional instruction
>> beyond the moves[lwb] instructions.
>>
>> Tested on 68030 (Atari Falcon 030) with transfers beginning
>> at one to six bytes offset from the end of a mapped page,
>> followed by further bytes on an unmapped page (testcase
>> derived from stress-ng sysbadaddr stressor by Finn Thain).
>>
>> Tested on 68040 (Mac Quadra) and 68030 (Mac IIci) by Finn Thain.
>>
>> A similar problem is present in __clear_user(); modify the
>> exception table for that function in the same way (tested by
>> Finn Thain).
>>
> Well, that __clear_user() bug is no longer theoretical. I accidentally
> bumped into it when I sent a ^C to a shell script I wrote to test some
> mac_scsi driver patches...
>
>
> [    0.000000] Linux version 6.10.0-mac-00011-gd1d490afeb2a (fthain@nippy) (m68k-unknown-linux-musl-gcc (Gentoo 13.2.1_p20240210 p14) 13.2.1 20240210, GNU ld (Gentoo 2.40 p7) 2.40.0) #39 Sat Aug  3 19:57:43 AEST 2024
>
> ...
>
> root@(none):/# bash scsi-test.sh /dev/sda5
> bs=512k count=1
> [  130.090000] sd 0:0:0:0: [sda] tag#9 PDMA fixup: DRQ timeout
> [  130.090000] sd 0:0:0:0: [sda] tag#9 switching to slow handshake
> [  130.180000] sd 0:0:0:0: Power-on or device reset occurred
> 1+0 records in
> 1+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 5.13732 s, 102 kB/s
> [  136.030000] bash (57): drop_caches: 3
> ^C
> root@(none):/# bash scsi-test.sh /dev/sdb5
> bs=512k count=1
> 1+0 records in
> 1+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.1273 s, 465 kB/s
> [  160.440000] bash (61): drop_caches: 3
> 1+0 records in
> 1+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.12763 s, 465 kB/s
> [  171.920000] bash (61): drop_caches: 3
>
> bs=64k count=8
> 8+0 records in
> 8+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.03469 s, 507 kB/s
> [  184.480000] bash (61): drop_caches: 3
> 8+0 records in
> 8+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.03221 s, 508 kB/s
> [  196.340000] bash (61): drop_caches: 3
>
> bs=4k count=128
> 128+0 records in
> 128+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.13089 s, 464 kB/s
> [  208.860000] bash (61): drop_caches: 3
> 128+0 records in
> 128+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.13089 s, 464 kB/s
> [  220.850000] bash (61): drop_caches: 3
>
> bs=512 count=1k
> 1024+0 records in
> 1024+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 3.69678 s, 142 kB/s
> [  236.020000] bash (61): drop_caches: 3
> 1024+0 records in
> 1024+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 3.68874 s, 142 kB/s
> [  250.570000] bash (61): drop_caches: 3
>
> bs=512k count=1
> 1+0 records in
> 1+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.12338 s, 467 kB/s
> [  263.120000] bash (61): drop_caches: 3
> 1+0 records in
> 1+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.12665 s, 465 kB/s
> [  275.110000] bash (61): drop_caches: 3
>
> bs=64k count=8
> 8+0 records in
> 8+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.08861 s, 482 kB/s
> [  287.610000] bash (61): drop_caches: 3
> 8+0 records in
> 8+0 records out
> 524288 bytes (524 kB, 512 KiB) copied, 1.03319 s, 507 kB/s
> [  299.510000] bash (61): drop_caches: 3
> ^C[  303.190000] Unable to handle kernel access at virtual address d7d17fd7
> [  303.200000] Oops: 00000000
> [  303.210000] Modules linked in:
> [  303.220000] PC: [<004301fe>] __clear_user+0x22/0x40
> [  303.240000] SR: 2000  SP: 4841d159  a2: 00b78590
> [  303.250000] d0: 000003ab    d1: 00000000    d2: 00000000    d3: 8000c150
> [  303.260000] d4: 00002000    d5: 00000000    a0: 8000c154    a1: 009bdb3c
> [  303.280000] Process cmp (pid: 92, task=7d95deea)
> [  303.290000] Frame format=B ssw=0709 isc=0801 isb=0001 daddr=8000c150 dobuf=00000000
> [  303.310000] baddr=00430202 dibuf=8000c150 ver=f
> [  303.320000] Stack from 0149de8c:
> [  303.320000]         8001c2c4 0149deb8 00139904 8000c150 00000eb0 00983c00 00000000 00000003
> [  303.320000]         00000003 8000bf00 00983a00 0149df40 0013a1fa 00912480 8000bf00 00983c60
> [  303.320000]         00000003 00000012 00000000 fffffff8 00000006 d012f728 00000000 00983a5a
> [  303.320000]         00000004 00983a00 000579d4 0052b7e8 009125a0 00912480 00983a5a 80000034
> [  303.320000]         000d1704 014994c0 80008864 80000000 00000000 80008864 80008864 00000000
> [  303.320000]         01497800 00000000 00000034 fffffff8 fffffff8 0149df7c 000e9296 00983a00
> [  303.380000] Call Trace: [<00139904>] elf_load+0x192/0x1da
> [  303.390000]  [<0013a1fa>] load_elf_binary+0x8ae/0xe46
> [  303.400000]  [<000579d4>] try_module_get+0x0/0x48
> [  303.410000]  [<000d1704>] kfree+0x0/0x160
> [  303.420000]  [<000e9296>] bprm_execve+0x134/0x416
> [  303.430000]  [<000e9daa>] copy_string_kernel+0x0/0x184
> [  303.440000]  [<000e9fa4>] copy_strings+0x0/0x310
> [  303.460000]  [<000ea3f6>] do_execveat_common+0x142/0x1d2
> [  303.480000]  [<000eb128>] sys_execve+0x2a/0x36
> [  303.490000]  [<0000275e>] syscall+0x8/0xc
> [  303.510000]  [<0008c010>] do_read_cache_folio+0xde/0x2c8
> [  303.520000]
> [  303.520000] Code: 206e 0008 4282 4a80 6708 0e98 2800 5380 <66f8> 0801 0001 6704 0e58 2800 0801 0000 6704 0e10 2800 241f 4e5e 4e75 4e75 4e56
> [  303.560000] Disabling lock debugging due to kernel taint
>
> root@(none):/#
>
>
> Also, it appears that the patch Michael posted in this thread would have
> prevented that oops because the "jne 1b" at __clear_user+0x22 would have
> been found in the exception table.
