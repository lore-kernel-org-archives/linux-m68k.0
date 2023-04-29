Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F0BC77B61
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 00:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjD2AZL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Apr 2023 20:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjD2AZK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Apr 2023 20:25:10 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3022B35B1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 17:25:08 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 98CE832009CE;
        Fri, 28 Apr 2023 20:25:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 28 Apr 2023 20:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682727905; x=1682814305; bh=yqvQwAyYxdcPG
        C5Cfi1X3bpV60RgnDKcfD0VHkTMwhY=; b=ehWIXakWL807FOrE0FZUVaScsJ7+h
        UT93QjEQVR6KlbKjGwt3Uvzogun3E+7Q6vxtyKeXFnMErWBlc9VnjeGRvcR3vxzX
        vt8mNRjgsWQ5cYxGWbP2lW6X2QglVguT9kaXa3Gca5M70dh4BO9TqIkvCsLhY4dc
        Bwo8TbfAJYt4jwFqYth/tODa6WhKq9rBMhtZA1b8PmTLeyZt2NjEHKKcegqFThBh
        ayzL9prIBbhbc7sHTMETrfnGNPWcMT4BFqrpT1ATOOzcHv0SpYSsNlzjI9tExXM1
        C9KKoL+KvPeCbS5+oJ3P9LGMQGepbaExB/+ilPcYtImWAAD4Oeux0MSJQ==
X-ME-Sender: <xms:4GNMZCM3I3rO38J1Ep8JuDYFPbwCWTyYlf2VSlZoYiQWip5I1t455A>
    <xme:4GNMZA8IwhqG7Dz11WqOKfVfwoKD74y71OQtpOujFwpZCAhiy1Pj3xk7-YC08Un5v
    ses-C98qjga7r2lsfk>
X-ME-Received: <xmr:4GNMZJRADx-p46jYXdllLb2StbzQ0uyoaquoCvutzSqw-dQWauu-sPCYMkrpN6MFw5rFvequihyE7NkZ24V4aKwwPMOzXMNMaDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:4GNMZCvj1hKYsPPSy1bh_BZXrFZz1d9Napf5b2GMwYQc2CaV1hUYPg>
    <xmx:4GNMZKcffwcjIQwMjhfBoz-cEuftuVr8h2YYLzkpUqxdWqkLaC3QCw>
    <xmx:4GNMZG0ga-iyk4Z5Tte40Eipwyzt5gSUyaT-IfGj3-GC0AIayrcjcg>
    <xmx:4WNMZMqN8-ClJzMOE6yhintRwYkZSPNQ17ul3pvvlekrOzFw3zhmTw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Apr 2023 20:25:01 -0400 (EDT)
Date:   Sat, 29 Apr 2023 10:28:48 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
Message-ID: <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com> <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com>
 <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org> <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com> <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com> <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com> <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org>
 <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org> <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com> <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

[Cc kernel mailing list]

On Sat, 29 Apr 2023, Michael Schmitz wrote:

> The address right past the end of the signal frame is equal to the fault 
> address. Any smaller gap size (as evidenced by the fact that 16 causes 
> corruption) will see the signal frame go past the fault address.
> 
> Using the user stack pointer to calculate the address for the signal 
> frame is incorrect - the user stack pointer still reflects the situation 
> before the faulting instruction.
> 

Well, to quote do_page_fault(), USP is not reliable "due to some 
instructions doing pre-decrement on the stack and that doesn't show up 
until later".

