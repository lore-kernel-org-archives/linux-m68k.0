Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD1F9F8
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Jul 2024 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719812889; cv=none; b=e1aZZ7xNLoiTXuxq46gUdqEXrX2/dXXgNDk4utUlr1SjVuUbLk/bm7TQb7WvtNmgGkIXoo6+xlLRz/qdM3ZrJxWPt5WzlfJ6PMBGb948DsZLMy3aFITvZn9WNXuOLuYZbPdNClziCRwKigKRaHL8luUPlCk865pPDLQYNkwT8XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719812889; c=relaxed/simple;
	bh=fBwuJs+KnuC1zkxiBecu1dNssU02twc0YX/3EeWHE5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cy/ZOkeY54katVZx3qaVTkPHzYKPMMa7GYRt+x//HPS3gERqm8PKD69+wLif4LKKJPou4mFIRtgoR0MNW0WU0nbl91+JuLPce6VHkKXcyfR3jZnoCk0GCV8uDu+HCdBPDsPj6bYtHBZ1e7gzPiXhhSHwJ6Pjxwkv0NzUrfw/wD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=KEy79WPm; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="KEy79WPm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8901B1BF204;
	Mon,  1 Jul 2024 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719812878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OK42dxdGR6XKLz/jXWUcWkhjMUHE3gsKrqOhBvD0McY=;
	b=KEy79WPmbB57J9dSuI+/ui+IcVpFE09on/tG+YbSiMC68sXm8bB+XN0kquoASCI1Rm2yuP
	FGOnsl70ewjbqZD7pxT93Qi7swxWpoEdGW86mMzh8waw84hXxZSY2fDt/r2RQSd0j2ToxQ
	tgOHwjheFzdLN071xTTFOP75g9If0W7sBV+UQ1tZMmDTVpFW696R3EqGoldPf8ErJUBxRR
	AHy10J8Jc6aaVlyduacHVjjYHWAPrKLwXg+9QxA7wUMLm+efo1tPxQQjKA5Rxqp3l1S7yX
	uWZWA10Pzpdf/c3AOn+J2DH9/WT++JiRKbtGqky1S1eyf01oiHsSAsOrpS5KPA==
Message-ID: <62902808-d0ce-434a-9350-35bf5687e8cc@yoseli.org>
Date: Mon, 1 Jul 2024 07:47:54 +0200
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
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
 <b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Greg, Michael,

