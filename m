Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E0AEB64DD
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jul 2023 23:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjG0Xrf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jul 2023 19:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG0Xre (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 27 Jul 2023 19:47:34 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6E92D70
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jul 2023 16:47:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E0A855C00F7;
        Thu, 27 Jul 2023 19:47:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 27 Jul 2023 19:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690501649; x=1690588049; bh=yXUMKLKBIVCEw
        v2SMsG34X6d+mMDD3O4VAB3EANyDAA=; b=gNaFFrudwAR3tCAfg62UZZSlCG8WG
        XwiCDIXPc9TBYi/DjTK05P2nLyBQVU5nji3MEVssgkN0I002Vcy44xcFESLcCHHy
        60IPcXzNlmKDh+EE+cLw6qfP9Gl1unPrlHUAJIhHWFk1XBb/Yw+3keyqEvL6s6VV
        7jiKuIvKjUbuR2Oy22ARp0lwNjhk1hlYP5Vwgjl0hbU3K9FNWruuE2QG8u4O1ZBO
        UwcGKEOZQ0EyFpnX8ZPutI1ivvTdcJXbXfdhRlv1x8gt37CXRHMKvxmbvDCexnzI
        em23+WbDeYGDsH5Sq9CiuesAXqbe2o8CAFYLUa7b9uExC64Fx1N7VWiGQ==
X-ME-Sender: <xms:EQLDZF_6m-qEgpyr8ARNt2yv8XQ7Y-iJbJYkO_r_kaPU1jKScLnc8w>
    <xme:EQLDZJsQ5YD7PX85D88tkjO6niiSgNhQB12tsq_2oYpv1VdpOwvMBk-pG9lXiePyu
    oknnRWBkd9CZF41jFc>
X-ME-Received: <xmr:EQLDZDCst14zbLSGLXoP189QpTJIpOr0pM0YJeReeiheXak9qzRV3hRpN084AqJ5r8W5gLDMMW-ZALlO9mHxE-0X218qRBqyNyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieehgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:EQLDZJfcCvoZm-II50vuhpwVyeM1cCyoBE0PrBIIXOmVLVeenJHfQg>
    <xmx:EQLDZKNaR8Im3P5N-_j-sk0ZwA4uuAJGEudvZs_UU7j7tkup0QPoHg>
    <xmx:EQLDZLml-jyb6zw6for3OMzdmZeCGkSVpJr3YIcbwNzgsoFSeP7x4w>
    <xmx:EQLDZDb512-CXCJ4ZOeUdbJLkneWyKSezMzs3tr3SBlirWaoopeE9Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jul 2023 19:47:27 -0400 (EDT)
Date:   Fri, 28 Jul 2023 09:47:43 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
Message-ID: <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 27 Jul 2023, Michael Schmitz wrote:

> >
> >> And yes, I'm painfully aware the m68k low level IO code is becoming a 
> >> bit of a maintainance legacy, in no small part due to my hacks around 
> >> Atari EtherNEC.
> >>
> >
> > I guess you and I both can share the blame for 44b1fbc0f5f30e66...
> >
> > Anyway, you make a good point about on-going maintenance. Do you think 
> > that by supporting standard ISA drivers we might actually reduce the 
> > ideosyncracies in m68k IO code?
> 
> You and DaveM ought to have a chat about that - abstracting the legacy 
> drivers from the ISA constraints was his preferred option when I last 
> attempted to get the Gayle network driver patches merged. When I say 
> 'preferred', I'm probably understating a little.
> 

A discussion with maintainers probably won't get far without working code 
to look at. Perhaps William will send an RFC patch to illustrate his 
approach.

> I had toyed with that using the EtherNEC driver as test case but never 
> got very far (this would have been splitting the driver into a core 
> lib8390 module and a platform-specific module that allows to hook a 
> variety of IO accessors as hooks, not static defines, and I wasn't too 
> certain about performance impacts of such a change, the performance of 
> the EtherNEC being so shitty it won't make any impact there),
> 
> The only other option (that I can see) would be creating a bus driver 
> for the ISA bus, with platforms allowed to register their particular IO 
> accessors for IO and memory accesses - again, performance impacts to 
> consider and getting test coverage on legacy ISA hardware a nightmare. 
> This would allow to use legacy driver code more or less unchanged. 
> Haven't given that much thought at all (the idea pretty much originated 
> from this present mess, but that's all).
> 
> There may be other approaches that can be considered, if none of this is 
> what you had in mind.
> 

What I had in mind is probably unacceptable because drivers end up having 
to do byteswapping as happens in pata_falcon (or falconide and q40ide). 
Perhaps your bus driver idea would probabably find more acceptance. OTOH 
if the aim of the exercise is to use standard drivers (like pata_legacy) 
there would probably be driver changes either way.

It might be helpful to look for some precedent for this kind of thing 
among the other big-endian platforms with ISA. MIPS Magnum is dual-endian 
but Linux only runs in little-endian mode and the problem doesn't arise. 
But there must be other examples. Maybe CHRP?
