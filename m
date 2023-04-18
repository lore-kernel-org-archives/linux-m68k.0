Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F03C77B72
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Apr 2023 02:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjDRCBV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 22:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjDRCBT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 22:01:19 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C0B4201
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 19:01:17 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id F3A1A5C0140;
        Mon, 17 Apr 2023 22:01:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 17 Apr 2023 22:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681783275; x=1681869675; bh=boA+7Sp308kwS
        Bo25byDuVNupBa/3bs5caEZ6wX/dyQ=; b=dfjiIyAVzy4d8Ee3yUZNvBSYplkUD
        IS0PZDHDkO7fdtxWmeTA6SfoeeUyA8od2cicez4R19fkitpdvApsbgLiH4VL3us5
        AdXFA9Mb+l2b2Lbue6LhuDJU37XYHJi86onx1zvP63VIv4iOuIOabaKFE5INXRY5
        PWr9zB9tHznvVwj/3O4GCW7vv8A1zTTOiAlSDRntPbxhSRbXph5D07PooUChemAL
        pfgN760N7olu6IRC3+syDcKypOwMm7JctsZybeMIZgA/b2a4I8nI9hHuH6z/3h6S
        g4oc9t3fRPjUn/HKX09hQ+bePLfIwikVI3jBoeuqP6UUhAJKF34NoRVBQ==
X-ME-Sender: <xms:6_k9ZPjw9E1BlI4cr1vjm7MakkFE5QJSWeLwGEPbTg6Fy9IZzPf09A>
    <xme:6_k9ZMCFX76VNl8tkROx60Knn52mdYUO2MWdMqVg2FstR2nGDE1Ick0kXuHy6f5XU
    1IE3CiK5b4HbTZj1kM>
X-ME-Received: <xmr:6_k9ZPHKNqX9aem4WgDGKGQPysOQpuq28bgWJdLoPdTJODGa7P_dZ5byi6ZZp_QqO2GWjPe52VZ3x2NFsgt81SEP9iybpt9qaN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeljedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:6_k9ZMRauOsitREYM0q_WAUZnhv5nqjIp9GTU6RHObS2Y45AY8gKTw>
    <xmx:6_k9ZMyB_t_z5PibEF4egfyVfSdd2fZ_DcibUJEaeb5fqIMzPQNBOw>
    <xmx:6_k9ZC4o8RiQcLVtgZT2oisVZ0yThB7O6y2XDCKpP2PLtSF-uWNg3w>
    <xmx:6_k9ZCb1PYAU6QSvLFDhauPQlbad2RXareEN84n8Dx2iHn8Hi7b08w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Apr 2023 22:01:12 -0400 (EDT)
Date:   Tue, 18 Apr 2023 12:04:25 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
Message-ID: <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 18 Apr 2023, Michael Schmitz wrote:

> Am 16.04.2023 um 18:44 schrieb Finn Thain:
> 
> >
> > The backtrace confirms that this signal was delivered during execution 
> > of __wait3(). (Delivery can happen during execution of __libc_fork() 
> > but I just repeat the test until I get these ducks in a row.)
> >
> > (gdb) c
> > Continuing.
> > # x=$(:)
> > [Detaching after fork from child process 1055]
> >
> > Breakpoint 6.1, onsig (signo=17) at trap.c:286
> > 286     trap.c: No such file or directory.
> > (gdb) bt
> > #0  onsig (signo=17) at trap.c:286
> > #1  <signal handler called>
> > #2  0xc00e81b6 in __GI___wait4_time64 (pid=-1, stat_loc=0xeffff86a,
> > options=2,
> >     usage=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:35
> > #3  0xc00e8164 in __GI___wait3_time64 (usage=0x0, options=<optimized out>,
> >     stat_loc=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:26
> 
> Where did that one come from? I don't think we saw __GI___wait3_time64 
> called in your disassembly of __wait3 ...
> 
> > #4  __wait3 (stat_loc=<optimized out>, options=<optimized out>,
> >     usage=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:35


Well spotted. However, it turns out there is a good explanation for that:

