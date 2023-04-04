Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392E8C6FD1D
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Apr 2023 04:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjDDECH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Apr 2023 00:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjDDECG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Apr 2023 00:02:06 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7A919F
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Apr 2023 21:02:05 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E953D5C00E3;
        Tue,  4 Apr 2023 00:02:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 04 Apr 2023 00:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680580922; x=1680667322; bh=OCfU7+lX1zdYs
        FKbuXzbbMAxh6IJoJFQ+yjq29F6ikU=; b=CXRO3lZV5rgjV3RXmL2FwB+pwPWE6
        ero9amy1ZLiCoUE29xLktapJreG0g+BsVbHaO7N1Dh3YQbIyQSHbQlPYu4V+B0/o
        WmVI6+lXu3CVxsYYyw6uX6UMRFy3CYJWAzfakU0xS2KwdX1oTBP6Ml9Qk2HAheqP
        HM5n7tg/1CSQ6ce99eF60H18/TJUG2T/J7L+5U00jB/DK/GTuGF5W2uoylvp08na
        LJaEyOELKkZ6qfVh/dJFd1K0MswSEb0uFg8u74VSmrR1k0ZujHXHuJ5qnWguBkSl
        EAxDvQPU8fNR5pmYCb0xeauk7XlLWj6jdgocack3fFs7OwquMD+eDJ25A==
X-ME-Sender: <xms:OqErZNGFIt11D3pM1y29tLRmSxmHz5Tr6_cnyW0yANkFlqIHUuqP2Q>
    <xme:OqErZCXcjg7YlHS9DbCasL3FYEeL4NeENLo83EFHHnCwHPnYMf3krUbwMMJc_q5eb
    DeeLA9CpWnJQWbLpt0>
X-ME-Received: <xmr:OqErZPJRGYyJ6NYH8PPwm2c0rKYr89XP7lo8K88ZrG5Pr2XO_snHuOajArYxT65LiYvoMcIq3yAAuWO1P7a2Q2OlxFEsN0ysGHU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeikedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpefghfeihfegvdffueekffettedtjeduudeludekudeuhfefhfejiedvgefg
    uddtveenucffohhmrghinhepuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:OqErZDG8YhKOG6vLk4ZRCibA4BUemXtHktXIdtUxNSJ_GOhd9sQ3Ww>
    <xmx:OqErZDXrjcDJwh68ol95cwjt3qRwqW5z5b73mRceIHY39SPBZfSnsw>
    <xmx:OqErZONfgcklPdT_KIvAa7th81ji5orcseX9FvQn_aKr34dpUROLHQ>
    <xmx:OqErZEf7bxexq2rLhAcsqE-9u5Iaoh-goNkU9OOGAqloOnlkZpm64w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 00:01:59 -0400 (EDT)
Date:   Tue, 4 Apr 2023 14:05:06 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <d6bdf882-9470-4d05-bd3c-36a1f3410fc1@gmail.com>
Message-ID: <69f70488-b84d-7c24-d001-529896f3bd34@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com> <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org> <d6bdf882-9470-4d05-bd3c-36a1f3410fc1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 3 Apr 2023, Michael Schmitz wrote:

> Am 02.04.2023 um 21:31 schrieb Finn Thain:
> >
> >>
> >> Maybe an interaction between (multiple?) signals and syscall 
> >> return...
> >
> > When running dash from gdb in QEMU, there's only one signal (SIGCHLD) 
> > and it gets handled before __wait3() returns. (Of course, the "stack 
> > smashing detected" failure never shows up in QEMU.)
> 
> Might be a clue that we need multiple signals to force the stack 
> smashing error. And we might not get that in QEMU, due to the faster 
> execution in emulating on a modern processor.
> 

Right -- being that the failure is intermittent on real hardware, it's not 
surprising that I can't make it show up in QEMU or Aranym.

But no-one has reproduced it on Atari or Amiga hardware yet so I guess it 
could be a driver issue...

I wonder whether anyone else is actually running recent Debian/SID with 
sysvinit and without a Debian initrd on a Motorola 68030 system.

> Thinking a bit more about interactions between signal delivery and 
> syscall return, it turns out that we don't check for pending signals 
> when returning from a syscall. That's OK on SMP systems, because we 
> don't have another process running while we execute the syscall (and we 
> _do_ run signal handling when scheduling, i.e. when wait4 sleeps or is 
> woken up)?
> 
> Seems we can forget about that interaction then.
> 
> >
> >> depends on how long we sleep in wait4, and whether a signal happens 
> >> just during that time.
> >>
> >
> > I agree, there seems to be a race condition there. (And dash's 
> > waitproc() seems to take pains to reap the child and handle the signal 
> > in any order.)
> 
> Yes, it makes sure the SIGCHLD is seen no matter in what order the 
> signals are delivered ...
> 
> > I wouldn't be surprised if this race somehow makes the failure rare.
> >
> > I don't want to recompile any userland binaries at this stage, so it 
> > would be nice if we could modify the kernel to keep track of exactly 
> > how that race gets won and lost. Or perhaps there's an easy way to rig 
> > the outcome one way or the other.
> 
> A race between syscall return due to child exit and signal delivery 
> seems unlikely, but maybe there is a race between syscall return due to 
> a timer firing and signal delivery. Are there any timers set to 
> periodically interrupt wait3?
> 

I searched the source code and SIGALRM appears to be unused by dash. And 
'timeout' is not a dash builtin. But that doesn't mean we don't get 
multiple signals. One crashy script looks like this:

TMPFS_SIZE="$(tmpfs_size_vm "$TMPFS_SIZE")"
RUN_SIZE="$(tmpfs_size_vm "$RUN_SIZE")"
LOCK_SIZE="$(tmpfs_size_vm "$LOCK_SIZE")"
SHM_SIZE="$(tmpfs_size_vm "$SHM_SIZE")"
TMP_SIZE="$(tmpfs_size_vm "$TMP_SIZE")"

Is it possible that the SIGCHLD from the first sub-shell got delayed?

> 
> Still no nearer to a solution - something smashes the stack near %sp, 
> causes the %a3 register restore after __GI___wait4_time64 to return a 
> wrong pointer to the stack canary, and triggers a stack smashing warning 
> in this indirect way. But what??
> 

I've no idea.

The actual corruption might offer a clue here. I believe the saved %a3 was 
clobbered with the value 0xefee1068 which seems to be a pointer into some 
stack frame that would have come into existence shortly after 
__GI___wait4_time64 was called. That stack frame is gone by the time the 
core dump was made. Was it dash's signal handler, onsig(), or some libc 
subroutine called by __GI___wait4_time64(), or was it something that the 
kernel put there?

Dash's SIGCHLD handler looks safe enough -- I don't see how it could 
corrupt the saved registers in the __GI___wait4_time64 stack frame (it's 
not like 1 was stored in the wrong place). 
https://sources.debian.org/src/dash/0.5.12-2/src/trap.c/?hl=285#L285
