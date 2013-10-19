From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k/atari: Call paging_init() before nf_init()
Date: Sat, 19 Oct 2013 13:33:07 +1300
Message-ID: <bedc4eadbebb75f6d51afea3f5755b7c__35010.5069498115$1382142831$gmane$org@biophys.uni-duesseldorf.de>
References: <1382080184-19115-1-git-send-email-geert@linux-m68k.org> <172f2b40c29a29a470215c14250a559e@biophys.uni-duesseldorf.de> <CAMuHMdVPnyRhfGjpMraMrwhxwy9_mSfm=ouDEnYm2YJMzhhZ_Q@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVPnyRhfGjpMraMrwhxwy9_mSfm=ouDEnYm2YJMzhhZ_Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Geert,

> On Fri, Oct 18, 2013 at 9:29 AM, Michael Schmitz
> <schmitz@biophys.uni-duesseldorf.de> wrote:
>> does your fiddling with memory blocks in bootinfo now result in 
>> kernels
>> being possible to boot in FastRAM?
>
> No, I only played with the start address of ST-RAM.
>
> Probably you can run a kernel in FastRAM with some minor tweaks if
> you remove the ST-RAM block from the bootinfo, but then you loose
> (at least) atafb :-)

That, plus eventual ST-RAM bounce buffers for SCSI (which has been 
broken on my Falcon for a long time).

>
> With the DISCONTIGMEM memory model, the kernel must be stored in the
> first memory block. As ST-RAM is before FastRAM in memory, you cannot
> have the kernel in FastRAM without losing ST-RAM (as main memory ---
> you can still e.g. ioremap() it for atafb, and use the rest of it as
> swap through
> a block device like z2ram. This is basically what we do on Amiga with 
> Chip RAM
> and Z2 RAM).

As long as we can ioremap() the ST-RAM frame buffer, we ought to be 
fine in the first instance. How useful ST-RAM as swap may be is 
debatable so I'd leave that aside for now.

Main benefits would be for users of TTs that have been left out with 
recent kernel sizes.

OK - how would I go about ioremaping a chunk of ST-RAM when that has 
been left out of the mm setup because it violates the discontigmem 
layout rules? Set up a kernel private mapping for all of ST-RAM, and 
make that available to the stram allocator?


> With the SPARSEMEM memory model, you should be able to store the kernel
> in FastRAM and have ST-RAM, too.

I can still remember the headache I got when last playing with the mm 
code, I think I'll pass.


Cheers,

	Michael



> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds
