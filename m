From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: debian-installer progress and input needed
Date: Mon, 15 May 2017 23:21:36 +0200
Message-ID: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57294 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758649AbdEOVVj (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 May 2017 17:21:39 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi!

Recently, I made some progress with debian-installer on m68k and got it
to build on m68k, at least the cdrom installer. It can be downloaded
for testing purpose here [1]. It should work in emulators like Aranym
and qemu-m68k in system mode.

I haven't tested the installer myself yet, but Laurent Vivier had a go
and he confirmed it actually loaded the installer from initrd \o/.

However, there is one task that needs to be addressed and for that I
need help. Since d-i hasn't been touched on m68k for a long time, the
kernel module list is outdated and hence hardware like CD-ROM drives
and similar are not detected.

Thus, I would to ask around which modules are needed for the various
hardware people have, e.g. SCSI driver for 68k Macs, IDE drivers for
Amiga and Atari and so on.

The drivers need to be added to the corresponding module list in [2]
which will add them to module packages. The module packages then
have to be included in the pkg-list for d-i on m68k [3]. Of course,
the drivers need to be enabled in the kernel configuration as well.

Another issue that needs to be addressed is that the loop-modules
udeb package needs to be enabled for src:linux on m68k because it's
required for the hdmedia d-i images. But I can open a bug report
for that as well.

Thanks,
Adrian


> [1] https://people.debian.org/~glaubitz/debian-installer-m68k/cdrom/
> [2] https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k
> [3] https://anonscm.debian.org/cgit/d-i/debian-installer.git/tree/build/pkg-lists/cdrom/m68k.cfg

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
