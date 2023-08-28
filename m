Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62845C71153
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 12:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjH1MvR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 08:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjH1MvC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 08:51:02 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653D511A
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:50:59 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qabhl-000VGm-Ad; Mon, 28 Aug 2023 14:50:53 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qabhk-002gaU-Se; Mon, 28 Aug 2023 14:50:53 +0200
Message-ID: <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 14:50:52 +0200
In-Reply-To: <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
         <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
         <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
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

Hi Adhemerval!

On Mon, 2023-08-28 at 09:44 -0300, Adhemerval Zanella Netto wrote:
> If the idea is really to endeavor on a new ABI for m68k, it means a different
> loader and the question: will it be interoperable with current m68k ABI in the 
> sense that i686 is interoperable with x86_64? It would allow to keep old binaries
> running, similar to what old ABI did for 32 to 64 bits transition.

OK.

> It would require take care that some possible shared data structures (such as 
> pthread_mutex_t and alike) have the same layout and alignment, add some support
> to ldconfig to differentiated between DSO with different ABIs (either through 
> e_flags as ARM, PT_GNU_PROPERTY used by aarch64 or x86_64, or something else),
> bump the required minimum kernel (for 64 bit time_t support), and check current
> status of the port.

Understood.

> I am bringing the later because I fixed some recent m68k build issues [1], that
> seems to be from gcc changes over the years (as hinted by Andreas Schwab) where
> compiler changed some internal defined flags and it was not reflected on glibc
> (for a short, it seems that -mcpu=680X0 does not already define __mc68020__).
> The build fix is straightforward, but it raised question whether something
> else is not broken and has not been caught yet.
> 
> Waldemar Brodkorb has posted his results on running glibc 2.38 on qemu and
> it shows a lot of regression:
> 
>     949 FAIL
>    3344 PASS
>      99 UNSUPPORTED
>      16 XFAIL
>       2 XPASS
> 
> I guess the math failures are from the extra rounding and exception testing, which 
> requires a fully compliant IEEE 754 fp unit (which I guess m68k does not provide).
> The last m68k testsuite report where from 2.26 release [1] running under ARAnyM,
> which shows the port is a better shape.

The FP failures are most likely the result of the limitations of the FPU emulation
in QEMU for m68k. ARAnyM is known to have much better FPU emulation support than
QEMU, so if you want to have more accurate results, you should test on ARAnyM.

> I also noted that gcc on mc68060 changed the __DEC_EVAL_METHOD__ to 2, which makes 
> glibc tests to fail to build (since it assumes __DEC_EVAL_METHOD__ equal 0). This
> again raised questions on how the math library would behave depending of the target
> chip.
> 
> All of this issues and potentially work required for a new ABI makes me wonder
> if is really worth to keep *2* distinct ABIs for m68k.  Yes, m68k can follow the
> MIPS mess and have 28 different ABIs that fails to be fully interoperable; but
> I think that if you really want to on this 'gnu32' journey, I think it will be
> better to just deprecate the m68k current ABI, remove it from glibc; and move
> everything to new ABI.

I actually wouldn't have a problem with that. I don't plan on supporting the old
ABI with 16-bit alignment. After all, we had to change the ABI for TLS support
as well, didn't we?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
