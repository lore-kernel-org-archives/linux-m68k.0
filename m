Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1C0C77B75
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 02:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjEFCnF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 22:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjEFCnE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 22:43:04 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFEC7ABA
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 19:43:01 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0AD82320091A;
        Fri,  5 May 2023 22:42:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 22:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683340978; x=1683427378; bh=UiTBvXv7PZ7eV
        z398PTH33IJdzhAfNOHnLYN1/Qv4BI=; b=JPR/8RNnKmeHMdqAqau9Tt3f7Dz3q
        6l4dVBCe/84s/sFTZXkIrsovfeJHMFLkQtqUk7OCdy848350GbACMLXzCSKEtDC2
        42uJlN+6QpKjzVsnZmMBZ7CR2MASvmLJNHpaa1dN2V7GuOApiVegP1JAB6HvLghg
        NiV50OmxMI1wXxvl3uUAAjXyzdtraA3iGTOrEhFTMC5fa6ZYzFuJcyBMRc43JQr0
        WdI1LnplsX32yXEJQ/YRc/AQQvOf2urj5L1DJVml4Z9Mq8BLeHfaPgniv864mmb+
        DSC3Uqk6nHnVs526y07jFRJ96zFUJLG0gMCbzc/anZyq8FOE5dGOOM3UA==
X-ME-Sender: <xms:sr5VZHUU6DiJKl79UPjC7UbfUf9oNWNhc3RJ0FfMgKjXMXYOaI70Jg>
    <xme:sr5VZPnvA1f4AAuCl-fhPmC2-WIx5Ve-xZl6BKyQ956yRuXNbbwdGE9yzDtgbje0T
    6NEUoEQ-9OQ0BUi85k>
X-ME-Received: <xmr:sr5VZDY7M7WE_SSubMALfIiMI7tDoXZYnCdjqGhlCUxNtgvleQHEEXos4Xf4o_HpQkpbDrHxyA9wJIHQ-42fjS3yFHedIHH6P7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:sr5VZCUmrtws5eTJcznr3K1LdWA7w2H6h95nRzUdLLRhSD20fWUMXA>
    <xmx:sr5VZBlAy-j886e6_Iv3TCLj15Ype76o0-aijN5UMrGVjx_FBZLcPA>
    <xmx:sr5VZPdcEwA8qTCyHi23n7qsttSQjZBA18lu6wdRv3iOioP85z0z_Q>
    <xmx:sr5VZBvx0zXlrzjBNlYTGRhJcwUVpO2MF4U0ZCBU5TKE1m1G8DjnEg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 22:42:55 -0400 (EDT)
Date:   Sat, 6 May 2023 12:46:55 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <55ad6c92-4d84-a8dd-de2f-8342cff5e21f@gmail.com>
Message-ID: <c3c4f790-d878-c635-e326-756c3f082873@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com> <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org> <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com> <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org> <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
 <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com> <1a5a6aea-4d58-0f59-f283-694c51bb162d@linux-m68k.org> <55ad6c92-4d84-a8dd-de2f-8342cff5e21f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 6 May 2023, Michael Schmitz wrote:

> >
> > In my mind, at the time I sent them, patch 1 was expected to mitigate 
> > the impact of patch 2. It would have been surprising if the reverse 
> > had somehow happened.
> 
> I did wonder if delaying signal delivery would cause fewer signals to be 
> delivered in total, and whether the remaining bus faults that do cause 
> signal delivery (format a) still cause any trouble because of eventual 
> unreliable USP.
> 
> Adding your patch 2 then might have mitigated these problems while not 
> placing too much of a burden on the stack.
> 

If fewer signals get delivered in total, that's not a bug, right? It just 
amounts to is slightly more signal latency on what is already a slow CPU.

Format 0xA bus errors happen between instructions according to the User 
Manual. There's no possibility of hitting the stack corruption bug AFAICS:

	"For efficiency, the MC68030 uses two different bus error stack 
	frame formats. When the bus error exception is taken at an 
	instruction boundary, less information is required to recover from 
	the error, and the processor builds the short bus fault stack 
	frame as shown in Table 8-7."

> > Anyway, I'm still in the dark as to why patch 1 is interesting. Was 
> > that because you wanted to delay signal delivery to try to put more 
> > pressure on stack memory by delivering multiple signals? You and I did 
> > come up with an
> 
> No - it just eliminates temporary stack growth due to the format b bus 
> faults as entry into signal delivery.
> 
> > alternative patch for bypassing signal delivery after certain 
> > exceptions. Maybe that would work better.
> 
> Meaning skipping signal delivery on any bus fault? I haven't tried that 
> one yet.

Don't try that patch if you are hoping to see signal delivery after a 
format 0xA exception -- you'd only ever get signal delivery after traps, 
interrupts, FP exceptions and a few other obscure cases.

As with patch 1/2, I don't know why you'd want to use it.