(gdb) print __GI___wait3_time64
$3 = {pid_t (int *, int, struct __rusage64 *)} 0xc00e4054 <__GI___wait3_time64>
(gdb) disass __GI___wait3_time64
Dump of assembler code for function __GI___wait3_time64:
   0xc00e4054 <+0>:     movel %sp@(12),%sp@-
   0xc00e4058 <+4>:     movel %sp@(12),%sp@-
   0xc00e405c <+8>:     movel %sp@(12),%sp@-
   0xc00e4060 <+12>:    pea 0xffffffff
   0xc00e4064 <+16>:    bsrl 0xc00e4174 <__GI___wait4_time64>
   0xc00e406a <+22>:    lea %sp@(16),%sp
   0xc00e406e <+26>:    rts
End of assembler dump.
(gdb) print __wait3
$2 = {pid_t (int *, int, struct rusage *)} 0xc00e4070 <__wait3>
(gdb) disass __wait3
Dump of assembler code for function __wait3:
   0xc00e4070 <+0>:     linkw %fp,#-96
   0xc00e4074 <+4>:     moveml %a2-%a3/%a5,%sp@-
   0xc00e4078 <+8>:     lea %pc@(0xc019c000),%a5
   0xc00e4080 <+16>:    movel %fp@(8),%d0
   0xc00e4084 <+20>:    moveal %fp@(16),%a2
   0xc00e4088 <+24>:    moveal %a5@(108),%a3
   0xc00e408c <+28>:    movel %a3@,%fp@(-4)
   0xc00e4090 <+32>:    tstl %a2
   0xc00e4092 <+34>:    beqw 0xc00e4152 <__wait3+226>
   0xc00e4096 <+38>:    pea %fp@(-92)
   0xc00e409a <+42>:    movel %fp@(12),%sp@-
   0xc00e409e <+46>:    movel %d0,%sp@-
   0xc00e40a0 <+48>:    pea 0xffffffff
   0xc00e40a4 <+52>:    bsrl 0xc00e4174 <__GI___wait4_time64>
   0xc00e40aa <+58>:    lea %sp@(16),%sp
   0xc00e40ae <+62>:    tstl %d0
   0xc00e40b0 <+64>:    bgts 0xc00e40c8 <__wait3+88>
   0xc00e40b2 <+66>:    moveal %fp@(-4),%a0
   0xc00e40b6 <+70>:    movel %a3@,%d1
   0xc00e40b8 <+72>:    cmpl %a0,%d1
   0xc00e40ba <+74>:    bnew 0xc00e416c <__wait3+252>
   0xc00e40be <+78>:    moveml %fp@(-108),%a2-%a3/%a5
   0xc00e40c4 <+84>:    unlk %fp
   0xc00e40c6 <+86>:    rts
   0xc00e40c8 <+88>:    pea 0x44
   0xc00e40cc <+92>:    clrl %sp@-
   0xc00e40ce <+94>:    pea %a2@(4)
   0xc00e40d2 <+98>:    movel %d0,%fp@(-96)
   0xc00e40d6 <+102>:   bsrl 0xc00bc850 <__GI_memset>
   0xc00e40dc <+108>:   movel %fp@(-88),%a2@
   0xc00e40e0 <+112>:   movel %fp@(-80),%a2@(4)
   0xc00e40e6 <+118>:   movel %fp@(-72),%a2@(8)
   0xc00e40ec <+124>:   movel %fp@(-64),%a2@(12)
   0xc00e40f2 <+130>:   movel %fp@(-60),%a2@(16)
   0xc00e40f8 <+136>:   movel %fp@(-56),%a2@(20)
   0xc00e40fe <+142>:   movel %fp@(-52),%a2@(24)
   0xc00e4104 <+148>:   movel %fp@(-48),%a2@(28)
   0xc00e410a <+154>:   movel %fp@(-44),%a2@(32)
   0xc00e4110 <+160>:   movel %fp@(-40),%a2@(36)
   0xc00e4116 <+166>:   movel %fp@(-36),%a2@(40)
   0xc00e411c <+172>:   movel %fp@(-32),%a2@(44)
   0xc00e4122 <+178>:   movel %fp@(-28),%a2@(48)
   0xc00e4128 <+184>:   movel %fp@(-24),%a2@(52)
   0xc00e412e <+190>:   movel %fp@(-20),%a2@(56)
   0xc00e4134 <+196>:   movel %fp@(-16),%a2@(60)
   0xc00e413a <+202>:   movel %fp@(-12),%a2@(64)
   0xc00e4140 <+208>:   movel %fp@(-8),%a2@(68)
   0xc00e4146 <+214>:   lea %sp@(12),%sp
   0xc00e414a <+218>:   movel %fp@(-96),%d0
   0xc00e414e <+222>:   braw 0xc00e40b2 <__wait3+66>
   0xc00e4152 <+226>:   clrl %sp@-
   0xc00e4154 <+228>:   movel %fp@(12),%sp@-
   0xc00e4158 <+232>:   movel %d0,%sp@-
   0xc00e415a <+234>:   pea 0xffffffff
   0xc00e415e <+238>:   bsrl 0xc00e4174 <__GI___wait4_time64>
   0xc00e4164 <+244>:   lea %sp@(16),%sp
   0xc00e4168 <+248>:   braw 0xc00e40b2 <__wait3+66>
