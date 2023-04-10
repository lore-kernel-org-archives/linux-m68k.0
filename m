Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4979C76196
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Apr 2023 09:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjDJJgL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Apr 2023 05:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjDJJgL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Apr 2023 05:36:11 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F5830DC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 02:36:08 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 589AC3200944;
        Mon, 10 Apr 2023 05:36:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 10 Apr 2023 05:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1681119363; x=1681205763; bh=vUnHofezAcUVb
        GZw35R1XxrU6pm6LNjRAkKhxiLEbWg=; b=MLpD860geJafNCI48sz8g7Sq6ImLC
        ST5mM3f559DhLxSq6BFxnnn2QQZ/I6TTg2rJYYjLh9iAJM9S9CqQZsZ7gQF/7FLr
        APkIafIF995y0aOkQOqIf911PkOs8H3PYIGb7HpeIaoeg99kCUAQJIJOnnCblYdN
        fWwVsY2OQsMNtLk54l97XXzgFMKQz9zHSGSXEYqJjbHgONySwGLzBNrVGgy6A8Yu
        4nsbmS/CO02gRfqqTLxrf9oG5RDA6rmNzQGAFAE1NRhKV8cPAAK3YVQJm/JosqnF
        nvEkZDtmbSTzIGquAs6NOLBsMp0VNRHFabmIvk6PUsZDU8mHOelXyhX/A==
X-ME-Sender: <xms:g9gzZJHXQBhbblc84SrskpAzE4yCHj1zfDv8kBf4c2nJHJAH9ARvMA>
    <xme:g9gzZOUq6lRUwi6lwICTNWKTXElQiNkBRO3ObzxDciGCsdhCObkSPtNxODuODat-e
    570yx86HeZ7siRb2K8>
X-ME-Received: <xmr:g9gzZLJZuqK0T5JrshODkytIHCZpX7q4OCzRENchAwaPEbZynXlnVY6kyWyBePYkFEh-yKPqFbCMju8Q4Ump3jgO4y91wuF8vgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekvddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:g9gzZPGI6QbqjvyVNAGhG0W80X_eZ7fvPGJpINr2cuz5NyQy_b3GEg>
    <xmx:g9gzZPWY5zpyYf7qg470Zesf7sFcZxMe2bdSijbEkv7dkV-6XnTWgg>
    <xmx:g9gzZKPayiC-S_gb9y8qI8AZxNDdULZnW33IaosjUUhm39nRpMtZuw>
    <xmx:g9gzZAc7wmT_qBVwUSucRsplQgHyqS0U2srMZe-QIE706D0KyTNpcA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Apr 2023 05:36:01 -0400 (EDT)
Date:   Mon, 10 Apr 2023 19:39:22 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: kernel behaviour, was Re: dash behaviour
In-Reply-To: <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com>
Message-ID: <6f2c6c5b-7e9d-94f2-98ba-9a1306f131bb@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
 <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org> <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com> <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org> <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 10 Apr 2023, Michael Schmitz wrote:

> >
> > So I guess this bug has more to do with timing and little to do with 
> > state, contrary to my guesswork above. And no doubt I will have to
> 
> What may still vary is physical mapping - I remember you had used some 
> tool before to parse proc/<pid>/pagemap to determine the physical 
> addresses for task stack areas? Or am I misremembering that from some 
> other bug?
> 

You're right, back in September 2021 when I was chasing a different bug we 
did discuss tools to look at physical mappings. I don't think that would 
help here though. We know the failure is not bad RAM because multiple Macs 
fail in the same way. Also, there's no DMA taking place on these 
particular machines.

> > contradict myself again if/when it turns out that uninitialized memory 
> > is a factor :-/
> 
> I haven't found a config option to initialize memory returned by the 
> kernel page allocators, so not sure how to test that ...
> 

I was able to find some command line options (init_on_alloc, init_on_free) 
and the related Kconfig symbols (CONFIG_INIT_ON_ALLOC_DEFAULT_ON, 
CONFIG_INIT_ON_FREE_DEFAULT_ON).

Given the compiler supports -fzero-call-used-regs=used-gpr there's also 
CONFIG_ZERO_CALL_USED_REGS. Also CONFIG_INIT_STACK_ALL_ZERO 
(-ftrivial-auto-var-init=zero).

The problem with these options is that they may produce a large effect on 
the timing of events but they should still have no effect on the behaviour 
of a correct userspace program.

Since we are dealing with a suspect userspace program, what could we learn 
from such a test? E.g. if the crashing stopped one could simply attribute 
that to the timing change. I suppose, if the crashing became more 
frequent, perhaps that would help debug the userspace program. So maybe 
it's worth a try...
