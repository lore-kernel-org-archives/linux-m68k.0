Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB99C05027
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 12:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjBFMa5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjBFMa4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 07:30:56 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E357512052
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 04:30:55 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pP0e4-003if1-0T; Mon, 06 Feb 2023 13:30:52 +0100
Received: from dynamic-078-055-160-111.78.55.pool.telefonica.de ([78.55.160.111] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pP0e3-001sJ5-Px; Mon, 06 Feb 2023 13:30:51 +0100
Message-ID: <13f6e0187991b42c45a8341f4441e80aee563741.camel@physik.fu-berlin.de>
Subject: Re: U-Boot support for M68K removal
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Greg Ungerer <gerg@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Date:   Mon, 06 Feb 2023 13:30:51 +0100
In-Reply-To: <40a0fdd71a65307e33dc3b5d8fd15d655fcb0607.camel@physik.fu-berlin.de>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
         <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
         <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
         <Y9fs2wH4WHIzae5r@bill-the-cat>
         <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
         <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
         <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
         <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
         <40a0fdd71a65307e33dc3b5d8fd15d655fcb0607.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 78.55.160.111
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 2023-02-06 at 13:25 +0100, John Paul Adrian Glaubitz wrote:
> On Mon, 2023-02-06 at 22:02 +1000, Greg Ungerer wrote:
> > I wish I had a 54415 based board in my collection. Would make it so
> > much easier to keep the kernel working on it :-(
> 
> Maybe we can find one to buy for you. I would be happy to donate for it.

Btw, what environment are you using to test Coldfire kernel patches?

Do you use Buildroot to create a bootable ColdFire chroot?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
