Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE81C77B6E
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Apr 2023 09:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjDNJ1w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 14 Apr 2023 05:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjDNJ1v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 14 Apr 2023 05:27:51 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A256271E
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Apr 2023 02:27:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 8D9855C017E;
        Fri, 14 Apr 2023 05:27:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 14 Apr 2023 05:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681464469; x=1681550869; bh=5eUbBUR9prjcV
        eQ9nd2co49hSYVmF2UjW25vUGzEFQg=; b=JnP097tFE/Xlyj3OOtooSAdeSD7or
        lj4BUHdJmvxqxvCl4rkqm7tze3oWOUHSeCdqbOOINyID+ADteWXxFDjSOJJF83/G
        ukJgH5Q3/x0Y4LB3mSGPP7ush+sj/uzUOXreTkFCwsQ1C3/PG/FhPGxzqO7kb+m4
        2kplX62mBsbYFCsJpkA+u1V04NpjK4T6/rhFJKAkOPD4yUvabr2o/fhsEsXzjXQn
        s9OnqMibd+ZPhCrHFKbnXdIgM7/eCVH95rCUln0mO7yb6CQ5DL1/SIsnMmQ5WCgl
        9Ogt475C+EMxloAAB646AORzml85pwO5RrNQkzQ3CSBp6Rmune5gMa9ow==
X-ME-Sender: <xms:lRw5ZLqJztSBgdmS3KvYa79-9XnjUPwhyOw5HI-45s4OpKMmKuJpsQ>
    <xme:lRw5ZFrcG7fi5JEe33i-NFpIutxiqsehgvlgdLaOI-6uV5yKI5emUgsYU9Mdepo9P
    CgKHeh2Zy8MOPuf0uw>
X-ME-Received: <xmr:lRw5ZIMGLiVX3d6qsj3Ou_8lYG_5PYyzsp7iBTPLowWkjaL4ziO1PpIsW3XdNQBFqkpZISoLj7_luu8CDCS2ZjTEQtQ3ccD7wuE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeltddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
    dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeffudfhgeefvdeitedugfelueeghe
    ekkeefveffhfeiveetledvhfdtveffteeuudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hg
X-ME-Proxy: <xmx:lRw5ZO7jGQ6JjUkStaIbMETOh4VVzsKCID0ZBie-1pxz96PomgEnFQ>
    <xmx:lRw5ZK6keQN0lrxXPgoXbp-UdEnLOhsgrn3behT3UIUWPyMdNDgxxA>
    <xmx:lRw5ZGgODvo-Myel78-MmHeHuoEmt7ft4e1RTOm6pO52HXRdw7xRBw>
    <xmx:lRw5ZHWAORde-bnDGEptIep7oO1d7_qydf2RZQpwJmj1TE7puh2XXw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 05:27:47 -0400 (EDT)
Date:   Fri, 14 Apr 2023 19:30:56 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
Message-ID: <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 5 Apr 2023, I wrote:

> 
> I don't care that much what dash does as long as it isn't corrupting 
> it's own stack, which is a real possibility, and one which gdb's data 
> watch point would normally resolve. And yet I have no way to tackle 
> that.
> 
> I've been running gdb under QEMU, where the failure is not reproducible. 
> Running dash under gdb on real hardware is doable (RAM permitting). But 
> the failure is intermittent even then -- it only happens during 
> execution of certain init scripts, and I can't reproduce it by manually 
> running those scripts.
> 
> (Even if I could reproduce the failure under gdb, instrumenting 
> execution in gdb can alter timing in undesirable ways...)
> 

Somewhat optimistically, I upgraded the RAM on this system to 36 MB so I 
can run dash under gdb (20 MB was not enough). But, as expected, the crash 
went away when I did so.

Outside of gdb, I was able to reproduce the same failure with a clean 
build from the dash repo (commit b00288f). I can get a crash with 
optimization level -O1 and -O though it becomes even more rare. So it's 
easier to use Debian's build (-O2).

One of the difficulties with the core dump is that it happens too late. 
After the canary check fails, __stack_chk_fail() is called, which then 
calls a bunch of other stuff until finally abort() is called. This 
obliterates whatever was below the stack pointer at the time of the 
failure.

So I modified libc.so.6 and now it just crashes with an illegal 
instruction in __wait3 rather than branching to __stack_chk_fail. This let 
me see whatever was left behind in stack memory by __wait4_time64() etc.

__wait4_time64() calls __m68k_read_tp(), and the return address from 
__m68k_read_tp() can still be seen in stack memory, which suggests that 
the stack never grew after that call. (So __m68k_read_tp() is implicated.)

Would signal delivery erase any of the memory immediately below the USP? 
If so, it would erase those old stack frames, which would give some 
indication of the timing of signal delivery.

If I run dash under gdb under QEMU, I can break on entry to onsig() and 
find the signal frame on the stack. But when I examine stack memory from 
the core dump, I can't find 0x70774e40 (i.e. moveq __NR_sigreturn,%d0 ; 
trap #0) which the kernel puts on the stack in my QEMU experiments.

That suggests that no signal was delivered... and yet gotsigchld == 1 at 
the time of the coredump, after having been initialized by waitproc() 
prior to calling __wait3(). So the signal handler onsig() must have 
executed during __wait3() or __wait4_time64(). I can't explain this.
