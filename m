Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAF5C77B75
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Apr 2023 01:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjDSBsW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 18 Apr 2023 21:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjDSBsV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 18 Apr 2023 21:48:21 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E517C3C0D
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Apr 2023 18:48:18 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 4B81532008FF;
        Tue, 18 Apr 2023 21:48:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 18 Apr 2023 21:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681868895; x=1681955295; bh=CpmiXzAKl2zFz
        BZ1f2ORoVrtwSIX9FpQqezakCj+Pi8=; b=NyoFDX61VhnXVfAR9TF1pUhXCZhFZ
        Cq7UJ87QVmXJxla33Jp84Ep1qim6rFam4DXzEjKgmAmC4phYsquIB6x7qAmNZLlz
        NFrv9HfugHSqpT0Zxj2EkgGKgBAancG31RnvqLpQpus2bJs8VhYapJCk97oi/s59
        gRn2Q8fldRNOyoPLnWOFgscjMvRI6eqEHPTYhEDE9yQyP2F07xSNnUAD9osa5C9l
        FR/gkWXM7dzlqwglEvAQRFiwha0a+sQ0LHGcb7OHhumAMLeb+6wcaL2n2GJ55qBX
        x3c4ec5B1VUFeI3K5UGd2zQtRRO/aTqZeo9YWmOHlsyyfVeWX0nIF2K8w==
X-ME-Sender: <xms:X0g_ZDaj7r2xtIoD6GpN7Yzb9PXXpBqWi5CcFwGNhwAULy-gKZwARg>
    <xme:X0g_ZCYe_NbpaymKCniE_NanNiESyulaTqDcKVQvgm3DmOvW26SFBh_dyWBH9KmvY
    BsSLFl1VSncxtSNyrs>
X-ME-Received: <xmr:X0g_ZF9S18JqkqhZPTBVMI671bjtprlZ1XjFyA_EY595XtCCAsrIM1InC9lFui9XKHWdy6pQzQVEYQ1fe-D2zd0Qgs0mDUa3mjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:X0g_ZJrYJgBQLPC-ls8aqr2_hg6S1Zagpb55EcgRsC4AMM46bNiYfw>
    <xmx:X0g_ZOpZYG2wfSTBQ0KIjXSnswFe5nBgy0AFqsIU-Wfq--pwWgk5AQ>
    <xmx:X0g_ZPQgbXNGEv6b8zFcUNg6d_zY1VXVI7Ob_iQmYaoDbr7kHFxMZQ>
    <xmx:X0g_ZFS88upIBKNExUsusEC6EdywfBgDVOXAaCKZaJSTwglZ5LmFwA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Apr 2023 21:48:12 -0400 (EDT)
Date:   Wed, 19 Apr 2023 11:50:58 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
Message-ID: <3292e840-0ecd-1f03-5d7f-462347e161c9@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 18 Apr 2023, Michael Schmitz wrote:

