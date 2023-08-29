Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A88C83F14
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 10:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjH2KwU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 06:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjH2Kvw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 06:51:52 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F8BAC
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 03:51:41 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qawJq-001umg-F5; Tue, 29 Aug 2023 12:51:34 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qawJq-002kGd-7d; Tue, 29 Aug 2023 12:51:34 +0200
Message-ID: <c39646c885102448c49a4797140e4fcfd1769717.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Tue, 29 Aug 2023 12:51:33 +0200
In-Reply-To: <mvmy1hv71d7.fsf@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
         <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
         <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
         <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
         <mvmy1hv71d7.fsf@linux-m68k.org>
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

On Mon, 2023-08-28 at 15:17 +0200, Andreas Schwab wrote:
> On Aug 28 2023, John Paul Adrian Glaubitz wrote:
> 
> > The FP failures are most likely the result of the limitations of the FPU emulation
> > in QEMU for m68k. ARAnyM is known to have much better FPU emulation support than
> > QEMU, so if you want to have more accurate results, you should test on ARAnyM.
> 
> No, you should test on real hardware.  Neither ARAnyM nor QEMU comes
> close.

In an ideal world, I would be testing on real hardware, yes. Unfortunately, even on
my Amiga 4000 with 68060/50 MHz the testsuite would run two weeks or so.

> > After all, we had to change the ABI for TLS support as well, didn't
> > we?
> 
> Nope.

So, any binaries from Debian Potato will still work against glibc 2.38 on m68k?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
