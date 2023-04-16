Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511EFC77B61
	for <linux-m68k@archiver.kernel.org>; Sun, 16 Apr 2023 06:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjDPGlc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 16 Apr 2023 02:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjDPGlb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 16 Apr 2023 02:41:31 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46D8FB
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Apr 2023 23:41:29 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 4886C5C01A1;
        Sun, 16 Apr 2023 02:41:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 16 Apr 2023 02:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681627287; x=1681713687; bh=CsG9psYp7s0fA
        LttAuW1TCCoQ0CuglwLL6PYCbUrwT8=; b=Lw3Z6TQQEEw+CSqiM0nYf3nt26LCl
        I9+9FUBdmSOAbKCfxnWH4u2PYHg6duSsIq3zXXwmmFqd4rNlormDp1LK+b6aBYkL
        9u7/cMoGaXOR7Q/TD3nq277jTwsdToai/Qvh/FLk88cP/0cs0i6Vy2IKElA3duAl
        ei0zdv+evnZznf3BX7VDtBbCyX6l5AXl3b12Jly207S/mT3kwTLk4UiJrWllveAD
        4SwqK9wmqBoBiPlR4UmlM5nKxyuVJAUab5YhgXO+NTXdF6TFaMv1r26DVYlnTzRx
        g6t7yF1aKP9QdoneIY9DezaWMsdxNNZmPhIk/SOo+ahS4TL1yqCmmjqYQ==
X-ME-Sender: <xms:lpg7ZNRVAKnZj8aEAay8pZgFwNOM8CH-1GvpVX6Ob7wuQUyYFl-DBg>
    <xme:lpg7ZGwfp4FhDrksH4lmL-3-BV2IxCVjx_39qfjnJ6d6UrTYhZSNzzClT6HKtMnR4
    MlabM6o17Ri-EK3GjI>
X-ME-Received: <xmr:lpg7ZC3BU_GA9oUjFNZEx5CVWzQbfh-MLZ5U-zu1yK8G9em60-7NcGmkVKTCKotCWgDiB7j1LZdgu2u8uVuNV0UBSUoYeSi77Oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelfedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:lpg7ZFAal2BLmnOcUfx3M0nnlQeEfz1C0wxlPUMYZqrg0JAJfcgdzg>
    <xmx:lpg7ZGjY_b_HHNmiuCkSib80FiqCSeSr-busdxScRV0Ibnri25ZOxg>
    <xmx:lpg7ZJowSQAyicayKa7CrkzYcTQC49Z6-kzNrVPf-tE7MBx8FNgZ2Q>
    <xmx:l5g7ZOL2lCdGvkTZo1KrcQH2tciRrUq3Nv9iVJwr23r7atUbMvK74Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Apr 2023 02:41:23 -0400 (EDT)
Date:   Sun, 16 Apr 2023 16:44:49 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
Message-ID: <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 16 Apr 2023, Michael Schmitz wrote:

> Am 14.04.2023 um 21:30 schrieb Finn Thain:
> > Would signal delivery erase any of the memory immediately below the 
> > USP? If so, it would erase those old stack frames, which would give 
> > some indication of the timing of signal delivery.
> 
> The signal stack is set up immediately below USP, from my reading of 
> signal.c:setup_frame(). Old stack frames will be overwritten.
> 

OK.

> >
> > If I run dash under gdb under QEMU, I can break on entry to onsig() 
> > and find the signal frame on the stack. But when I examine stack 
> > memory from the core dump, I can't find 0x70774e40 (i.e. moveq 
> > __NR_sigreturn,%d0 ; trap #0) which the kernel puts on the stack in my 
> > QEMU experiments.
> 
> As I understand this, the call to sys_sigreturn() removes both this code 
> (signal trampoline IIRC) and the signal stack...

I don't see that stuff getting removed when I run dash under gdb under 
QEMU. With breakpoints at the head of onsig() and the tail of __wait3(), 
the memory under USP is the same when examined at either juncture.

The backtrace confirms that this signal was delivered during execution of 
__wait3(). (Delivery can happen during execution of __libc_fork() but I 
just repeat the test until I get these ducks in a row.)

(gdb) c
Continuing.
# x=$(:)
[Detaching after fork from child process 1055]

Breakpoint 6.1, onsig (signo=17) at trap.c:286
286     trap.c: No such file or directory.
(gdb) bt
#0  onsig (signo=17) at trap.c:286
#1  <signal handler called>
#2  0xc00e81b6 in __GI___wait4_time64 (pid=-1, stat_loc=0xeffff86a, options=2, 
    usage=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:35
