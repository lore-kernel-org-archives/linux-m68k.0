Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D43C83F1E
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 10:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjH1K6H convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 06:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjH1K5n (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 06:57:43 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B20E132
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 03:57:35 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qaZvy-0043dq-Ta; Mon, 28 Aug 2023 12:57:26 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qaZvy-002Dny-Dm; Mon, 28 Aug 2023 12:57:26 +0200
Message-ID: <99aacdf62e82c8c4244e47052d5661df7417a47a.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Richard <richiezid@arcor.de>, debian-68k@lists.debian.org,
        James Le Cuirot <chewi@aura-online.co.uk>
Cc:     libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 12:57:25 +0200
In-Reply-To: <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
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

On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
> > Not only mold but also most notably the following projects:
> 
> a linker that is broken by a slightly unusual alignment isn't exactly a
> prime example.. if any project I would expect linkers and binary tools
> to pay attention to portability.

Portable shouldn't mean having to accommodate for unreasonable design decisions
of other developers. It's perfectly fine to assume 32-bit natural alignment on
a 32-bit platform and I don't think it's fair to put the burden of adopting for
unusual design decisions on to upstream projects.

This kind of attitude was certainly one of the reasons why the Itanium architecture
failed. Its designers made weird decisions which made life hard for upstream developers
and most of them were happy when the architecture was finally abandoned.

> > - LLVM
> 
> Ok .. too big to complain about.. and see above.

It's also nearly impossible to make LLVM work with 16-bit alignment because the code uses
certainly packed data types which require 32-bit alignment or higher.

> > - OpenJDK
> 
> OpenJDK has not only that one problem.

That's an unnecessary remark that is not helpful here. Please don't do that!

> > It's a regular occurrence that a package doesn't build on m68k due to it's unusual
> > default alignment. 
> 
> Unfortunately. Some time ago m68k was not the only one with this problem?

Well, as mentioned above, other architectures with weird requirements such as Itanium
have been abandoned and most upstream projects were happy when this finally happened.

> > Thus, in order to keep the port alive in the future, I think
> > switching to 32-bit alignment by default is inevitable.
> > 
> 
> Ok. 
> 
> 
> > > We need to
> > > break the ABI anyway with time_t going 64-bit, so it makes sense to do these
> > > two things at the same time.
> 
> 
> What exactly will be broken? Afaics kernel ABIs have been since long pretty carefully
> designed to avoid this problems and noone of the mentioned examples should touch them anyway. 
> 
> Thus.. is there any need to change the kernel ABI?

I don't think this mandates changes to the kernel ABI.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
