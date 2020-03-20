Return-Path: <SRS0=BlFA=5F=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4782C4332B
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Mar 2020 22:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D324320658
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Mar 2020 22:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgCTWt1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Mar 2020 18:49:27 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41964 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgCTWt1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Mar 2020 18:49:27 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 144412A262;
        Fri, 20 Mar 2020 18:49:20 -0400 (EDT)
Date:   Sat, 21 Mar 2020 09:49:26 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
Subject: Re: Seccomp support for linux-m68k
In-Reply-To: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
Message-ID: <alpine.LNX.2.22.394.2003210904040.8@nippy.intranet>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Fri, 20 Mar 2020, John Paul Adrian Glaubitz wrote:

> Hi!
> 
> Would it be possible to add seccomp support for m68k in the kernel?
> 
> There are some packages like kscreensaver in Debian that require 
> libseccomp-dev and it would therefore be desirable if we could that 
> library on Linux/m68k as well.
> 
> From what I have learned from Helge Deller who added seccomp for hppa, 
> it doesn't seem much that is necessary to get seccomp working on an 
> architecture.
> 
> So, if anyone could work on the kernel part, I could do the work on 
> libseccomp.
> 
> Thanks,
> Adrian
> 

I suspect (without evidence) that many m68k systems are actually virtual 
machines. And the need for container hosting on m68k seems negligible.

Therefore, there doesn't seem to be a lot of actual benefit from seccomp.

There are 17 architectures (out of 25) lacking seccomp support. This 
suggests that the portability issue around this missing feature can't 
easily be pinned on m68k.

That's not the case for certain other feature, where the m68k port could 
more easily be blamed for harming portability or generality (potentially 
creating work for others).

Just based on the numbers (below) the foremost would be tracehook and 
generic-idle-thread.

Also, arguably the most desirable features for m68k are those that might 
improve performance (e.g. jump-labels, eBPF-JIT, locking/*, generic VDSO 
for 680x0 etc.).

$ grep -c TODO Documentation/features/*/*/arch-support.txt | sort -t: -k2n
	Documentation/features/time/clockevents/arch-support.txt:1
	Documentation/features/time/modern-timekeeping/arch-support.txt:1
	Documentation/features/vm/numa-memblock/arch-support.txt:2
	Documentation/features/vm/THP/arch-support.txt:5
Documentation/features/core/tracehook/arch-support.txt:6
	Documentation/features/sched/numa-balancing/arch-support.txt:6
Documentation/features/core/generic-idle-thread/arch-support.txt:8
Documentation/features/locking/lockdep/arch-support.txt:9
Documentation/features/debug/kgdb/arch-support.txt:12
Documentation/features/debug/kprobes/arch-support.txt:13
Documentation/features/debug/kretprobes/arch-support.txt:14
Documentation/features/time/irq-time-acct/arch-support.txt:14
Documentation/features/core/jump-labels/arch-support.txt:15
Documentation/features/perf/kprobes-event/arch-support.txt:15
Documentation/features/time/virt-cpuacct/arch-support.txt:15
	Documentation/features/vm/TLB/arch-support.txt:16
Documentation/features/debug/gcov-profile-all/arch-support.txt:17
Documentation/features/io/dma-contiguous/arch-support.txt:17
Documentation/features/seccomp/seccomp-filter/arch-support.txt:17
Documentation/features/vm/pte_special/arch-support.txt:17
Documentation/features/core/eBPF-JIT/arch-support.txt:18
Documentation/features/debug/stackprotector/arch-support.txt:18
Documentation/features/debug/uprobes/arch-support.txt:18
Documentation/features/locking/queued-rwlocks/arch-support.txt:18
Documentation/features/vm/ELF-ASLR/arch-support.txt:18
Documentation/features/locking/queued-spinlocks/arch-support.txt:19
Documentation/features/time/context-tracking/arch-support.txt:19
Documentation/features/perf/perf-regs/arch-support.txt:20
Documentation/features/perf/perf-stackdump/arch-support.txt:20
Documentation/features/time/arch-tick-broadcast/arch-support.txt:20
Documentation/features/vm/ioremap_prot/arch-support.txt:20
Documentation/features/debug/kprobes-on-ftrace/arch-support.txt:21
Documentation/features/core/cBPF-JIT/arch-support.txt:22
Documentation/features/debug/KASAN/arch-support.txt:22
Documentation/features/debug/optprobes/arch-support.txt:22
Documentation/features/locking/cmpxchg-local/arch-support.txt:22
Documentation/features/sched/membarrier-sync-core/arch-support.txt:22
Documentation/features/vm/PG_uncached/arch-support.txt:23
Documentation/features/vm/huge-vmap/arch-support.txt:23
Documentation/features/debug/user-ret-profiler/arch-support.txt:24

m68k has a "TODO" against all of the above features, except for the 6 that 
I've indented. Some of these seem to be inapplicable (e.g. virt-cpuacct, 
perf-regs).
