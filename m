Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED785C61DA3
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 15:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbjBUPxr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 10:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbjBUPxq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 10:53:46 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD8CCDC3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 07:53:45 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pUUxb-000MgP-N5; Tue, 21 Feb 2023 16:53:43 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pUUxb-0044zP-FD; Tue, 21 Feb 2023 16:53:43 +0100
Message-ID: <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Date:   Tue, 21 Feb 2023 16:53:42 +0100
In-Reply-To: <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
         <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert!

On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
> Looks surprisingly similar to the issue reported by Stan.
> Do the mitigations given in
> https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
> help?

The kernel actually crashes with a backtrace:

ABCDGHIJK
[    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
[    0.000000] Enabling workaround for errata I14
[    0.000000] printk: bootconsole [debug0] enabled
[    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
LISA ALICE_PAL ZORRO3 
[    0.000000] initrd: 0ef0602c - 0f800000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
[    0.000000] Unable to handle kernel access at virtual address (ptrval)
[    0.000000] Oops: 00000000
[    0.000000] Modules linked in:
[    0.000000] PC: [<00201d3c>] memcmp+0x28/0x56
[    0.000000] SR: 2709  SP: (ptrval)  a2: 004a5580
[    0.000000] d0: 00000003    d1: 00000001    d2: 00201d14    d3: 00000272
[    0.000000] d4: 00012750    d5: 08023ec0    a0: 0000000c    a1: 0f7ffff4
[    0.000000] Process swapper (pid: 0, task=(ptrval))
[    0.000000] Frame format=4 fault addr=0f7ffff4 fslw=01051000
[    0.000000] Stack from 004a3fac:
[    0.000000]         00201d14 00000272 00374e40 0f7ffff4 0f800000 00534b22 0f7ffff4 0042e325
[    0.000000]         0000000c 0055c000 00000272 00012750 08023ec0 00012750 080dbf48 08001000
[    0.000000]         08001000 0f7ffff0 00553d9a 00000000 00533872
[    0.000000] Call Trace: [<00201d14>] memcmp+0x0/0x56
[    0.000000]  [<00374e40>] _printk+0x0/0x18
[    0.000000]  [<00534b22>] start_kernel+0x8a/0x5d6
[    0.000000]  [<00012750>] LOGTBL+0x228/0x800
[    0.000000]  [<00012750>] LOGTBL+0x228/0x800
[    0.000000]  [<00533872>] _sinittext+0x872/0x11f8
[    0.000000] 
[    0.000000] Code: b288 661e 4280 6030 2a49 284b 264c 224d <bb8c> 66ea 5988 7003 b088 65f0 224d 264c 60dc 4283 1631 1800 4282 1433 1800
2003
[    0.000000] Disabling lock debugging due to kernel taint
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

> > FWIW, I noticed that the kernel image itself is already over 7 MB, not sure
> > whether this is a problem.
> 
> Depends on how much RAM you have ;-)

128 MB.

> > Anyone else tried a recent kernel on their Amigas?
> 
> I really should start booting on real Amiga hardware again...

You should ;-).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
