From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: falconide not registering device nodes
Date: Tue, 5 Sep 2017 09:57:49 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1709050953200.8843@nippy.intranet>
References: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de> <alpine.LNX.2.00.1709041125280.4359@nippy.intranet> <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de> <alpine.LNX.2.00.1709042347230.3501@nippy.intranet>
 <8feafa00-1391-f534-ce4a-46ba2f96943f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46372 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754027AbdIDX51 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Sep 2017 19:57:27 -0400
In-Reply-To: <8feafa00-1391-f534-ce4a-46ba2f96943f@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Mon, 4 Sep 2017, John Paul Adrian Glaubitz wrote:

> On 09/04/2017 04:12 PM, Finn Thain wrote:
> > > I tried "udevadm trigger" but that didn't help.
> > >
> > 
> > I tried your initrd & kernel with the patched qemu:
> 
> Installation on qemu-m68k (q800 branch) works without any issues, the 
> CD-ROM drive found and used by debian-installer. The problem is Aranym.
> 

I know. I don't have Aranym installed. And if I did have it, I'd still do 
the exactly same test with qemu.

> > The SCSI CD-ROM requires cdrom & sr_mod. I don't know about IDE.
> > 
> > # lsmod
> > Module                  Size  Used by
> > sr_mod                 10868  0
> > cdrom                  33376  1 sr_mod
> > esp_scsi               17694  0
> > #
> 
> I will do further tests with different kernels.
> 

The point of my email was to provide a working example. Then you could 
obtain the output of "udevadm monitor" for falconide module and compare 
that with my mac_esp example. I expect that this will show that the 
problem lies with userspace, not the kernel.

-- 

> Adrian
> 
> 