> Am 18.04.2023 um 14:04 schrieb Finn Thain:
> > On Tue, 18 Apr 2023, Michael Schmitz wrote:
> >> Am 16.04.2023 um 18:44 schrieb Finn Thain:
> >>
> >>> 0xeffff750:     0xc01a0000                      saved $a5 == libc .got
> >>> 0xeffff74c:     0xc0023e8c                      saved $a3 == &__stack_chk_guard
> >>> 0xeffff748:     0x00000000                      saved $a2
> >>> 0xeffff744:     0x00000001                      saved $d5
> >>> 0xeffff740:     0xeffff86e                      saved $d4
> >>> 0xeffff73c:     0xeffff86a                      saved $d3
> >>> 0xeffff738:     0x00000002                      saved $d2
> >>> 0xeffff734:     0x00000000
> >>> 0xeffff730:     0x00000000
> >>> 0xeffff72c:     0x00000000
> >>> 0xeffff728:     0x00000000
> >>> 0xeffff724:     0x00000000
> >>> 0xeffff720:     0x00000000
> >>> 0xeffff71c:     0x00000000
> >>> 0xeffff718:     0x00000000
> >>> 0xeffff714:     0x00000000
> >>> 0xeffff710:     0x00000000
> >>> 0xeffff70c:     0x00000000
> >>> 0xeffff708:     0x00000000
> >>> 0xeffff704:     0x00000000
> >>> 0xeffff700:     0x00000000
> >>> 0xeffff6fc:     0x00000000
> >>> 0xeffff6f8:     0x00000000
> >>> 0xeffff6f4:     0x00000000
> >>> 0xeffff6f0:     0x00000000
> >>> 0xeffff6ec:     0x00000000
> >>> 0xeffff6e8:     0x00000000
> >>> 0xeffff6e4:     0x00000000
> >>> 0xeffff6e0:     0x00000000
> >>> 0xeffff6dc:     0x00000000
> >>> 0xeffff6d8:     0x00000000
> >>> 0xeffff6d4:     0x00000000
> >>> 0xeffff6d0:     0x00000000
> >>> 0xeffff6cc:     0x00000000
> >>> 0xeffff6c8:     0x00000000
> >>> 0xeffff6c4:     0x00000000
> >>> 0xeffff6c0:     0x00000000
> >>> 0xeffff6bc:     0x00000000
> >>> 0xeffff6b8:     0x00000000
> >>> 0xeffff6b4:     0x00000000
> >>> 0xeffff6b0:     0x00000000
> >>> 0xeffff6ac:     0x00000000
> >>> 0xeffff6a8:     0x00000000
> >>> 0xeffff6a4:     0x00000000
> >>> 0xeffff6a0:     0x00000000
> >>> 0xeffff69c:     0x00000000
> >>> 0xeffff698:     0x00000000
> >>> 0xeffff694:     0x00000000
> >>> 0xeffff690:     0x00000000
> >>> 0xeffff68c:     0x00000000
> >>> 0xeffff688:     0x00000000
> >>> 0xeffff684:     0x00000000
> >>> 0xeffff680:     0x00000000
> >>> 0xeffff67c:     0x00000000
> >>> 0xeffff678:     0x00000000
> >>> 0xeffff674:     0x00000000
> >>> 0xeffff670:     0x00000000
> >>> 0xeffff66c:     0x00000000
> >>> 0xeffff668:     0x00000000
> >>> 0xeffff664:     0x00000000
> >>> 0xeffff660:     0x41000000
> >>> 0xeffff65c:     0x00000000
> >>> 0xeffff658:     0x00000000
> >>> 0xeffff654:     0x00000000
> >>> 0xeffff650:     0x00000000
> >>> 0xeffff64c:     0x80000000
> >>> 0xeffff648:     0x3fff0000
> >>> 0xeffff644:     0x00000000
> >>> 0xeffff640:     0xd0000000
> >>> 0xeffff63c:     0x40020000                <= (sc.formatvec & 0xffff) << 16; fpregs from here on
> >>> 0xeffff638:     0x81b60080                <= (sc.pc & 0xffff) << 16 | sc.formatvec >> 16
> >>> 0xeffff634:     0x0000c00e                <= sc.sr << 16  sc.pc >> 16
> >>> 0xeffff630:     0xd001e4e3                <= sc.a1
> >>> 0xeffff62c:     0xc0028780                <= sc.a0
> >>> 0xeffff628:     0xffffffff                <= sc.d1
> >>> 0xeffff624:     0x0000041f                <= sc.d0
> >>> 0xeffff620:     0xeffff738                <= sc.usp
> >>> 0xeffff61c:     0x00000000                <= sc.mask
> >>> 0xeffff618:     0x00000000                <= extramask
> >>> 0xeffff614:     0x00000000                <= frame.retcode[1]
> >>> 0xeffff610:     0x70774e40      moveq #119,%d0 ; trap #0
> >>> 0xeffff60c:     0xeffff61c                <= frame->sc
> >>> 0xeffff608:     0x00000080                <= tregs->vector
> >>> 0xeffff604:     0x00000011                <= signal no.
> >>> 0xeffff600:     0xeffff610      return address
> >>>
> >>> The above comes from dash running under gdb under qemu, which does 
> >>> not exhibit the failure but is convenient for that kind of 
> >>> experiment.
> >>
> >> I would have expected to see a different signal trampoline (for 
> >> sys_rt_sigreturn) ...
> >
> > Well, this seems to be the trampoline from setup_frame() and not 
> > setup_rt_frame().
> 
> According to the manpages I've seen, glibc ought to pick rt signals if 
> the kernel supports those (which I suppose it does).
> 

