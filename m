From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: Call paging_init() before nf_init()
Date: Sat, 19 Oct 2013 09:49:20 +0200
Message-ID: <CAMuHMdVS_Ad_0gmTbyVYRoYZDZQyczsa6ON20Yv_ouw3t0XX-w__10496.2261896164$1382168987$gmane$org@mail.gmail.com>
References: <1382080184-19115-1-git-send-email-geert@linux-m68k.org>
	<172f2b40c29a29a470215c14250a559e@biophys.uni-duesseldorf.de>
	<CAMuHMdVPnyRhfGjpMraMrwhxwy9_mSfm=ouDEnYm2YJMzhhZ_Q@mail.gmail.com>
	<bedc4eadbebb75f6d51afea3f5755b7c@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <bedc4eadbebb75f6d51afea3f5755b7c@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Oct 19, 2013 at 2:33 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> With the DISCONTIGMEM memory model, the kernel must be stored in the
>> first memory block. As ST-RAM is before FastRAM in memory, you cannot
>> have the kernel in FastRAM without losing ST-RAM (as main memory ---
>> you can still e.g. ioremap() it for atafb, and use the rest of it as
>> swap through
>> a block device like z2ram. This is basically what we do on Amiga with Chip
>> RAM
>> and Z2 RAM).
>
> As long as we can ioremap() the ST-RAM frame buffer, we ought to be fine in
> the first instance. How useful ST-RAM as swap may be is debatable so I'd
> leave that aside for now.
>
> Main benefits would be for users of TTs that have been left out with recent
> kernel sizes.
>
> OK - how would I go about ioremaping a chunk of ST-RAM when that has been
> left out of the mm setup because it violates the discontigmem layout rules?
> Set up a kernel private mapping for all of ST-RAM, and make that available
> to the stram allocator?

Just call ioremap(), that takes care of the kernel private mapping.
ioremap() is meant to map anything that is not part of the mm setup.

>> With the SPARSEMEM memory model, you should be able to store the kernel
>> in FastRAM and have ST-RAM, too.
>
> I can still remember the headache I got when last playing with the mm code,
> I think I'll pass.

But "we" probably have to do that anyway, to please the Amiga BigRAM users.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
