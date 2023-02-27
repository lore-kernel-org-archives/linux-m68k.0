Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE8FC7EE2D
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 07:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjB0H6s (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjB0H6r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 02:58:47 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B10903B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 23:58:46 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 45C5C5C00C2;
        Mon, 27 Feb 2023 02:58:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 Feb 2023 02:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677484724; x=1677571124; bh=l6VOToy92pz23N7jEvOL/cpz2a5h
        kxP9WuyX8f5sgSo=; b=DxLOHugjP9TvBS1x0u7jlyed/VhRt9v86XPqYvt1A4Hu
        tsLNFG2iSsTc1V5wUqMHDpNyWJB0eXYKwybx59sEFMxWhlNygHaLGGWwTtllhzUN
        egzqM1SumLUgFB+wavuKdiSqqRWwn/9EXcbAKBUJ4+QcoiEDlVq5gnPorfH21ymN
        HWAWIhjByXdb/sgpLef4vAFhk7tNb5RipNpbi5okLQgD3XXcTUV3q94ec0WVfK0S
        mDmZhybv2eKPKEKqIEFwph1Pi7V3eak5a/9XIreeAG/fZXX7yzAtVBDYPy2PMfcM
        B5W0ZQR9Uuzy2SNqIw/WcodPXU4TOaZ1mimgXUMYwg==
X-ME-Sender: <xms:tGL8Y8Pj10ouCR0qByufBjYJ74HUMai0qgnEDmYTewaDluDdWP4unw>
    <xme:tGL8Yy9IRy5erNjkZGtoAfoKgZ0LE8vjwrsGBtMz2lSjqhXvN0yu0y_P5c5K8aQ-k
    xQK4wXXyebeqS9_lw4>
X-ME-Received: <xmr:tGL8YzRO6APnBQbfrMrylm6YKpM3jFCuFj40kKMjXOs1V-WkKV_ZrbVXV2kJY5-VxAQDJfMOzY6dgd8i47thJj4ghClaLsF7UFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekledguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:tGL8Y0tw_9QchEQsdmapgoU6ITAf78hOnZpZqjFItWjYqQ1OcmuyiQ>
    <xmx:tGL8Y0f2DfsIbxzJ7G6Fy0-4ACCYJ9ncaWMkdKoyl6TyjjJBbaivVg>
    <xmx:tGL8Y41CkIyhZZmdXJ9MvsHeqB5nU9xf4awqA_RPo7Z8jNSBfyd86Q>
    <xmx:tGL8Y1rl0HYoF82xQ0BKpg75KlQJBbjXN0pULhHJP4WQFG2hgv01Rg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 02:58:41 -0500 (EST)
Date:   Mon, 27 Feb 2023 19:01:13 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
In-Reply-To: <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
Message-ID: <e4572f9c-2c9b-ee12-a8b9-e731cf2f45e4@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de> <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com> <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de> <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com> <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com> <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Mon, 27 Feb 2023, I wrote:

> On Mon, 27 Feb 2023, Michael Schmitz wrote:
> 
> > 
> > I wonder whether Finn's memtest patch merely exposed another MM bug 
> > 
> 
> A kernel patch may be easier than a bootloader patch (even if this is a 
> bootloader bug) particularly if it affects multiple platforms.
> 
> A partial revert of my patch (below) will probably avoid the issue, but 
> with the side effect that use of memtest will clobber the initrd.
> 

Maybe that's for the best now that the initrd/initramfs has grown so 
large. That portion of memory is presently skipped by memtest, which means 
you'd have to disable the initrd to get good coverage from memtest anyway.

> The initrd and memtest features aren't usually needed together. At the 
> time when I needed the memtest feature I did not have confidence in the 
> hardeare. An initrd wasn't very useful at that point.
> 
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 3a2bb2e8fdad..92f1b9268dff 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -326,6 +326,8 @@ void __init setup_arch(char **cmdline_p)
>  		panic("No configuration setup");
>  	}
>  
> +	paging_init();
> +
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	if (m68k_ramdisk.size) {
>  		memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
> @@ -335,8 +337,6 @@ void __init setup_arch(char **cmdline_p)
>  	}
>  #endif
>  
> -	paging_init();
> -
>  #ifdef CONFIG_NATFEAT
>  	nf_init();
>  #endif
>  
> 