It's got to be the trampoline from setup_frame() because dash did this:

        act.sa_flags = 0;
        sigfillset(&act.sa_mask);
        sigaction(signo, &act, 0);

and the kernel did this:

        /* set up the stack frame */
        if (ksig->ka.sa.sa_flags & SA_SIGINFO)
                err = setup_rt_frame(ksig, oldset, regs);
        else
                err = setup_frame(ksig, oldset, regs);

> >
> >> But anyway:
> >>
> >> The saved pc is 0xc00e81b6 which does match the backtrace above. 
> >> Vector offset 80 matches trap 0 which suggests 0xc00e81b6 should be 
> >> the instruction after a trap 0 instruction. d0 is 1055 which is not a 
> >> signal number I recognize.
> >>
> >
> > I don't know what d0 represents here. But &frame->sig == 0x11 is 
> > correct (SIGCHLD).
> 
> Correct - that all works out. But d0 holds the syscall number when we 
> enter the kernel via trap 0, and that one is odd.
> 

Well, you showed subsequently that the kernel was probably entered via a 
page fault and not the get_thread_area trap. Would that explain the d0 
value?

> >>> ...
> >>>
> >>> Here's some stack memory from the core dump.
> >>>
> >>> 0xeffff0dc:     0xd000c38e      return address waitproc+124
> >>> 0xeffff0d8:     0xd001c1ec      frame 0 $fp               == &suppressint
> >>> 0xeffff0d4:     0x00add14b      canary
> >>> 0xeffff0d0:     0x00000000
> >>> 0xeffff0cc:     0x0000000a
> >>> 0xeffff0c8:     0x00000202
> >>> 0xeffff0c4:     0x00000008
> >>> 0xeffff0c0:     0x00000000
> >>> 0xeffff0bc:     0x00000000
> >>> 0xeffff0b8:     0x00000174
> >>> 0xeffff0b4:     0x00000004
> >>> 0xeffff0b0:     0x00000004
> >>> 0xeffff0ac:     0x00000006
> >>> 0xeffff0a8:     0x000000e0
> >>> 0xeffff0a4:     0x000000e0
> >>> 0xeffff0a0:     0x00171f20
> >>> 0xeffff09c:     0x00171f20
> >>> 0xeffff098:     0x00171f20
> >>> 0xeffff094:     0x00000002
> >>> 0xeffff090:     0x00002000
> >>> 0xeffff08c:     0x00000006
> >>> 0xeffff088:     0x0000e920
> >>> 0xeffff084:     0x00005360
> >>> 0xeffff080:     0x00170700
> >>> 0xeffff07c:     0x00170700
> >>> 0xeffff078:     0x00170700      frame 0 $fp - 96
> >>> 0xeffff074:     0xd001b874                         saved $a5 == dash .got
> >>> 0xeffff070:     0xd001e498                         saved $a3 == &dash_errno
> >>> 0xeffff06c:     0xd001e718      frame 0 $sp        saved $a2 == &gotsigchld
> >>> 0xeffff068:     0x00000000
> >>> 0xeffff064:     0x00000000
> >>> 0xeffff060:     0xeffff11e
> >>> 0xeffff05c:     0xffffffff
> >>> 0xeffff058:     0xc00e4164      return address __wait3+244
> >>> 0xeffff054:     0x00add14b      canary
> >>> 0xeffff050:     0x00000001
> >>> 0xeffff04c:     0x00000004
> >>> 0xeffff048:     0x0000000d
> >>> 0xeffff044:     0x0000000d
> >>> 0xeffff040:     0x0015ef82
> >>> 0xeffff03c:     0x0015ef82
> >>> 0xeffff038:     0x0015ef82
> >>> 0xeffff034:     0x00000003
> >>> 0xeffff030:     0x00000004
> >>> 0xeffff02c:     0x00000004
> >>> 0xeffff028:     0x00000140
> >>> 0xeffff024:     0x00000140
> >>> 0xeffff020:     0x00000034
> >>> 0xeffff01c:     0x00000034
> >>> 0xeffff018:     0x00000034
> >>> 0xeffff014:     0x00000006
> >>> 0xeffff010:     0x003b003a
> >>> 0xeffff00c:     0x000a0028
> >>> 0xeffff008:     0x00340020
> >>> 0xeffff004:     0xc019c000                      saved $a5 == libc .got
> >>> 0xeffff000:     0xeffff068                      saved $a3 (corrupted)
> >>> 0xefffeffc:     0x00000000                      saved $a2
> >>> 0xefffeff8:     0x00000001                      saved $d5
> >>> 0xefffeff4:     0xeffff122                      saved $d4
> >>> 0xefffeff0:     0xeffff11e                      saved $d3
> >>> 0xefffefec:     0x00000000                      saved $d2
> >>> 0xefffefe8:     0xc00e419a      return address __GI___wait4_time64+38
> >>> 0xefffefe4:     0xc0028780
> >>> 0xefffefe0:     0x3c344bfb
> >>> 0xefffefdc:     0x000af353
> >>> 0xefffefd8:     0x3c340170
> >>> 0xefffefd4:     0x00000000
> >>> 0xefffefd0:     0xc00e417c
> >>> 0xefffefcc:     0xc00e417e
> >>> 0xefffefc8:     0xc00e4180
> >>> 0xefffefc4:     0x48e73c34
> >>> 0xefffefc0:     0x00000000
> >>> 0xefffefbc:     0xefffeff8
> >>> 0xefffefb8:     0xefffeffc
> >>> 0xefffefb4:     0x4bfb0170
> >>> 0xefffefb0:     0x0eee0709
> >>> 0xefffefac:     0x00000000
> >>> 0xefffefa8:     0x00000000
> >>> 0xefffefa4:     0x00000000
> >>> 0xefffefa0:     0x00000000
> >>> 0xefffef9c:     0x00000000
> >>> 0xefffef98:     0x00000000
> >>> 0xefffef94:     0x00000000
> >>> 0xefffef90:     0x00000000
> >>> 0xefffef8c:     0x00000000
> >>> 0xefffef88:     0x00000000
> >>> 0xefffef84:     0x00000000
> >>> 0xefffef80:     0x00000000
> >>> 0xefffef7c:     0x00000000
> >>> 0xefffef78:     0x00000000
> >>> 0xefffef74:     0x00000000
> >>> 0xefffef70:     0x00000000
> >>> 0xefffef6c:     0x00000000
> >>> 0xefffef68:     0x00000000
> >>> 0xefffef64:     0x00000000
> >>> 0xefffef60:     0x00000000
> >>> 0xefffef5c:     0x00000000
> >>> 0xefffef58:     0x00000000
> >>> 0xefffef54:     0x00000000
> >>> 0xefffef50:     0x00000000
> >>> 0xefffef4c:     0x00000000
> >>> 0xefffef48:     0x00000000
> >>> 0xefffef44:     0x00000000
> >>> 0xefffef40:     0x00000000
> >>> 0xefffef3c:     0x00000000
> >>> 0xefffef38:     0x00000000
> >>> 0xefffef34:     0x00000000
> >>> 0xefffef30:     0x00000000
> >>> 0xefffef2c:     0x00000000
> >>> 0xefffef28:     0x00000000
> >>> 0xefffef24:     0x00000000
> >>> 0xefffef20:     0x00000000
> >>> 0xefffef1c:     0x00000000
> >>> 0xefffef18:     0x00000000
> >>> 0xefffef14:     0x00000000
> >>> 0xefffef10:     0x7c0effff
> >>> 0xefffef0c:     0xffffffff
> >>> 0xefffef08:     0xaaaaaaaa
> >>> 0xefffef04:     0xaf54eaaa
> >>> 0xefffef00:     0x40040000
> >>> 0xefffeefc:     0x40040000
> >>> 0xefffeef8:     0x2b000000
> >>> 0xefffeef4:     0x00000000
> >>> 0xefffeef0:     0x00000000
> >>> 0xefffeeec:     0x408ece9a
> >>> 0xefffeee8:     0x00000000
> >>> 0xefffeee4:     0xf0ff0000
> >>> 0xefffeee0:     0x0f800000
> >>> 0xefffeedc:     0xf0fff0ff
> >>> 0xefffeed8:     0x1f380000
> >>> 0xefffeed4:     0x00000000
> >>> 0xefffeed0:     0x00000000
> >>> 0xefffeecc:     0x00000000    
> >>> 0xefffeec8:     0xffffffff    
> >>> 0xefffeec4:     0xffffffff    
> >>> 0xefffeec0:     0x7fff0000    
> >>> 0xefffeebc:     0xffffffff    
> >>> 0xefffeeb8:     0xffffffff
> >>> 0xefffeeb4:     0x7fff0000    sc_formatvec
> >>>
> >>> The signal frame is not readily apparent (to me).
> >>
> >> From looking at the above stack dump, sc ought to start at 0xefffee90,
> >> and the trampoline would be three words below that.
> >
> > 0xefffeeb0:     0x4178b008    sc_pc, sc_formatvec
> > 0xefffeeac:     0x0008c00e    sc_sr, sc_pc
> > 0xefffeea8:     0xd00223bb    sc_a1
> > 0xefffeea4:     0xd001e32c    sc_a0
> > 0xefffeea0:     0x00000003    sc_d1
> > 0xefffee9c:     0xeffff11e    sc_d0
> > 0xefffee98:     0xeffff004    sc_usp
> > 0xefffee94:     0x00000000    sc_mask
> > 0xefffee90:     0x00000000    extramask
> > 0xefffee8c:     0xc0024a90    retcode[1]
> > 0xefffee88:     0x70774e40    retcode[0]
> > 0xefffee84:     0xefffee94    psc
> > 0xefffee80:     0x00000008    code
> > 0xefffee7c:     0x00000011    sig
> > 0xefffee78:     0xefffee88    pretcode
> 
> OK, that's our  SIGCHLD. But the signal frame format is odd ...
> 
> Frame format b, vector offset 008. That's a bus error? 
> How does that get on the user mode stack?
> 
> > 0xefffee74:     0xc019c000
> > 0xefffee70:     0x00000000
> > 0xefffee6c:     0xc0025878
> > 0xefffee68:     0xc0007ed4
> > 0xefffee64:     0xc0024000
> > 0xefffee60:     0xefffef50
> > 0xefffee5c:     0xc0024000
> > 0xefffee58:     0xc002a034
> > 0xefffee54:     0xc0024a90
> > 0xefffee50:     0xc0025878
> > 0xefffee4c:     0x00000001
> > 0xefffee48:     0x0017f020
> > 0xefffee44:     0x0000002c
> > 0xefffee40:     0x0000000f
> > 0xefffee3c:     0x00000000
> > 0xefffee38:     0xfffff7fa
> > 0xefffee34:     0xffffffff
> > 0xefffee30:     0x00009782
> > 0xefffee2c:     0x00000000
> > 0xefffee28:     0x0000001e
> > 0xefffee24:     0xc0025858
> > 0xefffee20:     0xc0025af8
> > 0xefffee1c:     0xc000b376
> > 0xefffee18:     0xc0024000
> > 0xefffee14:     0xc0025878
> > 0xefffee10:     0x0000001d
> > 0xefffee0c:     0xd0001b60
> > 0xefffee08:     0x0000002f
> > 0xefffee04:     0xc002563e
> > 0xefffee00:     0xc0025490
> >
> >> The last address you show corresponds to 0xeffff640 in first dump 
> >> above, which is at the start of the saved fpregs. I'd say we just 
> >> miss the beginning of the signal frame?
> >>
> >
> > It looks like you're right. I'm not sure how I missed that.
> >
> > So when the signal was delivered, PC == 0xc00e4178 and USP == 
> > 0xc00e4178.
> 
> USP is 0xeffff004 AFAICS. That's the location 15 was saved to above 
> (holding libc .got according to your interpretation).
> 

