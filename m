Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA48C76196
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 04:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjDKErk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 00:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDKErj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 00:47:39 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF5E1708
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 21:47:38 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0A3095C018C;
        Tue, 11 Apr 2023 00:47:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 11 Apr 2023 00:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1681188456; x=1681274856; bh=b7/XrowpfOEtx
        CDAws9xhtiXLj7v7rbS/vPK3/+gHoQ=; b=Xfl09Scc5cMu9SaApMG0Gi72pF0xB
        eFkpaJTO/fp3V8iDLy6rjENtfjKMws7uso/JeO4aVd+2ttWtb87mS+x4mSsvXhk7
        Esdl6SDrEr4HSzi6JcNris2lpwe/EBJp9/OHMWobEL6sxgNjqvqC6vfbHucCickF
        NYsDW+/SsXD3xczhip39R2Db1ZuhBWACadVRc86O3LhlAZ2ai3+Dw99cFH273Dae
        jhWLFJ2DwEzE61MiBdrpFa2rT+1d7PVQJ57qcQieBAXudHboNSJDCLH6/ke0H7gI
        rSYB9FD3KTfiRgOZE4cwUgP698GnnmKRnLn1bDVVz7GVvAnixXCDVirDw==
X-ME-Sender: <xms:Z-Y0ZGkliN4vd7fmGvVRz-JNl7f6GH99vaZ-I98l7gM6nGkwCzEHZw>
    <xme:Z-Y0ZN1fVuQ2HgAi41fDqXtqKz1mnumnCzdkGbfO8fARfWazks--KbyeXw6UEVYrc
    2BYgR6SdNEf_X4BFpA>
X-ME-Received: <xmr:Z-Y0ZEq3A9DNqKpC5Zs2zXj3OSuVY1NkCYKuHJZigKx2DPNRKxqY86XnWCuzIpdOKJY6Rp8D0zUfdVMGnVi_boV32WhtsmZcVTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekfedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Z-Y0ZKnyXFHxhOfXqlNsykFNvD0R03cGNIsU6ivXUh4sQ7PPHxP2GA>
    <xmx:Z-Y0ZE3spqShOqle-IF74qrSVg41bRPwgZZajZL9TrDx7qJdZpUtQQ>
    <xmx:Z-Y0ZBtnQjGOfgbeRHW5HwWFCJ8TPghfYryoUfNNOtc0yn0gw4Y1cg>
    <xmx:aOY0ZJ-zULu_Yj5pzCdhKqbzk_GzLO80yyVXDw2998xtE8rZSp4LoQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 00:47:33 -0400 (EDT)
Date:   Tue, 11 Apr 2023 14:50:54 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: kernel behaviour, was Re: dash behaviour
In-Reply-To: <df1f56d3-ff3a-a4bf-290f-7f43f60ba45b@gmail.com>
Message-ID: <dcad89d6-d535-4e07-0fff-c9070af3519a@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com> <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org> <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
 <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org> <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com> <6f2c6c5b-7e9d-94f2-98ba-9a1306f131bb@linux-m68k.org> <df1f56d3-ff3a-a4bf-290f-7f43f60ba45b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 11 Apr 2023, Michael Schmitz wrote:

> >
> > I was able to find some command line options (init_on_alloc, 
> > init_on_free) and the related Kconfig symbols 
> > (CONFIG_INIT_ON_ALLOC_DEFAULT_ON, CONFIG_INIT_ON_FREE_DEFAULT_ON).
> 
> Right - not sure how I managed to miss those.
> 
> init_on_free might delay the boot process a while! But I would guesss 
> init_on_alloc should be OK in the first instance.
> 
> >
> > Given the compiler supports -fzero-call-used-regs=used-gpr there's 
> > also CONFIG_ZERO_CALL_USED_REGS. Also CONFIG_INIT_STACK_ALL_ZERO 
> > (-ftrivial-auto-var-init=zero).
> >

With all of those options enabled I still see dash crash sometimes. I 
don't think I've learned anything new about the bug from that test.

> > The problem with these options is that they may produce a large effect 
> > on the timing of events but they should still have no effect on the 
> > behaviour of a correct userspace program.
> >
> > Since we are dealing with a suspect userspace program, what could we 
> > learn from such a test? E.g. if the crashing stopped one could simply 
> > attribute
> 
> We don't know for definite that we deal with a suspect user space 
> program - it might just be a change in a previously fine program that 
> now exposes a subtle kernel bug (undetected for quite a long time, but 
> we've seen a few of those now...)?
> 

That's right -- the kernel is also suspect. As is glibc. I will keep 
looking for some way to narrow down the search.
