From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k-queue
Date: Thu, 16 May 2013 10:10:43 +1200
Message-ID: <CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
	<5191FC4C.8010707@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1305151727470.10554@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:37088 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009Ab3EOWKn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 May 2013 18:10:43 -0400
Received: by mail-oa0-f48.google.com with SMTP id i4so2832841oah.7
        for <linux-m68k@vger.kernel.org>; Wed, 15 May 2013 15:10:43 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1305151727470.10554@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Finn,

> I went digging in the mac68k repo. ADBREQ_RAW shows up here:
>
>     "Latest ADB changes including the new 68k PMU driver."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.15&r2=1.16&
>
>     "Added Baboon interrupt support.
>     Moved all time and PRAM-related functions into misc.c."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/arch/m68k/mac/misc.c?r1=1.4&r2=1.5&
>
> You are right, ADBREQ_RAW was clearly PRAM and clock related.

Thanks for this bit of detective work - I had forgotten about the
mac68k CVS. Or never knew about it).

> And this seems to indicate roughly when it got broken:
>
>     "Merge with 2.4.0 release."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.21&r2=1.22

Appears it was broken in v1.21 already (unconditionally sets the first
byte to ADB_PACKET).

If clock/pram access is all handled by other code now, the patch
should indeed be dropped.

Cheers,

  Michael


On Wed, May 15, 2013 at 8:47 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Tue, 14 May 2013, schmitz wrote:
>
>> >   - mac: ADB raw packets
>> >     I guess this can be dropped?
>
> Geert, you should drop this patch, because there are no other patches in
> your queue that use ADBREQ_RAW and because it seems to be broken (the idea
> of sending a raw packet using adb_request() was apparently to permit
> req->data[0] != ADB_PACKET). Also it seems to have become obsolete back in
> 2006.
>
>>
>> I'd guess so - I struggle to recall what this was for. Perhaps to talk
>> to the clock chip on some Macs.
>
> I went digging in the mac68k repo. ADBREQ_RAW shows up here:
>
>     "Latest ADB changes including the new 68k PMU driver."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.15&r2=1.16&
>
>     "Added Baboon interrupt support.
>     Moved all time and PRAM-related functions into misc.c."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/arch/m68k/mac/misc.c?r1=1.4&r2=1.5&
>
> You are right, ADBREQ_RAW was clearly PRAM and clock related.
>
> And this seems to indicate roughly when it got broken:
>
>     "Merge with 2.4.0 release."
>     http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.21&r2=1.22
>
> Anyway, in mainline kernels, adb_request() was not called from the PRAM
> and clock related code since 2006 when Al Viro got that code to build
> again:
>
>     https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/m68k/mac/misc.c?id=3272244c2b1a8f13cec83c04b8245fa7fcb47a27
>
> Finn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
