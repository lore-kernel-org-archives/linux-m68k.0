Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2050C7619A
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Apr 2023 23:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjDLXae (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Apr 2023 19:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDLXad (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Apr 2023 19:30:33 -0400
X-Greylist: delayed 471 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Apr 2023 16:30:30 PDT
Received: from welho-filter3.welho.com (welho-filter3b.welho.com [83.102.41.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB94049E5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Apr 2023 16:30:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter3.welho.com (Postfix) with ESMTP id B77C81694A;
        Thu, 13 Apr 2023 02:22:36 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
        by localhost (welho-filter3.welho.com [::ffff:83.102.41.25]) (amavisd-new, port 10024)
        with ESMTP id gkmEg0jd-D9l; Thu, 13 Apr 2023 02:22:36 +0300 (EEST)
Received: from [192.168.0.20] (82-181-33-83.bb.dnainternet.fi [82.181.33.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp2.welho.com (Postfix) with ESMTPSA id 6EAEE287;
        Thu, 13 Apr 2023 02:22:29 +0300 (EEST)
Message-ID: <304e5c81-4e51-6c16-28d0-be48bf86a564@helsinkinet.fi>
Date:   Thu, 13 Apr 2023 02:22:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From:   Eero Tamminen <oak@helsinkinet.fi>
Subject: Re: instrumentation, was Re: core dump analysis
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
 <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
 <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
 <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
 <13a69c91-ca2b-42d8-dbd5-0b81e76044c6@gmail.com>
Content-Language: en-US
In-Reply-To: <13a69c91-ca2b-42d8-dbd5-0b81e76044c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On 11.4.2023 11.24, Michael Schmitz wrote:
> Am 11.04.2023 um 19:19 schrieb Geert Uytterhoeven:
>> On Tue, Apr 11, 2023 at 6:56 AM Michael Schmitz <schmitzmic@gmail.com> 
>>> Am 11.04.2023 um 12:20 schrieb Finn Thain:
>>>> A better solution might be be to port the existing instrumentation like
>>>> ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder
>>>> how portable that stuff is.

Another possibility is just using manually added kernel tracepoints:
https://www.kernel.org/doc/html/latest/trace/tracepoints.html

"git grep TRACE_EVENT" did not given any hits for arch/m68k/ though.

(I don't think those need any particular architecture support. One just 
adds them to locations where it makes sense to trace activity that is 
important, but which does not happen too often for the very small 
overhead from disabled static trace point to be significant.)


> Looking at a few arch implementations, I'm utterly confused. Wouldn't 
> know where to start.

Good article: https://lwn.net/Articles/132196/

(Ignore jprobes stuff as that's deprecated.)


Because probe replaces instruction at the probe point with a breakpoint:
https://www.kernel.org/doc/html/latest/trace/kprobes.html#how-does-a-kprobe-work

It needs architecture specific code to decode and simulate the replaced 
instruction (its side-effects) when it is later executed "out-of-line".

This also causes architecture specific limitations on where the probe 
can be set.  Architecture may not support simulating all possible 
instructions, just the most common ones (e.g. ones typically used on 
function entry and exit points).

Besides that, AFAIK plain kprobes support should not have much 
architecture specific stuff.


(I have no experience with kernel code, I just remember some LWN 
articles about kprobes during past 2 decades, and I was involved with a 
tool that did something similar in user-space, before Linux got uprobes 
support.)



As to what architecture to use as an example, I think it would be best 
to ask tracing maintainers for advice, as there seems to be a lot of 
code which has been copied from each other at different points in time, 
that might be nowadays better as shared rather than under each arch...

These architectures support kprobes:
------------------------------------
$ grep " ok " Documentation/features/debug/kprobes/arch-support.txt
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |        csky: |  ok  |
     |        ia64: |  ok  |
     |        mips: |  ok  |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
     |         x86: |  ok  |
------------------------------------

But only these seem to have probing functionality isolated nicely to its 
own directory:
------------------------------------
$ ls arch/*/kernel/probes/

arch/arm64/kernel/probes/:
decode-insn.c  decode-insn.h  kprobes.c  kprobes_trampoline.S  Makefile 
simulate-insn.c  simulate-insn.h  uprobes.c

arch/csky/kernel/probes/:
decode-insn.c  decode-insn.h  ftrace.c  kprobes.c  kprobes_trampoline.S 
Makefile  simulate-insn.c  simulate-insn.h  uprobes.c

arch/riscv/kernel/probes/:
decode-insn.c  decode-insn.h  ftrace.c  kprobes.c  Makefile  rethook.c 
rethook.h  rethook_trampoline.S  simulate-insn.c  simulate-insn.h  uprobes.c
------------------------------------


As to testing whether kprobes work, that could be easier with ftrace 
support also present:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/ftrace/README


	- Eero

PS. Looking at the kernel features list, m68k arch seems to be missing a 
lot of other features too:
https://www.kernel.org/doc/html/latest/m68k/features.html
