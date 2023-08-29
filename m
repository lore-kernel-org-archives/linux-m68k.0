Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6967AC6FA8F
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 10:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjH2K4f convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 06:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbjH2K4Q (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 06:56:16 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F10BE53
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 03:55:43 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qawMr-001vVU-9w; Tue, 29 Aug 2023 12:54:41 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qawMr-002kuC-2V; Tue, 29 Aug 2023 12:54:41 +0200
Message-ID: <95b19b7af3c64aa4048d47f2b2966e195e7b2235.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     James Le Cuirot <chewi@aura-online.co.uk>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Tue, 29 Aug 2023 12:54:40 +0200
In-Reply-To: <95a4dd47f25addc0408a1016ecbe1ed18d9dab6d.camel@aura-online.co.uk>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
         <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
         <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
         <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
         <95a4dd47f25addc0408a1016ecbe1ed18d9dab6d.camel@aura-online.co.uk>
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

On Mon, 2023-08-28 at 14:29 +0100, James Le Cuirot wrote:
> On Mon, 2023-08-28 at 14:50 +0200, John Paul Adrian Glaubitz wrote:
> > Hi Adhemerval!
> > 
> > On Mon, 2023-08-28 at 09:44 -0300, Adhemerval Zanella Netto wrote:
> > > If the idea is really to endeavor on a new ABI for m68k, it means a different
> > > loader and the question: will it be interoperable with current m68k ABI in the 
> > > sense that i686 is interoperable with x86_64? It would allow to keep old binaries
> > > running, similar to what old ABI did for 32 to 64 bits transition.
> > 
> > OK.
> 
> To that, I would add: what old binaries? Linux on m68k is very obscure these
> days, with Gentoo, Debian, and NixOS being the only major distributions still
> supporting it. As the Gentoo m68k maintainer, I would not expect users to be
> pulling binaries from elsewhere, and I imagine Adrian would say the same.
> Where would you even get them from? I thought there might be a handful on
> Aminet, but I cannot even find any there.

Fully agreed.

> Upgrading an existing system might be awkward, but time_t alone will probably
> warrant a reinstall. Having said that, I just tried a somewhat unscientific
> experiment of running a bunch of random binaries from my 32-bit aligned system
> on my 16-bit aligned one and nothing broke. I then tried the reverse and saw
> stash smashing detection kicking in on anything more complex than ls.

Thanks so much for performing such tests. This is really appreciated and provides
valuable information that's very helpful for the transition process.

> > 
> > most likely the result of the limitations of the FPU emulation
> > in QEMU for m68k. ARAnyM is known to have much better FPU emulation support than
> > QEMU, so if you want to have more accurate results, you should test on ARAnyM.
> 
> This is fairly typical of the math-related test failures I have seen from
> other projects. I hadn't realised that QEMU's FPU emulation was lacking and
> had just chalked it up to m68k's FP hardware having different capabilities.
> Either way, I have never noticed any issues here when using software in
> practise. Not that I've done any heavy number crunching on m68k, but who
> would?

There have always been FPU-relevant issues on both QEMU and Aranym although it's
better on Aranym than on QEMU. This is a well known issue.

> > > I also noted that gcc on mc68060 changed the __DEC_EVAL_METHOD__ to 2, which makes 
> > > glibc tests to fail to build (since it assumes __DEC_EVAL_METHOD__ equal 0). This
> > > again raised questions on how the math library would behave depending of the target
> > > chip.
> > > 
> > > All of this issues and potentially work required for a new ABI makes me wonder
> > > if is really worth to keep *2* distinct ABIs for m68k.  Yes, m68k can follow the
> > > MIPS mess and have 28 different ABIs that fails to be fully interoperable; but
> > > I think that if you really want to on this 'gnu32' journey, I think it will be
> > > better to just deprecate the m68k current ABI, remove it from glibc; and move
> > > everything to new ABI.
> > 
> > I actually wouldn't have a problem with that. I don't plan on supporting the old
> > ABI with 16-bit alignment. After all, we had to change the ABI for TLS support
> > as well, didn't we?
> 
> I don't want to force anyone here, but I'd also be fine with that. The only
> downside, apart from compatibility, appears to be slightly increased memory
> usage, and you're not exactly going to run modern Linux with 8MB RAM anyway.

Agreed. And I finally want to be able to use Rust and LLVM on m68k ;-).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
