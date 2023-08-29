Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A48C71153
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 01:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbjH2BPB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 21:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbjH2BO5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 21:14:57 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A9C132
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 18:14:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E3CE13200986;
        Mon, 28 Aug 2023 21:14:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 28 Aug 2023 21:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693271694; x=1693358094; bh=GYzaHF4EoQJrl
        jrwW7H1vltFJPOCwd8O8DL1nWVnf5s=; b=ldn5edeb4zJttOVrqFCdPEcA6O4jv
        5mBpMHCZxEl6FPIaJhXXgIfBAXeyiwA89QyqtPwsq6P8ogK8hbZBubeFUAhcyXfE
        /4x8tkGcom+HB/9y/2EmFEr4j3zW8rXJXbblD52GDWyBmR2FSqMk4xgYUf1JiZt2
        xQ9OaaC78PYU7iRtS6/lpDg7AizcUec7vD9DwCByq/QDcrO07Aqw9QOVsm/FO8nT
        uDyxLanfxj0d4WczOREVMo0ePhU+4G1lA9SNfWPbbW6GLFVIFyKeuXQV7bIbGHly
        PG3FYiK6sRabAjFyg5oVExjkufnZ7dvjpFLLQvst449pv+EnD52oxC2ow==
X-ME-Sender: <xms:jUbtZFw92EUft28rPyn00zHrN8TNTzRvBHsYHFQJfDlAAgISHzWDFg>
    <xme:jUbtZFTk-KStGBxh6-sjQdvVKNOJWjfwG9wbtQONYtJbZwgrpx8Kovfs9vJ9Q48Ng
    1-RCJq_ebhqmgL-g2U>
X-ME-Received: <xmr:jUbtZPUH7SfbE-aoQG4cC4LRAD5lPKEcJT-UqJd25nupu4MxgBwCuZ_elyM0RPbyc9B16zrq_fJ2eW0O6we_M-N3oqgbMm5A8Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefhedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:jUbtZHjt0QWvmg9T0yzn0t4wKj8_dhkagxkDfwQKhkO54NjCpHOQzw>
    <xmx:jUbtZHCwn0yG2p_ag-nMsRGXXxOYAHzxYt-xd7bZgNU2GG6ifngNJw>
    <xmx:jUbtZAJcqWB02_g3Hg21uuVgYcz_qG-nXTL8W24XXtYRug2-7DXJ7w>
    <xmx:jkbtZKNbJty_Pudv7M2kyKp5cJgbdEq56mFH1CS4zBn7ghhCGzGzFQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Aug 2023 21:14:50 -0400 (EDT)
Date:   Tue, 29 Aug 2023 11:14:48 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
Message-ID: <0891ec11-bed1-9120-79d5-4436dc9aee32@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>  <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
 <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 28 Aug 2023, John Paul Adrian Glaubitz wrote:

> 
> And since we have to break the ABI anyway to be able to use 64-bit 
> time_t

If you're worried about Y2038, aren't you jumping the gun? I reckon we 
have about 10 years in which to figure out what a better m68k ABI should 
look like.

> I don't see any valid reason to stick to the problematic 16-bit 
> alignment used by the current ABI.
> 

Well, here are a few reasons why all those padding patches you wrote were 
a good thing (besides the obvious benefit of avoiding an ABI break):

- That code is now more portable among projects which care about 
  portability to 16-bit platforms etc.

- Explicit alignment reveals suboptimal cache footprint and wasted memory.

- Data structures often outlive the software that introduced them. It's 
  safe to say that the struct definitions you fixed will produce a benefit 
  you may never hear about, by virtue of code re-use.

> ...
> > If it's the former, perhaps you should not push it upstream. If it's 
> > the latter, perhaps this redesign should seek to address real 
> > shortcomings with the existing ABI, including problems which (for all 
> > I know) may have entirely prevented some people from using it thus 
> > far. That is, it should consider silicon beyond 680x0.
> 
> It's a historic architecture. We don't have to redesign everything. 

Coldfire is still shipping (is it "historic" yet?). Not sure about Apollo 
68080 and Buffee BP68040. Most likely TG68K and Pistorm will end up 
gaining whatever features Linux requires (MMU etc.).

If we get the ABI right, such designs can benefit if it allows them to go 
beyond 680x0 and better exploit the FPGA they may be implemented on.
(Dare I mention SMP?)

Considering just Coldfire for a moment, one question we could look at is, 
how could the ABI be changed to permit the same binaries to work 
efficiently on both kernels (CF and 680x0)?

It seems likely that ABI changes could potentially help to accelerate 68k 
emulators.

Inefficient thread local storage is an issue that might be addressed with 
VDSO calls rather than an ABI break.
