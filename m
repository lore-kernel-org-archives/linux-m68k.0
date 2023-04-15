Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC1FC7619A
	for <linux-m68k@archiver.kernel.org>; Sat, 15 Apr 2023 15:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjDOPuS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 15 Apr 2023 11:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDOPuQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 15 Apr 2023 11:50:16 -0400
Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90812D59
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Apr 2023 08:50:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter2.welho.com (Postfix) with ESMTP id 171CC417D5;
        Sat, 15 Apr 2023 18:50:11 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
        by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
        with ESMTP id pDXO0hk6XWZo; Sat, 15 Apr 2023 18:50:10 +0300 (EEST)
Received: from [192.168.0.20] (89-27-47-90.bb.dnainternet.fi [89.27.47.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp2.welho.com (Postfix) with ESMTPSA id 69733287;
        Sat, 15 Apr 2023 18:50:08 +0300 (EEST)
Message-ID: <eb1e55b6-7633-6100-667d-88029433e4c6@helsinkinet.fi>
Date:   Sat, 15 Apr 2023 18:50:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: instrumentation, was Re: core dump analysis
To:     debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
 <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
 <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
 <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
 <13a69c91-ca2b-42d8-dbd5-0b81e76044c6@gmail.com>
 <304e5c81-4e51-6c16-28d0-be48bf86a564@helsinkinet.fi>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <304e5c81-4e51-6c16-28d0-be48bf86a564@helsinkinet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 13.4.2023 2.22, Eero Tamminen wrote:
> On 11.4.2023 11.24, Michael Schmitz wrote:
>> Am 11.04.2023 um 19:19 schrieb Geert Uytterhoeven:
>>> On Tue, Apr 11, 2023 at 6:56 AM Michael Schmitz <schmitzmic@gmail.com>
>>>> Am 11.04.2023 um 12:20 schrieb Finn Thain:
>>>>> A better solution might be be to port the existing instrumentation 
>>>>> like
>>>>> ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder
>>>>> how portable that stuff is.
> 
> Another possibility is just using manually added kernel tracepoints:
> https://www.kernel.org/doc/html/latest/trace/tracepoints.html
> 
> "git grep TRACE_EVENT" did not given any hits for arch/m68k/ though.
> 
> (I don't think those need any particular architecture support. One just 
> adds them to locations where it makes sense to trace activity that is 
> important, but which does not happen too often for the very small 
> overhead from disabled static trace point to be significant.)
> 
> 
>> Looking at a few arch implementations, I'm utterly confused. Wouldn't 
>> know where to start.
> 
> Good article: https://lwn.net/Articles/132196/
> 
> (Ignore jprobes stuff as that's deprecated.)
> 
> 
> Because probe replaces instruction at the probe point with a breakpoint:
> https://www.kernel.org/doc/html/latest/trace/kprobes.html#how-does-a-kprobe-work
> 
> It needs architecture specific code to decode and simulate the replaced 
> instruction (its side-effects) when it is later executed "out-of-line".
> 
> This also causes architecture specific limitations on where the probe 
> can be set.  Architecture may not support simulating all possible 
> instructions, just the most common ones (e.g. ones typically used on 
> function entry and exit points).

These are the kernel symbol entry point instructions that get executed 
when booting Atari Falcon from IDE (using emulator LILO) to Busybox init:
    4524 link.w
       4 movea.l
       3 move.l
       3 clr.l
       2 movem.l
       2 dc.w
       2 btst.b
       1 subq.l
       1 ori.w
       1 move.w
       1 lea.l
       1 jsr
       1 bra.b

For Linus' 6.2 kernel built with this config:
https://git.tuxfamily.org/hatari/hatari.git/tree/tools/linux/kernel.config

Using "gcc-m68k-linux-gnu" (4:10.2.1-1) in Debian Stable.


Count is for how many of the executed kernel symbol addresses had given 
instruction.

I'm a bit surprised how many functions (symbol addresses) start with 
link.w instruction, instead of e.g. move* instruction.

(dc.w is check for emulator NatFeats API.)


	- Eero

PS. Above info is produced by building & booting Linux under Hatari 
emulator as documented here:
https://hatari.tuxfamily.org/doc/m68k-linux.txt

And using:
-------------------
hatari ... --parse sym-breakpoint.ini > instr.txt
-------------------

Where "sym-breakpoint.ini" is:
-------------------
b PConSymbol > 0 :trace :quiet :file pc-disasm.ini
-------------------

And "pc-disasm.ini" file is:
-------------------
d pc-"pc+2"
-------------------

Then to get counts from the output:
-------------------
$ cat  instr.txt | grep -E -e '^\$' | sort -u |\
   cut -b46-52 | sort | uniq -c | sort -nr
-------------------

(Match disassembly lines, drop duplicate function calls, count uniq 
entry point instructions.)


> Besides that, AFAIK plain kprobes support should not have much 
> architecture specific stuff.
> 
> 
> (I have no experience with kernel code, I just remember some LWN 
> articles about kprobes during past 2 decades, and I was involved with a 
> tool that did something similar in user-space, before Linux got uprobes 
> support.)
> 
> 
> 
> As to what architecture to use as an example, I think it would be best 
> to ask tracing maintainers for advice, as there seems to be a lot of 
> code which has been copied from each other at different points in time, 
> that might be nowadays better as shared rather than under each arch...
> 
> These architectures support kprobes:
> ------------------------------------
> $ grep " ok " Documentation/features/debug/kprobes/arch-support.txt
>      |         arc: |  ok  |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
>      |        csky: |  ok  |
>      |        ia64: |  ok  |
>      |        mips: |  ok  |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
>      |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
>      |         x86: |  ok  |
> ------------------------------------
> 
> But only these seem to have probing functionality isolated nicely to its 
> own directory:
> ------------------------------------
> $ ls arch/*/kernel/probes/
> 
> arch/arm64/kernel/probes/:
> decode-insn.c  decode-insn.h  kprobes.c  kprobes_trampoline.S  Makefile 
> simulate-insn.c  simulate-insn.h  uprobes.c
> 
> arch/csky/kernel/probes/:
> decode-insn.c  decode-insn.h  ftrace.c  kprobes.c  kprobes_trampoline.S 
> Makefile  simulate-insn.c  simulate-insn.h  uprobes.c
> 
> arch/riscv/kernel/probes/:
> decode-insn.c  decode-insn.h  ftrace.c  kprobes.c  Makefile  rethook.c 
> rethook.h  rethook_trampoline.S  simulate-insn.c  simulate-insn.h  
> uprobes.c
> ------------------------------------
> 
> 
> As to testing whether kprobes work, that could be easier with ftrace 
> support also present:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/ftrace/README
> 
> 
>      - Eero
> 
> PS. Looking at the kernel features list, m68k arch seems to be missing a 
> lot of other features too:
> https://www.kernel.org/doc/html/latest/m68k/features.html
> 