=> 0xc00e416c <+252>:   illegal
End of assembler dump.


(gdb) info frame
Stack level 3, frame at 0xeffff82c:
 pc = 0xc00e8164 in __GI___wait3_time64
    (../sysdeps/unix/sysv/linux/wait3.c:26); saved pc = 0xd000c38e
 inlined into frame 4, caller of frame at 0xeffff7a8
 source language c.
 Arglist at unknown address.
 Locals at unknown address, Previous frame's sp is 0xeffff7a8
 Saved registers:
  d2 at 0xeffff738, d3 at 0xeffff73c, d4 at 0xeffff740, d5 at 0xeffff744,
  a2 at 0xeffff748, a3 at 0xeffff74c, a5 at 0xeffff750, pc at 0xeffff7a4


(gdb) up
#4  __wait3 (stat_loc=<optimized out>, options=<optimized out>, 
    usage=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:35
35      in ../sysdeps/unix/sysv/linux/wait3.c
(gdb) info frame
Stack level 4, frame at 0xeffff82c:
 pc = 0xc00e8164 in __wait3 (../sysdeps/unix/sysv/linux/wait3.c:35); 
    saved pc = 0xd000c38e
 called by frame at 0xeffff928, caller of frame at 0xeffff82c
 source language c.
 Arglist at 0xeffff824, args: stat_loc=<optimized out>, 
    options=<optimized out>, usage=<optimized out>
 Locals at 0xeffff824, Previous frame's sp is 0xeffff82c
 Saved registers:
  a2 at 0xeffff7b8, a3 at 0xeffff7bc, a5 at 0xeffff7c0, fp at 0xeffff824,
  pc at 0xeffff828


Note that frame 3 was "inlined into frame 4". The inlined code can be seen 
above at 0xc00e4154. So the backtrace is misleading inasmuchas it 
represents the source code rather than the disassembly.