On 01/07/2024 00:35, Greg Ungerer wrote:
> Hi Michael,
> 
> On 28/6/24 17:48, Michael Schmitz wrote:
>> Jean-Michel,
>>
>> Am 28.06.2024 um 19:24 schrieb Jean-Michel Hautbois:
>>>> I forgot to take into account that libraries are loaded only the
>>>> binary starts executing. Can you print the same map dump in the exit
>>>> syscall code path? That ought to show all loaded libraries at that 
>>>> point.
>>>
>>> Thanks for your suggestion !
>>> I changed it a bit, and I added a call in do_exit() as suggested. When
>>> executing ls I get:
>>>
>>> bash-5.2# ls -l
>>> load_elf_binary: Dump memory for ls (31):
>>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>>> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>>>
>>> do_exit: Dump memory for ls (31):
>>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>>> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
>>> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
>>> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
>>> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
>>> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
>>> mmap: 60030000-60032000 rw-p 60030000 00:00 0
>>> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
>>> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
>>> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
>>> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
>>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>>> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
>>> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
>>> mmap: 700ca000-700ec000 rwxp 700ca000 00:00 0 [heap]
>>> mmap: bfc1e000-bfc40000 rw-p bffde000 00:00 0 [stack]
>>>
>>> When I call it a second time, I get:
>>>
>>> bash-5.2# ls -l
>>> load_elf_binary: Dump memory for ls (33):
>>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>>> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>>> do_exit: Dump memory for ls (33):
>>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>>> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
>>> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
>>> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
>>> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
>>> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
>>> mmap: 60030000-60032000 rw-p 60030000 00:00 0
>>> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
>>> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
>>> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
>>> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
>>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>>> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
>>> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
>>
>> No heap in this second call. Can you print mm->start_brk and mm->brk 
>> please?
>>
>> The process memory layout is a little unusual (I would have expected 
>> the binary to be mapped before the dynamic libraries, not after). Is 
>> that expected on Coldfire, Greg?
> 
> I am not entirely sure of the history behind the layouts. But for the 
> M547x family
> I have done most MMU work on this is typical. So like this:
> 
> # cat /proc/1/maps
> 60000000-60008000 r-xp 00000000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
> 60008000-6000a000 r--p 00006000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
> 6000a000-6000c000 rw-p 00008000 1f:00 550544     /lib/ld-uClibc-0.9.33.2.so
> 6000c000-6000e000 rw-p 00000000 00:00 0
> 60010000-60014000 r-xp 00000000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
> 60014000-60016000 r--p 00002000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
> 60016000-60018000 rw-p 00004000 1f:00 1194384    /lib/libcrypt-0.9.33.2.so
> 60018000-60028000 rw-p 00000000 00:00 0
> 60028000-60080000 r-xp 00000000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
> 60080000-60082000 r--p 00056000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
> 60082000-60084000 rw-p 00058000 1f:00 184160     /lib/libuClibc-0.9.33.2.so
> 60084000-60086000 rw-p 00000000 00:00 0
> 80000000-80004000 r-xp 00000000 1f:00 1882624    /bin/init
> 80004000-80006000 r--p 00002000 1f:00 1882624    /bin/init
> 80006000-80008000 rw-p 00004000 1f:00 1882624    /bin/init
> 80008000-8000a000 rwxp 00000000 00:00 0          [heap]
> bfdba000-bfddc000 rwxp 00000000 00:00 0          [stack]
> 
> The 0x60000000 library addresses are due to mmaping - and that is based 
> on the
> definition of TASK_UNMAPPED_BASE for ColdFire, from 
> arch/m68k/include/asm/processor.h
> 
>      /* This decides where the kernel will search for a free chunk of vm
>       * space during mmap's.
>       */
>      #ifdef CONFIG_MMU
>      #if defined(CONFIG_COLDFIRE)
>      #define TASK_UNMAPPED_BASE      0x60000000UL
> 
> 
> The application address range of 0x80000000 are baked in at link time:
> 
> $ m68k-linux-objdump --headers bin/init
> 
> init:     file format elf32-m68k
> 
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>    0 .interp       0000000d  80000114  80000114  00000114  2**0
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    1 .hash         00000170  80000124  80000124  00000124  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    2 .gnu.hash     000001b4  80000294  80000294  00000294  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    3 .dynsym       00000350  80000448  80000448  00000448  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    4 .dynstr       00000174  80000798  80000798  00000798  2**0
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    5 .rela.dyn     00000018  8000090c  8000090c  0000090c  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    6 .rela.plt     00000240  80000924  80000924  00000924  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>    7 .init         00000014  80000b64  80000b64  00000b64  2**1
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>    8 .plt          00000498  80000b78  80000b78  00000b78  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>    9 .text         00001258  80001010  80001010  00001010  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>   10 .fini         0000000e  80002268  80002268  00002268  2**1
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>   11 .rodata       00000257  80002276  80002276  00002276  2**0
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>   12 .eh_frame     00000004  800024d0  800024d0  000024d0  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>   13 .ctors        00000008  80005f30  80005f30  00003f30  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   14 .dtors        00000008  80005f38  80005f38  00003f38  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   15 .dynamic      000000c0  80005f40  80005f40  00003f40  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   16 .got          000000cc  80006000  80006000  00004000  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   17 .data         00000008  800060cc  800060cc  000040cc  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>   18 .bss          0000002c  800060d4  800060d4  000040d4  2**2
>                    ALLOC

In my case I have:
m68k-linux-objdump --headers ../buildroot/output/target/bin/bash

