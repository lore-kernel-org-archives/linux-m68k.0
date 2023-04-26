Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDDAC77B61
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 01:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbjDZB70 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 21:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239218AbjDZB7V (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 21:59:21 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D0717DFE
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 18:59:20 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2B1E05C0185;
        Tue, 25 Apr 2023 21:59:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 25 Apr 2023 21:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682474360; x=1682560760; bh=CKFv2zbZHNGSS
        QItixtf3/h8sPV025PAhbek9mNixrQ=; b=UtpNpJrnQo3Qs+1n9dJPJeONb7zsC
        /pmsKo2KpKsiGu/tm1C7TNtmxzaweqSv9uitla75B+KuYxysAsR9jCP7ST2QjjHt
        u+4577EyTAh80iZqsnuYO1EeBNjMXlJ8+vFlRAoKboJukaQgToHgZ8q8XZpFRTHx
        iTytIUjjXDtRL16EQVhtGfaWtAnrBze5hUQEKUr8er4yrM9oqnwT5JB8UboCQlE3
        DKGji0dXoqhPYtYtnMGfDYq7Y5pU8b7JMbxdgLZAi8RR4WjtwQWcFpLZlXwaFNRb
        nO4fBPYm11FXxuJEkDQgYqj2p4z6s9qPYZrAt3bRJtrnLkpadtilrB/BQ==
X-ME-Sender: <xms:d4VIZFJwq8hISSvwq3K-4BCO3-sj3SNxHkMS8Km5AnpDhDs1_y-_SA>
    <xme:d4VIZBKbdmfThzNKzia2cVYdHlQcTZTqiW1p2HClU-cgeaCBIM4SPzmNLMb4YaXcw
    kpmAvfSFRjj__psRW8>
X-ME-Received: <xmr:d4VIZNuKyiSHhA4qt0ShGLETrfzuTem0mTUQ3_-4on0rckVv5KXixAK7Hv2HUR6G65jQ-Lv9-BH7UHZChLf_Qxg2dXuYYdy4Wck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:d4VIZGZNxdO_XHmqFATzp2Bs9LYp6Z04sj574L7J0HPMynwm_DWqUA>
    <xmx:d4VIZMZc13i1mGb1ooQ_4Saqe03eKyDO7wvAzePqpqESLx0kZxCMYQ>
    <xmx:d4VIZKAAe6yuwykiqnIWtNTC1V8mk5wyyCLN1uaUAszpKexOIKOqsg>
    <xmx:eIVIZHxflnweu3OifHlDSYJBik44BQAxxMp34IGl-VKvg-slfb0DQA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 21:59:17 -0400 (EDT)
Date:   Wed, 26 Apr 2023 12:02:56 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
Message-ID: <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com>
 <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com> <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
 <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <87y1mgryp1.fsf@igel.home> <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 26 Apr 2023, Michael Schmitz wrote:

> Thanks - we had seen evidence that a bus error generated mid-instruction 
> did leave the USP at the address where the bus fault happened (not 
> before the instruction started, neither what it would have been once the 
> instruction completed), and the operation did not complete normally 
> after the bus error (at least the value/address seen in the exception 
> frame not stored).

I'm afraid I still don't fully understand how and why the user stack 
(rather than the supervisor stack) gets used for processing the exception 
frame.

> Finn had also demonstrated that skipping signal delivery on bus errors 
> abolishes the stack corruption.  Your patch achieves the same objective 
> in a different way, so I'm sure this will work as well.
> 
> I had thought the 030 could resume the interrupted instruction using the 
> information from the exception frame - and that does appear to work in 
> all other cases except where signal delivery gets in the way, and it 
> also works if moving the exception frame a little bit further down the 
> stack. So our treatment of the bus error exception frame during signal 
> delivery appears to be incorrect.

Wouldn't that depend on the exception frame format? Perhaps it is unsafe 
to treat any format 0xB exception frame in the way we do. If so, what do 
we do about address error exceptions, which are to produce SIGBUS? The 
Programmers Reference Manual says "a long bus fault stack frame may be 
generated" in this case.