> > #5  0xd000c38e in waitproc (status=0xeffff85a, block=1) at jobs.c:1179
> > #6  waitone (block=1, job=0xd001f618) at jobs.c:1055
> > #7  0xd000c5b8 in dowait (block=1, jp=0xd001f618) at jobs.c:1137
> > #8  0xd000ddb0 in waitforjob (jp=0xd001f618) at jobs.c:1014
> > #9  0xd000aade in expbackq (flag=68, cmd=0xd001e4c8 <stackbase+36>)
> >     at expand.c:520
> > #10 argstr (p=<optimized out>, flag=68) at expand.c:335
> > #11 0xd000b5ce in expandarg (arg=0xd001e4e8 <stackbase+68>,
> >     arglist=0xeffffb08, flag=4) at expand.c:192
> > #12 0xd0007e2a in evalcommand (cmd=<optimized out>, flags=<optimized out>)
> >     at eval.c:855
> > #13 0xd0006ffc in evaltree (n=0xd001e4f8 <stackbase+84>, flags=0) at
> > eval.c:300
> > #14 0xd000e3c0 in cmdloop (top=1) at main.c:246
> > #15 0xd0005018 in main (argc=<optimized out>, argv=<optimized out>)
> >     at main.c:181
> >
> >
> > 0xeffff750:     0xc01a0000                      saved $a5 == libc .got
> > 0xeffff74c:     0xc0023e8c                      saved $a3 == &__stack_chk_guard
> > 0xeffff748:     0x00000000                      saved $a2
> > 0xeffff744:     0x00000001                      saved $d5
> > 0xeffff740:     0xeffff86e                      saved $d4
> > 0xeffff73c:     0xeffff86a                      saved $d3
> > 0xeffff738:     0x00000002                      saved $d2
> > 0xeffff734:     0x00000000
> > 0xeffff730:     0x00000000
> > 0xeffff72c:     0x00000000
> > 0xeffff728:     0x00000000
> > 0xeffff724:     0x00000000
> > 0xeffff720:     0x00000000
> > 0xeffff71c:     0x00000000
> > 0xeffff718:     0x00000000
> > 0xeffff714:     0x00000000
> > 0xeffff710:     0x00000000
> > 0xeffff70c:     0x00000000
> > 0xeffff708:     0x00000000
> > 0xeffff704:     0x00000000
> > 0xeffff700:     0x00000000
> > 0xeffff6fc:     0x00000000
> > 0xeffff6f8:     0x00000000
> > 0xeffff6f4:     0x00000000
> > 0xeffff6f0:     0x00000000
> > 0xeffff6ec:     0x00000000
> > 0xeffff6e8:     0x00000000
> > 0xeffff6e4:     0x00000000
> > 0xeffff6e0:     0x00000000
> > 0xeffff6dc:     0x00000000
> > 0xeffff6d8:     0x00000000
> > 0xeffff6d4:     0x00000000
> > 0xeffff6d0:     0x00000000
> > 0xeffff6cc:     0x00000000
> > 0xeffff6c8:     0x00000000
> > 0xeffff6c4:     0x00000000
> > 0xeffff6c0:     0x00000000
> > 0xeffff6bc:     0x00000000
> > 0xeffff6b8:     0x00000000
> > 0xeffff6b4:     0x00000000
> > 0xeffff6b0:     0x00000000
> > 0xeffff6ac:     0x00000000
> > 0xeffff6a8:     0x00000000
> > 0xeffff6a4:     0x00000000
> > 0xeffff6a0:     0x00000000
> > 0xeffff69c:     0x00000000
> > 0xeffff698:     0x00000000
> > 0xeffff694:     0x00000000
> > 0xeffff690:     0x00000000
> > 0xeffff68c:     0x00000000
> > 0xeffff688:     0x00000000
> > 0xeffff684:     0x00000000
> > 0xeffff680:     0x00000000
> > 0xeffff67c:     0x00000000
> > 0xeffff678:     0x00000000
> > 0xeffff674:     0x00000000
> > 0xeffff670:     0x00000000
> > 0xeffff66c:     0x00000000
> > 0xeffff668:     0x00000000
> > 0xeffff664:     0x00000000
> > 0xeffff660:     0x41000000
> > 0xeffff65c:     0x00000000
> > 0xeffff658:     0x00000000
> > 0xeffff654:     0x00000000
> > 0xeffff650:     0x00000000
> > 0xeffff64c:     0x80000000
> > 0xeffff648:     0x3fff0000
> > 0xeffff644:     0x00000000
> > 0xeffff640:     0xd0000000
> > 0xeffff63c:     0x40020000				<= (sc.formatvec & 0xffff) << 16; fpregs from here on
> > 0xeffff638:     0x81b60080      			<= (sc.pc & 0xffff) << 16 | sc.formatvec >> 16
> > 0xeffff634:     0x0000c00e				<= sc.sr << 16  sc.pc >> 16
> > 0xeffff630:     0xd001e4e3                          <= sc.a1
> > 0xeffff62c:     0xc0028780                          <= sc.a0
> > 0xeffff628:     0xffffffff                          <= sc.d1
> > 0xeffff624:     0x0000041f                          <= sc.d0
> > 0xeffff620:     0xeffff738                          <= sc.usp
> > 0xeffff61c:     0x00000000      			<= sc.mask
> > 0xeffff618:     0x00000000				<= extramask
> > 0xeffff614:     0x00000000				<= frame.retcode[1]
> > 0xeffff610:     0x70774e40      moveq #119,%d0 ; trap #0
> > 0xeffff60c:     0xeffff61c				<= frame->sc
> > 0xeffff608:     0x00000080				<= tregs->vector
> > 0xeffff604:     0x00000011				<= signal no.
> > 0xeffff600:     0xeffff610      return address
> >
> > The above comes from dash running under gdb under qemu, which does not 
> > exhibit the failure but is convenient for that kind of experiment.
> 
> I would have expected to see a different signal trampoline (for 
> sys_rt_sigreturn) ... 

Well, this seems to be the trampoline from setup_frame() and not 
setup_rt_frame().

