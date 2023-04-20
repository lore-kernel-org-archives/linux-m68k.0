Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4141C6FD18
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 00:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjDTAzL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Apr 2023 20:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjDTAzK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Apr 2023 20:55:10 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A7E10E2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 17:55:08 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51fdc1a1270so279636a12.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 17:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681952107; x=1684544107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBJT93oz2K/kEznnv9D2/HJSfX8TO4PebVoxInTUD9w=;
        b=Qoz8RDPxjGG+2szxyjQEyhBfH5K437eQ/M/ZtDpR23f8I3srZehLSqXDmHLBWPTNHT
         hgkqMmGa7h+4kbML4n1BM5Q5SbYs5d7Wb5z1O4CsFCiNUU6LWbYkzZ9eBapYbuz4cktr
         iDxD3I9laHxNTcRXVgvGq33SHI2dqGXxRjkluYtFrJaN3eJxcKtliwhRy611ned5UCuD
         jVRgs5a60RRCjw2oh/MdbwgjyEgItODk8BZ2TtaRHEm+zFlIwl4ASDbEABzUFdBwksFt
         4N61t+0QwgfpDTw6viHpwau9rDGnrZNquJNjfnZatGyLD426nD9qDytdnCuV64+Q3EC2
         zrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681952107; x=1684544107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBJT93oz2K/kEznnv9D2/HJSfX8TO4PebVoxInTUD9w=;
        b=YFtLvBrWLoQMEsQu+a/m9nSwH2iwhf8BDk55wKKKctERgUb8xyxn2oHQrQyR8q+8bM
         jpx16ZopBgHsiIbWHn2pJQjejGc9YtQf3ndV2hTn9WrHRwsgWcIebWfesLrbY7pnCwIn
         G6WMvpLd9NvPvjuMuOrr0+3YX47iDmbgaoHNABc3zjTi8H44hbAirQhKvfqeT5Fjb/EK
         mjppWgrJNwD14HhUIrhI7QGg8eebsegTu/fGTMvVSMAAE17rNScplV8hPv9Lxck56zvh
         5p5JGl8qcjtriCDCUaiFNdoSnoV0LhsdLrLHp25KVnTWUz7EAF8ic5AKgRKQhojxsSPb
         CuHQ==
X-Gm-Message-State: AAQBX9flpRtl6BthGT8k7gGPv3qIlHWRU7xJvE9BlC6FEe1ez6X7s/fM
        PiAs9sIv0b1losao/sEb/lY=
X-Google-Smtp-Source: AKy350YXR0daYs44+gKIdftD6lJ9nrp3by7CsxEzmnsGxbJytrPpf1tOElq904ZDhfl9Tj/KqDwBfw==
X-Received: by 2002:a17:90a:f48c:b0:246:b4b4:555f with SMTP id bx12-20020a17090af48c00b00246b4b4555fmr4514294pjb.7.1681952107246;
        Wed, 19 Apr 2023 17:55:07 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:d501:7e49:b002:d30d? ([2001:df0:0:200c:d501:7e49:b002:d30d])
        by smtp.gmail.com with ESMTPSA id n2-20020a17090a4e0200b00246774a9addsm1868907pjh.48.2023.04.19.17.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:55:06 -0700 (PDT)
