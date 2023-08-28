Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B777C83F11
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 11:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjH1LN1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbjH1LNL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 07:13:11 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD79CA
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:13:09 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qaaB5-0049dB-Qm; Mon, 28 Aug 2023 13:13:03 +0200
Received: from p57bd925a.dip0.t-ipconnect.de ([87.189.146.90] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qaaB5-002FwU-CU; Mon, 28 Aug 2023 13:13:03 +0200
Message-ID: <39d60bf3f3b80223a9366a379e672e7cbddc6f6a.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 13:13:02 +0200
In-Reply-To: <CAMuHMdWE5V9N4GYdoe+G6iqBxmjX2rY15FsBkfWYWrXN1TGuGQ@mail.gmail.com>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
         <CAMuHMdWE5V9N4GYdoe+G6iqBxmjX2rY15FsBkfWYWrXN1TGuGQ@mail.gmail.com>
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

On Mon, 2023-08-28 at 08:56 +0200, Geert Uytterhoeven wrote:
> > And potentially more in the future, which may be anticipated on the basis
> > that "those users don't need a stable ABI any more, so let's just ignore
> > the portability issues in our code and leave the problem to the distros
> > and toolchain developers".
> 
> Indeed, the world is slowly turning into "everything is 64-bit little endian"...

Well, if we want to prevent that to happen in the future, we should make sure that
the m68k port is prepared for the future.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
