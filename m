From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/11] m68k: Atari EtherNAT Updates
Date: Wed, 26 May 2010 19:48:42 +0200
Message-ID: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:43288 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934126Ab0EZRs6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:48:58 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

	Hi Michael,

As the Atari EtherNAT driver no longer compiles in post-2.6.34, I ported all
recent changes to the smc91x driver to it.

      m68k: Atari EtherNAT - request_irq - Remove unnecessary leading & from sec
      m68k: Atari EtherNAT - convert to dev_pm_ops
      m68k: Atari EtherNAT - Fix irq flags
      m68k: Atari EtherNAT - fix unused flags warnings on UP systems
      m68k: Atari EtherNAT - Fix up type mismatch in smc_drv_resume().
      m68k: Atari EtherNAT - use netdev_mc_count and netdev_mc_empty when approp
      m68k: Atari EtherNAT - convert multiple drivers to use netdev_for_each_mc_
      m68k: Atari EtherNAT - remove trailing space in messages
      m68k: Atari EtherNAT - include cleanup: slab.h
      m68k: Atari EtherNAT - convert multicast list to list_head
      m68k: Atari EtherNAT - trans_start cleanups

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
