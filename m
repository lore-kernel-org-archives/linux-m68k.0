Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F93C83F14
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 11:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjH1LKr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjH1LKn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 07:10:43 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D64B0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:10:41 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qaa8h-0048uy-80; Mon, 28 Aug 2023 13:10:35 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qaa8g-002FaC-Q2; Mon, 28 Aug 2023 13:10:35 +0200
Message-ID: <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 13:10:34 +0200
In-Reply-To: <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.146.90
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
> > Not only mold but also most notably the following projects:
> > 
> > - LLVM
> > - Firebird Database
> > - OpenJDK
> > - Various Qt packages
> > 
> 
> And potentially more in the future, which may be anticipated on the basis 
> that "those users don't need a stable ABI any more, so let's just ignore 
> the portability issues in our code and leave the problem to the distros 
> and toolchain developers".

It's reasonable to assume that a 32-bit architecture uses 32-bit alignment and
I understand every single upstream project that doesn't want to care about obscure
design the decisions of some ABI designers of the past.

> That is the precedent you would set.

No, I wouldn't set such precedent. I would fix something that has been broken
for years and has caused endless headaches for people maintaining the m68k port
in Linux distributions.

And since we have to break the ABI anyway to be able to use 64-bit time_t, I don't
see any valid reason to stick to the problematic 16-bit alignment used by the current
ABI.

> Moreover, why is it that only a few developers have a problem with making 
> explicit their decisions regarding alignment of shorts? What actual pain 
> does it cause them to accept a patch to make their struct layouts plain?

The problem aren't upstream projects but the lack of manpower to work on all these
issues. Talk is cheap when there is hardly anyone doing this work.

I have invested a ton of work to get the m68k port into better shape and with the
help of the community, we even managed to land m68k support in LLVM. It was a HUGE
disappointment to me when the 16-bit alignment again caused trouble for a relevant
upstream project on m68k meaning that LLVM can currently not be used natively on
m68k.

> > > It goes against the traditional ABIs, but practically no m68k Linux 
> > > binaries are published outside of distributions, so this not a 
> > > concern.
> 
> It is of concern to some users (though not all, apparently).

If these users really cared, they would actually help address these issues. I haven't
seen any contributions trying to address these issues outside my efforts and the efforts
of the Gentoo developers.

> > > We need to break the ABI anyway with time_t going 64-bit, so it makes 
> > > sense to do these two things at the same time.
> > 
> > Fully agreed.
> > 
> 
> If the kernel breaks the ABI, that's a bug, not an excuse. Either you're 
> okay with proliferation of incompatible binaries and tools or there are 
> some criteria (yet to be identified AFAIK) which permit this bug.
> 
> It's not difficult to foresee fragmentation because it follows from the 
> manpower shortage. There will always be sufficient manpower to produce a 
> break that pleases a few. There may never be enough manpower to produce a 
> stable ABI that pleases everyone for the foreseeable future.

Again, talk is cheap. Show me the code.

> > I think -gnu32 sounds very reasonable.
> 
> You do? I think 32 is misleading in the absence of 16-bit or 64-bit 
> variants, and -gnu is misleading if other tooling like LLVM already 
> supports malign-int. Moreover, it's impossible to align to a bit count in 
> general. Not that you'd want to -- it's actually the natural alignment of 
> shorts that is at issue, AIUI.

Yes, I do and that's just my personal opinion. But as I said, I am open to
other naming suggestions.

> So, for naming purposes, the proposal might be described as either the ABI 
> du jour (leading to -abi23 for 2023) or the new ABI for ever (leading to 
> -abin as in -gnuabin32 on MIPS).

That's why I suggested we can look how the ARM developers will name their
triplet when switching to 64-bit time_t on 32-bit ARM systems.

> If it's the former, perhaps you should not push it upstream. If it's the 
> latter, perhaps this redesign should seek to address real shortcomings 
> with the existing ABI, including problems which (for all I know) may have 
> entirely prevented some people from using it thus far. That is, it should 
> consider silicon beyond 680x0.

It's a historic architecture. We don't have to redesign everything. It's enough
to address the most pressing issues and these are 16-bit alignment and 32-bit
time_t.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
