Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37012C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 08:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbjDTIzv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbjDTIyO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 04:54:14 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7148640D3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 01:52:22 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2BD825C019C;
        Thu, 20 Apr 2023 04:52:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 20 Apr 2023 04:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681980741; x=1682067141; bh=mI57mz2HU9anR
        bRxvQvM3lQKU2tJ3cL10pad34pjXug=; b=kFUVuuVrB2d1A4+QbLCgUzn/r5E11
        3gyS4u/G6Bu3ZvQBK2cqW03Eup7XNMm7mO5Glmx47CotzC9mDdq66GtJv2r3ena2
        QzDKZ90eQvDUOqZu1A7SVUY5l2WOa/tNeWboiHJN14L9MX8CwDto/MB65DgCR8cj
        4Lpfnre76Ua/N/bv5H1Q0fUG1e9Es/M9EcagfodSw/8/kpMclecpXZTm9p1cC9b9
        zwW3s8IuiP2QxuqYr+dIvJoiKXkTqEa8nik7iOpv5Rda7uY+05DKTq8huE1Rh8Hf
        wXMwFOPrfv+BkMYJ/6Pewauah/YYiLZhwpxCk2IER8X7hMtWts5VorLig==
X-ME-Sender: <xms:RP1AZM-X4nS96eRaRRD8uaHWQReZoSfqhf4MFsHufKclr0B66g5WBg>
    <xme:RP1AZEu5qBUrXF1YOvIUcs8KYTxVQ_8JVQxEyNdiKkPl_gzMo6ltt6PZ480kzX6Hb
    h1UuBC4J05b_6jA34Y>
X-ME-Received: <xmr:RP1AZCCf1KHoFM5VNf6LQMyImPhowlOPOQAK4rKNQvD5DWdJY4g1iUYDt0rQ__aMUWM-8cD5wB__NdJV1PpYgPFVkT1DafxNulA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:RP1AZMfs4aSJkjBg-AnvQAsa2RwckTCW8_h5C-aURH8iFBeJkVx6Iw>
    <xmx:RP1AZBNfpERndVaDTfltTbQYBg8_Mo5VMJXxYFbQ8p8zvEx8ZM3CLQ>
    <xmx:RP1AZGkp0ocEFx4VrpMY2C8V1pV-1fWnGijbsAlpMvbwkp7z9qn1bQ>
    <xmx:Rf1AZDWAKvPflYGhkuVpfI0uZPuy0lwkBUpip3kcYoGRxrvdvhVKjg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 04:52:19 -0400 (EDT)
Date:   Thu, 20 Apr 2023 18:55:53 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
Message-ID: <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org> <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com> <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org> <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Michael Schmitz wrote:

> Am 20.04.2023 um 19:47 schrieb Finn Thain:
> >>> So all the stack pages would have been faulted in well before the 
> >>> failure shows up. It appears to be the signal that's the problem and 
> >>> not the page fault. That's not surprising considering the PC in the 
> >>> signal frame in the dash crash was a MOVEM saving registers onto the 
> >>> stack.
> >>
> >> Well. without locking the faulted in pages in memory we can't be sure 
> >> they were not swapped back out. Unless I misunderstand what's 
> >> involved in that ...
> >>
> >
> > There was no swap enabled.
> >
> > 50000 frames * 36 bytes per frame == 1.8 MB
> 
> OK - swap is enabled in my case. That may explain the different fault 
> rates.
> 
> But in any case, it looks like we can eliminate the bus error code. Same 
> fault on both 030 and 040 with very different bus error handlers is 
> highly unlikely.
> 

There's no failure on '040. QEMU and Motorola '040 gave the same result.