Right, it was a typo. USP is 0xeffff004, where a5 is to be saved.

> The saved PC is that from the exception frame, in this case a long bus 
> error sequence fault frame. The PC is that of the instruction executing 
> when the fault occurred. As you say, that's the moveml saving registers 
> to the stack.
> 
> I don't believe the whole fault frame is on the signal stack in one 
> contiguous piece, just the first four words, then we have struct 
> sigcontext. But after that, the extra contents follows, and that nicely 
> explains the extra bits right below the return address from the 
> __m68k_read_tp call.
> 
> > Those addresses can be found in the disassembly and the stack contents 
> > I sent previously (quoted above) and it all seems to line up.
> >
> >> (My reasoning is that copy_siginfo_to_user clears the end of the 
> >> signal stack, which is what we can see in both cases.)
> >>
> >> Can't explain the 14 words below the saved return address though.
> >>
> >
> > Right. Is it sc_fpstate? Perhaps we should expect QEMU to differ here.
> 
> See above - I think what's stored there is the extra frame content for a 
> format b bus error frame. But that extra frame is incomplete at best 
> (should be 22 longwords, only a4 are seen). Probably overwritten by the 
> stack frame from __GI___wait4_time64.
> 

Maybe the exception frame leaked onto the user stack via setup_frame()?

