From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Status of the FB drivers on m68k
Date: Sat, 14 Oct 2017 08:40:07 +0200
Message-ID: <6505DF9F-E677-487C-9082-54D1B640C50F@physik.fu-berlin.de>
References: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de> <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com> <90f7b321-207c-fd6d-92ae-f415a7fcf384@physik.fu-berlin.de> <f65ab00c-8dad-f7a4-cba8-14c6d9fe3ce8@gmail.com> <alpine.LNX.2.00.1710141310400.3@nippy.intranet>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=windows-1251
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:38141 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750766AbdJNGkN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 14 Oct 2017 02:40:13 -0400
In-Reply-To: <alpine.LNX.2.00.1710141310400.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>



> On Oct 14, 2017, at 4:23 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> 
> On Sat, 14 Oct 2017, Michael Schmitz wrote:
> 
>>> - Michael Schmitz' ESP driver fixes for the Cyberstorm SCSI
>> 
>> Finn's fixes actually, and no guarantee what I have in mind will 
>> actually work.
>> 
> 
> Just to clarify, Michael and I did reach a solution (i.e. don't attempt 
> 2-byte DMA transfers) after we kicked around various theories for years, 
> and tested some of them with Stan's help, and fixed some mac_esp and 
> esp_scsi bugs along the way. But someone still has to write the code for 
> zorro_esp. The code is easily adapted from mac_esp, now that mac_esp works 
> properly, since you only have to implement the the transfer_size < 
> FIFO_SIZE case or even just the write != 0 case. I can help with this 
> patch if need be.

Fantastic.

FWIW, I moved the Amiga 4000 back into my office yesterday but I didn’t get to hook it up yet, this will happen on Monday.

I have also lots of test hardware now:

 * Cybervision 64
 * Cybervision 64/3D
 * Retina Z-3
 * 2x X-Surf100
 * 3x Buddha IDE Controller

The Buddha will be used for the libata porting by Bartolomej (I hope I spelled his name correctly) from Samsung.

Adrian
