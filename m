Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBF9C001B0
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 07:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjHMHiE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 03:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjHMHiE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 03:38:04 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99659B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 00:38:05 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id B00EC3200437;
        Sun, 13 Aug 2023 03:38:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 13 Aug 2023 03:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1691912283; x=1691998683; bh=0F8QW3HpnwfkN
        xWA0qYKHq0ynmNcsfGt/1v/lEifRw4=; b=TxuYzsvq+lo1Z1ewJd5xublWrCgbW
        LzEsaiGJZF9A4Q1DaTiqmYs7yEUKiihqFClt25kDbLVR+gtFZhddBG4nTZkeTuaA
        OBngB3lPOzLRzTsBGWhb0r9Xsc4rZoRCsA26X3l9XY9MkCsYf/9Bq6/2UdHVjHE3
        80V7q0FkaMeWRLtKngAyDpljNiIAMVz2TCJ5uqrf0ljPIkW2EIX8ck52Yv0+mzA6
        M13Gl5mNk4veQ3QelywtuxHOLIgyPBWNPaFFGIEPgxvF7MjlC+sIo/b4hX7ue58x
        +fTt/NQ71lp5/HKhWs7U69J9EL67QhNfHP/LpKjbp3wOTIxiWAMXN3rqA==
X-ME-Sender: <xms:WojYZJwkZ_eE9XiZ93msrJzmHcj5TzFePkGzHxFRg87efwo8NTmKpA>
    <xme:WojYZJTalFFYJaMPVu9uukGw6fczf_gdRlAw8CXltnM6bJoUdVet8OE47Gu8Z44xN
    prxpgJco7IJDJHucJY>
X-ME-Received: <xmr:WojYZDVhkkjoWEr5QB-5TdHwMF32K97uOcE0D8Afr2Jl4YIHSTaF9MPgAQvSDKVdur-oFY3q5PPvUFVVK8dQwWLwGhjuOEJ7uLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtuddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdt
    keevvdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmhei
    kehkrdhorhhg
X-ME-Proxy: <xmx:WojYZLhtaEG_Eiw8urYv6QvBXsSaFesYxXiFJ-pshoRq-hpwKbbhAw>
    <xmx:WojYZLDL7Z22EOBtiSnByB-8JWfJ94zv7KzTYEGPDT3A23bwE13Qaw>
    <xmx:WojYZEJ2Zsqvb9aPr4xOud3IHEiOpQ5uU1BrYoPIi9OAxluYF_rZ1A>
    <xmx:W4jYZOOeZIrwirnbOWQy_vVWTmmRpqLgBP-dO_fp-lLb7cro-ycM9w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Aug 2023 03:38:00 -0400 (EDT)
Date:   Sun, 13 Aug 2023 17:38:00 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>,
        William R Sowerbutts <will@sowerbutts.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
Message-ID: <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Michael, William,

On Sun, 13 Aug 2023, Michael Schmitz wrote:

> Am 28.07.23 um 11:47 schrieb Finn Thain:
> > On Thu, 27 Jul 2023, Michael Schmitz wrote:
> >
> >>>> And yes, I'm painfully aware the m68k low level IO code is becoming 
> >>>> a bit of a maintainance legacy, in no small part due to my hacks 
> >>>> around Atari EtherNEC.
> >>>>
> >>> I guess you and I both can share the blame for 44b1fbc0f5f30e66...
> >>>
> >>> Anyway, you make a good point about on-going maintenance. Do you 
> >>> think that by supporting standard ISA drivers we might actually 
> >>> reduce the ideosyncracies in m68k IO code?
> >> You and DaveM ought to have a chat about that - abstracting the 
> >> legacy drivers from the ISA constraints was his preferred option when 
> >> I last attempted to get the Gayle network driver patches merged. When 
> >> I say 'preferred', I'm probably understating a little.
> >>
> > A discussion with maintainers probably won't get far without working 
> > code to look at. Perhaps William will send an RFC patch to illustrate 
> > his approach.
> 
> Haven't seen anything yet, so I've just sent a patch switching 
> pata_falcon.c to use the IO resources instead of the memory resources.

Thanks for sending that.

> Survived compile and ARAnyM boot tests only so far. I've checked and 
> confirmed the entire 0xffxxxxx range is mapped transparent in head.S for 
> Q40 so I don't see what else might be missing.
> 

In the message that Geert originally forwarded, William was quoted as 
saying it was necessary to "fix up the pata_falcon_data_xfer function". He 
also said that using the IO port resources "causes the ioread8/iowrite8 
functions to complain loudly". 
https://lore.kernel.org/linux-m68k/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com/

I think your patch is taking the same approach and may run into the same 
issues... I guess we shall see when William tests it.

> Please have a look and test if possible. Haven't yet bothered 
> linux-block or linux-ide... the patch still needs a Fixes: and other 
> trimmings so isn't ready for submission anyway.
> 

Right. You'll want to run checkpatch.pl on it at some stage.
