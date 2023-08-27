Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4613BC83F01
	for <linux-m68k@archiver.kernel.org>; Sun, 27 Aug 2023 00:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjH0Aru (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 26 Aug 2023 20:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjH0Arb (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 26 Aug 2023 20:47:31 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3076F19A
        for <linux-m68k@vger.kernel.org>; Sat, 26 Aug 2023 17:47:29 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id DB5CE5C00B9;
        Sat, 26 Aug 2023 20:47:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 26 Aug 2023 20:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693097245; x=1693183645; bh=Fp09O59ANftag
        CTt83PACfCjbcHLW1cdhEBznSYXhmc=; b=dXuNePy0h4eQIViQe6ImppenPLs+s
        A89LuhkLEVJZVBDvft+JyjHN2aHWLL4yl2zywyv5cvYIx8HfJVUMhPFD9iFTe2Az
        fktD5VhupZnoUm66bvV9cSwpDsZIQgnTte9W2xEvKj5m7JW7E4dS+U8nHqwWzvZP
        MV4MMmd4LripuSSutdTb1l9j3c9c2K8ZSjO8rKS+8PfEZ7AnGmGR8IppMLBizk8W
        aEa3A8hvYPKQz55uIrJ6fDIqkRESGh+oZbyTyPhAFlPha3WG9N6m4NiEy3IAe6BG
        Ul0qa+ZBlKYj3iFqrV3DgdukkJ5SHHPx/skzLwMXqBJtz6k5mMrhDxjrw==
X-ME-Sender: <xms:HZ3qZJq6nJ68Q6y1rxD99FvbzD4D4sFZ-V3N595E8wtX3NKwKIaQjA>
    <xme:HZ3qZLrrTzJBs7KZ5UUQCpT0Q1Toxz38lK_wgfLx_YeqPloRyb_ikvKUXRrEGrKWu
    ypIG_cPDGWugJE42XU>
X-ME-Received: <xmr:HZ3qZGPSqMwNTQGNmAYAWiYZ-4XmDA3FlbQX1hpbJR8iRHicQGOC5zJeRYKcFzELLCITLbejr2-mFPEHj5pPKTb9h99N1lAaU0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:HZ3qZE7yDePIr_jyPsj45roQoSpD9gZJMO2XODwbAzCzY6abf6Hm5A>
    <xmx:HZ3qZI4DznSbU1_XJ52NwCGJiRrGHtf1xlXRD17FraR3OsSoyi6uNA>
    <xmx:HZ3qZMizt75vCJ0RNNyfszFpzMylHfXIMDbri3zrWmywa7pvDFGCew>
    <xmx:HZ3qZIG0FHV4CKOeLIBDa57hLCuY4iM_txlQ43bGgC8sGu_oaYnHmA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Aug 2023 20:47:23 -0400 (EDT)
Date:   Sun, 27 Aug 2023 10:46:54 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
Message-ID: <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 26 Aug 2023, John Paul Adrian Glaubitz wrote:

> On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:

> ...

> 
> Not only mold but also most notably the following projects:
> 
> - LLVM
> - Firebird Database
> - OpenJDK
> - Various Qt packages
> 

And potentially more in the future, which may be anticipated on the basis 
that "those users don't need a stable ABI any more, so let's just ignore 
the portability issues in our code and leave the problem to the distros 
and toolchain developers".

That is the precedent you would set.

Moreover, why is it that only a few developers have a problem with making 
explicit their decisions regarding alignment of shorts? What actual pain 
does it cause them to accept a patch to make their struct layouts plain?

> > It goes against the traditional ABIs, but practically no m68k Linux 
> > binaries are published outside of distributions, so this not a 
> > concern.

It is of concern to some users (though not all, apparently).

> > We need to break the ABI anyway with time_t going 64-bit, so it makes 
> > sense to do these two things at the same time.
> 
> Fully agreed.
> 

If the kernel breaks the ABI, that's a bug, not an excuse. Either you're 
okay with proliferation of incompatible binaries and tools or there are 
some criteria (yet to be identified AFAIK) which permit this bug.

It's not difficult to foresee fragmentation because it follows from the 
manpower shortage. There will always be sufficient manpower to produce a 
break that pleases a few. There may never be enough manpower to produce a 
stable ABI that pleases everyone for the foreseeable future.

> 
> I think -gnu32 sounds very reasonable.

You do? I think 32 is misleading in the absence of 16-bit or 64-bit 
variants, and -gnu is misleading if other tooling like LLVM already 
supports malign-int. Moreover, it's impossible to align to a bit count in 
general. Not that you'd want to -- it's actually the natural alignment of 
shorts that is at issue, AIUI.

So, for naming purposes, the proposal might be described as either the ABI 
du jour (leading to -abi23 for 2023) or the new ABI for ever (leading to 
-abin as in -gnuabin32 on MIPS).

If it's the former, perhaps you should not push it upstream. If it's the 
latter, perhaps this redesign should seek to address real shortcomings 
with the existing ABI, including problems which (for all I know) may have 
entirely prevented some people from using it thus far. That is, it should 
consider silicon beyond 680x0.
