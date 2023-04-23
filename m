Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB416C77B76
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 09:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjDWJT5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 05:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjDWJT4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 05:19:56 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD3A1BF0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 02:19:55 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 22FBB3200708;
        Sun, 23 Apr 2023 05:19:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 23 Apr 2023 05:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682241591; x=1682327991; bh=H0AkL8MUlLFKo
        BI2PfzxEaZHvpksuig7eEoEHrmGMKM=; b=ZZ/jm5QNCdpYgaZZ00knmcTY+eNvf
        uJEHgVSz6S5CL0KHyc9aUL/zLCJIR7jiX3HlJ5Rn/kPJ2twd09IiBm3IGt7W6WZ0
        SQfBDrpAVDBphR+OUnelvBJQLGVYB9wGyw1iJcAGQntH8VDU/8bKBKACA2+TAuBp
        4oLG8eywzzec4JdpvUecKpthcz/QCj/moMwPGZ+q7Am0MUDelFhKrY+WevtaHWpW
        yjNm4rrt+Ih2HiakX+NKyT8zvFTL3Nq1jaqc1IPHrWd1GvLSuvoymPIRZ/Fy6JrK
        iJxdQQh0XETKNRZ570qWKphGGhNZ6/R2k8cIF28TUMQlAEL23kxELVhYA==
X-ME-Sender: <xms:N_hEZF_i_Z-SXtnqm_S9-UNsGOut7whrtAz4eY_It9BJD1OsfFB6ZQ>
    <xme:N_hEZJvYBJLncjp_TZARlKAlAAHD_eKmFfYYl94VbG753pDoGJWF9pzUSnWwGjmsd
    36tqIb4nxfooTiaUXE>
X-ME-Received: <xmr:N_hEZDDU75Z5oISNakvt8QsOOykfl0yZsSwdajofaIobiQ4SljYcA3UBdbm60yliywN8KcdVB0yeVKt97iLP9esTsGALa_GC5Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtkedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:N_hEZJfk4z2pteSuW7wa6xGMw6k1g1PPRZ1cLc66K-NBOc8lK8iZgA>
    <xmx:N_hEZKPC3wITfNLJG55gArcHZZ2jeWobws0OsGPVmnEhCJ1XYcYPrA>
    <xmx:N_hEZLntTosM8A2yktNOqB_xlMvIPYIR3LXRNLIvJfgPz4RfIHX5lw>
    <xmx:N_hEZM1LhHNS5OMVJUnylrX3MfvpILFRdBSt5hZNyBq4YsKGqUkNWw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Apr 2023 05:19:48 -0400 (EDT)
Date:   Sun, 23 Apr 2023 19:23:27 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
Message-ID: <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org> <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com> <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org> <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org> <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com> <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com> <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org> <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com>
 <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 23 Apr 2023, Michael Schmitz wrote:

> Am 23.04.2023 um 13:41 schrieb Michael Schmitz:
> 
> Though the question remains - is this expected behaviour for programs 
> that do deep recursion on the stack while taking signals (and the reason 
> for the option to run signal handlers on an alternate stack)?
> 

I don't understand how "deep recursion" can be used to explain this. We've 
seen crashes with only 1.8 MB of stack usage.

The best reason I can think of for having a signal stack would be that it 
may be better for signal delivery to fail than for the target process to 
fail. But I've no idea whether the kernel makes that kind of defensive 
programming possible (?)

> And why does this almost always appear to happen after bus error exceptions
> (frame format b)? The extra exception stack information isn't even accounted
> for in the above frame end address!
> 
> Result with sa_sigaction handler:
> 
> parent usp  : 0xef969e28
> handler tos : 0xef969e6c
> handler stack overwrote usp!
> frame end   : 0xef969e7c
> frame start : 0xef969b58
> handler usp : 0xef969b40
> signal usp  : 0xef969e04
> signal pc   : 0x80000696
> signal fmtv : 0x114
> 
> parent usp  : 0xef955008
> handler tos : 0xef955064
> handler stack overwrote usp!
> frame end   : 0xef955074
> frame start : 0xef954d50
> handler usp : 0xef954d38
> signal usp  : 0xef954ffc
> signal pc   : 0x80000680
> signal fmtv : 0xb008
> 
> parent usp  : 0xef945eb8
> handler tos : 0xef945f0c
> handler stack overwrote usp!
> frame end   : 0xef945f1c
> frame start : 0xef945bf8
> handler usp : 0xef945be0
> signal usp  : 0xef945ea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x80
> 
> parent usp  : 0xef933eb8
> handler tos : 0xef933f0c
> handler stack overwrote usp!
> frame end   : 0xef933f1c
> frame start : 0xef933bf8
> handler usp : 0xef933be0
> signal usp  : 0xef933ea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x80
> 
> parent usp  : 0xef921edc
> handler tos : 0xef9aaca4
> handler stack overwrote usp!
> frame end   : 0xef9aacb4
> frame start : 0xef9aa990
> handler usp : 0xef9aa978
> signal usp  : 0xef9aac40
> signal pc   : 0x80000782
> signal fmtv : 0x114
> 
> Illegal instruction (core dumped)
> 

I don't understand these results. If usp was really overwritten, the 
program would have crashed early, no?

> Exception right before crash was an interrupt in this case (only seen 
> that once in this context, though I've seen lots of those in the course 
> of the test runs). Frame start calculated from siginfo pointer value in 
> this case.
> 

I didn't realize that you could get a crash from a signal delivered 
following an interrupt. I'll try to modify the kernel such that signals 
are not delivered after page faults.
