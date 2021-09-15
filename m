Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237FCC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 01:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFB4761166
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 01:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhIOBjj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:39:39 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51031 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230438AbhIOBji (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 14 Sep 2021 21:39:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D39535C01EA;
        Tue, 14 Sep 2021 21:38:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 14 Sep 2021 21:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JI6Zpz
        CU9AnXoUmyv/g7x6s9CkZ0zZef3N9ED2S5Zhc=; b=kupY+7c3qqtRVqTEEvQ6Th
        j0oTBdpPiEJp0yGtAvLBDE4g/KOfJ6FR/28C19QpFIhNo/UI4n8XOUrI/i4NUeRQ
        xpq0oOzLNjtmDhZPWTgLBCoyd2YQ7d0m+W5CGgxJlMbip8eXo8kRHA726mVaf1Vp
        uMsXWiddJH1/TKGshw+OKf3+ftWYnuu0ZVLNBzO8Iiq1YEPrXnIShX0l38OGMvj+
        nMNbD+SZvltYnyi2Z9YQpOl6orTa1qGO/DJS8RnUzqUe1SUds8W9XyQiZF3IedJq
        EB0hTKclv4HmG/qO9neBgh4edH99QiAD1xVeLX24EMWmQuYK4UlQCDOuAZVNjOfA
        ==
X-ME-Sender: <xms:i05BYVJu40SCaCyEQS7sGfGAvMNInUB9EUWlQFPKUukbnV0YmamJWg>
    <xme:i05BYRLBgcGvKkFQfco3mWIApH3wsLH7Q3QbWBb88wj4zTbfT7Y6VgNj8sPCsbBjG
    GfpKf9qHT0AftKcZt4>
X-ME-Received: <xmr:i05BYdu4rYebiV7qvxUFGb0-7DTiCLAzMjTcbRHE4m0WeyXP7d2_kC450E1Dzmi0-jg7YCiNX9VOgES8FDu5MifIIk0bZm9EoEStIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehtddggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:i05BYWbj03EzPEMtjQcJIRKiySihFAsWvMDuVdNJAhElMe50YHGdNQ>
    <xmx:i05BYcY60SfnwZ3TeBYnJACytnEqBa34ARZ2Z8fJl4n3SyPdhkPjTg>
    <xmx:i05BYaCGUlKc8KEtBTBOxKv9pXaZc_Z1mq6rJVMeFpH9sDlcLZqxpg>
    <xmx:i05BYS1EAg4_wyhOhwnNkK0Zp2pNU5UC1M6YBQI-z4hPK7DAxtD9Dg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 21:38:17 -0400 (EDT)
Date:   Wed, 15 Sep 2021 11:38:13 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
Message-ID: <189062a2-2b82-8185-2a5b-75a9282dca79@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org> <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com> <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org> <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com> <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
 <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org> <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com> <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org> <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 13 Sep 2021, Michael Schmitz wrote:

> > > 
> > > Incidentally - have you ever checked whether Al Viro's signal 
> > > handling fixes have an impact on these bugs?
> > > 
> > 
> > I will try that patch series if you think it is related.
> 
> Initial tests look promising (but I've said that before).
> 

Here's what I found in recent tests on my Quadra 630.

The usual stress-ng panic can happen without list corruption, even with 
local_irq_save/restore() added to do_IRQ().

The panic did not show up at all during stress tests with Al's signal 
handling patch series.

I think my results are consistent with yours.

The kernel's 'memtest' didn't detect any bad DRAM but it isn't 
particularly thorough so I'm running some tests with memtester-4.5.1.