#3  0xc00e8164 in __GI___wait3_time64 (usage=0x0, options=<optimized out>, 
    stat_loc=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:26
#4  __wait3 (stat_loc=<optimized out>, options=<optimized out>, 
    usage=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:35
#5  0xd000c38e in waitproc (status=0xeffff85a, block=1) at jobs.c:1179
#6  waitone (block=1, job=0xd001f618) at jobs.c:1055
#7  0xd000c5b8 in dowait (block=1, jp=0xd001f618) at jobs.c:1137
#8  0xd000ddb0 in waitforjob (jp=0xd001f618) at jobs.c:1014
#9  0xd000aade in expbackq (flag=68, cmd=0xd001e4c8 <stackbase+36>)
    at expand.c:520
#10 argstr (p=<optimized out>, flag=68) at expand.c:335
#11 0xd000b5ce in expandarg (arg=0xd001e4e8 <stackbase+68>, 
    arglist=0xeffffb08, flag=4) at expand.c:192
#12 0xd0007e2a in evalcommand (cmd=<optimized out>, flags=<optimized out>)
    at eval.c:855
#13 0xd0006ffc in evaltree (n=0xd001e4f8 <stackbase+84>, flags=0) at eval.c:300
#14 0xd000e3c0 in cmdloop (top=1) at main.c:246
#15 0xd0005018 in main (argc=<optimized out>, argv=<optimized out>)
    at main.c:181


0xeffff750:     0xc01a0000                      saved $a5 == libc .got
0xeffff74c:     0xc0023e8c                      saved $a3 == &__stack_chk_guard
0xeffff748:     0x00000000                      saved $a2
0xeffff744:     0x00000001                      saved $d5
0xeffff740:     0xeffff86e                      saved $d4
0xeffff73c:     0xeffff86a                      saved $d3
0xeffff738:     0x00000002                      saved $d2 
0xeffff734:     0x00000000
0xeffff730:     0x00000000
0xeffff72c:     0x00000000
0xeffff728:     0x00000000
0xeffff724:     0x00000000
0xeffff720:     0x00000000
0xeffff71c:     0x00000000
0xeffff718:     0x00000000
0xeffff714:     0x00000000
0xeffff710:     0x00000000
0xeffff70c:     0x00000000
0xeffff708:     0x00000000
0xeffff704:     0x00000000
0xeffff700:     0x00000000
0xeffff6fc:     0x00000000
0xeffff6f8:     0x00000000
0xeffff6f4:     0x00000000
0xeffff6f0:     0x00000000
0xeffff6ec:     0x00000000
0xeffff6e8:     0x00000000
0xeffff6e4:     0x00000000
0xeffff6e0:     0x00000000
0xeffff6dc:     0x00000000
0xeffff6d8:     0x00000000
0xeffff6d4:     0x00000000
0xeffff6d0:     0x00000000
0xeffff6cc:     0x00000000
0xeffff6c8:     0x00000000
0xeffff6c4:     0x00000000
0xeffff6c0:     0x00000000
0xeffff6bc:     0x00000000
0xeffff6b8:     0x00000000
0xeffff6b4:     0x00000000
0xeffff6b0:     0x00000000
0xeffff6ac:     0x00000000
0xeffff6a8:     0x00000000
0xeffff6a4:     0x00000000
0xeffff6a0:     0x00000000
0xeffff69c:     0x00000000
0xeffff698:     0x00000000
0xeffff694:     0x00000000
0xeffff690:     0x00000000
0xeffff68c:     0x00000000
0xeffff688:     0x00000000
0xeffff684:     0x00000000
0xeffff680:     0x00000000
0xeffff67c:     0x00000000
0xeffff678:     0x00000000
0xeffff674:     0x00000000
0xeffff670:     0x00000000
0xeffff66c:     0x00000000
0xeffff668:     0x00000000
0xeffff664:     0x00000000
0xeffff660:     0x41000000
0xeffff65c:     0x00000000
0xeffff658:     0x00000000
0xeffff654:     0x00000000
0xeffff650:     0x00000000
0xeffff64c:     0x80000000
0xeffff648:     0x3fff0000
0xeffff644:     0x00000000
0xeffff640:     0xd0000000
0xeffff63c:     0x40020000
0xeffff638:     0x81b60080      
0xeffff634:     0x0000c00e
0xeffff630:     0xd001e4e3                               saved a1?
0xeffff62c:     0xc0028780                               saved a0?
0xeffff628:     0xffffffff                               saved d1?
0xeffff624:     0x0000041f                               saved d0?
0xeffff620:     0xeffff738                               saved sp?
0xeffff61c:     0x00000000      
0xeffff618:     0x00000000
0xeffff614:     0x00000000
0xeffff610:     0x70774e40      moveq #119,%d0 ; trap #0
0xeffff60c:     0xeffff61c
0xeffff608:     0x00000080
0xeffff604:     0x00000011
0xeffff600:     0xeffff610      return address