> But anyway:
> 
> The saved pc is 0xc00e81b6 which does match the backtrace above. Vector 
> offset 80 matches trap 0 which suggests 0xc00e81b6 should be the 
> instruction after a trap 0 instruction. d0 is 1055 which is not a signal 
> number I recognize.
> 

I don't know what d0 represents here. But &frame->sig == 0x11 is correct 
(SIGCHLD).

> >
> >> Again as far as I understand, the core dump happens on process exit. 
> >> Stack smashing is detected and process exit is forced only at exit 
> >> from __wait3() or __wait4_time64(),
> >
> > I placed an illegal instruction in __wait3. This executes instead of 
> > the call to __stack_chk_fail because that obliterates stack memory of 
> > interest.
> 
> OK.
> 
> >
> > Consequently the latest core dump still contains dead stack frames 
> > (see below) of subroutines that returned before __wait3() dumped core. 
> > You can see the return address for the branch to __wait4_time64() and 
> > below that you can see the return address for the branch to 
> > __m68k_read_tp().
> >
> > (gdb) disas __wait4_time64
> > Dump of assembler code for function __GI___wait4_time64:
> >    0xc00e4174 <+0>:     lea %sp@(-80),%sp
> >    0xc00e4178 <+4>:     moveml %d2-%d5/%a2-%a3/%a5,%sp@-
> >    0xc00e417c <+8>:     lea %pc@(0xc019c000),%a5
> >    0xc00e4184 <+16>:    movel %sp@(116),%d2
> >    0xc00e4188 <+20>:    moveal %sp@(124),%a2
> >    0xc00e418c <+24>:    moveal %a5@(108),%a3
> >    0xc00e4190 <+28>:    movel %a3@,%sp@(104)
> >    0xc00e4194 <+32>:    bsrl 0xc0056e2c <__m68k_read_tp@plt>
> >
> > I gather the signal was delivered before __wait4_time64+38, otherwise 
> > the return address 0xc00e419a (which appears below) would have been 
> > overwritten by the signal frame. The signal must have been delivered 
> > after waitproc() initialized gotsigchld = 0 since gotsigchld is 1 at 
> > the time of the coredump.
> >
> > I assume the %a3 corruption happened after __wait4_time64+8 because 
> > that's when %a3 first appears on the stack. And the corruption must 
> > have happened before __wait4_time64+238, which is when %a3 was 
> > restored.
> >
> > If it was the signal which somehow corrupted the saved %a3, there's 
> > only a small window for that. The only syscall in that window is 
> > get_thread_area.
> 
> I see sys_wait4 called in two places (0xc00e01b4, and then 0xc00e0286 
> depending on the return code of the first). The second one again would 
> have called __m68k_read_tp so would have left a return address on the 
> stack (0xc00e02d2). Leaves the first.
> 

That's why my analysis stopped at __wait4_time64+38: the rest of 
__wait4_time64 is not relevant to the dead stack contents. (It would have 
left a different return address in that memory location.)

