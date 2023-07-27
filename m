Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F2DC0015E
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jul 2023 01:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjG0BP4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jul 2023 21:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjG0BPz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jul 2023 21:15:55 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779382709
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 18:15:54 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3594B5C00DF;
        Wed, 26 Jul 2023 21:15:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 26 Jul 2023 21:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690420551; x=1690506951; bh=YI/3XTu4NvOdL
        4WSEWVOpF0HD8KPXef3FlJEdQ8Hr+I=; b=IapBpajPqAFHXyRm+rw1B24SFahC9
        XrxxMZuT5tNlzzsHfBer6DnfwtvFGecwv77Xh3kJ4rB17+pEk035qU/BX8x63D03
        9wEZwPGze5p98U7NHi8WGFC6Stg7GEod0vPTao574tEIDUPKd7gaRGhQGnEjpT/v
        dMnx/7+VZq4Cl3JS21Mcyuj5bGWpUm4w9Gqnt8A797fra/jcdeKtMobFseYiVvwr
        mZ7pkdTv+PWEVsikWiEtl/tTlEx/cfdrmlgOiCTDPjP9+zs5Jen6eHPIvIFvDOj4
        TNmjcveoy3wVPcj3IqC2s09hF+deLWwWZiZsKgHEpTqsHQKm1RylGrZyA==
X-ME-Sender: <xms:RsXBZO_QKdja-7nPCT4OaFlxKY_DPnL5S7sd_D5ovMPhvx_FZ7_nrQ>
    <xme:RsXBZOvLzsFFG6UMXPfkh4IfGYZO80xbiVzKH0z6FFkwScyKsL5Jx2O7FZpeEDDVL
    66IquxJVyJTgw7cYkI>
X-ME-Received: <xmr:RsXBZEBNRg4tiWmeQstTMOqm7HycdKc5FZouk_hcpqBCFjPg0XWReWFT8e6Rz0FAhD3zjgNpi7WUNXi_PQ-dctdWFKuaEx5UhU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieefgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:RsXBZGfQOTnDVuhmo6G4SHU11zAVhtvGV3AnCK-oGsxWsx_8DGm5gg>
    <xmx:RsXBZDMKEvw60DdSOwJBYq7O5J63hvm5UnAU78upblyEnq7WgNy4cQ>
    <xmx:RsXBZAnGwqp_LPVEA6AOsTeTBwFtpeg--07hpEM-98OWhMNjpOBUmg>
    <xmx:R8XBZJ3hHXxZZLuOVzwMkxy9A4s_DHk7Z4RctHZrCEoESGfKCHgZzA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 21:15:47 -0400 (EDT)
Date:   Thu, 27 Jul 2023 11:16:03 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
Message-ID: <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 27 Jul 2023, Michael Schmitz wrote:

> > I can't figure out why those platforms don't suffer from the same 
> > "double translation" problem that William described on q40.
> 
> There are only two other address translation schemes in effect - Amiga 
> Gayle, which handles byte/word address offsets, and gets passed IO 
> addresses (in the sense that these are the addresses where registers are 
> mapped in memory), and Atari EtherNEC, which handles IO ports (from the 
> ne.c legacy ISA driver).
> 
> The Gayle address translation, taking MMIO addresses does not add an IO 
> base address. The EtherNEC address translation, OTOH, takes IO ports and 
> must add the ROM port base address as IO base.
> 
> What I did not realize at the time I rewrote the Q40 driver as platform 
> driver is that the old driver used IO ports, not MMIO addresses. In 
> order to reserve the IDE register area (we don't have a MMIO area 
> corresponding to the IO ports range mapped on m68k), I did add the Q40 
> ISA base address to the IO port range to populate the platform memory 
> resources, forgetting that the same base address is then added a second 
> time through the IO address translation.
> [...]
> 
> A correct fix would keep the current IO translation intact, and instead 
> use the platform mem resource to register the driver IO range, and the 
> platform IO resource as base offset to populate the port ioaddr struct 
> (minus the register scaling and byte offset, mind you).
> 
> I'll give this some more thought ASAP.
> 

I wonder whether Will's suggestion (CONFIG_HAS_IOPORT_MAP) is feasible in 
light of the needs of Gayle and EtherNEC drivers.

> And yes, I'm painfully aware the m68k low level IO code is becoming a 
> bit of a maintainance legacy, in no small part due to my hacks around 
> Atari EtherNEC.
> 

I guess you and I both can share the blame for 44b1fbc0f5f30e66...

Anyway, you make a good point about on-going maintenance. Do you think 
that by supporting standard ISA drivers we might actually reduce the 
ideosyncracies in m68k IO code?
