From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] m68knommu: fix allnoconfig
Date: Tue, 7 Jul 2015 11:00:06 +0200
Message-ID: <CAMuHMdXenF_87nwbiVAM_+or19xCAMLfDExOxRPbKvGk7Q2AuQ@mail.gmail.com>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34694 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754201AbbGGJAH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 05:00:07 -0400
Received: by obbkm3 with SMTP id km3so124138536obb.1
        for <linux-m68k@vger.kernel.org>; Tue, 07 Jul 2015 02:00:06 -0700 (PDT)
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Tue, Jul 7, 2015 at 8:55 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> The following set of patches are designed to fix the issues causing a
> "make allnoconfig" to fail for m68k. There is really only a couple of
> problems, and those are easily fixed.

Thanks!

For 1-3:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Now I only have to fix the m68k+MMU allnoconfig build

    $ echo CONFIG_MMU=y > allno.config
    $ make allnoconfig KCONFIG_ALLCONFIG=1

I have patches for some problems, but not all of them...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
