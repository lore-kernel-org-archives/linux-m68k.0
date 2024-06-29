Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681814A85
	for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719647839; cv=none; b=fl6eYicyG7w6QUIGFZrwFKdPnYkLWAWyDwHGCBAYcRQ3+ekwEqtS+Knf0zPtzhNNsYD+MFjVQWm00j8jvytZKwiba0512pEU5Fh/94A8mlKOiyPiziqfLsoHEB5KaVrPGlBvwj/0Lcv/gZd0mRom8vu3Nd9+iX/ZZ+JcvULTCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719647839; c=relaxed/simple;
	bh=Mvqv17jVnmDVmYcNDzHDmKB5pqV3uD4m7U8/tLhc0+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwRspsLRbFlji7IMkAKpQB4tnbE86et0psgApa2OdEz/I3TkciEvU6i5zsOPMP4vZnOkh4efoyfvD7c5rNOE4FpSAxQUNbjuk6RPk98MwSwM2z6aVrGFVpB2/C9q8jcwnlYnIBqOnmGvExTQxmQdlPRmMV+OOUAOLE3A33BkYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=nyKu3C+K; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="nyKu3C+K"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DAC3C0003;
	Sat, 29 Jun 2024 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719647829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysVS5eoipodhxp0yWJvyLHdCYOzU17l9nhE746MObXw=;
	b=nyKu3C+KVduIzmlkP6QCb2KosMRU11iB+4XshAircVwWv10j4O8TXJBP4TuGO20fZCDSWK
	I83/IW2yO7/Dkfw0sLS3++atYTCR3dOVap6IOGev8fC3+gD2T5MO3hnKaPueQc5lyOAB7v
	YOfHVvmP/MKN+6dV0bKegL2laxenBz3eyEynO3i7MoqxGTB70I0lCVpMlNLCJ67FYkZTwq
	gTWAuBwS31RF9mtcgYoX1zNLz29GE3Fy2W8gVNY4ZqwygBQHU0ESYyQCsAWVbEQY0L1A8b
	oAOCV/NMB2YDMF60DB6aa/sHtbAQLx96aVZcBW8B2XyvZUrsaJ5fcDCOCPQjTQ==
Message-ID: <e8a5ef3d-ce8a-492c-bf69-e161e043fed7@yoseli.org>
Date: Sat, 29 Jun 2024 09:57:08 +0200
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
 <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
 <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Michael,

On 29/06/2024 05:41, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 28.06.2024 um 23:25 schrieb Jean-Michel Hautbois:
>>>
>>> No heap in this second call. Can you print mm->start_brk and mm->brk
>>> please?
>>>
>>> The process memory layout is a little unusual (I would have expected
>>> the binary to be mapped before the dynamic libraries, not after). Is
>>> that expected on Coldfire, Greg?
>>>
>>
>> I did the test, and called ls twice to see what differs:
>> bash-5.2# ls -l > /dev/null
>> load_elf_binary: Dump memory for ls (31):
>> mmap: start_brk: 700ca000, brk: 700ca000
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
>> do_exit: Dump memory for ls (31):
>> mmap: start_brk: 700ca000, brk: 700ec000
> 
> ls managed to allocate heap space OK ...
> 
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
>> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
>> bash-5.2# ls -l > /dev/null
>> load_elf_binary: Dump memory for ls (33):
>> mmap: start_brk: 700ca000, brk: 700ca000
>> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
>> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
>> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
>> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
>> mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
>> do_exit: Dump memory for ls (33):
>> mmap: start_brk: 700ca000, brk: 700ca000
> 
> No heap space allocated here. I would have expected that to cause an 
> error message from libc ...
> 
> Can you print a brief meminfo summary such as found in fs/proc/meminfo.c 
> (total, free, available, buffer and cached for starters)?

I dumped using sysrq, before and after each ls:
bash-5.2# sysrq: Show Memory
Mem-Info:
active_anon:1 inactive_anon:39 isolated_anon:0
  active_file:0 inactive_file:223 isolated_file:0
  unevictable:0 dirty:0 writeback:0 

  slab_reclaimable:109 slab_unreclaimable:641 

  mapped:212 shmem:0 pagetables:3 

  sec_pagetables:0 bounce:0 

  kernel_misc_reclaimable:0 

  free:28227 free_pcp:200 free_cma:0
Node 0 active_anon:8kB inactive_anon:312kB active_file:0kB 
inactive_file:1784kB unevictable:0kB isolated(anon):0kB 
isolated(file):0kB mapped:1696kB dirty:0kB writeback:0kB shmem:0kB 
writeback_tmp:0kB kernel_stack:168kB pagetables:24kB s
ec_pagetables:0kB all_unreclaimable? no
DMA free:225816kB boost:0kB min:1952kB low:2440kB high:2928kB 
reserved_highatomic:0KB active_anon:8kB inactive_anon:312kB 
active_file:0kB inactive_file:1784kB unevictable:0kB writepending:0kB 
present:262144kB managed:238752kB mlocked:0k
B bounce:0kB free_pcp:1600kB local_pcp:1600kB free_cma:0kB
lowmem_reserve[]: 0 0 0
DMA: 3*8kB (UME) 0*16kB 2*32kB (UM) 1*64kB (M) 1*128kB (U) 1*256kB (U) 
2*512kB (UM) 1*1024kB (E) 3*2048kB (UME) 3*4096kB (UME) 25*8192kB (M) = 
225816kB
230 total pagecache pages
0 pages in swap cache
Free swap  = 0kB
Total swap = 0kB
32768 pages RAM
0 pages HighMem/MovableOnly
2924 pages reserved

