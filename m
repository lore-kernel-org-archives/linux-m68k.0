Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F29AC71153
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 12:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjH1Mq0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 08:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjH1MqR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 08:46:17 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CCF100
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:46:11 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qabd7-000Tv1-N3; Mon, 28 Aug 2023 14:46:05 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qabd7-002fgI-8s; Mon, 28 Aug 2023 14:46:05 +0200
Message-ID: <b6bdce9f714ab0db7fa3ff99260e1020aaa9f367.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Richard <richiezid@arcor.de>, debian-68k@lists.debian.org,
        James Le Cuirot <chewi@aura-online.co.uk>
Cc:     libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 14:46:04 +0200
In-Reply-To: <D3BF1EA1-1675-42EB-AF10-592F4C3D5C83@arcor.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
         <99aacdf62e82c8c4244e47052d5661df7417a47a.camel@physik.fu-berlin.de>
         <D3BF1EA1-1675-42EB-AF10-592F4C3D5C83@arcor.de>
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

On Mon, 2023-08-28 at 12:11 +0000, Richard wrote:
> 
> On August 28, 2023 10:57:25 AM UTC, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> > On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
> > > > Not only mold but also most notably the following projects:
> > > 
> > > a linker that is broken by a slightly unusual alignment isn't exactly a
> > > prime example.. if any project I would expect linkers and binary tools
> > > to pay attention to portability.
> > 
> > Portable shouldn't mean having to accommodate for unreasonable design decisions
> > of other developers. It's perfectly fine to assume 32-bit natural alignment on
> > a 32-bit platform and I don't think it's fair to put the burden of adopting for
> > unusual design decisions on to upstream projects.
> 
> Assuming anything that is not declared by the c standard is not good imho. The C
> lang is well known for its pitfalls and the basic binary tools ought not to set
> bad precedents ignoring those. 
> 
> It is also reasonable to assume that on modern hw cache is filled in blocks of perhap
> 1k or more and thus "unnatural" alignment might actually help performance because more
> fits into that one data burst.

This is a very academic discussion really and doesn't really solve the problem we're
seeing. We're here to solve a technical problem, not to discuss whether something is
according to the C standard.

Upstream projects decide on their own what maintenance burden they're willing to accept
and which not. If they don't think it's reasonable to accommodate for the specific m68k
alignment requirements, the burden to keep these packages working are on the distribution
maintainers meaning that I will have to continue spending time unbreaking packages like
OpenJDK in Debian which I prefer not having to in the future.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
