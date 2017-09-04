From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: falconide not registering device nodes
Date: Tue, 5 Sep 2017 00:12:29 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1709042347230.3501@nippy.intranet>
References: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de> <alpine.LNX.2.00.1709041125280.4359@nippy.intranet> <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54928 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbdIDOMJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Sep 2017 10:12:09 -0400
In-Reply-To: <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Mon, 4 Sep 2017, John Paul Adrian Glaubitz wrote:

> > After udevd starts, udevadm might shed some light.
> 
> I tried "udevadm trigger" but that didn't help.
> 

I tried your initrd & kernel with the patched qemu:

# cat /proc/version
Linux version 4.12.0-1-m68k (debian-kernel@lists.debian.org) (gcc version 6.4.0 20170805 (Debian 6.4.0-3) ) #1 Debian 4.12.6-1 (2017-08-12)
# grep devtmpfs /proc/mounts
devtmpfs /dev devtmpfs rw,relatime,size=500196k,nr_inodes=125049,mode=755 0 0
# rmmod mac_esp
# ls /dev/sr0
ls: /dev/sr0: No such file or directory
# udevadm monitor &
# modprobe mac_esp
KERNEL[116.250000] add      /module/mac_esp (module)
UDEV  [116.280000] add      /module/mac_esp (module)
KERNEL[119.280000] add      /devices/platform/mac_esp.0/host0 (scsi)
KERNEL[119.280000] add      /devices/platform/mac_esp.0/host0/scsi_host/host0 (scsi_host)
KERNEL[119.280000] add      /devices/platform/mac_esp.0/host0/spi_host/host0 (spi_host)
KERNEL[119.320000] add      /bus/platform/drivers/mac_esp (drivers)
KERNEL[119.340000] add      /devices/platform/mac_esp.0/host0/target0:0:2 (scsi)
KERNEL[119.340000] add      /devices/platform/mac_esp.0/host0/target0:0:2/spi_transport/target0:0:2 (spi_transport)
KERNEL[119.360000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0 (scsi)
UDEV  [119.360000] add      /devices/platform/mac_esp.0/host0 (scsi)
KERNEL[119.360000] add      /devices/virtual/bdi/11:0 (bdi)
KERNEL[119.400000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/block/sr0 (block)
KERNEL[119.440000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/scsi_device/0:0:2:0 (scsi_device)
KERNEL[119.490000] change   /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/block/sr0 (block)
UDEV  [119.530000] add      /devices/platform/mac_esp.0/host0/spi_host/host0 (spi_host)
KERNEL[119.530000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/bsg/0:0:2:0 (bsg)
UDEV  [119.550000] add      /devices/platform/mac_esp.0/host0/scsi_host/host0 (scsi_host)
UDEV  [119.550000] add      /devices/platform/mac_esp.0/host0/target0:0:2 (scsi)
UDEV  [119.570000] add      /devices/platform/mac_esp.0/host0/target0:0:2/spi_transport/target0:0:2 (spi_transport)
UDEV  [119.570000] add      /devices/virtual/bdi/11:0 (bdi)
UDEV  [119.600000] add      /bus/platform/drivers/mac_esp (drivers)
UDEV  [119.600000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0 (scsi)
UDEV  [119.600000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/scsi_device/0:0:2:0 (scsi_device)
UDEV  [119.620000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/bsg/0:0:2:0 (bsg)
UDEV  [119.720000] add      /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/block/sr0 (block)
UDEV  [119.880000] change   /devices/platform/mac_esp.0/host0/target0:0:2/0:0:2:0/block/sr0 (block)
# ls /dev/sr0
/dev/sr0
# 

> >> Can anyone give me a hint what might be missing here? Do we need to 
> >> implement modlias_show and _hotplug [3,4] for falconide [5] or are we 
> >> missing something else?
> >>
> > 
> > Probably something else. There is already a .uevent method with a call 
> > to add_uevent_var() in drivers/ide/ide.c.
> 
> Hmm. Do we maybe need additional generic modules to be loaded?
> 

The SCSI CD-ROM requires cdrom & sr_mod. I don't know about IDE.

# lsmod
Module                  Size  Used by
sr_mod                 10868  0
cdrom                  33376  1 sr_mod
esp_scsi               17694  0
# 

-- 

> Adrian
> 
> 
