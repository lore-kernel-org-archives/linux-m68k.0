Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A8DC71153
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 22:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239773AbjH2WDz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 18:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238870AbjH2WDd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 18:03:33 -0400
X-Greylist: delayed 574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Aug 2023 15:02:55 PDT
Received: from scenergy.dfmk.hu (scenergy.dfmk.hu [193.224.143.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F8ACD2
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 15:02:55 -0700 (PDT)
Received: by scenergy.dfmk.hu (Postfix, from userid 1000)
        id 33E3F8003F4; Tue, 29 Aug 2023 23:53:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by scenergy.dfmk.hu (Postfix) with ESMTP id 190688001FB;
        Tue, 29 Aug 2023 23:53:17 +0200 (CEST)
Date:   Tue, 29 Aug 2023 23:53:16 +0200 (CEST)
From:   Karoly Balogh <charlie@scenergy.dfmk.hu>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>, libc-help@sourceware.org,
        debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <95b19b7af3c64aa4048d47f2b2966e195e7b2235.camel@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.02.2308292337250.4585@scenergy.dfmk.hu>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>  <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>  <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
  <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>  <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>  <95a4dd47f25addc0408a1016ecbe1ed18d9dab6d.camel@aura-online.co.uk>
 <95b19b7af3c64aa4048d47f2b2966e195e7b2235.camel@physik.fu-berlin.de>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Tue, 29 Aug 2023, John Paul Adrian Glaubitz wrote:

> > I don't want to force anyone here, but I'd also be fine with that. The only
> > downside, apart from compatibility, appears to be slightly increased memory
> > usage, and you're not exactly going to run modern Linux with 8MB RAM anyway.
>
> Agreed. And I finally want to be able to use Rust and LLVM on m68k ;-).

So, let me get this straight (or from anothe perspective if you will) -
neither LLVM and Rust is ready for prime time, because it can't accomodate
a decade old established standard on our platform. But Linux maintainers
rush forward, and break^Wchange the ABI, so we can accomodate some
half-baked fancy new tools.

Sometime later someone realizes: if you want to support any other system
on m68k (Amiga, Atari, 68k Mac, *BSD, game consoles (embedded) you name
it), you still need to add support for the original alignment
restrictions, because on those systems you're not always going to be able
recompile the $world. So that someone will have the skills to add the
needed changes to these tools, so they can finally mature and accommodate
more real world scenarios that are out there.

At that point Linux m68k broke their own ABI for no reason, but because
someone couldn't wait until the necessary work was done, instead of
hacking problems around.

Ask me if I've seen this already (elsewhere).

Best,
--
Charlie

(Ps: Also, IMO the Itanium analogy is totally bogus. Itanium never had the
history and the historical significance of m68k, and the hardware has been
always been an expensive toy for a select few, with a few having any sort
of self-motivating emotional attachment to it. Also, where you draw the
line? At which point are we going to do a little endian ABI for m68k, so
upstream can ignore big endian? Don't laugh, apart from the well known
ppc64le case by IBM, this has been done the other in an m68k-context too,
but the other way around - a big-endian x86 GCC, so you can compile Amiga
ABI compatible libraries that contain native x86 code on emulators...)
