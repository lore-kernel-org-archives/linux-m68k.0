From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 2.6.31 (was: Re: [git pull] m68knommu
	arch fixes)
Date: Wed, 26 Aug 2009 23:26:33 +0200
Message-ID: <10f740e80908261426w4c37f960ma9ff1206a65618d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.216.174]:55570 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743AbZHZVdC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2009 17:33:02 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Hi Linus,

On Fri, Jun 12, 2009 at 08:22, Geert Uytterhoeven<geert@linux-m68k.org> wrote:
> Probably I won't have time to handle and submit any m68k patches
> during this merge window,
> so if anyone needs anything to be in 2.6.31, it would be nice if
> somebody else could take care of
> it.

Here is the most critical stuff. Thanks for pulling!

The following changes since commit f415c413f458837bd0c27086b79aca889f9435e4:
  Linus Torvalds (1):
        Merge git://git.kernel.org/.../davem/net-2.6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git#for-linus

Alexey Dobriyan (1):
      m68k: Fix redefinition of pgprot_noncached

Andrew Morton (1):
      arch/m68k/include/asm/motorola_pgalloc.h: fix kunmap arg

Geert Uytterhoeven (1):
      m68k,m68knommu: Wire up rt_tgsigqueueinfo and perf_counter_open

Roel Kluin (2):
      m68k: count can reach 51, not 50
      m68k: cnt reaches -1, not 0

 arch/m68k/amiga/config.c                 |    6 ++++--
 arch/m68k/include/asm/motorola_pgalloc.h |   10 ++++------
 arch/m68k/include/asm/pgtable_mm.h       |    3 +--
 arch/m68k/include/asm/unistd.h           |    4 +++-
 arch/m68k/kernel/entry.S                 |    2 ++
 arch/m68knommu/kernel/syscalltable.S     |    2 ++
 drivers/macintosh/via-maciisi.c          |    2 +-
 7 files changed, 17 insertions(+), 12 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