> I think what we need to do in setup_(rt_)_signal is to check if the 
> frame format is format b, and use the fault pc address from the 
> exception frame (if it's lower) instead of the usp. I'll test a patch 
> for that shortly.
> 

Right. If we fix this in the signal handling code, we take care of address 
errors as well, which was my concern with Andreas' patch. We can do what 
do_page_fault() does and assume the worst (256 bytes?).

I believe we can use USP to get a worst case estimate for the future 
extent of the user stack. Using the fault address seems like an 
unnecessary complication.

I agree that this should be contingent on frame format 0xB and also on 
CPU_IS_020_OR_030 so the code is omitted on other builds. (Much like 
Andreas' patch.)

Here's what I learned from running gdb on the LC III. The transcript below 
shows a printk from handle_signal() following a printk from 
bus_error030(). So this is a page fault at the top of stack page 
efffe000..efffefff which also delivered a signal.

(gdb) file /root/stack-test
Reading symbols from /root/stack-test...
(No debugging symbols found in /root/stack-test)

(gdb) run 2050
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /root/stack-test 2050
[ 2958.890000] bus_error030: page fault: pc 80038d14, usp efffee28, addr efffee28
starting recursion
[ 2958.940000] bus_error030: page fault: pc 8000038c, usp efffe00c, addr efffdffc
[ 2958.960000] bus_error030: page fault: pc 8000038c, usp efffd004, addr efffcffc
[ 2958.970000] bus_error030: page fault: pc 8000038c, usp efffbffc, addr efffbffc
[ 2958.980000] bus_error030: page fault: pc 8000038c, usp efffa010, addr efff9ffc
[ 2958.990000] bus_error030: page fault: pc 8000038c, usp efff9008, addr efff8ffc
[ 2959.010000] bus_error030: page fault: pc 8000038c, usp efff8000, addr efff7ffc
[ 2959.030000] bus_error030: page fault: pc 8000038c, usp efff6014, addr efff5ffc
[ 2959.050000] bus_error030: page fault: pc 8000038c, usp efff500c, addr efff4ffc
[ 2959.060000] bus_error030: page fault: pc 8000038c, usp efff4004, addr efff3ffc
[ 2959.080000] bus_error030: page fault: pc 8000038c, usp efff2ffc, addr efff2ffc
[ 2959.100000] bus_error030: page fault: pc 8000038c, usp efff1010, addr efff0ffc
[ 2959.110000] bus_error030: page fault: pc 8000038c, usp efff0008, addr effefffc
[ 2959.130000] bus_error030: page fault: pc 8000038c, usp effef000, addr effeeffc
done.
starting recursion with fork
[Detaching after fork from child process 166]
[ 2959.310000] bus_error030: page fault: pc 8000038c, usp effff014, addr efffeffc
[ 2959.350000] handle_signal: fmtvec b008, pc 8000038c, usp efffee88


With a breakpoint set in the userspace signal handler, we can examine 
stack memory from the USP as it presently is, going back up to USP as it 
was at the time of the page fault (both addresses are given in printk 
output above).

The difference is 396 bytes, and pahole confirms that sizeof(struct 
sigframe) + sizeof(struct frame.un.fmtb) == 312 + 84 == 396.

(Note that this kernel was patched so that it doesn't truncate the result 
of that pointer arithmetic. Hence there's no gap between the bottom of the 
user stack and the start of the signal frame, which tends to confuse the 
issue, as the gap would normally come and go unpredictably.)

Breakpoint 1, 0x800004a4 in handler ()
(gdb) x/110z 0xeffff014 - 396
0xefffee88:     0xefffee98      0x00000011      0x00000008      0xefffeea4
0xefffee98:     0x70774e40      0xf1f2f3f4      0x00000000      0x00000000
0xefffeea8:     0xeffff014      0x000007a7      0x000007a6      0x800744ec
0xefffeeb8:     0x8006d2b0      0x00008000      0x038cb008      0x7fff0000
0xefffeec8:     0xffffffff      0xffffffff      0x7fff0000      0xffffffff
0xefffeed8:     0xffffffff      0x00000000      0x00000000      0x00000000
0xefffeee8:     0x1f386980      0xf0fff0ff      0x0f800000      0xf0ff0000
0xefffeef8:     0x00000000      0x408ece9a      0x00000000      0x00000000
0xefffef08:     0x00000000      0x00000000      0x3ffe0000      0x00000000
0xefffef18:     0x00000000      0xffffffff      0x7c0effff      0x014ee530
0xefffef28:     0x08010000      0x00000004      0x00994000      0x00995e94
0xefffef38:     0x014ed540      0x00994000      0x0040ee24      0x08010000
0xefffef48:     0x00000004      0x004fa794      0x00995f18      0x00995e34
0xefffef58:     0x00079a72      0x004fa794      0x000270ce      0x00995e54
0xefffef68:     0x00027370      0x00000001      0x014f1e60      0x00995f2c
0xefffef78:     0x00994000      0x00000011      0x00995f18      0x00995e98
0xefffef88:     0x00027d08      0x00000011      0x00000004      0x00000000
0xefffef98:     0x00995f2c      0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4
0xefffefa8:     0xeffffed0      0x00000001      0x00000001      0x00995f78
0xefffefb8:     0xb1b2b3b4      0xc1c2c3c4      0x0eee0709      0x24798004
0xefffefc8:     0xefffeffc      0xefffeff8      0xd1d2d3d4      0x48e7383c
0xefffefd8:     0x80000394      0x80000392      0x80000390      0x000007a7
0xefffefe8:     0x383cff0d      0x000ff153      0x383c2479      0x8007b4e0
0xefffeff8:     0x0000383c      0x00000000      0x80100000      0x800003f8
0xeffff008:     0x000000e0      0x014ed500      0xeffffcc4      0xc1c2c3c4
0xeffff018:     0xeffff03c      0x800003f8      0xd1d2d3d4      0xe1e2e3e4
0xeffff028:     0xf1f2f3f4      0x91929394      0xa1a2a3a4      0xb1b2b3b4
0xeffff038:     0xc1c2c3c4      0xeffff060


Here's the same hex dump with struct member names added, much like the 
output from your test program:

efffee88:	efffee98	sigframe.pretcode
efffee8c:	00000011	sigframe.sig
efffee90:	00000008	sigframe.code
efffee94:	efffeea4	sigframe.psc
efffee98:	70774e40	sigframe.retcode
efffee9c:	f1f2f3f4	sigframe.retcode
efffeea0:	00000000	sigframe.extramask
efffeea4:	00000000	sigframe.sc.mask
efffeea8:	effff014	sigframe.sc.sc_usp
efffeeac:	000007a7	sigframe.sc.sc_d0
efffeeb0:	000007a6	sigframe.sc.sc_d1
efffeeb4:	800744ec	sigframe.sc.sc_a0
efffeeb8:	8006d2b0	sigframe.sc.sc_a1
efffeebc:	00008000	sigframe.sc.sc_sr, sc_pc
efffeec0:	038cb008	sigframe.sc.sc_pc, sc_formatvec
efffeec4:	7fff0000	sigframe.sc.sc_fpregs
efffeec8:	ffffffff	sigframe.sc.sc_fpregs
efffeecc:	ffffffff	sigframe.sc.sc_fpregs
efffeed0:	7fff0000	sigframe.sc.sc_fpregs
efffeed4:	ffffffff	sigframe.sc.sc_fpregs
efffeed8:	ffffffff	sigframe.sc.sc_fpregs
efffeedc:	00000000	sigframe.sc.sc_fpcntl
efffeee0:	00000000	sigframe.sc.sc_fpcntl
efffeee4:	00000000	sigframe.sc.sc_fpcntl
efffeee8:	1f386980	sigframe.sc.sc_fpstate
efffeeec:	f0fff0ff	sigframe.sc.sc_fpstate
efffeef0:	0f800000	sigframe.sc.sc_fpstate
efffeef4:	f0ff0000	sigframe.sc.sc_fpstate
efffeef8:	00000000	sigframe.sc.sc_fpstate
efffeefc:	408ece9a	sigframe.sc.sc_fpstate
efffef00:	00000000	sigframe.sc.sc_fpstate
efffef04:	00000000	sigframe.sc.sc_fpstate
efffef08:	00000000	sigframe.sc.sc_fpstate
efffef0c:	00000000	sigframe.sc.sc_fpstate
efffef10:	3ffe0000	sigframe.sc.sc_fpstate
efffef14:	00000000	sigframe.sc.sc_fpstate
efffef18:	00000000	sigframe.sc.sc_fpstate
efffef1c:	ffffffff	sigframe.sc.sc_fpstate
efffef20:	7c0effff	sigframe.sc.sc_fpstate
efffef24:	014ee530	sigframe.sc.sc_fpstate
efffef28:	08010000	sigframe.sc.sc_fpstate
efffef2c:	00000004	sigframe.sc.sc_fpstate
efffef30:	00994000	sigframe.sc.sc_fpstate
efffef34:	00995e94	sigframe.sc.sc_fpstate
efffef38:	014ed540	sigframe.sc.sc_fpstate
efffef3c:	00994000	sigframe.sc.sc_fpstate
efffef40:	0040ee24	sigframe.sc.sc_fpstate
efffef44:	08010000	sigframe.sc.sc_fpstate
efffef48:	00000004	sigframe.sc.sc_fpstate
efffef4c:	004fa794	sigframe.sc.sc_fpstate
efffef50:	00995f18	sigframe.sc.sc_fpstate
efffef54:	00995e34	sigframe.sc.sc_fpstate
efffef58:	00079a72	sigframe.sc.sc_fpstate
efffef5c:	004fa794	sigframe.sc.sc_fpstate
efffef60:	000270ce	sigframe.sc.sc_fpstate
efffef64:	00995e54	sigframe.sc.sc_fpstate
efffef68:	00027370	sigframe.sc.sc_fpstate
efffef6c:	00000001	sigframe.sc.sc_fpstate
efffef70:	014f1e60	sigframe.sc.sc_fpstate
efffef74:	00995f2c	sigframe.sc.sc_fpstate
efffef78:	00994000	sigframe.sc.sc_fpstate
efffef7c:	00000011	sigframe.sc.sc_fpstate
efffef80:	00995f18	sigframe.sc.sc_fpstate
efffef84:	00995e98	sigframe.sc.sc_fpstate
efffef88:	00027d08	sigframe.sc.sc_fpstate
efffef8c:	00000011	sigframe.sc.sc_fpstate
efffef90:	00000004	sigframe.sc.sc_fpstate
efffef94:	00000000	sigframe.sc.sc_fpstate
efffef98:	00995f2c	sigframe.sc.sc_fpstate
efffef9c:	d1d2d3d4	sigframe.sc.sc_fpstate
efffefa0:	e1e2e3e4	sigframe.sc.sc_fpstate
efffefa4:	f1f2f3f4	sigframe.sc.sc_fpstate
efffefa8:	effffed0	sigframe.sc.sc_fpstate
efffefac:	00000001	sigframe.sc.sc_fpstate
efffefb0:	00000001	sigframe.sc.sc_fpstate
efffefb4:	00995f78	sigframe.sc.sc_fpstate
efffefb8:	b1b2b3b4	sigframe.sc.sc_fpstate
efffefbc:	c1c2c3c4	sigframe.sc.sc_fpstate
efffefc0:	0eee0709	fmtb.int1, ssw
efffefc4:	24798004	fmtb.isc, isb
efffefc8:	efffeffc	fmtb.daddr
efffefcc:	efffeff8	fmtb.int2
efffefd0:	d1d2d3d4	fmtb.dobuf
efffefd4:	48e7383c	fmtb.int3
efffefd8:	80000394	fmtb.int3
efffefdc:	80000392	fmtb.baddr
efffefe0:	80000390	fmtb.int4
efffefe4:	000007a7	fmtb.dibuf
efffefe8:	383cff0d	fmtb.int5
efffefec:	000ff153	fmtb.int5, ver, int6
efffeff0:	383c2479	fmtb.int7
efffeff4:	8007b4e0	fmtb.int7
efffeff8:	0000383c	fmtb.int7
efffeffc:	00000000	fmtb.int7
effff000: *	80100000	fmtb.int7
effff004: *	800003f8	fmtb.int7
effff008: *	000000e0	fmtb.int7
effff00c: *	014ed500	fmtb.int7
effff010: *	effffcc4	fmtb.int7
effff014:	c1c2c3c4	user stack
effff018:	effff03c	user stack
effff01c:	800003f8	user stack
effff020:	d1d2d3d4	user stack
effff024:	e1e2e3e4	user stack
effff028:	f1f2f3f4	user stack
effff02c:	91929394	user stack
effff030:	a1a2a3a4	user stack
effff034:	b1b2b3b4	user stack
effff038:	c1c2c3c4	user stack
effff03c:	effff060	user stack

The portion marked with an * is the part that damages the user stack, as 
these locations are all higher than USP. This just confirms by other means 
what your test program already demonstrated.


(gdb) c
Continuing.
[ 3334.340000] bus_error030: page fault: pc 8000038c, usp efffe00c, addr efffdffc
[ 3334.360000] bus_error030: page fault: pc 8000038c, usp efffd004, addr efffcffc
[ 3334.380000] bus_error030: page fault: pc 8000038c, usp efffbffc, addr efffbffc
[ 3334.390000] bus_error030: page fault: pc 8000038c, usp efffa010, addr efff9ffc
[ 3334.410000] bus_error030: page fault: pc 8000038c, usp efff9008, addr efff8ffc
[ 3334.430000] bus_error030: page fault: pc 8000038c, usp efff8000, addr efff7ffc
[ 3334.440000] bus_error030: page fault: pc 8000038c, usp efff6014, addr efff5ffc
[ 3334.450000] bus_error030: page fault: pc 8000038c, usp efff500c, addr efff4ffc
[ 3334.460000] bus_error030: page fault: pc 8000038c, usp efff4004, addr efff3ffc
[ 3334.480000] bus_error030: page fault: pc 8000038c, usp efff2ffc, addr efff2ffc
[ 3334.500000] bus_error030: page fault: pc 8000038c, usp efff1010, addr efff0ffc
[ 3334.510000] bus_error030: page fault: pc 8000038c, usp efff0008, addr effefffc
[ 3334.530000] bus_error030: page fault: pc 8000038c, usp effef000, addr effeeffc
[Detaching after fork from child process 167]

Breakpoint 1, 0x800004a4 in handler ()
(gdb) c
Continuing.

Program received signal SIGILL, Illegal instruction.
0x80000492 in rec ()


My test program terminates having detected the corruption visible at 
0xeffff000 but gdb allows us to examine that memory afterwards:

(gdb) x/110z 0xeffff014 - 396
0xefffee88:     0xc1c2c3c4      0xefffeeb0      0x800003f8      0xd1d2d3d4
0xefffee98:     0xe1e2e3e4      0xf1f2f3f4      0x91929394      0xa1a2a3a4
0xefffeea8:     0xb1b2b3b4      0xc1c2c3c4      0xefffeed4      0x800003f8
0xefffeeb8:     0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4      0x91929394
0xefffeec8:     0xa1a2a3a4      0xb1b2b3b4      0xc1c2c3c4      0xefffeef8
0xefffeed8:     0x800003f8      0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4
0xefffeee8:     0x91929394      0xa1a2a3a4      0xb1b2b3b4      0xc1c2c3c4
0xefffeef8:     0xefffef1c      0x800003f8      0xd1d2d3d4      0xe1e2e3e4
0xefffef08:     0xf1f2f3f4      0x91929394      0xa1a2a3a4      0xb1b2b3b4
0xefffef18:     0xc1c2c3c4      0xefffef40      0x800003f8      0xd1d2d3d4
0xefffef28:     0xe1e2e3e4      0xf1f2f3f4      0x91929394      0xa1a2a3a4
0xefffef38:     0xb1b2b3b4      0xc1c2c3c4      0xefffef64      0x800003f8
0xefffef48:     0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4      0x91929394
0xefffef58:     0xa1a2a3a4      0xb1b2b3b4      0xc1c2c3c4      0xefffef88
0xefffef68:     0x800003f8      0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4
0xefffef78:     0x91929394      0xa1a2a3a4      0xb1b2b3b4      0xc1c2c3c4
0xefffef88:     0xefffefac      0x800003f8      0xd1d2d3d4      0xe1e2e3e4
0xefffef98:     0xf1f2f3f4      0x91929394      0xa1a2a3a4      0xb1b2b3b4
0xefffefa8:     0xc1c2c3c4      0xefffefd0      0x800003f8      0xd1d2d3d4
0xefffefb8:     0xe1e2e3e4      0xf1f2f3f4      0x91929394      0xa1a2a3a4
0xefffefc8:     0xb1b2b3b4      0xc1c2c3c4      0xefffeff4      0x800003f8
0xefffefd8:     0xd1d2d3d4      0xe1e2e3e4      0xf1f2f3f4      0x91929394
0xefffefe8:     0xa1a2a3a4      0xb1b2b3b4      0xc1c2c3c4      0xeffff018
0xefffeff8:     0x800003f8      0xd1d2d3d4      0x80100000      0x800003f8
0xeffff008:     0x000000e0      0x014ed500      0xeffffcc4      0xc1c2c3c4
0xeffff018:     0xeffff03c      0x800003f8      0xd1d2d3d4      0xe1e2e3e4
0xeffff028:     0xf1f2f3f4      0x91929394      0xa1a2a3a4      0xb1b2b3b4
0xeffff038:     0xc1c2c3c4      0xeffff060
(gdb) 


So the page that caused the fault never shows any corruption. It turns out 
that the MOVEM resumes correctly after the signal is handled, which 
overwrites the stack memory used for the signal frame, starting at the top 
of the new stack page. I had incorrectly assumed the MOVEM had gone awry 
but it actually resumed just fine.
