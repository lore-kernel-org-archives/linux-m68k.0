Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A980C636CD
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Feb 2023 23:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjBEXTG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Feb 2023 18:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjBEXS6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Feb 2023 18:18:58 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A56A5F5
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 15:18:49 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pOoHU-003LsT-SG; Mon, 06 Feb 2023 00:18:44 +0100
Received: from dynamic-077-183-123-111.77.183.pool.telefonica.de ([77.183.123.111] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pOoHU-0046Nj-Lf; Mon, 06 Feb 2023 00:18:44 +0100
Message-ID: <2bccc83c2417374fadeb65076a6dbe29a072a91d.camel@physik.fu-berlin.de>
Subject: Re: Debian initramfs/initrd, was Re: stack smashing detected
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Finn Thain <fthain@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Mon, 06 Feb 2023 00:18:35 +0100
In-Reply-To: <fdb9fe86-4646-06fe-6d83-fde649922789@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
         <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
         <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
         <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
         <667fa6a9-a760-2116-5f76-a01e078c8079@linux-m68k.org>
         <86badf6e-2cc8-1937-1a2f-45334bb338f4@yahoo.com>
         <fdb9fe86-4646-06fe-6d83-fde649922789@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.183.123.111
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 2023-02-06 at 09:29 +1100, Finn Thain wrote:
> On Sun, 5 Feb 2023, Stan Johnson wrote:
> 
> > > 
> > > To save time, I recommend using QEMU and an up-to-date Debian/m68k SID 
> > > virtual machine to produce the vmlinux and initrd files needed for use 
> > > with Penguin on your slower machines.
> > > 
> > 
> > AFAIK, the initrd must be created on the system that is using the initrd 
> > (or an identical system, at least that was the response I received a 
> > while back when I was unsuccessfully trying to use the initrd that ships 
> > on the Debian install CD).
> 
> If that was true, how could Debian ship a single initrd that works on 
> Atari, Amiga, Mac etc.? They could not.

You cannot use the initrd that's on the debian-installer medium because it
boots directly into the installer. It's not a regular initrd.

That's completely independent of the architecture/sub-architecture in use.

> When you need to generate a valid Debian/m68k vmlinux/initrd combination 
> that is also current, then you'll need a Debian/m68k system that is 
> current. The quickest way to get it is an emulator.

Correct.

Adrian


-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
