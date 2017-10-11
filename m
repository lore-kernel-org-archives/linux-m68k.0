From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Status of the FB drivers on m68k
Date: Wed, 11 Oct 2017 14:01:41 +0200
Message-ID: <90f7b321-207c-fd6d-92ae-f415a7fcf384@physik.fu-berlin.de>
References: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de>
 <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:53047 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752029AbdJKMBn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 11 Oct 2017 08:01:43 -0400
In-Reply-To: <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert!

On 10/11/2017 09:24 AM, Geert Uytterhoeven wrote:
>> I am currently discussing the topic of usable graphics cards on Debian/m68k
>> on the German Amiga forum a1k.org since one user asked me [1] and he told
>> me that in the past, users could use CONFIG_FB_CYBER and CONFIG_FB_VIRGE
>> which both seem gone, sadly.
> 
> CyberVision 64, CyberVision 64/3D, and Retina/Z3 support were removed in
> commit e019630e78e3482c ("[PATCH] remove broken video drivers").
> 
> All of them were marked broken before because they needed an update
> for the new fbdev framework, cfr. e.g full-history-linux
> commit 6764ca1a7c58dc5f07bd730000a4c40be4ef9f00
> Author: Geert Uytterhoeven <geert@linux-m68k.org>
> Date:   Sun Sep 28 20:02:47 2003 -0700
> 
>      [PATCH] Amiga Cybervision 64/3D frame buffer device is broken
> 
>      Amiga Cybervision 64/3D frame buffer device is broken (needs update to new
>      fbdev framework)

Ok, thanks.

>> Also, the CONFIG_FB_PM2 driver is marked as broken [2].
> 
>  From full-history-linux:
> commit a05cb1584100212ae8b20a8026dac1f814760158
> Author: Geert Uytterhoeven <geert@linux-m68k.org>
> Date:   Mon Apr 12 17:29:57 2004 -0700
> 
>      [PATCH] Pm2fb is broken on Amiga
> 
>      Permedia2: Mark pm2fb broken on Amiga, until somebody fixes it (pm2fb.c
>      explicitly tests for CONFIG_PCI right now)
> 
>> Is there a chance to bring the CYBER and VIRGE drivers back? And maybe
>> get PM2 working on m68k?
> 
> There's always a chance ;-)
> You "just" need someone with the hardware, programming skills, and a
> strong desire to get it working again.

So, I have already someone from Berlin who is going to give me exactly these
three boards for kernel development and testing \o/.

> For CyberVision 64, CyberVision 64/3D, and Retina/Z3, the amount of work
> shouldn't be that big. Just revert commit e019630e78e3482c, and look how
> other fbdev driver were converted to the new framework.

Alright. I hope you, Michael Schmitz and Michael Karcher will be around
to help :-). I will have my A4000 set up by next week, equipped with
a Buddha, an X-Surf100 and the various graphics cards (one at a time).

> However, in the mean time another S3 Trio / Virge driver was added, so it
> may make more sense to add Amiga support to the latter.  But as I expect
> that driver to contain many PC-isms, and rely on the BIOS having initialized
> the graphics chip first, reviving FB_CYBER and FB_VIRGE as a first step,
> may be the best approach.

Ok, we'll see.

> I expect fixing Permedia2 to be much harder...
Ok, I guess the next things to be done then are:

- Michael Schmitz' ESP driver fixes for the Cyberstorm SCSI
- Michael Karcher's xsurf100 driver
- fixing Cybervision 64, 64/3D, Retina Z3

Might also be an idea to have another Linux/m68k meeting to
get these things done :-).

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