../buildroot/output/target/bin/bash:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .interp       0000000d  00000154  00000154  00000154  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   1 .note.ABI-tag 00000020  00000164  00000164  00000164  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   2 .hash         00002f74  00000184  00000184  00000184  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   3 .gnu.hash     00003180  000030f8  000030f8  000030f8  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   4 .dynsym       00007d40  00006278  00006278  00006278  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   5 .dynstr       0000771b  0000dfb8  0000dfb8  0000dfb8  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   6 .gnu.version  00000fa8  000156d4  000156d4  000156d4  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   7 .gnu.version_r 000000a0  0001667c  0001667c  0001667c  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   8 .rela.dyn     0000a788  0001671c  0001671c  0001671c  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   9 .rela.plt     00003624  00020ea4  00020ea4  00020ea4  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  10 .init         00000024  000244c8  000244c8  000244c8  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  11 .plt          00006c60  000244ec  000244ec  000244ec  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  12 .text         0006a008  0002b14c  0002b14c  0002b14c  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  13 .fini         00000018  00095154  00095154  00095154  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  14 .rodata       00016302  0009516c  0009516c  0009516c  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  15 .eh_frame_hdr 0000002c  000ab470  000ab470  000ab470  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  16 .eh_frame     000000e8  000ab49c  000ab49c  000ab49c  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  17 .init_array   00000004  000ad2a8  000ad2a8  000ad2a8  2**1
                   CONTENTS, ALLOC, LOAD, DATA
  18 .fini_array   00000004  000ad2ac  000ad2ac  000ad2ac  2**1
                   CONTENTS, ALLOC, LOAD, DATA
  19 .data.rel.ro  00000c40  000ad2b0  000ad2b0  000ad2b0  2**1
                   CONTENTS, ALLOC, LOAD, DATA
  20 .dynamic      00000110  000adef0  000adef0  000adef0  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  21 .got          000039d8  000ae000  000ae000  000ae000  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  22 .data         0000198c  000b19d8  000b19d8  000b19d8  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  23 .bss          000090b0  000b3364  000b3364  000b3364  2**2
                   ALLOC


> 
> I am not sure why JM's link has applications linked at 0x70000000.
> Is that a glibc thing?  My examples above are all based on uClibc.
> 
> While we are talking about link addresses, JM, can you tell me what
> your kernel is linked at?  For me it is from a base near 0 (well actually
> 128k offset, but there is some meaning to that address) which matches
> the physical DRAM which starts at address 0:
> 
> $ m68k-linux-objdump --headers linux/vmlinux
> 
> linux/vmlinux:     file format elf32-m68k
> 
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>    0 .text         002e1800  00020000  00020000  00002000  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>    1 .rodata       0003f398  00302000  00302000  002e4000  2**4
>                    CONTENTS, ALLOC, LOAD, DATA
> ...
> 
> 
> I know the 54418 typically has DRAM at a different physical offset
> (I think it is 0x40000000?), so wondering if the VM layout was
> adjusted in some way to cater for that difference?

The SDRAM is mapped at 0x40000000 yes.
In my case it is linked like this:
m68k-linux-objdump --headers vmlinux

