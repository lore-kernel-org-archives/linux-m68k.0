Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1C6C7618E
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 04:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239147AbjDZEuN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 00:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjDZEuL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 00:50:11 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A89426AB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 21:50:10 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D822C5C00CE;
        Wed, 26 Apr 2023 00:50:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 26 Apr 2023 00:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682484609; x=1682571009; bh=SZQOgyx+Ts1W3
        n7Cd9kH2uckc3tq+wYGNQzD86dSSlc=; b=YGAYhsjUKa5PHD6Cvz96gxEOwOePf
        gCulBd4IAPHESdTIrIfVISjDohhuafM+jJBeQBB0VGINOD9+hbEzUzHD21jUIQBH
        O72WgNPAF1zWrDImfHYm6Tv/c0HqFSzmqVNN0tBNNEJfT96DZTf5OWBgpgPjsp6o
        G0PLxZeRDyDmY9dllb+J2wx9XlP/TozjXle67gx5toNUx1wF1guLj6f2RcXb/1zp
        fSUedqFZPpPUjVa9PcS0Qneou2ZZEn8NP2MACvGeVmMKNW9ImAc9fh1v6Uh+c3bH
        ewgOibd7XVe3MAJJ5aupGPY8fSySiDgLUm9/j92my2hNK6o9FEavwEGHw==
X-ME-Sender: <xms:ga1IZN5yKjVUToKkkDrzCcH4-OWvJsfTu_rXZ3IpWVqgZlzXV_3mFQ>
    <xme:ga1IZK545Hbxx2m3Ghzj9UZfehiXptEWXlVdrZh-iFTtIbzfyWm4wAUL7eTaReeQX
    C19j7sGel76McXEHZw>
X-ME-Received: <xmr:ga1IZEcOfP919mB0h4s8Wxy0qymBdG-0b3j_raF682nbByvVusmSTrHgwLauST3JWpa5ClGzLJtwgxx1WZqA0H04xqt4VADijr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:ga1IZGJK_Ty5-Zga0MmUvhYzm-x3KfRTseceIX6xkFIo2MApScEnsw>
    <xmx:ga1IZBJ8SFN17Oy5LjrWqhavxv70-zLVZS4FWdy70LPaTDjMzKeMmQ>
    <xmx:ga1IZPyb0xL5UzwOM0lFlKrAbg1GnrT-EuxqepIpwAEQY72IIaS-hw>
    <xmx:ga1IZPh_WucGa3SrTp49BNIsQuVuzpedjCM81vHVEFkDU3KI9dEA-w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Apr 2023 00:50:07 -0400 (EDT)
Date:   Wed, 26 Apr 2023 14:53:48 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <bc28131a-e3eb-dae5-3731-d69a422ccac1@gmail.com>
Message-ID: <c86e8334-28b3-b13d-9206-2bc38de8336c@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com> <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <87y1mgryp1.fsf@igel.home>
 <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com> <6dac9c08-ebc1-03d2-4762-fdff937edf2d@gmail.com> <5c0ba5e6-8f3d-0712-99db-3b8191cfe684@linux-m68k.org> <bc28131a-e3eb-dae5-3731-d69a422ccac1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 26 Apr 2023, Michael Schmitz wrote:

> In my copy of entry.S, sys_sigreturn has SAVE_SWITCH_STACK, just as
> sys_rt_sigreturn does.
> 

You're right.

I think I've been at this too long.
