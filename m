Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA1AC636CC
	for <linux-m68k@archiver.kernel.org>; Sat,  4 Feb 2023 15:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjBDPzm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 4 Feb 2023 10:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBDPzl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 4 Feb 2023 10:55:41 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B6B32E42
        for <linux-m68k@lists.linux-m68k.org>; Sat,  4 Feb 2023 07:55:40 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pOKt7-002s2e-Lh; Sat, 04 Feb 2023 16:55:37 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pOKt7-000Bk6-Ea; Sat, 04 Feb 2023 16:55:37 +0100
Message-ID: <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
Subject: Re: U-Boot support for M68K removal
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Tom Rini <trini@konsulko.com>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Date:   Sat, 04 Feb 2023 16:55:36 +0100
In-Reply-To: <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
         <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
         <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
         <Y9fs2wH4WHIzae5r@bill-the-cat>
         <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 2023-01-30 at 17:22 +0100, John Paul Adrian Glaubitz wrote:
> FWIW, m68k is still a very actively maintained architecture in the
> Linux kernel and userland with even LLVM and Rust having recently
> added support for m68k.
> 
> I also own a Coldfire board myself (not sure which one without
> looking), so I can offer to test U-Boot patches in the future.

So, I just found my Coldfire board and it's actually a 547x/548x EVB
fitted with a 5475 CPU module clocked at 266 MHz.

I will get this board set up during the next weeks and I am happy to
test any Coldfire kernel patches, and eventually, U-Boot patches if
that board is still supported.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
