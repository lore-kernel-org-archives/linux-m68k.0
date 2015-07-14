From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of drivers/char/nvram.c
Date: Tue, 14 Jul 2015 10:23:52 +0200
Message-ID: <CAMuHMdVGtdEMMMF87FAEuiKYyLZPQFQeaX5dH6DiATsmLxzJfw@mail.gmail.com>
References: <20150712102527.356151908@telegraphics.com.au>
	<20150712102528.107134628@telegraphics.com.au>
	<87d1zwc4dj.fsf@igel.home>
	<alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Andreas Schwab <schwab@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jul 14, 2015 at 10:17 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Mon, 13 Jul 2015, Andreas Schwab wrote:
>> Finn Thain <fthain@telegraphics.com.au> writes:
>> > BTW, I didn't change the SCSI ID location in NVRAM. This code says 16
>> > whereas atari_scsi says 14. Which one is correct?
>>
>> I think atari_scsi is wrong.  The best source I could find
>> (http://www.gratifiant.com/nvram-falcon-t561185) places it after the
>> video mode byte, thus at byte 16.
>
> Thanks for that. BTW, I googled a phrase from that page and found this one
>   http://toshyp.atari.org/en/004009.html
> which may be closer to the source.

Hence "int" is 16-bits in all those references?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
