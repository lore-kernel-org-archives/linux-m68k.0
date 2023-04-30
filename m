Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41117C77B7F
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Apr 2023 00:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjD3AU2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 20:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjD3AU1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 20:20:27 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D4B10F7
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 17:20:25 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 51B175C0111;
        Sat, 29 Apr 2023 20:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 29 Apr 2023 20:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682814022; x=1682900422; bh=NkxX2xUNj2/H6
        49u5tWpgCR5L3QZupM8hUuZywwpXZU=; b=cXF67QXRduSaoaIFFHtCGyho7jmtC
        76emx9EfrN05HTTH+upuuw2kqE/cUmQ8jMnOKgro2epU9u4Ie9gn5ZcdDao+H0Xz
        71O5/eIZ1jaGzMasN1bVrMsFT2kMTU3trJNqCM/t/NQoIrIk0VNq42KdhVsE8JZ2
        OJFmPWQ6knF6CJCuoyCnoy9Wlm7gzkbFYQREduiVB8dHY+4YZvpGQfPoksaKEqfa
        Rnyjg4sM+LocICO5hm3VhT1ic/XBFKqFkPOYKsdXIo6Dn/UMTNOVpwmezTvzru1e
        WqHeJIgab4cwh5Rwrg1/ATLza/unBtufC2bXpacagXvYciM+K4fMVMxcA==
X-ME-Sender: <xms:RbRNZJCuFXHvBN1wRxIm4b9j7a_FoGn3PQ_8kzYLUB6JJ62E2UQfww>
    <xme:RbRNZHjPxrWkKRF710bBr5mR8b6u7qbTD6SBTZ_LmFlaR_oUyXNQ47Vpf7tAfADXG
    UXNdO-W0GbeI0wR0oM>
X-ME-Received: <xmr:RbRNZEl-DE72oUz4CQJu4mlJBSpZjJUsjmtZrwrI7P3Mc77RQ3pAhUsxmGiaaJlToYzhtN6lOkvK1KcDbILBBQj5cx0VG4URmW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvuddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:RbRNZDzH9nJWu7P9mOGTAEU_amElsN8-_dexltlBOBzn5TQXfqxq_g>
    <xmx:RbRNZOSAppkFpEHCGV_mRaPTrf9P4PR3q3HZ90TrIBZRs0-n7mlYqQ>
    <xmx:RbRNZGZVyA6RoQDzn_0WIR9fQYOsmPWgS34OVoG_nCHzbBova9X_Lg>
    <xmx:RrRNZJdGQzJvbU38K3H5OzvtMCv34ltGHk9yXbsnDJhcB6HkqSuUgw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 20:20:19 -0400 (EDT)
Date:   Sun, 30 Apr 2023 10:24:08 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
In-Reply-To: <10ace434-8b76-bd38-5570-9befc9eb7b98@gmail.com>
Message-ID: <0827b987-134d-b463-c3c9-e21905f94e09@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com> <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org> <10ace434-8b76-bd38-5570-9befc9eb7b98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sun, 30 Apr 2023, Michael Schmitz wrote:

> Am 29.04.2023 um 21:49 schrieb Finn Thain:
> 
> >
> > That seems over-complicated to me... I must be missing something.
> >

If signals don't nest, a page fault on the signal stack should never 
produce a new signal frame there, so this bug should never show up there. 
I think that was the point I'd missed, because it means the signal stack 
may be exempted here. But is the extra complexity worth it?

> > What I had in mind was something like this (untested):
> >
> > unsigned long usp;
> >
> > if (CPU_IS_020_OR_030 && tregs->format == 0xb)
> >     /* USP is unreliable so use the worst-case value. */
> >     usp = sigsp(rdusp() - 256, ksig);
> > else
> >     usp = sigsp(rdusp(), ksig);
> >
> > return (void __user *)((usp - frame_size) & -8UL);
> 
> sigsp() may return an address from the alternate signal stack. In that 
> case, no adjustment to the signal stack address is advised.
> ...

It'd be ill advised as it would reduce data locality when it expanded the 
signal stack across a cache line or page boundary, and there may be a 
performance penalty for that. However, the signal stack seems to be prone 
to poor data locality anyway, compared to the normal user stack. So I 
wonder if this penalty could be measured. It seems like a premature 
optimization to me. Unfortunately, I don't think we get to measure cache 
misses on m68k.
