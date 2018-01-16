From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Fix race conditions in OSS interrupt dispatch
Date: Tue, 16 Jan 2018 19:10:58 +0100
Message-ID: <CAMuHMdU3vtLP6G1kmwE4Bp46u4bP_WNWvDdEWLGdDaJMmSEwwg@mail.gmail.com>
References: <96431db1a6c217d5b6be05ff4c73e953834b1d81.1515881369.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:46604 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751665AbeAPSK7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Jan 2018 13:10:59 -0500
Received: by mail-qt0-f171.google.com with SMTP id o35so9218928qtj.13
        for <linux-m68k@vger.kernel.org>; Tue, 16 Jan 2018 10:10:59 -0800 (PST)
In-Reply-To: <96431db1a6c217d5b6be05ff4c73e953834b1d81.1515881369.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Sat, Jan 13, 2018 at 11:44 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The interrupt dispatch algorithm used in the OSS driver seems to be
> subject to race conditions: an IRQ flag could be lost if asserted between
> the MOV instructions from and to the interrupt flag register. But testing
> shows that the write to the flag register has no effect, so rewrite the
> algorithm without the theoretical race condition.
>
> There is a second theoretical race condition here. When oss_irq() is
> called with say, IPL == 2 it will invoke the SCSI interrupt handler.
> The SCSI IRQ is then cleared by the mac_scsi driver. If SCSI and NuBus
> IRQs are now asserted together, oss_irq() will be invoked with IPL == 3
> and the mac_scsi interrupt handler can be re-entered. This re-entrance
> issue is not limited to SCSI and could affect NuBus and ADB drivers too.
> Fix it by splitting up oss_irq() into separate handlers for each IPL.
>
> No-one seems to know how OSS irq flags can be cleared, if at all, so add
> a comment to this effect (actually reinstate one I previously removed).
> Testing showed that a slot IRQ with no handler can remain asserted (in
> this case a Radius video card) without causing problems for other IRQs.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks, applied and queued for v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
