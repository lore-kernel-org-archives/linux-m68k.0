From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: debian-installer progress and input needed
Date: Wed, 17 May 2017 14:24:25 +0200
Message-ID: <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55882 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753407AbdEQMY1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 17 May 2017 08:24:27 -0400
In-Reply-To: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Ok, let's get some order into this.

I have already opened a bug report to include loop-modules [1].

Then, looking at the module packages on m68k [2] and powerpc [3],
I suggest to add the following new packages first:

- affs-modules (to allow d-i to mount Amiga filesystems)
- hfs-modules (to allow d-i to mount MacOS filesystems)
- pata-modules
- scsi-core-modules (for sd_mod and scsi_mod)

nic-shared-modules should be renamed to nic-modules. Note that most
NIC modules are already added, see [4]. Also, many generic drivers
are added by merely including them with "#include <module package>"
which includes them from [5]. So, please, if you suggest additional
modules, please make sure not to put modules on the list which
we already have, either directly or through #include.

To nic-modules, we should add:

- macmace

To pata-modules, we should add:

- gayle
- ide-cd_mod
- macide
- swim_mod (although this is a floppy module)

To scsi-modules, we should add:

- atari_scsi
- esp_scsi
- mac_esp
- mac_scsi

Did I miss anything?

Adrian

> [1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862813
> [2]
https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k
> [3]
https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/powerpc/modules/powerpc
> [4]
https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k/nic-shared-modules
> [5]
https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/modules

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