bash-5.2# ls -l > /dev/null
load_elf_binary: Dump memory for ls (31):
mmap: start_brk: 700ca000, brk: 700ca000
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bfb18000-bfb3a000 rw-p bffde000 00:00 0 [stack]
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
mmap: bfb18000-bfb3a000 rw-p bffde000 00:00 0 [stack]
bash-5.2# sysrq: Show Memory
Mem-Info:
active_anon:0 inactive_anon:47 isolated_anon:0
  active_file:83 inactive_file:197 isolated_file:0 

  unevictable:0 dirty:0 writeback:0 

  slab_reclaimable:110 slab_unreclaimable:650 

  mapped:219 shmem:0 pagetables:3 

  sec_pagetables:0 bounce:0 

  kernel_misc_reclaimable:0
  free:28206 free_pcp:160 free_cma:0
Node 0 active_anon:0kB inactive_anon:376kB active_file:664kB 
inactive_file:1576kB unevictable:0kB isolated(anon):0kB 
isolated(file):0kB mapped:1752kB dirty:0kB writeback:0kB shmem:0kB 
writeback_tmp:0kB kernel_stack:168kB pagetables:24kB
  sec_pagetables:0kB all_unreclaimable? no
DMA free:225648kB boost:0kB min:1952kB low:2440kB high:2928kB 
reserved_highatomic:0KB active_anon:0kB inactive_anon:376kB 
active_file:664kB inactive_file:1576kB unevictable:0kB writepending:0kB 
present:262144kB managed:238752kB mlocked:
0kB bounce:0kB free_pcp:1280kB local_pcp:1280kB free_cma:0kB
lowmem_reserve[]: 0 0 0
DMA: 2*8kB (UE) 0*16kB 1*32kB (U) 1*64kB (M) 2*128kB (UM) 2*256kB (UM) 
1*512kB (U) 1*1024kB (E) 3*2048kB (UME) 3*4096kB (UME) 25*8192kB (M) = 
225648kB
280 total pagecache pages
0 pages in swap cache
Free swap  = 0kB
Total swap = 0kB
32768 pages RAM
0 pages HighMem/MovableOnly
2924 pages reserved

bash-5.2# ls -l > /dev/null
load_elf_binary: Dump memory for ls (33):
mmap: start_brk: 700ca000, brk: 700ca000
mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
mmap: bf89e000-bf8c0000 rw-p bffde000 00:00 0 [stack]
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
mmap: bf89e000-bf8c0000 rw-p bffde000 00:00 0 [stack]
bash-5.2# sysrq: Show Memory
Mem-Info:
active_anon:0 inactive_anon:47 isolated_anon:0
  active_file:196 inactive_file:84 isolated_file:0
  unevictable:0 dirty:0 writeback:0
  slab_reclaimable:110 slab_unreclaimable:650
  mapped:219 shmem:0 pagetables:3
  sec_pagetables:0 bounce:0
  kernel_misc_reclaimable:0
  free:28206 free_pcp:159 free_cma:0
Node 0 active_anon:0kB inactive_anon:376kB active_file:1568kB 
inactive_file:672kB unevictable:0kB isolated(anon):0kB 
isolated(file):0kB mapped:1752kB dirty:0kB writeback:0kB shmem:0kB 
writeback_tmp:0kB kernel_stack:176kB pagetables:24kB
  sec_pagetables:0kB all_unreclaimable? no
DMA free:225648kB boost:0kB min:1952kB low:2440kB high:2928kB 
reserved_highatomic:0KB active_anon:0kB inactive_anon:376kB 
active_file:1568kB inactive_file:672kB unevictable:0kB writepending:0kB 
present:262144kB managed:238752kB mlocked:
0kB bounce:0kB free_pcp:1272kB local_pcp:1272kB free_cma:0kB
lowmem_reserve[]: 0 0 0
DMA: 2*8kB (UE) 0*16kB 1*32kB (U) 1*64kB (M) 2*128kB (UM) 2*256kB (UM) 
1*512kB (U) 1*1024kB (E) 3*2048kB (UME) 3*4096kB (UME) 25*8192kB (M) = 
225648kB
280 total pagecache pages
0 pages in swap cache
Free swap  = 0kB
Total swap = 0kB
32768 pages RAM
0 pages HighMem/MovableOnly
2924 pages reserved

JM
