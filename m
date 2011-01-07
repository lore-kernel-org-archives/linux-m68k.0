From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] m68k: Allow all kernel traps to be handled via exception fixups
Date: Fri,  7 Jan 2011 17:22:02 +0100
Message-ID: <1294417325-6109-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

This patch series is a split and cleanup of the single commit
aa8fcffdec0ac8d0ace3af622eb92f5ee804fc44
("m68k-allow-all-kernel-traps-to-be-handled-via-exception-fixups-all.diff"),
which dates back to the Linux/m68k CVS tree.

It's a prerequisite for ARAnyM support.

    [PATCH 1/3] m68k: Add helper function handle_kernel_fault()
    [PATCH 2/3] m68k: Use base_trap_init() to initialize vectors
    [PATCH 3/3] m68k: Allow all kernel traps to be handled via exception fixups

 arch/m68k/kernel/traps.c            |   10 +++++++---
 b/arch/m68k/include/asm/processor.h |    2 ++
 b/arch/m68k/kernel/signal.c         |   24 +++++++++++++++++++++++-
 b/arch/m68k/kernel/traps.c          |   10 +++++-----
 b/arch/m68k/mm/fault.c              |   16 +---------------
 5 files changed, 38 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
