Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B275C636D7
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 21:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjBUVqJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 16:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjBUVqJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 16:46:09 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA342BECA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 13:46:04 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pUaSY-001hBI-MQ; Tue, 21 Feb 2023 22:46:02 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pUaSY-000qIG-FD; Tue, 21 Feb 2023 22:46:02 +0100
Message-ID: <c531fc933a033be61ee63ce4ac58ceeb3a8df39e.camel@physik.fu-berlin.de>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Date:   Tue, 21 Feb 2023 22:46:01 +0100
In-Reply-To: <40e057d3-dfa3-6cd9-2bce-98f0db93430b@gmail.com>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
         <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
         <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
         <40e057d3-dfa3-6cd9-2bce-98f0db93430b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael!

On Wed, 2023-02-22 at 10:09 +1300, Michael Schmitz wrote:
> a1 is just  before the end of your RAM chunk. If that's a longword 
> access, you'd fall over the edge :) Can you disassemble the code snippet 
> (or memcmp()) so we can see what's happening?

Here you go:

00201d14 <memcmp>:
  201d14:       48e7 301c       moveml %d2-%d3/%a3-%a5,%sp@-
  201d18:       226f 0018       moveal %sp@(24),%a1
  201d1c:       266f 001c       moveal %sp@(28),%a3
  201d20:       206f 0020       moveal %sp@(32),%a0
  201d24:       7003            moveq #3,%d0
  201d26:       b088            cmpl %a0,%d0
  201d28:       650a            bcss 201d34 <memcmp+0x20>
  201d2a:       4281            clrl %d1
  201d2c:       b288            cmpl %a0,%d1
  201d2e:       661e            bnes 201d4e <memcmp+0x3a>
  201d30:       4280            clrl %d0
  201d32:       6030            bras 201d64 <memcmp+0x50>
  201d34:       2a49            moveal %a1,%a5
  201d36:       284b            moveal %a3,%a4
  201d38:       264c            moveal %a4,%a3
  201d3a:       224d            moveal %a5,%a1
  201d3c:       bb8c            cmpml %a4@+,%a5@+
  201d3e:       66ea            bnes 201d2a <memcmp+0x16>
  201d40:       5988            subql #4,%a0
  201d42:       7003            moveq #3,%d0
  201d44:       b088            cmpl %a0,%d0
  201d46:       65f0            bcss 201d38 <memcmp+0x24>
  201d48:       224d            moveal %a5,%a1
  201d4a:       264c            moveal %a4,%a3
  201d4c:       60dc            bras 201d2a <memcmp+0x16>
  201d4e:       4283            clrl %d3
  201d50:       1631 1800       moveb %a1@(0,%d1:l),%d3
  201d54:       4282            clrl %d2
  201d56:       1433 1800       moveb %a3@(0,%d1:l),%d2
  201d5a:       2003            movel %d3,%d0
  201d5c:       9082            subl %d2,%d0
  201d5e:       5281            addql #1,%d1
  201d60:       b483            cmpl %d3,%d2
  201d62:       67c8            beqs 201d2c <memcmp+0x18>
  201d64:       4cdf 380c       moveml %sp@+,%d2-%d3/%a3-%a5
  201d68:       4e75            rts

The kernel image is actually unstripped. Is there a config option for that?

Do we want to keep symbols in a non-debug kernel?

> I do recall recent changes to the mm code, but that was for NOMMU. I 
> wonder whether there was anything else that would introduce an implicit 
> assumption about memory starting at 0x0 ...

Sounds like a possible culprit.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