vmlinux:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         00377ad0  41002000  41002000  00002000  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 .rodata       000e95c0  4137a000  4137a000  0037a000  2**4
                   CONTENTS, ALLOC, LOAD, DATA
   2 __ksymtab     00009e04  414635c0  414635c0  004635c0  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   3 __ksymtab_gpl 000079e0  4146d3c4  4146d3c4  0046d3c4  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   4 __ksymtab_strings 0001a88b  41474da4  41474da4  00474da4  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   5 __param       000004d8  4148f630  4148f630  0048f630  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   6 __modver      000000aa  4148fb08  4148fb08  0048fb08  2**1
                   CONTENTS, ALLOC, LOAD, DATA
   7 .notes        00000054  4148fbb4  4148fbb4  0048fbb4  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   8 .data         00091b70  41490000  41490000  00490000  2**4
                   CONTENTS, ALLOC, LOAD, DATA
   9 __ex_table    000014e8  41521b70  41521b70  00521b70  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
  10 .init.text    000121f4  41524000  41524000  00524000  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  11 .init.data    0000275c  415361f4  415361f4  005361f4  2**1
                   CONTENTS, ALLOC, LOAD, DATA
  12 .data..percpu 00000000  4153a000  4153a248  0053a248  2**0
                   CONTENTS, ALLOC, LOAD, DATA
  13 .m68k_fixup   00000248  4153a000  4153a000  0053a000  2**0
                   CONTENTS, ALLOC, LOAD, DATA
  14 .init.data    00001db8  4153a248  4153a248  0053a248  2**0
                   ALLOC
  15 .bss          00035098  4153c000  4153c000  0053a248  2**4
                   ALLOC
  16 .comment      00000035  00000000  00000000  0053a248  2**0
                   CONTENTS, READONLY

Thanks,
JM

> Regards
> Greg
> 
> 
> 
> 
> 
>> Cheers,
>>
>>      Michael
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
>>>  static bool ignore_rlimit_data;
>>>  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>>>
>>> +int dump_memory_map(struct task_struct *task)
>>> +{
>>> +    struct mm_struct *mm = task->mm;
>>> +    struct vm_area_struct *vma;
>>> +    struct file *file;
>>> +    struct path *path;
>>> +    char *buf;
>>> +    char *pathname;
>>> +
>>> +       if (!mm) {
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
>>> +    // Acquire the read lock for mmap_lock
>>> +    down_read(&mm->mmap_lock);
>>> +       mas_lock(&mas);
>>> +       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
>>> ULONG_MAX)) {
>>> +               char perms[5] = "---p"; // Default permissions
>>> +               // Set permissions based on vm_flags
>>> +               if (vma->vm_flags & VM_READ) perms[0] = 'r';
>>> +               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
>>> +               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
>>> +               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
>>> +
>>> +               if (vma->vm_file) { // If there's an associated file
>>> +                       buf = (char *)__get_free_page(GFP_KERNEL);
>>> +                       if (!buf) {
>>> +                               continue; // Handle memory allocation
>>> failure
>>> +                       }
>>> +
>>> +                       file = vma->vm_file;
>>> +                       path = &file->f_path;
>>> +                       pathname = d_path(path, buf, PAGE_SIZE);
>>> +                       if (IS_ERR(pathname)) {
>>> +                               pathname = NULL;
>>> +                       }
>>> +
>>> +                       // Print memory area information with file path
>>> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu 
>>> %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               MAJOR(file_inode(file)->i_rdev),
>>> +                               MINOR(file_inode(file)->i_rdev),
>>> +                               file_inode(file)->i_ino,
>>> +                               pathname ? pathname : "");
>>> +
>>> +                       free_page((unsigned long)buf);
>>> +               } else {
>>> +                       char *special_area_name = NULL;
>>> +
>>> +                       // Check for heap
>>> +                       if (vma->vm_end > mm->start_brk && vma->vm_start
>>> < mm->brk) {
>>> +                               special_area_name = "[heap]";
>>> +                       }
>>> +                       // Check for stack
>>> +                       else if (vma->vm_start <= mm->start_stack &&
>>> vma->vm_end >= mm->start_stack) {
>>> +                               special_area_name = "[stack]";
>>> +                       }
>>> +                       // Check for vdso
>>> +                       else if (vma->vm_flags & VM_EXEC &&
>>> vma->vm_flags & VM_READ && !vma->vm_file) {
>>> +                               special_area_name = "[vdso]";
>>> +                       }
>>> +
>>> +                       // Print memory area information without file 
>>> path
>>> +                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               special_area_name ? special_area_name :
>>> "    ");
>>> +               }
>>> +       }
>>> +       mas_unlock(&mas);
>>> +    // Release the read lock for mmap_lock
>>> +    up_read(&mm->mmap_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(dump_memory_map);
>>>
>>>
>>> Thanks,
>>> JM
