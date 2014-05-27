From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 4/4] m68k/atari: fix SCC initialization for debug console
Date: Tue, 27 May 2014 14:57:19 +1200
Message-ID: <CAOmrzkLLNeCgFsam+e0_nBKRGhjpFv=bv_eT0wp8R=o4z8D0QQ@mail.gmail.com>
References: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet>
	<CAOmrzkLw1r+QUxqxQUKEwewtnWRmJknYCzLzf29Tq_TsjK-RyQ@mail.gmail.com>
	<alpine.LNX.2.00.1405271047450.14863@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:39581 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbaE0C5U (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 22:57:20 -0400
Received: by mail-oa0-f52.google.com with SMTP id eb12so8800391oac.25
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 19:57:19 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1405271047450.14863@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,


On Tue, May 27, 2014 at 2:31 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Tue, 27 May 2014, Michael Schmitz wrote:
>
>> Hi Finn,
>>
>> according to the old driver source, all Ataris except for the TT use a
>> 3.672 MHz clock at RTxC[A,B] for both the 9600 and 38400 baud settings.
>> Most lower baud rates use the 8 MHz PCLK input. Divisors are 24 (9600
>> baud) and 6 (38400 baud) in that case.
>>
>
> Not quite (see below).

I see - so you are saying the head.S setup uses PCLK as clock source
in x16 mode, while the serial driver does something more complicated
to use the baud rate generator with a lower frequency clock?

>> The TT uses that same arrangement on channel A, but something very
>> different on channel B - 307.2 kHz at RTxCB and 2.4576 MHz on TRxCB.
>> Divisors are 2 (using RTxCB) and 4 (using TRxCB), resepectively.
>>
>
> TT aside, is it safe to assume in head.S that channel B is clocked the
> same as channel A (i.e. 8 MHz)?

That should be safe even for the TT with PCLK (PCLK is useable for
both channels).

>> Adding all that in would complicate the code too much - let's settle for
>> a comment in the code to say SCC_B should not be used on the TT without
>> fixing the init table.
>
> A comment is probably a good idea but it can be a different patch. That
> is, I'm happy for Geert to merge v2 unless you want to pursue 38400 baud.

Nope, not at this time. Not without seeing what the exact data rate is
with these new settings.

Cheers,

  Michael


>> >  1 file changed, 21 insertions(+), 10 deletions(-)
>> >
>> > Index: linux-m68k/arch/m68k/kernel/head.S
>> > ===================================================================
>> > --- linux-m68k.orig/arch/m68k/kernel/head.S     2014-05-26 23:13:50.000000000 +1000
>> > +++ linux-m68k/arch/m68k/kernel/head.S  2014-05-26 23:24:33.000000000 +1000
>> > @@ -2722,6 +2722,7 @@ func_return       get_new_page
>> >  #define MAC_USE_SCC_B /* Printer port */
>> >
>> >  #if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
>> > +/* Initialisation table for SCC with 3.6864 MHz PCLK */
>> >  L(scc_initable_mac):
>> >         .byte   4,0x44          /* x16, 1 stopbit, no parity */
>> >         .byte   3,0xc0          /* receiver: 8 bpc */
>> > @@ -2744,14 +2745,12 @@ L(scc_initable_mac):
>> >  #define USE_MFP
>> >
>> >  #if defined(USE_SCC_A) || defined(USE_SCC_B)
>> > -#define USE_SCC
>> > -/* Initialisation table for SCC */
>> > -L(scc_initable):
>> > -       .byte   9,12            /* Reset */
>> > +/* Initialisation table for SCC with 7.9872 MHz PCLK */
>> > +/* PCLK == 8.0539 gives baud == 9680.1 */
>> > +L(scc_initable_atari):
>> >         .byte   4,0x44          /* x16, 1 stopbit, no parity */
>> >         .byte   3,0xc0          /* receiver: 8 bpc */
>> >         .byte   5,0xe2          /* transmitter: 8 bpc, assert dtr/rts */
>> > -       .byte   9,0             /* no interrupts */
>> >         .byte   10,0            /* NRZ */
>> >         .byte   11,0x50         /* use baud rate generator */
>> >         .byte   12,24,13,0      /* 9600 baud */
>>
>> Would be 6 instead of 24 here for 38400, presumably?
>
> From http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/char/atari_SCC.c
>
> 351     For 8.053976 MHz == base 503374:
> 352     0 bps -> 0
> 353     50 bps -> 5032
> 354     75 bps -> 3354
> 355     110 bps -> 2286
> 356     134 bps -> 1876
> 357     150 bps -> 1676
> 358     200 bps -> 1256
> 359     300 bps -> 837
> 360     600 bps -> 417
> 361     1200 bps -> 208
> 362     1800 bps -> 138
> 363     2400 bps -> 103
> 364     4800 bps -> 50
> 365     9600 bps -> 24
> 366     19200 bps -> 11
> 367     31500 bps -> 6 (really 31461 bps)
> 368     50000 bps -> 3
> 369     125000 bps -> 0
>
> Based on Baud = PCLK / (2 x mode x (Time Constant + 2)), we have:
>
> mode    16      16      16      16      16      16
> TC      6       11      24      1       4       10
> PCLK    8.0539  8.0539  8.0539  3.670   3.670   3.670 MHz
> baud    31460.5 19360.3 9680.2  38250.0 19125.0 9562.5
>
> The x16 mode can't get close to 38400 baud. The first version of this
> patch used the x1 mode:
>
> mode    1       1       1
> TC      102     102     103
> PCLK    7.9872  8.0539  8.0539 MHz
> baud    38400.0 38720.7 38351.9
>
> I don't know why 38720.7 wasn't close enough to work when apparently
> 9680.2 baud does work.
>
> Anyway, TC = 103 should be closer to 38400 baud given we now know PCLK is
> 8.0539 MHz, unless I'm missing something...
>
> --
>