> >
> > Here's some stack memory from the core dump.
> >
> > 0xeffff0dc:     0xd000c38e      return address waitproc+124
> > 0xeffff0d8:     0xd001c1ec      frame 0 $fp                   ==
> > &suppressint
> > 0xeffff0d4:     0x00add14b      canary
> > 0xeffff0d0:     0x00000000
> > 0xeffff0cc:     0x0000000a
> > 0xeffff0c8:     0x00000202
> > 0xeffff0c4:     0x00000008
> > 0xeffff0c0:     0x00000000
> > 0xeffff0bc:     0x00000000
> > 0xeffff0b8:     0x00000174
> > 0xeffff0b4:     0x00000004
> > 0xeffff0b0:     0x00000004
> > 0xeffff0ac:     0x00000006
> > 0xeffff0a8:     0x000000e0
> > 0xeffff0a4:     0x000000e0
> > 0xeffff0a0:     0x00171f20
> > 0xeffff09c:     0x00171f20
> > 0xeffff098:     0x00171f20
> > 0xeffff094:     0x00000002
> > 0xeffff090:     0x00002000
> > 0xeffff08c:     0x00000006
> > 0xeffff088:     0x0000e920
> > 0xeffff084:     0x00005360
> > 0xeffff080:     0x00170700
> > 0xeffff07c:     0x00170700
> > 0xeffff078:     0x00170700      frame 0 $fp - 96
> > 0xeffff074:     0xd001b874                         saved $a5 == dash .got
> > 0xeffff070:     0xd001e498                         saved $a3 == &dash_errno
> > 0xeffff06c:     0xd001e718      frame 0 $sp        saved $a2 == &gotsigchld
> > 0xeffff068:     0x00000000
> > 0xeffff064:     0x00000000
> > 0xeffff060:     0xeffff11e
> > 0xeffff05c:     0xffffffff
> > 0xeffff058:     0xc00e4164      return address __wait3+244
> > 0xeffff054:     0x00add14b      canary
> > 0xeffff050:     0x00000001
> > 0xeffff04c:     0x00000004
> > 0xeffff048:     0x0000000d
> > 0xeffff044:     0x0000000d
> > 0xeffff040:     0x0015ef82
> > 0xeffff03c:     0x0015ef82
> > 0xeffff038:     0x0015ef82
> > 0xeffff034:     0x00000003
> > 0xeffff030:     0x00000004
> > 0xeffff02c:     0x00000004
> > 0xeffff028:     0x00000140
> > 0xeffff024:     0x00000140
> > 0xeffff020:     0x00000034
> > 0xeffff01c:     0x00000034
> > 0xeffff018:     0x00000034
> > 0xeffff014:     0x00000006
> > 0xeffff010:     0x003b003a
> > 0xeffff00c:     0x000a0028
> > 0xeffff008:     0x00340020
> > 0xeffff004:     0xc019c000                      saved $a5 == libc .got
> > 0xeffff000:     0xeffff068                      saved $a3 (corrupted)
> > 0xefffeffc:     0x00000000                      saved $a2
> > 0xefffeff8:     0x00000001                      saved $d5
> > 0xefffeff4:     0xeffff122                      saved $d4
> > 0xefffeff0:     0xeffff11e                      saved $d3
> > 0xefffefec:     0x00000000                      saved $d2
> > 0xefffefe8:     0xc00e419a      return address __GI___wait4_time64+38
> > 0xefffefe4:     0xc0028780
> > 0xefffefe0:     0x3c344bfb
> > 0xefffefdc:     0x000af353
> > 0xefffefd8:     0x3c340170
> > 0xefffefd4:     0x00000000
> > 0xefffefd0:     0xc00e417c
> > 0xefffefcc:     0xc00e417e
> > 0xefffefc8:     0xc00e4180
> > 0xefffefc4:     0x48e73c34
> > 0xefffefc0:     0x00000000
> > 0xefffefbc:     0xefffeff8
> > 0xefffefb8:     0xefffeffc
> > 0xefffefb4:     0x4bfb0170
> > 0xefffefb0:     0x0eee0709
> > 0xefffefac:     0x00000000
> > 0xefffefa8:     0x00000000
> > 0xefffefa4:     0x00000000
> > 0xefffefa0:     0x00000000
> > 0xefffef9c:     0x00000000
> > 0xefffef98:     0x00000000
> > 0xefffef94:     0x00000000
> > 0xefffef90:     0x00000000
> > 0xefffef8c:     0x00000000
> > 0xefffef88:     0x00000000
> > 0xefffef84:     0x00000000
> > 0xefffef80:     0x00000000
> > 0xefffef7c:     0x00000000
> > 0xefffef78:     0x00000000
> > 0xefffef74:     0x00000000
> > 0xefffef70:     0x00000000
> > 0xefffef6c:     0x00000000
> > 0xefffef68:     0x00000000
> > 0xefffef64:     0x00000000
> > 0xefffef60:     0x00000000
> > 0xefffef5c:     0x00000000
> > 0xefffef58:     0x00000000
> > 0xefffef54:     0x00000000
> > 0xefffef50:     0x00000000
> > 0xefffef4c:     0x00000000
> > 0xefffef48:     0x00000000
> > 0xefffef44:     0x00000000
> > 0xefffef40:     0x00000000
> > 0xefffef3c:     0x00000000
> > 0xefffef38:     0x00000000
> > 0xefffef34:     0x00000000
> > 0xefffef30:     0x00000000
> > 0xefffef2c:     0x00000000
> > 0xefffef28:     0x00000000
> > 0xefffef24:     0x00000000
> > 0xefffef20:     0x00000000
> > 0xefffef1c:     0x00000000
> > 0xefffef18:     0x00000000
> > 0xefffef14:     0x00000000
> > 0xefffef10:     0x7c0effff
> > 0xefffef0c:     0xffffffff
> > 0xefffef08:     0xaaaaaaaa
> > 0xefffef04:     0xaf54eaaa
> > 0xefffef00:     0x40040000
> > 0xefffeefc:     0x40040000
> > 0xefffeef8:     0x2b000000
> > 0xefffeef4:     0x00000000
> > 0xefffeef0:     0x00000000
> > 0xefffeeec:     0x408ece9a
> > 0xefffeee8:     0x00000000
> > 0xefffeee4:     0xf0ff0000
> > 0xefffeee0:     0x0f800000
> > 0xefffeedc:     0xf0fff0ff
> > 0xefffeed8:     0x1f380000
> > 0xefffeed4:     0x00000000
> > 0xefffeed0:     0x00000000
> > 0xefffeecc:     0x00000000	
> > 0xefffeec8:     0xffffffff	
> > 0xefffeec4:     0xffffffff	
> > 0xefffeec0:     0x7fff0000	
> > 0xefffeebc:     0xffffffff	
> > 0xefffeeb8:     0xffffffff
> > 0xefffeeb4:     0x7fff0000	sc_formatvec
> >
> > The signal frame is not readily apparent (to me).
> 
> From looking at the above stack dump, sc ought to start at 0xefffee90, 
> and the trampoline would be three words below that.

