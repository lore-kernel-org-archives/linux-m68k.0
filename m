Return-Path: <SRS0=fwhs=2F=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D11C2D0CB
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Dec 2019 11:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E465D2072B
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Dec 2019 11:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfLOLBW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 15 Dec 2019 06:01:22 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34282 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfLOLBV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 15 Dec 2019 06:01:21 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so5117943otf.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Dec 2019 03:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sc6GGcfgwmoNrKLt45/al8RhKbyfuuf9QDt4/lUAVg4=;
        b=Jj3ar1esdUri2PQECfGUAsgZAEMBWNdDbGbqqTAtVeQ1xo5rFGBFM2z7hQRxdpyMfz
         dw0zuG9QZemR+piOwI2I0hnjTg0703JeIKs3LJC5rvUXkipQv5J4BkRpF1mcvKSJ+B72
         NKIA2SvsAkkDkNGqBnDM/ObtlXLPRWrA6/vng8TPkShMv8lh7prMB0wrxJyaDrcR/YTq
         BseyJRHozsEAVcWQN/q6ZqBglRTVvESF6ac65hzZF7IZHpMS4fXKG5P9J6A7qUG7d8pX
         h2N6DEQ81evoroQ5tTSUu9Lyl8GYmoljgqVrFvA+etvqSl6G7MA2OVeY+PHnPS9wryd0
         f73A==
X-Gm-Message-State: APjAAAV66U7Vbnekx9JR0JczG9z2XhsRQ3+p4J4jciD2OYvVck6LcsvE
        xghU3vMlp/atiDo0Tj7X30g0scTfofAbjGCFILM=
X-Google-Smtp-Source: APXvYqz3u4dSz4ycWxBn/BdSudojdlGQCt/exfiSiKLV9+JvISlVT2ntXDz3pvxnTbIUFrLhJV5+HlROzE2nMA4A37k=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr25600648ota.145.1576407681006;
 Sun, 15 Dec 2019 03:01:21 -0800 (PST)
MIME-Version: 1.0
References: <b95c70fe-aca0-faf7-4ff7-e71d8db3d149@physik.fu-berlin.de>
 <alpine.LNX.2.21.1.1912150919080.8@nippy.intranet> <20191215014133.GA2084@allandria.com>
In-Reply-To: <20191215014133.GA2084@allandria.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 15 Dec 2019 12:01:10 +0100
Message-ID: <CAMuHMdW26v_j=ADaisMN-FqC2v+YYRs3W0J0jy2+sgO_YCxYOw@mail.gmail.com>
Subject: Re: Using more than 1 GB in qemu-m68k-system
To:     Brad Boyer <flar@allandria.com>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Brad,

On Sun, Dec 15, 2019 at 3:19 AM Brad Boyer <flar@allandria.com> wrote:
> We could probably emulate a fake NuBus card in qemu that is just memory
> in the super slot space for that card. Can a regular driver add RAM, or
> would we have to detect that in the core code somewhere?

I think a regular driver can do that, if CONFIG_MEMORY_HOTPLUG=y.
However, the latter depends on CONFIG_SPARSEMEM.

The early core code can just call memblock_add(), though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
