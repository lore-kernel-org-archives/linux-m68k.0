From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2 7/8] m68k: only generate FPU instructions if CONFIG_FPU enabled
Date: Tue, 30 Aug 2016 09:32:12 +0200
Message-ID: <CAMuHMdVe9KOdDyTy6ty5Wpw=QqB_msCMzAQD-7ZitZ+0qFv3Ug@mail.gmail.com>
References: <1472542194-11743-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37478 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753327AbcH3HcO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Aug 2016 03:32:14 -0400
Received: by mail-it0-f49.google.com with SMTP id n75so24030962ith.0
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2016 00:32:13 -0700 (PDT)
In-Reply-To: <1472542194-11743-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Tue, Aug 30, 2016 at 9:29 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> Most of the m68k code that supports a hardware FPU is surrounded by
> CONFIG_FPU. Be consistent and surround the hardware FPU instruction
> setup in setup_mm.c with CONFIG_FPU as well as the check for
> CONFIG_M68KFPU_EMU_ONLY.
>
> The existing classic m68k architectures all define CONFIG_FPU, so they
> see no change from this. But on ColdFire where we do not support the
> emulated FP code we can now compile without CONFIG_FPU being set as well.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for the update. Series looks good to me now.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