0xefffeeb0:     0x4178b008	sc_pc, sc_formatvec
0xefffeeac:     0x0008c00e	sc_sr, sc_pc
0xefffeea8:     0xd00223bb	sc_a1
0xefffeea4:     0xd001e32c	sc_a0
0xefffeea0:     0x00000003	sc_d1
0xefffee9c:     0xeffff11e	sc_d0
0xefffee98:     0xeffff004	sc_usp
0xefffee94:     0x00000000	sc_mask
0xefffee90:     0x00000000	extramask
0xefffee8c:     0xc0024a90	retcode[1]
0xefffee88:     0x70774e40	retcode[0]
0xefffee84:     0xefffee94	psc
0xefffee80:     0x00000008	code
0xefffee7c:     0x00000011	sig
0xefffee78:     0xefffee88	pretcode
0xefffee74:     0xc019c000
0xefffee70:     0x00000000
0xefffee6c:     0xc0025878
0xefffee68:     0xc0007ed4
0xefffee64:     0xc0024000
0xefffee60:     0xefffef50
0xefffee5c:     0xc0024000
0xefffee58:     0xc002a034
0xefffee54:     0xc0024a90
0xefffee50:     0xc0025878
0xefffee4c:     0x00000001
0xefffee48:     0x0017f020
0xefffee44:     0x0000002c
0xefffee40:     0x0000000f
0xefffee3c:     0x00000000
0xefffee38:     0xfffff7fa
0xefffee34:     0xffffffff
0xefffee30:     0x00009782
0xefffee2c:     0x00000000
0xefffee28:     0x0000001e
0xefffee24:     0xc0025858
0xefffee20:     0xc0025af8
0xefffee1c:     0xc000b376
0xefffee18:     0xc0024000
0xefffee14:     0xc0025878
0xefffee10:     0x0000001d
0xefffee0c:     0xd0001b60
0xefffee08:     0x0000002f
0xefffee04:     0xc002563e
0xefffee00:     0xc0025490

> The last address you show corresponds to 0xeffff640 in first dump above, 
> which is at the start of the saved fpregs. I'd say we just miss the 
> beginning of the signal frame?
> 

It looks like you're right. I'm not sure how I missed that.

So when the signal was delivered, PC == 0xc00e4178 and USP == 0xc00e4178. 
Those addresses can be found in the disassembly and the stack contents I 
sent previously (quoted above) and it all seems to line up.

> (My reasoning is that copy_siginfo_to_user clears the end of the signal 
> stack, which is what we can see in both cases.)
> 
> Can't explain the 14 words below the saved return address though.
> 

Right. Is it sc_fpstate? Perhaps we should expect QEMU to differ here.

Bottom line is, the corrupted %a3 register would have been saved by the 
MOVEM instruction at 0xc00e4178, which turns out to be the PC in the 
signal frame. So it certainly looks like the kernel was the culprit here.
