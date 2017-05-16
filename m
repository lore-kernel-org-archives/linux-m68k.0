From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: debian-installer progress and input needed
Date: Tue, 16 May 2017 18:13:09 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705161739210.5040@nippy.intranet>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37756 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbdEPIIh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 16 May 2017 04:08:37 -0400
In-Reply-To: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 15 May 2017, John Paul Adrian Glaubitz wrote:

> Hi!
> 
> Recently, I made some progress with debian-installer on m68k and got it 
> to build on m68k, at least the cdrom installer. It can be downloaded for 
> testing purpose here [1]. It should work in emulators like Aranym and 
> qemu-m68k in system mode.
> 

Nice work!

> I haven't tested the installer myself yet, but Laurent Vivier had a go 
> and he confirmed it actually loaded the installer from initrd \o/.
> 
> However, there is one task that needs to be addressed and for that I 
> need help. Since d-i hasn't been touched on m68k for a long time, the 
> kernel module list is outdated and hence hardware like CD-ROM drives and 
> similar are not detected.
> 
> Thus, I would to ask around which modules are needed for the various 
> hardware people have, e.g. SCSI driver for 68k Macs, IDE drivers for 
> Amiga and Atari and so on.
> 

For m68k Macs, the SCSI, IDE, FDC and NIC driver modules are,

	mac_esp
	mac_scsi

	macide

	swim_mod

	mac8390
	macmace
	mac89x0
	macsonic

Their respective Kconfig symbols are:

	CONFIG_SCSI_MAC_ESP
	CONFIG_MAC_SCSI

	CONFIG_BLK_DEV_MAC_IDE

	BLK_DEV_SWIM

	CONFIG_MAC8390
	CONFIG_MACMACE
	CONFIG_MAC89x0
	CONFIG_MACSONIC

Any other Mac-specific modules (ADB, FB, SCC etc) should probably be 
built-in.

> The drivers need to be added to the corresponding module list in [2] 
> which will add them to module packages. The module packages then have to 
> be included in the pkg-list for d-i on m68k [3]. Of course, the drivers 
> need to be enabled in the kernel configuration as well.
> 
> Another issue that needs to be addressed is that the loop-modules udeb 
> package needs to be enabled for src:linux on m68k because it's required 
> for the hdmedia d-i images. But I can open a bug report for that as 
> well.
> 

Installer images would be awesome (I gather that there is no ISO yet...)

-- 

> Thanks,
> Adrian
> 
> 
> > [1] https://people.debian.org/~glaubitz/debian-installer-m68k/cdrom/
> > [2] https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k
> > [3] https://anonscm.debian.org/cgit/d-i/debian-installer.git/tree/build/pkg-lists/cdrom/m68k.cfg
> 
> 
