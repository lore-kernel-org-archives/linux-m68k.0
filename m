Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0139DC636CC
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Feb 2023 22:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjBEW1i (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Feb 2023 17:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjBEW1h (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Feb 2023 17:27:37 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3705B9E
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 14:27:36 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8C4B232005C1;
        Sun,  5 Feb 2023 17:27:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 05 Feb 2023 17:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675636052; x=1675722452; bh=B72ia9wA43qYS5a3znEOiU9gwSuB
        QeZRF1pW6rcLtJY=; b=WsXmI7eKh2AL+GtSqYTvPY3F03+5JICJnMtun5an2b9V
        AQN8pxw9K9Yd+ztjj091HO0dGDWP5NxBnldaG24Q7ZIrfICNc8B6aqTlRGxNkslN
        o5UUS9PoKLAj5YJX5hTsYSzh8tVqvxv877TvkkqOcTVrq27Cv+tqgRH30aBxp96E
        1XheI6aTb+NmJjr9IvX6S6SCabjRzdao/3QjyMAdS+N7Ly80t2W5gvrMr4IUKJD5
        4olcjPZQm0qrKeD7uYcSiOFsdOQMqZ6Z+s7I2XilxMU4Fapu8YLYQB4cV2tH3vvu
        9QooiyjVJnekFDwVUDf+K9ihXETQsddcesYdGKEauA==
X-ME-Sender: <xms:Uy3gYzEpBIA2mWLtrDnb4U_ELm0j6tz1cYgYehra743ttqPOM9e9vQ>
    <xme:Uy3gYwWs6f3FpQIWwC6Nf0vATTRREMxIzofBj_HSrv5mWUBw1qXQwYx6JPjWwEwx1
    wiL9WRRh7yaA-PbL1Q>
X-ME-Received: <xmr:Uy3gY1IUB-839mLXMtkjEHUEH7P482GBiBQxy7gl-lkiEvpcmh9jSBeGhiV33wOI1EMIgjxi2jDE929L1Et4uL1jba06YNLYjdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggedgudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Uy3gYxG_wD6ZVn84sHZWSyWC2Xpgs1RgEhHayvPeTvuLKFuzvd6VaA>
    <xmx:Uy3gY5VkqgF60JnU77WTp4tAAX2DJuc3KECeWOxEdhFPe9El8pLncg>
    <xmx:Uy3gY8NNLTwBo7KlgPFbPn3iyRGecqUipQByV-LIS_2FPTV8AYg-tQ>
    <xmx:VC3gY4c7UBVBvEuQ0MMLGRXLYikkIaI8UXKXkYBooxqs5m4Q2vg1mw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Feb 2023 17:27:28 -0500 (EST)
Date:   Mon, 6 Feb 2023 09:29:35 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Stan Johnson <userm57@yahoo.com>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Debian initramfs/initrd, was Re: stack smashing detected
In-Reply-To: <86badf6e-2cc8-1937-1a2f-45334bb338f4@yahoo.com>
Message-ID: <fdb9fe86-4646-06fe-6d83-fde649922789@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com> <e7574759-4870-d554-dd63-17da220270f1@gmail.com> <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com> <667fa6a9-a760-2116-5f76-a01e078c8079@linux-m68k.org>
 <86badf6e-2cc8-1937-1a2f-45334bb338f4@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 5 Feb 2023, Stan Johnson wrote:

> > 
> > To save time, I recommend using QEMU and an up-to-date Debian/m68k SID 
> > virtual machine to produce the vmlinux and initrd files needed for use 
> > with Penguin on your slower machines.
> > 
> 
> AFAIK, the initrd must be created on the system that is using the initrd 
> (or an identical system, at least that was the response I received a 
> while back when I was unsuccessfully trying to use the initrd that ships 
> on the Debian install CD).

If that was true, how could Debian ship a single initrd that works on 
Atari, Amiga, Mac etc.? They could not.

If you boot a random Debian/m68k rootfs with a random Debian/m68k 
vmlinux/initrd combination, and if you need a kernal module at some point, 
then your random rootfs must contain the modules that match your random 
kernel binary (probably not going to work).

If you never need to load a module, perhaps because the important ones all 
got loaded from the initrd, then all you need is a valid vmlinux/initrd 
combination and the rootfs is not relevant.

When you need to generate a valid Debian/m68k vmlinux/initrd combination 
that is also current, then you'll need a Debian/m68k system that is 
current. The quickest way to get it is an emulator.

When you need a small initrd, because of RAM limitations, you'll need to 
customize your initrd for your hardware using /etc/initramfs-tools (as 
mentioned).

If you succeed, you'll get an initrd that is missing all the modules for 
all the hardware that you don't own, which saves RAM. It doesn't matter 
what system generates that initrd (could be a build farm).
