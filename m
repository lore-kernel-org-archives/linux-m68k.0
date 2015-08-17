From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC v5 00/26] Re-use nvram module
Date: Mon, 17 Aug 2015 18:04:59 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1508171756180.626@nippy.intranet>
References: <20150725074559.543547894@telegraphics.com.au> <CAMuHMdWUQsSG8cZmKX8tHMN1=87Og-xboAFzhP1vWyQF+A3_eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWUQsSG8cZmKX8tHMN1=87Og-xboAFzhP1vWyQF+A3_eg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-m68k@vger.kernel.org


On Sun, 16 Aug 2015, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Sat, Jul 25, 2015 at 9:45 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > The generic NVRAM module, drivers/char/generic_nvram, implements a 
> > /dev/nvram misc device. It is used only by 32-bit PowerPC platforms 
> > and isn't generic enough to be more widely used.
> 
> [...]
> 
> Thanks!
> 
> You can add my
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> to patches 03, 04, 11, 19, 23, 24, 25, 26.

Thanks for reviewing.

> 
> BTW, checkpatch reported a few newly-introduced whitespace errors in 
> patches 03, 05, 16, 24, and 25.

I will check again, but I'm sure those are all deliberate. I examined all 
the "errors" and "warnings" before submitting.

checkpatch doesn't really understand the difference between whitespace 
used for indentation of statements (according to scope) and whitespace 
used for alignment of terms or parameters (when line-wrapped). Any tool 
that fails to make that distinction can't be depended upon to correctly 
validate the elisp in Documentation/CodingStyle, for example.

-- 

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
