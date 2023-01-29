Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3783C38142
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Jan 2023 00:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjA2ANQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Jan 2023 19:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjA2ANP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 28 Jan 2023 19:13:15 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEC02196C
        for <linux-m68k@lists.linux-m68k.org>; Sat, 28 Jan 2023 16:13:14 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4489F320090C;
        Sat, 28 Jan 2023 19:13:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 28 Jan 2023 19:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674951190; x=1675037590; bh=DcLS1fh3J8Y+PVUWaCQHSOOuJ6Hc
        bP7LrppiPRPVZRU=; b=IEhqpjmq9E8PACkEbBsD8t2DITVkOFglCcJK1JLOF56/
        u+GqWYaJWkzqgziU5Yx08inpAqK7zVlflp/lrhd3ZIMe1EzjMI1GUl4TvoGxuZiE
        g6d7/pY09F45VvDazvlqxSFkGanLqxqheeCJztFno/PB+rY8GDSzYZ2UenLyS2rd
        QMY/p8Y7GeY+i/P3EpH3M87cLITFd+Cm4fwBE4T1E9uV4HP8ngKbc/M+ytxUj8Tf
        5Q44U0sjlPVvVDjm4AJtf4lzw3WR9nglGmLyldYNT0ZAB+9gtpSQrz+E10uAdhYn
        uxqyNGRyohzL+tEfwHZoWjObn0rDlSFWjeq6SnGWUg==
X-ME-Sender: <xms:FbrVYyvfcNpYvNvrApte26cMPC0bToO0QLfpfb9OGBzlvj1CZm3_0g>
    <xme:FbrVY3fDKbjq8USxbF2Va0l4e7B3HFAcadiZ2EoqHeJvt3xqNRJp-d2C2yBXBNV4I
    MMSCmpUJ9zKHMLCvUA>
X-ME-Received: <xmr:FbrVY9x7eUqZK9AuLWhlxuaxiUMmIaEs02rdhePOZe2SAFVE4pwMMEwsawKv6XlBGCrf9anZoLTovqM1prG2SUh_Z7FcgenrYRs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvledgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpedtkeehledvueetffdvveelfeegjefhgeekgeehleegvdeutdfguefgudeg
    gfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvggsihgrnhdrohhrghdpsh
    houhhrtggvfigrrhgvrdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmh
    eikehkrdhorhhg
X-ME-Proxy: <xmx:FbrVY9PQtBaVyWnZ6FlbaK9CqnJAviCEvPX5PuuFlSWzR4C-cqSwsg>
    <xmx:FbrVYy9AYtd4DzA6EFFbliagMNg--lyv64uidyLZwNqkNjDoORSkKg>
    <xmx:FbrVY1UqumiBxREea0oYdEKXAdf-h_dyNrBipDLwoqT25KKaNW4_8A>
    <xmx:FrrVY4kD2JFvjuIT5DwEZuHRh53funkJ1XUaFaef3zb9P-6nBvPi9g>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 19:13:07 -0500 (EST)
Date:   Sun, 29 Jan 2023 11:15:04 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>, port-m68k@netbsd.org
Subject: Re: Work on adding TLS support to LLVM on m68k
In-Reply-To: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
Message-ID: <30d71f0f-6628-4a67-2de3-eb84b25b2836@linux-m68k.org>
References: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sat, 28 Jan 2023, John Paul Adrian Glaubitz wrote:

> Hello!
> 
> The maintainers of the m68k backend in LLVM have started initial 
> planning for adding TLS support. An issue for that has been opened in 
> the LLVM Github tracker [1].
> 
> If anyone can help shed more light on how TLS works on m68k, please add 
> your comments to this Github issue. Any information on the topic is 
> highly appreciated.
> 
> Thanks,
> Adrian
> 
> > [1] https://github.com/llvm/llvm-project/issues/60354
> 

The developers of the TLS/NPTL support for m68k/coldfire were working for 
Freescale and Codesourcery at the time...

https://lists.debian.org/debian-68k/2008/02/msg00212.html
https://lists.debian.org/debian-68k/2007/11/msg00071.html

The toolchain mailing lists at sourceware.org might be a good place to 
seek technical information about the implementation. Or you could try 
sending a question to the old e-mail addresses of the people who sent the 
patches e.g.

https://git.kernel.org/torvalds/c/9674cdc74d63
