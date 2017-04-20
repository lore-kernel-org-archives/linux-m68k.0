From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] mac68k: Miscellaneous fixes, cleanup and modernization
Date: Thu, 20 Apr 2017 09:56:16 +0200
Message-ID: <CAMuHMdUfVR1PqXPRwT9GKk-T9wZiiAziT8bPyEemw5y5EiUh5A@mail.gmail.com>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
 <CAMuHMdUU8DYj-TKPCbjMCiCt5KrAi4ciTw9F=iL7eJ2shf9s=g@mail.gmail.com> <alpine.LNX.2.00.1704171150090.15400@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33350 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940330AbdDTH4S (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Apr 2017 03:56:18 -0400
In-Reply-To: <alpine.LNX.2.00.1704171150090.15400@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn,

On Mon, Apr 17, 2017 at 3:50 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Sun, 16 Apr 2017, Geert Uytterhoeven wrote:
>> On Sun, Apr 9, 2017 at 1:51 AM, Finn Thain <fthain@telegraphics.com.au>
>> wrote:
>> > This series has various patches from several different people. Two
>> > printk modernization patches were originally from Geert Uytterhoeven
>> > and three Nubus patches were originally committed to the Linux/mac68k
>> > CVS by David Huggins-Daines.
>>
>> Thanks, most of them look sane enough to apply and still queue for
>> v4.12.
>>
>> I'm a bit reluctant about the nubus changes (patches 6 and 8), though.
>> Do you think they need more testing?
>>
>> Thanks!
>
> Patch 6 is partly dead code removal. In principle, this patch is a
> reversion to the old code (pre-v2.3.17). The old code was thoroughly
> tested in Debian Sarge. I suppose a reviewer might wonder whether we want
> to keep new code for probing fake slot resources in Apple's on-board ROMs.
> That would be useful if it could eliminate the macintosh_config struct.
> But it can't, and we don't want both mechanisms. Hence the reversion in
> the mac68k CVS.
>
> Patch 8 changes the pointer validation code and although this has been
> tested on the valid path, you are right that it could use some negative
> testing. But that would seem to require cards with flawed ROMs. I don't
> know of any of such cards. So I think that all we can do is more review.
>
> Maybe Michael or Laurent would be willing to review these two patches?

OK.

I've applied and queued all but patches 6 and 8.  This required some
small adjustment to e.g. the whitespace patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