The above comes from dash running under gdb under qemu, which does not 
exhibit the failure but is convenient for that kind of experiment.

> Again as far as I understand, the core dump happens on process exit. 
> Stack smashing is detected and process exit is forced only at exit from 
> __wait3() or __wait4_time64(), 

I placed an illegal instruction in __wait3. This executes instead of the 
call to __stack_chk_fail because that obliterates stack memory of 
interest.

Consequently the latest core dump still contains dead stack frames (see 
below) of subroutines that returned before __wait3() dumped core. You can 
see the return address for the branch to __wait4_time64() and below that 
you can see the return address for the branch to __m68k_read_tp().

(gdb) disas __wait4_time64
Dump of assembler code for function __GI___wait4_time64:
   0xc00e4174 <+0>:     lea %sp@(-80),%sp
   0xc00e4178 <+4>:     moveml %d2-%d5/%a2-%a3/%a5,%sp@-
   0xc00e417c <+8>:     lea %pc@(0xc019c000),%a5
   0xc00e4184 <+16>:    movel %sp@(116),%d2
   0xc00e4188 <+20>:    moveal %sp@(124),%a2
   0xc00e418c <+24>:    moveal %a5@(108),%a3
   0xc00e4190 <+28>:    movel %a3@,%sp@(104)
   0xc00e4194 <+32>:    bsrl 0xc0056e2c <__m68k_read_tp@plt>

I gather the signal was delivered before __wait4_time64+38, otherwise the 
return address 0xc00e419a (which appears below) would have been 
overwritten by the signal frame. The signal must have been delivered after 
waitproc() initialized gotsigchld = 0 since gotsigchld is 1 at the time of 
the coredump.

I assume the %a3 corruption happened after __wait4_time64+8 because that's 
when %a3 first appears on the stack. And the corruption must have happened 
before __wait4_time64+238, which is when %a3 was restored.

If it was the signal which somehow corrupted the saved %a3, there's only a 
small window for that. The only syscall in that window is get_thread_area.

Here's some stack memory from the core dump.

