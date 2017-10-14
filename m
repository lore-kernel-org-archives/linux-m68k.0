From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Status of the FB drivers on m68k
Date: Sat, 14 Oct 2017 13:23:44 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710141310400.3@nippy.intranet>
References: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de> <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com> <90f7b321-207c-fd6d-92ae-f415a7fcf384@physik.fu-berlin.de> <f65ab00c-8dad-f7a4-cba8-14c6d9fe3ce8@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46202 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752072AbdJNCXm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Oct 2017 22:23:42 -0400
In-Reply-To: <f65ab00c-8dad-f7a4-cba8-14c6d9fe3ce8@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Sat, 14 Oct 2017, Michael Schmitz wrote:

> > - Michael Schmitz' ESP driver fixes for the Cyberstorm SCSI
> 
> Finn's fixes actually, and no guarantee what I have in mind will 
> actually work.
> 

Just to clarify, Michael and I did reach a solution (i.e. don't attempt 
2-byte DMA transfers) after we kicked around various theories for years, 
and tested some of them with Stan's help, and fixed some mac_esp and 
esp_scsi bugs along the way. But someone still has to write the code for 
zorro_esp. The code is easily adapted from mac_esp, now that mac_esp works 
properly, since you only have to implement the the transfer_size < 
FIFO_SIZE case or even just the write != 0 case. I can help with this 
patch if need be.

-- 
