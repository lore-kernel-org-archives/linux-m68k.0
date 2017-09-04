From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: falconide not registering device nodes
Date: Mon, 4 Sep 2017 12:08:30 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1709041125280.4359@nippy.intranet>
References: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48032 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753180AbdIDCJA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Sep 2017 22:09:00 -0400
In-Reply-To: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Sun, 3 Sep 2017, John Paul Adrian Glaubitz wrote:

> Hi!
> 
> I'm currently polishing debian-installer on m68k [1]. For that, I'm
> testing on various emulators like qemu-m68k and Aranym. Testing on the
> latter revealed a problem with falconide, namely device nodes not
> being created under /dev meaning the cdrom-detect module in debian-installer
> won't be able to find the CD-ROM drive [2].
> 

>From the similarity between the q40ide, macide and faldonide drivers, it 
seems likely that all are affected.

Did you confirm that the falconide module was actually loaded?

Do the device nodes appear in devtmpfs (before udevd starts)?

After udevd starts, udevadm might shed some light.

> Can anyone give me a hint what might be missing here? Do we need to 
> implement modlias_show and _hotplug [3,4] for falconide [5] or are we 
> missing something else?
> 

Probably something else. There is already a .uevent method with a call to 
add_uevent_var() in drivers/ide/ide.c.

-- 

> If you want to test this yourself, please use the kernel and initrd from 
> [6] to boot debian-installer and you must 
> "debian-installer/framebuffer=false" pass on the kernel command line.
> 
> Adrian
> 
> > [1] https://people.debian.org/~glaubitz/debian-cd/2017-09-03/debian-9.0-m68k-NETINST-1.iso
> > [2] https://people.debian.org/~glaubitz/falconide.png
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git/commit/?id=36128d204b81c099b5779771127a5546eac549c9
> > [4] https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git/commit/?id=5bde2c9be701c4583f0a9243bd46590ec401bfba
> > [5] https://github.com/torvalds/linux/blob/master/drivers/ide/falconide.c
> > [6] https://people.debian.org/~glaubitz/debian-cd/debian-installer-images_20170828_m68k.tar.gz
> 
> 
