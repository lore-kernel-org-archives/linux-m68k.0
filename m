Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270E0C001DC
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jul 2023 07:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjG0HaM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbjG0H3u (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 27 Jul 2023 03:29:50 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63C9525D
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jul 2023 00:18:33 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58451ecf223so6563657b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jul 2023 00:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690442313; x=1691047113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SABINuZDNp14ilcWP4pyR0WZrdK3Zh8LkL6BznDiqkI=;
        b=hXkCy7g5WCzELVFL1pXLO3Zt0DxFWArEstNow01GVnhqGLjXL6krTK9PgeYH+a673+
         FfWUUkYEOmS+zMm8ZIhQAQyfEB30D4vvHOZsGFvTCXYma+YxHdq79SokuAq05oclBhEV
         1D4346bS4tJ1d4XBhL+Ti6OLm1CbVhl3bSC+foAszAUQuAezqJJoZeaZ3smGdRgbpQX+
         BxC0NT8GLS+zA0m3StrxZ0G4PCvtnErBOIvS7o4UAOxIvJBR8ac947ZfmbUBJs3Gf+2T
         ZP9ueVWEBKWDHK6YMoJVrjTOcG0iLJa1uJJuV08UTJg+YepjiGf+r6Dtv2VvLsXTXZPK
         DpIw==
X-Gm-Message-State: ABy/qLZzLITxbnHVXWQmf9++n43JvOwTBeupTGtQ4NzqqsZcOMhlUpym
        xT7Y2tbxXAbvB912ltX+q8s7vcTXFqEz/g==
X-Google-Smtp-Source: APBJJlHXrMaAtSm++eg10nWD0VNW7u/dQ6XHrY4h1iEkHIlcZmMa9Y5SEOc4V3XyAK7Jhz2WfjQ3PQ==
X-Received: by 2002:a0d:fac2:0:b0:56d:1528:c56f with SMTP id k185-20020a0dfac2000000b0056d1528c56fmr4197343ywf.16.1690442312693;
        Thu, 27 Jul 2023 00:18:32 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q7-20020a817507000000b0057a93844c15sm256680ywc.127.2023.07.27.00.18.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:18:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so627256276.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jul 2023 00:18:31 -0700 (PDT)
X-Received: by 2002:a25:d494:0:b0:d10:d237:b03d with SMTP id
 m142-20020a25d494000000b00d10d237b03dmr4222751ybf.53.1690442311687; Thu, 27
 Jul 2023 00:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com> <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
In-Reply-To: <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 09:18:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdsjXtTgLjdwb6C-QsBwwCS0cyQr7X7cEvxzXyKp0GAA@mail.gmail.com>
Message-ID: <CAMuHMdVdsjXtTgLjdwb6C-QsBwwCS0cyQr7X7cEvxzXyKp0GAA@mail.gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC rz, to make him aware of this thread

On Wed, Jul 26, 2023 at 10:13 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 26/07/23 21:22, Finn Thain wrote:
> >>> There are two ISA slots where all other I/O devices are connected. These are
> >>> described (concisely!) on page 7 of the linked manual:
> >>>
> >>> 8-bit ISA I/O cycles are performed for CPU byte accesses to 0xFF400001 + 4 *
> >>> ISA address
> >>>
> >>> 16-bit ISA I/O cycles are performed for CPU word accesses to 0xFF400000 + 4
> >>> * ISA address
> >>>
> >>> 8-bit ISA memory cycles are performed for CPU byte accesses to 0xFF800001 +
> >>> 4 * ISA address
> >>>
> >>> 16-bit ISA memory cycles are performed for CPU word accesses to 0xFF800000 +
> >>> 4 * ISA address
> >> Yep, that much is evident from the Q40 address translation scheme. But a
> >> similar sort of scheme is used on other m68k platforms to wire up
> >> peripherals that were originally designed for Intel systems, and these
> >> are not connected through an ISA bus.
> > I can't figure out why those platforms don't suffer from the same "double
> > translation" problem that William described on q40.
>
> There are only two other address translation schemes in effect - Amiga
> Gayle, which handles byte/word address offsets, and gets passed IO
> addresses (in the sense that these are the addresses where registers are
> mapped in memory), and Atari EtherNEC, which handles IO ports (from the
> ne.c legacy ISA driver).
>
> The Gayle address translation, taking MMIO addresses does not add an IO
> base address. The EtherNEC address translation, OTOH, takes IO ports and
> must add the ROM port base address as IO base.
>
> What I did not realize at the time I rewrote the Q40 driver as platform
> driver is that the old driver used IO ports, not MMIO addresses. In
> order to reserve the IDE register area (we don't have a MMIO area
> corresponding to the IO ports range mapped on m68k), I did add the Q40
> ISA base address to the IO port range to populate the platform memory
> resources, forgetting that the same base address is then added a second
> time through the IO address translation.
>
> Seeing as the address passed into address translation already has the IO
> base offset of 0xff400000 and register scaling of 4 applied, it could be
> sufficient to change the address translations to only add the additional
> IO mem offset of 0x00400000:
>
> #define q40_io_mem_offset 0x00400000
>
> #define Q40_ISA_IO_B(ioaddr) ((unsigned long)(ioaddr))
> #define Q40_ISA_IO_W(ioaddr) ((unsigned long)(ioaddr))
> #define Q40_ISA_MEM_B(madr)  (q40_io_mem_offset + ((unsigned long)(madr)))
> #define Q40_ISA_MEM_W(madr)  (q40_io_mem_offset + ((unsigned long)(madr)))
>
> Note that this will play havoc with all other ISA drivers on Q40, so I'd
> just suggest that to test my hypothesis about how the address
> translation affects the IDE IO.
>
>
> A correct fix would keep the current IO translation intact, and instead
> use the platform mem resource to register the driver IO range, and the
> platform IO resource as base offset to populate the port ioaddr struct
> (minus the register scaling and byte offset, mind you).
>
> I'll give this some more thought ASAP.
>
> And yes, I'm painfully aware the m68k low level IO code is becoming a
> bit of a maintainance legacy, in no small part due to my hacks around
> Atari EtherNEC.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
