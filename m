From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k/for-2.6.34
Date: Mon, 1 Feb 2010 21:12:04 +0100
Message-ID: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f228.google.com ([209.85.219.228]:44991 "EHLO
	mail-ew0-f228.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755997Ab0BAUMI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Feb 2010 15:12:08 -0500
Received: by ewy28 with SMTP id 28so3025107ewy.28
        for <linux-m68k@vger.kernel.org>; Mon, 01 Feb 2010 12:12:04 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>

I added the following to the m68k for-next branch, destined for 2.6.34:

 Finn Thain (13):
      mac68k: cleanup
      mac68k: rework SWIM platform device
      pmac-zilog: cleanup
      pmac-zilog: add platform driver
      mac68k: replace mac68k SCC code with platform device
      mac68k: move mac_esp platform device
      mac68k: move macsonic and macmace platform devices
      fbdev: mac_var_to_mode() fix
      valkyriefb: various fixes
      mac68k: start CUDA early
      fbdev: add some missing mac modes
      macfb: cleanup
      macfb: fix 24-bit visual and stuff

Geert Uytterhoeven (2):
      ataflop: Killl warning about unused variable flags
      m68k: Eliminate unused variable in page_to_phys()

Julia Lawall (1):
      m68k: Use DIV_ROUND_CLOSEST

Maxim Kuvyrkov (2):
      m68k: Fix asm/swab.h for ColdFire
      m68k: Switch to generic siginfo layout

Peter Huewe (1):
      m68k: vme_scc - __init annotations

Philippe De Muyter (2):
      m68k: Allow ioremapping top of memory
      m68k{,nommu}/h8300: Remove obsolete comment about map_chunk

If there's anything else in m68k-queue (or anyplace else :-) you
desperately want in 2.6.34, please let me know.

Should I add the NPTL support for m68k and m68knommu, or shall I wait
for 2.6.35?
I'd also like to `get rid' of the ARAnyM support by getting it
mainlined, for 2.6.35 (if I find time). Who's gonna sign off those
patches?

Thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
