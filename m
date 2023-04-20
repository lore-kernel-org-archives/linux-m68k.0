Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7027C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 00:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjDTA7c (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Apr 2023 20:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjDTA7c (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Apr 2023 20:59:32 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005D040CD
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 17:59:27 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 354025C0219;
        Wed, 19 Apr 2023 20:59:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 19 Apr 2023 20:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681952367; x=1682038767; bh=Ni+Ghp4XuZZBy
        kr3LTarQkd4p0PSlvvRXDGyejyhI6o=; b=j6LxOwZag6PNmLYIBkQKa9p19WQRg
        9+RfbWfLDXQsyGXwGEanIm7CcQfHWHQGX7tq5G9T/332MnEV0eLjSTR4UBqySmbC
        PJQKVWi5lMwpQTbpjkG1K0uBjMWiRvm49gxC48nutajpCJk1t1j9b0kphPVlGUvj
        sdMnDztvFm4jJWBw08FQnGDM+qKoJ8x3tFHf48majpGz/SFE5yYJNTd3O5nbMP+Q
        b86D/l7ZcSyvX4W7cHFPag7fQUftRgP8GRJuG8cnfjfv+N2Z+G15Kde5hqmOPWat
        D/VdE0G9R0xNJH9ohwfo9aWY/8UCGG8zbBBT6k8n7tsEcob3/O72OZjkQ==
X-ME-Sender: <xms:bo5AZF-bT0-RHNEml9q7uszGWEFqWog2-w8XuyU2jY1BTT_n7iE6VA>
    <xme:bo5AZJudBjCHLv_QWaecUKcUM8lyzCm1oNmx4qK4L3CMRasFvA8kU9oBmC-o__Rlp
    -RGvGWKi4huVCxt_Nc>
X-ME-Received: <xmr:bo5AZDC1rhAOFSsxjZmFpYKZ2FTVM_mNDd3mD89nXZIoOVj6veWBeIKWAuxvso-lkuEiduw2tmabTzs3uobOtF0CQvoCNUQ3-u8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:bo5AZJexT_7tiNHcWcBFz89nU1YeLsZlu4jYAy4DgHP6Es22j5ZYWA>
    <xmx:bo5AZKML9MaSWVaUNG9HKM_gTvPNytQp2ytRYUzkTupaDzTg0xWoRQ>
    <xmx:bo5AZLkCiI1E_ywEELP3CmtmIOQst-rWdoCOJiFjvvi3vbrWUmVsfQ>
    <xmx:b45AZEVIS9Gifu2rtfu6vV7wGUGw8-vzS0aaOJ8-8lcg99pvmcT7cg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 20:59:23 -0400 (EDT)
Date:   Thu, 20 Apr 2023 11:02:17 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <CAMuHMdUo-qDuX7ob9iBuALZnLetgdS5c59cZ7Q-47QvrUcsM7Q@mail.gmail.com>
Message-ID: <1f759966-9030-9874-1698-3c9194a46347@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <CAMuHMdUo-qDuX7ob9iBuALZnLetgdS5c59cZ7Q-47QvrUcsM7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Wed, 19 Apr 2023, Geert Uytterhoeven wrote:

> Does it also fail on a very old kernel image you still have lying 
> around? Just to rule out a recent kernel bug.
> 

These are two mainline builds I've tried (among others):

[    0.000000] Linux version 4.14.0-mac (fthain@nippy) (gcc version 6.4.0 
(btc)) #1 Mon May 23 15:03:18 AEST 2022

[    0.000000] Linux version 6.3.0-rc5-mac (fthain@nippy) 
(m68k-unknown-linux-musl-gcc (Gentoo 12.2.1_p20221224 p7) 12.2.1 20221224, 
GNU ld (Gentoo 2.39 p5) 2.39.0) #1 Thu Apr 20 10:10:37 AEST 2023

The results are the same. 
