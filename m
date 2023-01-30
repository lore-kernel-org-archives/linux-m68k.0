Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB77C54EED
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 16:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjA3QWW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbjA3QWW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 11:22:22 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4E7A5FF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 08:22:21 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pMWvC-003vtO-5o; Mon, 30 Jan 2023 17:22:18 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pMWvB-001QQa-Un; Mon, 30 Jan 2023 17:22:18 +0100
Message-ID: <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
Subject: Re: U-Boot support for M68K removal
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Tom Rini <trini@konsulko.com>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Date:   Mon, 30 Jan 2023 17:22:17 +0100
In-Reply-To: <Y9fs2wH4WHIzae5r@bill-the-cat>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
         <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
         <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
         <Y9fs2wH4WHIzae5r@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

On Mon, 2023-01-30 at 11:14 -0500, Tom Rini wrote:
> On Mon, Jan 30, 2023 at 01:49:11PM +0100, Angelo Dureghello wrote:
> 
> > Hi Tom and all,
> > 
> > really have to apologize, had hard times these last 2 years
> > and couldn't follow at all the activity, i am totally culprit
> > and responsible.
> > 
> > Now i can jump back on following, if there is any sense
> > in keeping m68k/coldfire.
> > Let me know, if ok i start back checking all old patches
> > from tonight. Also, will have to update my email and rebase
> > to master.
> 
> I'm glad you're back. I think the first thing to do would be to
> confirm
> that U-Boot still works on at least some supported board, then
> confirming you can still access
> https://source.denx.de/u-boot/custodians/u-boot-coldfire
> 

FWIW, m68k is still a very actively maintained architecture in the
Linux kernel and userland with even LLVM and Rust having recently
added support for m68k.

I also own a Coldfire board myself (not sure which one without
looking), so I can offer to test U-Boot patches in the future.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
