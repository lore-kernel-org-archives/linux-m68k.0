Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEF2C71153
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 01:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbjH2BN0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 21:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbjH2BMy (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 21:12:54 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1F8EC
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 18:12:50 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5B77232000CC;
        Mon, 28 Aug 2023 21:12:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 28 Aug 2023 21:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693271565; x=1693357965; bh=rx7bBbH2ANLUA
        VJ22P8Asz2LL0y6V0sk4bd9pmTc18g=; b=Sw2FcQCsVLCaVI0zPLbzafvkPdFsl
        cRDba7x4yvVwYVtyUPcK8Gj08Jw8IGKA5452pa+esXbJtbZeniIfTVHntcA3PXTi
        aQUr0GTaJe5rFVXyXRu+xYQEtUMaDKQzEXmuGYzO9BSDE8WSIgxplxZ889uUueOD
        bWGj5UMOoREmk9ow/lYQPtcBZm3xm5tPhPLSXYJHlytwJS3ToMvaxpHR33On1bmN
        bnF8/PLpP0CZI8DRZuj6Olgj9qS1AggKA/GW7z7i8/FCB9Du1YD9zmGKEqajaOBG
        lHpPLLeblPivYL91N0L3lEoAaf6g+ZbZcdXErU2t2lJIJs93cMhouk3mA==
X-ME-Sender: <xms:DEbtZA5btRAmCKNNNWJCVTNFoJlnGCCr3UgXdEpSBn7BCgtlkitcKw>
    <xme:DEbtZB515GmyllNa5pAW8EvGf8usCMGVzmx5odF875x42pyKRxt71kor1TfhIV-lq
    v5GlRxb-h2AR69Duas>
X-ME-Received: <xmr:DEbtZPcph0qbTqNvOIU-4vlFHFI-fX3ixthhHbAA6SK-6KqtpLGP0hqRqxCbVcTjtqK6mkHuJ75UAsmOIAczTe-jiFJgdJHNgNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefhedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:DEbtZFI02FHiarvEqb2GZJo_mlOh5EAdHgDbC34s4GyBWVXKmKfFDg>
    <xmx:DEbtZEK366uTVe02IQ4imXD_RJ-oKrWOQMBoNKMwWjDpW2n2H2xHNw>
    <xmx:DEbtZGzvwKfIQkyI9o9Qdi89jBoQNEQASJxT3rhal3XIfac8AiQ33A>
    <xmx:DUbtZI1W1whrFF4LV6s06b1TColJL-wI1RthSbycc9S8D6ouE1Jucg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Aug 2023 21:12:41 -0400 (EDT)
Date:   Tue, 29 Aug 2023 11:12:39 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <39d60bf3f3b80223a9366a379e672e7cbddc6f6a.camel@physik.fu-berlin.de>
Message-ID: <fb4f31ff-9f23-8911-3175-28cc77fc8e1b@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>  <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>  <CAMuHMdWE5V9N4GYdoe+G6iqBxmjX2rY15FsBkfWYWrXN1TGuGQ@mail.gmail.com>
 <39d60bf3f3b80223a9366a379e672e7cbddc6f6a.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Mon, 28 Aug 2023, John Paul Adrian Glaubitz wrote:

> On Mon, 2023-08-28 at 08:56 +0200, Geert Uytterhoeven wrote:
> > > And potentially more in the future, which may be anticipated on the 
> > > basis that "those users don't need a stable ABI any more, so let's 
> > > just ignore the portability issues in our code and leave the problem 
> > > to the distros and toolchain developers".
> > 
> > Indeed, the world is slowly turning into "everything is 64-bit little 
> > endian"...
> 
> Well, if we want to prevent that to happen in the future, we should make 
> sure that the m68k port is prepared for the future.
> 

Agreed. And if we get it right, all those 64-bit architectures will not 
find themselves in the same predicament m68k is in now, once vendors of 
shiny 128-bit and 256-bit architectures start tossing them on the scrap 
heap. How will they avoid that predicament? By following our lead, and 
making struct member alignment decisions explicit.
