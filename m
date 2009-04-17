From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux/m68k on Atari
Date: Fri, 17 Apr 2009 09:26:04 +0200
Message-ID: <10f740e80904170026x6a35fbd6k9106163a7d74b05b@mail.gmail.com>
References: <20090327163917.e2b1d865.mandin.patrice@orange.fr>
	 <1239307252.11875.4.camel@joy>
	 <20090410185538.04034623.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904120652210.2715@zirkon.biophys.uni-duesseldorf.de>
	 <20090412094419.ab2ba909.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904140429240.18464@zirkon.biophys.uni-duesseldorf.de>
	 <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
	 <10f740e80904160219j7f4a71e5rceb634e3fb9cc4a3@mail.gmail.com>
	 <alpine.DEB.1.00.0904170304330.18855@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <alpine.DEB.1.00.0904170304330.18855@zirkon.biophys.uni-duesseldorf.de>
Resent-Message-ID: <klHPOlwm59H.A.BIE.n8C6JB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Patrice Mandin <mandin.patrice@orange.fr>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Fri, Apr 17, 2009 at 03:06, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> > Geert, Roman: does paging_init rely on part of the first memory chunk being
>> > mapped in head.S, or just part of the chunk the kernel resides in? Could I
>> > reorder the m68k_memory[] elements in setup.c to fix the ordering problems?
>>
>> Should work. config_amiga() removes Zorro II memory chunks, and that's
>> just before
>> paging_init() is called. of course you cannot reorder the first chunk,
>> as that one is
>> already in use.
>
> Found that out the hard way. So what's the fix for this? Does the first chunk
> always have to be the one the kernel resides in?
>
> What is the reason for dropping chunks that are residing below the fisrst one,
> in paging_init ??

`git blame' tells you that code was added by

commit 12d810c1b8c2b913d48e629e2b5c01d105029839
Author: Roman Zippel <zippel@linux-m68k.org>
Date:   Thu May 31 00:40:54 2007 -0700

    m68k: discontinuous memory support

Probably discontigmem supports only increasing physical addresses of the
multiple memory chunks :-(

But the newer sparsemem generic model may support it, see
Documentation/memory-hotplug.txt.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
