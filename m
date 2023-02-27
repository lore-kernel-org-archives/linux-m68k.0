Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEEEC64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 06:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjB0Gam (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 01:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjB0Gal (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 01:30:41 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D81B1115A
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 22:30:39 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E626D5C00CB;
        Mon, 27 Feb 2023 01:30:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 Feb 2023 01:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677479438; x=1677565838; bh=yR8V0nc6/cLTvCDQ09zcv946ypb/
        ZjN2XK657bwA0fM=; b=TQYRa+J+iIGxBjgADQmWwmzf620HwJV1tluJVTTTD0dZ
        1H/Rp5JPz5Jwwktlk17C6mqGBx7lwsZt+UYqgDFILeHcA8pTbN3s4tPVgMuzGj9P
        iJeWmUpDk1DnIvDQxTUylJbWquJnnkoLFC/ayIsZIhzZmKQr8nLZ/9i1C6bLWjLn
        TTe3jvlwY7eDc5H3YOKmJKMCowkAu2m6J0wNVg5IPT5bA9RB++GRJHt/dR9NYsbp
        psI9BiH+HUZBRWdKokKfhszag5yDV2KLa6GiKgbqxXRx/AF9g6JNmHG+bXgM4Y/i
        iJGwvuIhRWNfyzRt2ntY5Or1WNy6guF/WaMJhJ6x+Q==
X-ME-Sender: <xms:Dk78YyM8YIfqeSXa9iO_FaJuC1a0GfzMGUgk91JC1Rhze20Bli5uHw>
    <xme:Dk78Yw8pOyx8K1qizOtCnr9XYyUDZKzswlQjLEe4_Yd-P74n6gIrtKUp_pFgF0PBB
    hFGUmrb6YXari00gFY>
X-ME-Received: <xmr:Dk78Y5RNSM_95eIIYBu9KHafTsHMtRmP3qLlkHM3yPFO3PCcEioRkLgVW0OhS6vGhguFgbcJ-YCbSfYCQS9-AlnSk2WRN0qQrNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekledgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Dk78Yytsz1jZWc8BTJPE8mddTXUhu4AdncdXwKFOCQ4dDSVMu81IHQ>
    <xmx:Dk78Y6d0Z2mDgr6Nlh5PgTtZ1setbzVSmORBJ5qfN2y97xQmtYglgA>
    <xmx:Dk78Y21RtbAUuUMIDzd2mwo0BXScxHBvusl4FFnTQKYr_W7wQV0KFw>
    <xmx:Dk78Y7rPtynpsHElr7SdiHBkZSo7aGXOQeoW4F7nm0-qE6kqz-bi1w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 01:30:36 -0500 (EST)
Date:   Mon, 27 Feb 2023 17:33:09 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
In-Reply-To: <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com>
Message-ID: <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de> <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com> <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de> <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com> <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 27 Feb 2023, Michael Schmitz wrote:

> 
> I wonder whether Finn's memtest patch merely exposed another MM bug 
> 

A kernel patch may be easier than a bootloader patch (even if this is a 
bootloader bug) particularly if it affects multiple platforms.

A partial revert of my patch (below) will probably avoid the issue, but 
with the side effect that use of memtest will clobber the initrd.

The initrd and memtest features aren't usually needed together. At the 
time when I needed the memtest feature I did not have confidence in the 
hardeare. An initrd wasn't very useful at that point.

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 3a2bb2e8fdad..92f1b9268dff 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -326,6 +326,8 @@ void __init setup_arch(char **cmdline_p)
 		panic("No configuration setup");
 	}
 
+	paging_init();
+
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (m68k_ramdisk.size) {
 		memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
@@ -335,8 +337,6 @@ void __init setup_arch(char **cmdline_p)
 	}
 #endif
 
-	paging_init();
-
 #ifdef CONFIG_NATFEAT
 	nf_init();
 #endif
 
