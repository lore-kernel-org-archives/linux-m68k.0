Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B26C7619A
	for <linux-m68k@archiver.kernel.org>; Sun,  2 Apr 2023 09:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjDBJ2X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 2 Apr 2023 05:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDBJ2W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 2 Apr 2023 05:28:22 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35412191F0
        for <linux-m68k@lists.linux-m68k.org>; Sun,  2 Apr 2023 02:28:20 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 08FF93200950;
        Sun,  2 Apr 2023 05:28:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 02 Apr 2023 05:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680427697; x=1680514097; bh=+Djy5x/Zgdmb+
        W1OBty286huOuxUKCJ7Vvx5RvfbiqU=; b=H/WQ/8S+pelZJA7JjjK4RX2r1ll72
        jkYEXbkCYuc9MguaXDXsWGzCSdGV2FNSZDQZk1/EqoIel42wZ6iqR3U648/rOrY0
        xvBynCDgashd89GbvNs+xDr3faUWUmyfnOugu3wQ7dat4LXX3fJANWdYMYK/78FR
        ugmyaFdf1xT4cobIgSVNUObtyVDz7OvyK7RkbANQkmFmzdoKmsd64DqpJETZDpNO
        ybj9S5XKtEV2vx0X3nH0kqMEJo6ufTeG8XMqHAvdA5SaZ1T5eWp04cHRhNAC3XHJ
        diNrG0i/nGfOLgRftbyH/cSy1+2EDO1P1I3MAmXzN9ddeWqEWTTMUkm1A==
X-ME-Sender: <xms:sUopZEEo6RXPEWGTXnkI6IJ0B4Et4qyuLSfmFlvYyhjDUKbVsmh_sA>
    <xme:sUopZNWlUpBUVZD78vNluXKiuLK0Bm4M1FsOb4mV_XwcsDoTZzZoNPynh2y95--kk
    TR-8-StiqSdcTleoAc>
X-ME-Received: <xmr:sUopZOJR6kFYhJ-DcF9dx_Qe_-dVt3-37qtM78OcR-de6SBCj-_3Lc9qwMj1F-BLgkj5Dq98jkRmKwJiqHwLbFIhAoWwFgYdACU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeihedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:sUopZGFVkVPTf3FvZEtQJfBVXqtY1TmR7ZwqX7pg0sgxnQxvl8M-Yg>
    <xmx:sUopZKVERjcbd-gu2V_yIimjdfL8ZmhvUWokXgtE4QSgQy3Wql0htQ>
    <xmx:sUopZJMUmomDOhojNGS-RaCNbt-HUCEeIU2LNtm2DFmF45UNW1dAig>
    <xmx:sUopZDcJB2Q-yiBCdleB8AGuHLFg-WKfiQeXVL4y_AZWvUhrFE97_A>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Apr 2023 05:28:12 -0400 (EDT)
Date:   Sun, 2 Apr 2023 19:31:08 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com>
Message-ID: <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com> <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 2 Apr 2023, Michael Schmitz wrote:

> Saved registers are restored from the stack before return from 
> __GI___wait4_time64 but we don't know which of the two wait4 call sites 
> was used, do we?
> 
> What registers does __m68k_read_tp@plt clobber?
> 

But that won't matter to the caller, __wait3, right? 

I did check that %a3 was saved on entry, before any wait4 syscall or 
__m68k_read_tp call etc. I also looked at the rts and %a3 did get restored 
there. Is it worth the effort to trace every branch, in case there's some 
way to reach an rts without having first restored the saved registers?

> 
> Maybe an interaction between (multiple?) signals and syscall return...

When running dash from gdb in QEMU, there's only one signal (SIGCHLD) and 
it gets handled before __wait3() returns. (Of course, the "stack smashing 
detected" failure never shows up in QEMU.)

> depends on how long we sleep in wait4, and whether a signal happens just 
> during that time.
> 

I agree, there seems to be a race condition there. (And dash's waitproc() 
seems to take pains to reap the child and handle the signal in any order.) 
I wouldn't be surprised if this race somehow makes the failure rare.

I don't want to recompile any userland binaries at this stage, so it would 
be nice if we could modify the kernel to keep track of exactly how that 
race gets won and lost. Or perhaps there's an easy way to rig the outcome 
one way or the other.

> %a3 is the first register saved to the switch stack BTW.
> 
> That kernel does contain Al Viro's patch that corrected our switch stack 
> handling in the signal return path? I wonder whether there's a potential 
> race lurking in there?
> 

I'm not sure which patch you're referring to, but I think Al's signal 
handling work appeared in v5.15-rc4. I have reproduced the "stack smashing 
detected" failure with v5.14.0 and with recent mainline (62bad54b26db from 
March 30th).

> And I just notice that we had had trouble with a copy_to_user in 
> setup_frame() earlier (reason for my buserr handler patch). I wonder 
> whether something's gone wrong there. Do you get a segfault instead of 
> the abort signal if you drop my patch?
> 

Are you referring to e36a82bebbf7? I doubt that it's related. I believe 
that copy_to_user is not involved here for the reason already given i.e. 
wait3(status, flags, NULL) means wait4 gets a NULL pointer for the struct 
rusage * parameter. Also, Stan first reported this failure in December 
with v6.0.9.