0xeffff0dc:     0xd000c38e      return address waitproc+124
0xeffff0d8:     0xd001c1ec      frame 0 $fp                   == &suppressint
0xeffff0d4:     0x00add14b      canary
0xeffff0d0:     0x00000000
0xeffff0cc:     0x0000000a
0xeffff0c8:     0x00000202
0xeffff0c4:     0x00000008
0xeffff0c0:     0x00000000
0xeffff0bc:     0x00000000
0xeffff0b8:     0x00000174
0xeffff0b4:     0x00000004
0xeffff0b0:     0x00000004
0xeffff0ac:     0x00000006
0xeffff0a8:     0x000000e0
0xeffff0a4:     0x000000e0
0xeffff0a0:     0x00171f20
0xeffff09c:     0x00171f20
0xeffff098:     0x00171f20
0xeffff094:     0x00000002
0xeffff090:     0x00002000
0xeffff08c:     0x00000006
0xeffff088:     0x0000e920
0xeffff084:     0x00005360
0xeffff080:     0x00170700
0xeffff07c:     0x00170700
0xeffff078:     0x00170700      frame 0 $fp - 96
0xeffff074:     0xd001b874                         saved $a5 == dash .got
0xeffff070:     0xd001e498                         saved $a3 == &dash_errno
0xeffff06c:     0xd001e718      frame 0 $sp        saved $a2 == &gotsigchld
0xeffff068:     0x00000000
0xeffff064:     0x00000000
0xeffff060:     0xeffff11e    
0xeffff05c:     0xffffffff    
0xeffff058:     0xc00e4164      return address __wait3+244
0xeffff054:     0x00add14b      canary
0xeffff050:     0x00000001
0xeffff04c:     0x00000004
0xeffff048:     0x0000000d
0xeffff044:     0x0000000d
0xeffff040:     0x0015ef82
0xeffff03c:     0x0015ef82
0xeffff038:     0x0015ef82
0xeffff034:     0x00000003
0xeffff030:     0x00000004
0xeffff02c:     0x00000004
0xeffff028:     0x00000140
0xeffff024:     0x00000140
0xeffff020:     0x00000034
0xeffff01c:     0x00000034
0xeffff018:     0x00000034
0xeffff014:     0x00000006
0xeffff010:     0x003b003a
0xeffff00c:     0x000a0028    
0xeffff008:     0x00340020      
0xeffff004:     0xc019c000                      saved $a5 == libc .got
0xeffff000:     0xeffff068                      saved $a3 (corrupted)
0xefffeffc:     0x00000000                      saved $a2
0xefffeff8:     0x00000001                      saved $d5
0xefffeff4:     0xeffff122                      saved $d4
0xefffeff0:     0xeffff11e                      saved $d3
0xefffefec:     0x00000000                      saved $d2
0xefffefe8:     0xc00e419a      return address __GI___wait4_time64+38
0xefffefe4:     0xc0028780
0xefffefe0:     0x3c344bfb
0xefffefdc:     0x000af353
0xefffefd8:     0x3c340170
0xefffefd4:     0x00000000
0xefffefd0:     0xc00e417c
0xefffefcc:     0xc00e417e
0xefffefc8:     0xc00e4180
0xefffefc4:     0x48e73c34
0xefffefc0:     0x00000000
0xefffefbc:     0xefffeff8
0xefffefb8:     0xefffeffc
0xefffefb4:     0x4bfb0170
0xefffefb0:     0x0eee0709
0xefffefac:     0x00000000
0xefffefa8:     0x00000000
0xefffefa4:     0x00000000
0xefffefa0:     0x00000000
0xefffef9c:     0x00000000
0xefffef98:     0x00000000
0xefffef94:     0x00000000
0xefffef90:     0x00000000
0xefffef8c:     0x00000000
0xefffef88:     0x00000000
0xefffef84:     0x00000000
0xefffef80:     0x00000000
0xefffef7c:     0x00000000
0xefffef78:     0x00000000
0xefffef74:     0x00000000
0xefffef70:     0x00000000
0xefffef6c:     0x00000000
0xefffef68:     0x00000000
0xefffef64:     0x00000000
0xefffef60:     0x00000000
0xefffef5c:     0x00000000
0xefffef58:     0x00000000
0xefffef54:     0x00000000
0xefffef50:     0x00000000
0xefffef4c:     0x00000000
0xefffef48:     0x00000000
0xefffef44:     0x00000000
0xefffef40:     0x00000000
0xefffef3c:     0x00000000
0xefffef38:     0x00000000
0xefffef34:     0x00000000
0xefffef30:     0x00000000
0xefffef2c:     0x00000000
0xefffef28:     0x00000000
0xefffef24:     0x00000000
0xefffef20:     0x00000000
0xefffef1c:     0x00000000
0xefffef18:     0x00000000
0xefffef14:     0x00000000
0xefffef10:     0x7c0effff
0xefffef0c:     0xffffffff
0xefffef08:     0xaaaaaaaa
0xefffef04:     0xaf54eaaa
0xefffef00:     0x40040000
0xefffeefc:     0x40040000
0xefffeef8:     0x2b000000
0xefffeef4:     0x00000000
0xefffeef0:     0x00000000
0xefffeeec:     0x408ece9a
0xefffeee8:     0x00000000
0xefffeee4:     0xf0ff0000
0xefffeee0:     0x0f800000
0xefffeedc:     0xf0fff0ff
0xefffeed8:     0x1f380000
0xefffeed4:     0x00000000
0xefffeed0:     0x00000000
0xefffeecc:     0x00000000
0xefffeec8:     0xffffffff
0xefffeec4:     0xffffffff
0xefffeec0:     0x7fff0000
0xefffeebc:     0xffffffff
0xefffeeb8:     0xffffffff
0xefffeeb4:     0x7fff0000

The signal frame is not readily apparent (to me).

Also, stack memory in the core dump and stack memory as observed upon 
signal handler breakpoint do not agree very well... I'd expect the values 
immediately below the stack pointer to be zeros once the signal frame was 
put there.

I can't explain all of that unless it's discontiguous stack corruption.
