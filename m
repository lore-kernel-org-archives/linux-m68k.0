Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABBBC64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 05:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjB0FxS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 00:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjB0FxR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 00:53:17 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72760E042
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 21:53:15 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 40ACA3200902;
        Mon, 27 Feb 2023 00:53:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 27 Feb 2023 00:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677477193; x=1677563593; bh=+rb5C1qNbXuZkfVc0THjxd9Q+GB2
        O1X3zIZaY+OiWpw=; b=Y2gqMKcPFq8nNmN+YOXM1dxLkkSsJXccWMf31taFiy6q
        tC+6El8898oIBmzsbH9DHY5Fn+vuSl+21jH1p77lJduEegTdcuEDDyckmP0Xphf4
        IU+ZosZymlhqdKLH6h/le/XGJmT+99gpspXm6TP++Fbm5o2gsMnhH4HIeuc7RZYA
        6vYL6Vf+3ER3kAzn3OMLe7htlosizFX1jaIhUyA52mwgEoEKMAcrdoEGI8DEaLt9
        5BT2k2ESLzTlv4krrq2vb1kdAwbUe31nyeDsiFTYuUANU/S9dVlmx7WJrAeckQyz
        J3txVu+aaPlCEUWy905Q3mPxvC5UgDWcdFO/w06/qw==
X-ME-Sender: <xms:SUX8Y43gWzZRV1LuzRoOrmrCWryJGk94_Y9dkHT7pNuSo2-RrkC_Sg>
    <xme:SUX8YzFmz0CeDnKTxvhvwgu32X5L5u5h26hcPQf9c2dnZzDqzx0OOLRLPMqSgZ4sn
    kfzdwPbCuSvE-hm6hI>
X-ME-Received: <xmr:SUX8Yw7hqphQxSPrdrEHDddAw_eN6hVTH2PoSrcv5OeBv8E3horJgUjiUbpyrQphFZBoWUU9OXHaOEm9vutk1npFjbQNYi5UjOs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekledgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpefghfeihfegvdffueekffettedtjeduudeludekudeuhfefhfejiedvgefg
    uddtveenucffohhmrghinhepuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:SUX8Yx3Tv2gTPDwVMCdeaTKkj11aToEyHgmsTG2oAnJ2pWzXHhrypg>
    <xmx:SUX8Y7G1WPLwGC9VfHjk-IXwxa0ttVScMlfa-VBTv9f8zUp8eQI6GQ>
    <xmx:SUX8Y6_-FGEAOVtNCXCkrnjH0mg1pTrm_uGY1duVn0x4KS9u0czhvg>
    <xmx:SUX8YwRoqESzP-ntsY_xK8yWt6jMD18EfjTKRYar8hmxLe1RmO2G2A>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 00:53:10 -0500 (EST)
Date:   Mon, 27 Feb 2023 16:55:41 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
In-Reply-To: <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
Message-ID: <412c63ed-f3dc-91e4-e08b-b52718823943@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de> <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com> <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de> <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com> <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 27 Feb 2023, Michael Schmitz wrote:

> >
> > Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest 
> > functionality") in v5.17-rc1.  Reverting that on top of latest fixes 
> > the issue.
> 
> Yes, I'm sorry to say that was the only likely candidate. Can't see why 
> though - are Macs all configured to have RAM start at address zero, and 
> possibly contiguous, Finn?
> 

I don't really understand your question. This was not a Mac patch. The 
issue seems to be about the locations initrd_start and initrd_end in 
relation to the various memory segments (?)

This seems to be the same bug that was raised about 6 months ago... I had 
thought it was a bootloader bug but I'm out of my depth here.

https://lists.debian.org/debian-68k/2022/09/msg00047.html 
https://lists.debian.org/debian-68k/2022/09/msg00051.html 
https://lists.debian.org/debian-68k/2022/09/msg00055.html