Message-ID: <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
Date:   Thu, 20 Apr 2023 12:55:01 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 19/04/23 22:50, Finn Thain wrote:
> On Tue, 18 Apr 2023, Michael Schmitz wrote:
>
>> ... I think what's stored there is the extra frame content for a format
>> b bus error frame. But that extra frame is incomplete at best (should be
>> 22 longwords, only a4 are seen). Probably overwritten by the stack frame
>> from __GI___wait4_time64.
>>
>> Let's parse what's left:
>> <=
>>>>> 0xefffefe4:     0xc0028780		<= internal registers (6x)
>>>>> 0xefffefe0:     0x3c344bfb		<=
>>>>> 0xefffefdc:     0x000af353		<=
>>>>> 0xefffefd8:     0x3c340170		<= internal reg; version no.
>>>>> 0xefffefd4:     0x00000000		<= data input buffer
>>>>> 0xefffefd0:     0xc00e417c		<= internal registers (2x)
>>>>> 0xefffefcc:     0xc00e417e		<= stage b address
>>>>> 0xefffefc8:     0xc00e4180		<= internal registers (4x)
>>>>> 0xefffefc4:     0x48e73c34		<=
>>>>> 0xefffefc0:     0x00000000		<= data output buffer
>>>>> 0xefffefbc:     0xefffeff8		<= internal registers (2x)
>>>>> 0xefffefb8:     0xefffeffc		<= data fault address
>>>>> 0xefffefb4:     0x4bfb0170		<= ins stage c, stage b
>>>>> 0xefffefb0:     0x0eee0709		<= internal register; ssw
>> The fault address is the location on the stack where a2 is saved. That
>> does match the data output buffer contents BTW. fc, fb, rc, rb bits
>> clear means the fault didn't occur in stage b or c instructions. ssw bit
>> 8 set indicates a data fault - the data cycle should be rerun on rte. rm
>> and rw bits clear tell us it's a write fault. If the moveml instruction
>> copies registers to the stack in descending order, the fault address
>> makes sense - the stack pointer just crossed a page boundary.
>>
> Inspired by your observation about the page fault and stack growth, I
> wrote a small test program (given below) that just pushes registers onto
> the stack recursively while forking processes and collecting the SIGCHLD
> signals.
>
> On a Motorola '030 the stack grows to about 7 MiB before it gets
> corrupted. The program detects the stack corruption and terminates
> immediately with an illegal instruction. Oddly, the program never detects
> any stack corruption when run on the QEMU '040.

That's great - finally irrefutable confirmation that we're onto a kernel 
bug.

>
> root@debian:~# ./movem
> Illegal instruction
> root@debian:~# ulimit -a
> real-time non-blocking time  (microseconds, -R) unlimited
> core file size              (blocks, -c) 0
> data seg size               (kbytes, -d) unlimited
> scheduling priority                 (-e) 0
> file size                   (blocks, -f) unlimited
> pending signals                     (-i) 242
> max locked memory           (kbytes, -l) 8192
> max memory size             (kbytes, -m) unlimited
> open files                          (-n) 1024
> pipe size                (512 bytes, -p) 8
> POSIX message queues         (bytes, -q) 819200
> real-time priority                  (-r) 0
> stack size                  (kbytes, -s) 8192
> cpu time                   (seconds, -t) unlimited
> max user processes                  (-u) 242
> virtual memory              (kbytes, -v) unlimited
> file locks                          (-x) unlimited
> root@debian:~# ulimit -s 7200
> root@debian:~# ./movem
> Illegal instruction
> root@debian:~# ulimit -s 7000
> root@debian:~# ./movem
> Segmentation fault
> root@debian:~# ulimit -s 16384
> root@debian:~# ./movem
> Illegal instruction
> root@debian:~#
>
> Looking at the core dump in gdb, the backtrace has 189869 frames. The dead
> stack frames confirm the recursion depth reached the limit I set at 200000
> before the stack began to reduce again. This was also confirmed by the
> lowest page fault address that was logged by the custom kernel.
>
> That means validation succeeded 200000 - 189869 == 10131 times before it
> encountered corruption (I should try to figure out whether this varies).
>
> The registers %a2, %a3 and %a4 below should contain 0x91929394, 0xa1a2a3a4
> and 0xb1b2b3b4 respectively. But they don't. Their values were restored
> from a corrupted stack by the returning rec() function call.
>
> (gdb) info reg
> d0             0x91929394          -1852664940
> d1             0xf3                243
> d2             0xd1d2d3d4          -774712364
> d3             0xe1e2e3e4          -505224220
> d4             0xf1f2f3f4          -235736076
> d5             0x80003f0c          -2147467508
> d6             0xd014c528          -803945176
> d7             0x0                 0
> a0             0xc0021708          0xc0021708
> a1             0xc0023e8c          0xc0023e8c <__stack_chk_guard>
> a2             0xf3                0xf3
> a3             0x1464000           0x1464000
> a4             0xef97bf44          0xef97bf44
> a5             0xc1c2c3c4          0xc1c2c3c4
> fp             0xef97b034          0xef97b034
> sp             0xef97b018          0xef97b018
> ps             0x8                 [ N ]
> pc             0x800005f6          0x800005f6 <rec+262>
> fpcontrol      0x0                 0
> fpstatus       0x0                 0
> fpiaddr        0x0                 0x0
>
> (gdb) x/z $sp - 36
> 0xef97aff4:     0xd1d2d3d4
> (gdb)
> 0xef97aff8:     0xe1e2e3e4
> (gdb)
> 0xef97affc:     0xf1f2f3f4
> (gdb)
> 0xef97b000:     0x000000f3
> (gdb)
> 0xef97b004:     0x01464000
> (gdb)
> 0xef97b008:     0xef97bf44
> (gdb)
> 0xef97b00c:     0xc1c2c3c4
> (gdb)
> 0xef97b010:     0xef97b034
> (gdb)
> 0xef97b014:     0x8000055c
>
> As with dash, the corruption lies the page boundary.

