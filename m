Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6BAC6FD18
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 02:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbjDTCyF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Apr 2023 22:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjDTCyE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Apr 2023 22:54:04 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E14198E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 19:54:02 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 120155C01AC;
        Wed, 19 Apr 2023 22:53:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 19 Apr 2023 22:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681959239; x=1682045639; bh=WziKLJo9MeY2n
        5SJrz+YrZ5UMYwju+YoPehRPfGgFm4=; b=LPowN3qeuLAk6herNT7K/A9EhSr9H
        aKEhN/xmahvwgbAsfbnYbltubdGelGmQVhzoNkk9MNeaBMWWN5QxDOiQcORawd93
        RfYLbg4Nua2oh/CnvTyr2go5coCFxqABc/kWmlJB8TB9sAWjmB1JM063zjogMdXa
        L/6mD9M+NGwqdBkIgKTHXFafNInePtNJDfkl/rliBfgHUso5JCztmDumDGhVKCge
        Fvv4dzsB2xv1SK1vzGYfggYTE8s/ZTkC/0Ln230nzcTD2h9RxxS9QycLH7CNMBgy
        n0G9rDC+X8Z94FeLEOvh68CMXjIklrCerKsA2OK06WhuJthsUWggfqSSA==
X-ME-Sender: <xms:RqlAZH8ojo6RiBAweJEAo2uprIkvbVOsY5TVN1aVakVBmxHtqqpQRw>
    <xme:RqlAZDt08ymaMQj8UWeUcd7iHKZUNehQqIlDtNLivy2eSyRBMu6ZKvjZC-0rQvqe5
    d8RXUuvdIp7KfAPfhQ>
X-ME-Received: <xmr:RqlAZFDX2d7VRXCveX0uamGXc4vZ6DoyMfitCr9_LEmu2HTSnPyD7bcqKKSdp5dnBXNBhfpqoSDbmWyjbeaNQqjSPq3LaoBCY40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:RqlAZDf51bzTsSgdoiITtICMt-2uSstkh11BwORyAw_tuSBlmzpdtA>
    <xmx:RqlAZMNK-lHynYPvxAWh94qgJBEVDtaw4UnXqcSKf_CJVHA76j6yZg>
    <xmx:RqlAZFmjZ009ZRiUN0hw781DrEWvbZH9352IjLEc_JPSini-2zmFcA>
    <xmx:R6lAZGWOrP2vkPwG3vURsHZYbkKEI5iIeSd8tjHIngEAYwrSBK7kMg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 22:53:56 -0400 (EDT)
Date:   Thu, 20 Apr 2023 12:57:24 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
Message-ID: <60cf61c8-8449-282e-8216-02318fc48c0b@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Michael Schmitz wrote:

> Can you try and fault in as many of these stack pages as possible, ahead 
> of filling the stack? (Depending on how much RAM you have ...). Maybe we 
> would need to lock those pages into memory? Just to show that with no 
> page faults (but still signals) there is no corruption?
> 

OK.

> > Any signal frames or exception frames have been completely overwritten 
> > because the recursion continued after the corruption took place. So 
> > there's not much to see in the core dump.
> 
> We'd need a way to stop recursion once the first corruption has taken 
> place. If the 'safe' recursion depth of 10131 is constant, the dump 
> taken at that point should look similar to what you saw in dash 
> (assuming it is the page fault and subsequent signal return that causes 
> the corruption).
> 

It turns out that the recursion depth can be set a lot lower than the 
200000 that I chose in that test program. (I used that value as it kept 
the stack size just below the default 8192 kB limit.)

At depth = 2500, a failure is around 95% certain. At depth = 2048 I can 
still get an intermittent failure. This only required 21 stack pagefaults 
and one fork.

I suspect that the location of the corruption is probably somewhat random, 
and the larger the stack happens to be when the signal comes in, the 
better the odds of detection.
