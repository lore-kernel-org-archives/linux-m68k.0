From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: USB/IP support?
Date: Mon, 1 Sep 2014 11:08:16 +0200
Message-ID: <CAMuHMdW+yOKA0fswU630HoNd2-BGFMAtBX+kVStgHSgBASBLBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:60342 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752928AbaIAJIS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Sep 2014 05:08:18 -0400
Received: by mail-la0-f43.google.com with SMTP id ty20so5683013lab.2
        for <linux-m68k@vger.kernel.org>; Mon, 01 Sep 2014 02:08:16 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

v3.17-rc3 gained (well, it was present before in staging) an interesting new
feature:

config USBIP_CORE
        tristate "USB/IP support"
        depends on USB && NET
        ---help---
          This enables pushing USB packets over IP to allow remote
          machines direct access to USB devices. It provides the
          USB/IP core that is required by both drivers.

          For more details, and to get the userspace utility
          programs, please see <http://usbip.sourceforge.net/>.

          To compile this as a module, choose M here: the module will
          be called usbip-core.

          If unsure, say N.

Hence USB is no longer limited to Ataris with NetUSBee, but can be used
"by proxy" on all network-enabled m68k machines.
Have fun with webcams, TV-cards, ...

Do you think we should enable (modular, of course) USB and its myriads of
drivers in all defconfigs now?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