> Let's parse what's left:
> <=
> >>> 0xefffefe4:     0xc0028780        <= internal registers (6x)
> >>> 0xefffefe0:     0x3c344bfb        <=
> >>> 0xefffefdc:     0x000af353        <=
> >>> 0xefffefd8:     0x3c340170        <= internal reg; version no.
> >>> 0xefffefd4:     0x00000000        <= data input buffer
> >>> 0xefffefd0:     0xc00e417c        <= internal registers (2x)
> >>> 0xefffefcc:     0xc00e417e        <= stage b address
> >>> 0xefffefc8:     0xc00e4180        <= internal registers (4x)
> >>> 0xefffefc4:     0x48e73c34        <=
> >>> 0xefffefc0:     0x00000000        <= data output buffer
> >>> 0xefffefbc:     0xefffeff8        <= internal registers (2x)
> >>> 0xefffefb8:     0xefffeffc        <= data fault address
> >>> 0xefffefb4:     0x4bfb0170        <= ins stage c, stage b
> >>> 0xefffefb0:     0x0eee0709        <= internal register; ssw
> 
> The fault address is the location on the stack where a2 is saved. That 
> does match the data output buffer contents BTW. fc, fb, rc, rb bits 
> clear means the fault didn't occur in stage b or c instructions. ssw bit 
> 8 set indicates a data fault - the data cycle should be rerun on rte. rm 
> and rw bits clear tell us it's a write fault. If the moveml instruction 
> copies registers to the stack in descending order, the fault address 
> makes sense - the stack pointer just crossed a page boundary.
> 

Well spotted! 

> >
> > Bottom line is, the corrupted %a3 register would have been saved by 
> > the MOVEM instruction at 0xc00e4178, which turns out to be the PC in 
> > the signal frame. So it certainly looks like the kernel was the 
> > culprit here.
> 
> I think the moveml instruction did cause a bus error, and on return from 
> that exception the signal got delivered.
> 

Maybe the signal frame was partially overwritten by the resumed MOVEM?

I wonder what we'd see if we patched the kernel to log every user data 
write fault caused by a MOVEM instruction. I'll try to code that up.

> On entering the buserror handler, only a1 and a2 are saved, but the 
> comment in entry.h states that a3-a6 and d6, d7 are preserved by C code. 
> After buserr_c returns, a3 should be restored to what it was when taking 
> the bus error. All registers restored before rte, the moveml instruction 
> ought to be able to resume normally.
> 
> Unless that register use constraint has changed, I don't see how a3 
> could have changed midway during return from the bus error exception. 
> But maybe a disassembly of buserr_c from your kernel could confirm that?
> 

I disassembled the relevant build. AFAICT, buserr_c() saves and restores 
those registers in the right places.

BTW, I've reproduced the failures with kernels built with both GCC 12 and 
GCC 6.
