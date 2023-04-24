Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163F3C7618E
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 23:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjDXXlt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 19:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXXls (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 19:41:48 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C89E49E5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 16:41:47 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 135F3320055E;
        Mon, 24 Apr 2023 19:41:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 24 Apr 2023 19:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682379701; x=1682466101; bh=dCyWMvalF1lUY
        +nNZYFmVolMCxSvlbqSuQGYDIYnMAc=; b=V1zLzkUt1YesV0VryziHhBc+Fw7Nd
        knXO482zQvBJaewiucIaYKUBEjcT4H6HudopLK5Y3aVZxTTbQ8SiGiBPwHsPAxmE
        96U56bNE0JIWP8aCBHq+9puTSv7AsTKSE7jidYY0WwpcJAXHHZdTE8ybvTxpV/IR
        9aR79MmjE/OYcSP/wLkxARTarOq3LIeEZMpWI0qmd18aLYVq4u4LIk0Fhd6B+vR/
        Uvd8ZloH0x9O8fsaijm5dmXrD+QBIOKzEWOfwtQlXTcUY3R8tsUd7n/vUhnXf8Z5
        bITzjQMSDfNsGTZAxmGLGEmhrU5QcrctRUcfIGzZyUJkQRlToeiVicHzw==
X-ME-Sender: <xms:tRNHZDcWGof3wgE08Gu6mHp9Snw0Pud6iXvuTqQi0-gZ2oTgwVeviA>
    <xme:tRNHZJP7umoMFzEezGo5l9JTit0ONo839hPPj6F-CVr56Sx7enC2uifHa_YU7dYN3
    Y2aZ04xhZ4pVvp2Xl4>
X-ME-Received: <xmr:tRNHZMiHh8wvW_E2jXzZ1DngGhI1qFF9gTd5SaLey8FzpgPBZd74Juuhxk8tobx0iEdVhXBwqAs6RBebK5tE7MsdlNOVYCoDCQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:tRNHZE_s9bqA7txkLyVL4mPR21cDYZSLBaSVyXRAHk3CDhO0pHq7aA>
    <xmx:tRNHZPtbHCRhq-hGhcR8_t0UMtqlBkhCH4ycUGT1P314ZzFWsmOB5g>
    <xmx:tRNHZDFIAdEJqPO4EJYb9ag6x2V70ZF_JTE_4UBmFXIbmEgi5S8sGw>
    <xmx:tRNHZN3VAovZNYPynL8TGRz_mN3o42H2-syoKLkZ0hzKynXJ2G5caA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 19:41:39 -0400 (EDT)
Date:   Tue, 25 Apr 2023 09:44:46 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
Message-ID: <20f672ca-6fa7-a38b-e962-8c8eaddbd0c3@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org> <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com> <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org> <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com> <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org> <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com> <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com>
 <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 24 Apr 2023, Michael Schmitz wrote:

> > I don't understand these results. If usp was really overwritten, the 
> > program would have crashed early, no?
> 
> I think we're still at the point where rec() is called recursively, 
> before any returns.

Right. I wasn't thinking.

I'll try to confirm that each "overwrote usp" error from movemlrt.c 
corresponds to visible corruption at the given address in the core dump.

> >> Exception right before crash was an interrupt in this case (only seen 
> >> that once in this context, though I've seen lots of those in the 
> >> course of the test runs). Frame start calculated from siginfo pointer 
> >> value in this case.
> >
> > I didn't realize that you could get a crash from a signal delivered 
> > following an interrupt. I'll try to modify the kernel such that 
> > signals are not delivered after page faults.
> 
> Yes, that was news to me, too.
> 

That seems to be a mistake (?) I didn't see any failures when I patched 
the kernel to skip signal delivery after a page fault.