Hence implies a page fault handled at the page boundary.

Can you try and fault in as many of these stack pages as possible, ahead 
of filling the stack? (Depending on how much RAM you have ...). Maybe we 
would need to lock those pages into memory? Just to show that with no 
page faults (but still signals) there is no corruption?

> Any signal frames or exception frames have been completely overwritten
> because the recursion continued after the corruption took place. So
> there's not much to see in the core dump.

We'd need a way to stop recursion once the first corruption has taken 
place. If the 'safe' recursion depth of 10131 is constant, the dump 
taken at that point should look similar to what you saw in dash 
(assuming it is the page fault and subsequent signal return that causes 
the corruption).

I'll give your test case a spin on my Falcon. I should also have a range 
of kernels to test and answer Geert's question...

Cheers,

     Michael



>
> (gdb) disass rec
> Dump of assembler code for function rec:
>     0x800004f0 <+0>:     linkw %fp,#0
>     0x800004f4 <+4>:     moveml %d2-%d4/%a2-%a5,%sp@-
>     0x800004f8 <+8>:     moveal 0x80000672 <i0>,%a2
>     0x800004fe <+14>:    moveal 0x80000676 <i1>,%a3
>     0x80000504 <+20>:    moveal 0x8000067a <i2>,%a4
>     0x8000050a <+26>:    moveal 0x8000067e <i3>,%a5
>     0x80000510 <+32>:    movel 0x80000682 <i4>,%d2
>     0x80000516 <+38>:    movel 0x80000686 <i5>,%d3
>     0x8000051c <+44>:    movel 0x8000068a <i6>,%d4
>     0x80000522 <+50>:    movel 0x80004034 <depth>,%d0
>     0x80000528 <+56>:    andil #2047,%d0
>     0x8000052e <+62>:    bnes 0x80000542 <rec+82>
>     0x80000530 <+64>:    jsr 0x8000042c <fork@plt>
>     0x80000536 <+70>:    tstl %d0
>     0x80000538 <+72>:    bnes 0x80000542 <rec+82>
>     0x8000053a <+74>:    clrl %sp@-
>     0x8000053c <+76>:    jsr 0x80000404 <exit@plt>
>     0x80000542 <+82>:    movel 0x80004034 <depth>,%d0
>     0x80000548 <+88>:    subql #1,%d0
>     0x8000054a <+90>:    movel %d0,0x80004034 <depth>
>     0x80000550 <+96>:    movel 0x80004034 <depth>,%d0
>     0x80000556 <+102>:   beqs 0x8000055c <rec+108>
>     0x80000558 <+104>:   jsr %pc@(0x800004f0 <rec>)
>     0x8000055c <+108>:   movel %a2,0x8000403c <o0>
>     0x80000562 <+114>:   movel %a3,0x80004040 <o1>
>     0x80000568 <+120>:   movel %a4,0x80004044 <o2>
>     0x8000056e <+126>:   movel %a5,0x80004048 <o3>
>     0x80000574 <+132>:   movel %d2,0x8000404c <o4>
>     0x8000057a <+138>:   movel %d3,0x80004050 <o5>
>     0x80000580 <+144>:   movel %d4,0x80004054 <o6>
>     0x80000586 <+150>:   movel 0x8000403c <o0>,%d1
>     0x8000058c <+156>:   movel #-1852664940,%d0
>     0x80000592 <+162>:   cmpl %d1,%d0
>     0x80000594 <+164>:   bnes 0x800005f6 <rec+262>
>     0x80000596 <+166>:   movel 0x80004040 <o1>,%d1
>     0x8000059c <+172>:   movel #-1583176796,%d0
>     0x800005a2 <+178>:   cmpl %d1,%d0
>     0x800005a4 <+180>:   bnes 0x800005f6 <rec+262>
>     0x800005a6 <+182>:   movel 0x80004044 <o2>,%d1
>     0x800005ac <+188>:   movel #-1313688652,%d0
>     0x800005b2 <+194>:   cmpl %d1,%d0
>     0x800005b4 <+196>:   bnes 0x800005f6 <rec+262>
>     0x800005b6 <+198>:   movel 0x80004048 <o3>,%d1
>     0x800005bc <+204>:   movel #-1044200508,%d0
>     0x800005c2 <+210>:   cmpl %d1,%d0
>     0x800005c4 <+212>:   bnes 0x800005f6 <rec+262>
>     0x800005c6 <+214>:   movel 0x8000404c <o4>,%d1
>     0x800005cc <+220>:   movel #-774712364,%d0
>     0x800005d2 <+226>:   cmpl %d1,%d0
>     0x800005d4 <+228>:   bnes 0x800005f6 <rec+262>
>     0x800005d6 <+230>:   movel 0x80004050 <o5>,%d1
>     0x800005dc <+236>:   movel #-505224220,%d0
>     0x800005e2 <+242>:   cmpl %d1,%d0
>     0x800005e4 <+244>:   bnes 0x800005f6 <rec+262>
>     0x800005e6 <+246>:   movel 0x80004054 <o6>,%d1
>     0x800005ec <+252>:   movel #-235736076,%d0
>     0x800005f2 <+258>:   cmpl %d1,%d0
>     0x800005f4 <+260>:   beqs 0x800005f8 <rec+264>
> => 0x800005f6 <+262>:   illegal
>     0x800005f8 <+264>:   nop
>     0x800005fa <+266>:   moveml %fp@(-28),%d2-%d4/%a2-%a5
>     0x80000600 <+272>:   unlk %fp
>     0x80000602 <+274>:   rts
> End of assembler dump.
>
> ---
>
> #include <stdlib.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <signal.h>
> #include <string.h>
>
> int depth = 200000;
>
> const unsigned long i0 = 0x91929394;
> const unsigned long i1 = 0xa1a2a3a4;
> const unsigned long i2 = 0xb1b2b3b4;
> const unsigned long i3 = 0xc1c2c3c4;
> const unsigned long i4 = 0xd1d2d3d4;
> const unsigned long i5 = 0xe1e2e3e4;
> const unsigned long i6 = 0xf1f2f3f4;
>
> unsigned long o0;
> unsigned long o1;
> unsigned long o2;
> unsigned long o3;
> unsigned long o4;
> unsigned long o5;
> unsigned long o6;
>
> static void rec(void)
> {
> 	// initialize registers
> 	asm(	"	move.l %0, %%a2\n"
> 		"	move.l %1, %%a3\n"
> 		"	move.l %2, %%a4\n"
> 		"	move.l %3, %%a5\n"
> 		"	move.l %4, %%d2\n"
> 		"	move.l %5, %%d3\n"
> 		"	move.l %6, %%d4\n"
> 		:
> 		: "m" (i0), "m" (i1), "m" (i2),
> 		  "m" (i3), "m" (i4), "m" (i5), "m" (i6)
> 		: "a2", "a3", "a4", "a5", "d2", "d3", "d4"
> 	);
>
> 	// maybe fork a short-lived process
> 	if ((depth & 0x7ff) == 0)
> 		if (fork() == 0)
> 			exit(0);
>
> 	if (--depth)
> 		rec();	// callee to save & restore registers
>
> 	// compare register contents
> 	asm(	"	move.l %%a2, %0\n"
> 		"	move.l %%a3, %1\n"
> 		"	move.l %%a4, %2\n"
> 		"	move.l %%a5, %3\n"
> 		"	move.l %%d2, %4\n"
> 		"	move.l %%d3, %5\n"
> 		"	move.l %%d4, %6\n"
> 		: "=m" (o0), "=m" (o1), "=m" (o2),
> 		  "=m" (o3), "=m" (o4), "=m" (o5), "=m" (o6)
> 		:
> 		:
> 	);
> 	if (o0 != i0 || o1 != i1 || o2 != i2 ||
> 	    o3 != i3 || o4 != i4 || o5 != i5 || o6 != i6)
> 		asm("illegal");
> }
>
> static void handler(int)
> {
> }
>
> int main(void)
> {
> 	struct sigaction act;
>
> 	memset(&act, 0, sizeof(act));
> 	act.sa_handler = handler;
> 	sigaction(SIGCHLD, &act, NULL);
>
> 	rec();
> }
