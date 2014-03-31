From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Mon, 31 Mar 2014 09:42:29 +0200
Message-ID: <CAMuHMdV_6e0qsrP6H6mguJ53inndFR--0MYG9KM9iso=F3X0Rg@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52165 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753415AbaCaHma (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 03:42:30 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so7800729pbb.19
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 00:42:29 -0700 (PDT)
In-Reply-To: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Sun, Mar 30, 2014 at 1:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> see the following patch series for the hopefully final word on
> the 'make ST-RAM pool accessible for kernels running from FastRAM'
> story.

When submitting a "take three", please annotate the individual patches
with "[PATCH v3 x/y]".

It would also have been nice to CC the block resp. SCSI maintainers to
get their acks for patches 3 and 4, but I'm gonna take them through the
m68k tree anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
