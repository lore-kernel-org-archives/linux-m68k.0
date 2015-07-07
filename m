From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] m68knommu: fix allnoconfig
Date: Tue, 7 Jul 2015 14:45:10 +0200
Message-ID: <CAMuHMdUNxTq4nbi0M9-Yt+MObDXKQ=MVgN-9xV1tOQEPA0bAPQ@mail.gmail.com>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
	<CAMuHMdXenF_87nwbiVAM_+or19xCAMLfDExOxRPbKvGk7Q2AuQ@mail.gmail.com>
	<559BC481.6010004@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35316 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757087AbbGGMpL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 08:45:11 -0400
Received: by obbop1 with SMTP id op1so127559359obb.2
        for <linux-m68k@vger.kernel.org>; Tue, 07 Jul 2015 05:45:11 -0700 (PDT)
In-Reply-To: <559BC481.6010004@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Tue, Jul 7, 2015 at 2:22 PM, Greg Ungerer <gerg@uclinux.org> wrote:
> Do we care about allmodconfig and allyesconfig?
> Looks like problems there too.

On top of the m68k(MMU) defconfigs, the following are part of my
standard build tests:
  - allmodconfig
  - allmodconfig-sun3
  - allnoconfig-mmu
  - allyesconfig
  - allyesconfig-sun3

Apart from allnoconfig-mmu, all of the above build fine locally, but not all
patches to fix issues are upstream yet. Most patches have been submitted
though, except for e.g. a few more complicated dependencies of USB on
HAS_DMA (for sun3).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
