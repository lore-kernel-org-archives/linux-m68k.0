From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: falconide not registering device nodes
Date: Mon, 4 Sep 2017 16:14:01 +0200
Message-ID: <8feafa00-1391-f534-ce4a-46ba2f96943f@physik.fu-berlin.de>
References: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de>
 <alpine.LNX.2.00.1709041125280.4359@nippy.intranet>
 <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de>
 <alpine.LNX.2.00.1709042347230.3501@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50026 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753622AbdIDOOD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Sep 2017 10:14:03 -0400
In-Reply-To: <alpine.LNX.2.00.1709042347230.3501@nippy.intranet>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 09/04/2017 04:12 PM, Finn Thain wrote:
>> I tried "udevadm trigger" but that didn't help.
>>
> 
> I tried your initrd & kernel with the patched qemu:

Installation on qemu-m68k (q800 branch) works without any issues, the
CD-ROM drive found and used by debian-installer. The problem is
Aranym.

> The SCSI CD-ROM requires cdrom & sr_mod. I don't know about IDE.
> 
> # lsmod
> Module                  Size  Used by
> sr_mod                 10868  0
> cdrom                  33376  1 sr_mod
> esp_scsi               17694  0
> #

I will do further tests with different kernels.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
